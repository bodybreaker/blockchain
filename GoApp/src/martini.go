package main

import (
	"database/sql"
	"fmt"
	"net/http"

	"github.com/go-martini/martini"
	_ "github.com/go-sql-driver/mysql"
	"github.com/martini-contrib/render"
)

type User struct {
	Name  string
	Email string
	Dept  string
}

func PanicIf(err error) {
	if err != nil {
		panic(err)
	}
}

var (
	createTable = ` CREATE TABLE IF NOT EXISTS users(
      name VARCHAR(50) NULL DEFAULT NULL,
      email VARCHAR(128) NULL DEFAULT NULL,
      dept VARCHAR(50) NULL DEFAULT NULL
    );`
)

func SetupDB() *sql.DB {
	var err error
	db, err := sql.Open("mysql", "root:87654321@tcp(127.0.0.1:3306)/testdb")
	PanicIf(err)

	tableName, err := db.Query(createTable)
	//result, err := db.Exec(createTable)
	PanicIf(err)

	fmt.Println("테이블 생성됨 >> ", tableName.Next())

	return db
}

func main() {
	m := martini.Classic()

	m.Map(SetupDB())

	m.Use(render.Renderer(render.Options{
		Layout: "layout", // Specify a layout template. Layouts can call {{ yield }} to render the current template.
	}))

	m.Post("/users", func(ren render.Render, req *http.Request, db *sql.DB) {
		fmt.Println(req.FormValue("name"))
		fmt.Println(req.FormValue("email"))
		fmt.Println(req.FormValue("dept"))
		_, err := db.Exec("INSERT INTO users(name,email,dept) VALUES(?,?,?)", req.FormValue("name"), req.FormValue("email"), req.FormValue("dept"))

		PanicIf(err)

		rows, err := db.Query("SELECT name,email,dept FROM users")
		PanicIf(err)

		defer rows.Close()

		users := []User{}
		for rows.Next() {
			user := User{}
			err := rows.Scan(&user.Name, &user.Email, &user.Dept)
			PanicIf(err)
			users = append(users, user)
		}
		fmt.Println(users)
		ren.HTML(200, "users", users)
	})

	m.Get("/delete/:name", func(params martini.Params, db *sql.DB) string {
		_, err := db.Exec("DELETE FROM users WHERE name = ?", params["name"])
		PanicIf(err)
		return "Return"
	})

	m.Run()
}
