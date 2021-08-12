package main

import (
	"database/sql"

	"github.com/go-martini/martini"
	_ "github.com/go-sql-driver/mysql"
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
      Name VARCHAR(50) NULL DEFAULT NULL,
      Email VARCHAR(128) NULL DEFAULT NULL,
      Dept VARCHAR(50) NULL DEFAULT NULL
    );`
)

func SetupDB() *sql.DB {
	var err error
	db, err := sql.Open("mysql", "root:87654321@tcp(127.0.0.1:3306)/testdb")
	PanicIf(err)

}

func main() {
	m := martini.Classic()
	m.Get("/", func() string {
		return "Hello, 세계!"
	})
	m.Run()
}
