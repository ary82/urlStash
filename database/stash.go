package database

import (
	"context"
	"time"
)

type Stash struct {
	Title      string
	Points     int
	Created_at time.Time
}

func (database *DB) GetPublicStashes() ([]*Stash, error) {
	query := `select title, points, created_at from stashes where is_public = true`
	rows, err := database.Pool.Query(context.Background(), query)
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	stashArr := []*Stash{}
	for rows.Next() {
		stash := new(Stash)
		err := rows.Scan(&stash.Title, &stash.Points, &stash.Created_at)
		if err != nil {
			return nil, err
		}
		stashArr = append(stashArr, stash)
	}
	return stashArr, nil
}
