package api

import (
	"encoding/json"
	"log"
	"net/http"

	"github.com/ary82/urlStash/database"
)

type Server struct {
	Addr     string
	Database *database.DB
}

func WriteJsonResponse(w http.ResponseWriter, statusCode int, data any) {
	w.Header().Add("Content-Type", "application/json")
	w.WriteHeader(statusCode)
	err := json.NewEncoder(w).Encode(data)
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
	}
}

func (s *Server) Run() error{
	router := http.NewServeMux()

	router.HandleFunc("/", NotFound)
	router.HandleFunc("GET /stash", getStashHandler)

	log.Println("Startin API on", s.Addr)
	err := http.ListenAndServe(s.Addr, router)
  return err
}

func NotFound(w http.ResponseWriter, r *http.Request) {
	WriteJsonResponse(w, http.StatusNotFound, map[string]string{"error": "not a valid api path"})
}

func getStashHandler(w http.ResponseWriter, r *http.Request) {

}
