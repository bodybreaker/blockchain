package main

import (
    "database/sql"
    "fmt"
    "log"
    _ "github.com/go-sql-driver/mysql"
)

func main() {
    // sql.DB 객체 생성
    db, err := sql.Open("mysql", "root:87654321@tcp(127.0.0.1:3306)/testdb")
    if err != nil {
        log.Fatal(err)
    }
    defer db.Close()

    // 복수 Row를 갖는 SQL 쿼리
    var id int
    var name string
    rows, err := db.Query("SELECT id, name FROM test1 where id >= ?", 85)
    if err != nil {
        log.Fatal(err)
    }
    defer rows.Close() //반드시 닫는다 (지연하여 닫기)

    for rows.Next() {
        err := rows.Scan(&id, &name)
        if err != nil {
            log.Fatal(err)
        }
        fmt.Println(id, name)
    }
}
