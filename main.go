package main

import (
	"log"

	"github.com/ary82/urlStash/api"
	"github.com/ary82/urlStash/database"
)

func main() {
	dbConnStr := "postgres://ary:123@localhost:5431/urlStash"
	database, err := database.Connect(dbConnStr)
	if err != nil {
		log.Fatal(err)
	}
	server := api.Server{Addr: ":8080", Database: database}
	err = server.Run()
	if err != nil {
		log.Fatal(err)
	}
}
