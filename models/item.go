package models

import (
	"encoding/json"
	"time"

	"github.com/gobuffalo/pop"
	"github.com/gobuffalo/uuid"
	"github.com/gobuffalo/validate"
	"github.com/gobuffalo/validate/validators"
)

type Item struct {
	ID          uuid.UUID `json:"id" db:"id"`
	CreatedAt   time.Time `json:"created_at" db:"created_at"`
	UpdatedAt   time.Time `json:"updated_at" db:"updated_at"`
	Name        string    `json:"name" db:"name"`
	Description string    `json:"description" db:"description"`
	Price       string    `json:"price" db:"price"`
	Image       string    `json:"image" db:"image"`
	Term        string    `json:"term" db:"term"`
}

// String is not required by pop and may be deleted
func (i Item) String() string {
	ji, _ := json.Marshal(i)
	return string(ji)
}

// Items is not required by pop and may be deleted
type Items []Item

// String is not required by pop and may be deleted
func (i Items) String() string {
	ji, _ := json.Marshal(i)
	return string(ji)
}

// Validate gets run every time you call a "pop.Validate*" (pop.ValidateAndSave, pop.ValidateAndCreate, pop.ValidateAndUpdate) method.
// This method is not required and may be deleted.
func (i *Item) Validate(tx *pop.Connection) (*validate.Errors, error) {
	return validate.Validate(
		&validators.StringIsPresent{Field: i.Name, Name: "Name"},
		&validators.StringIsPresent{Field: i.Description, Name: "Description"},
		&validators.StringIsPresent{Field: i.Price, Name: "Price"},
		&validators.StringIsPresent{Field: i.Image, Name: "Image"},
		&validators.StringIsPresent{Field: i.Term, Name: "Term"},
	), nil
}

// ValidateCreate gets run every time you call "pop.ValidateAndCreate" method.
// This method is not required and may be deleted.
func (i *Item) ValidateCreate(tx *pop.Connection) (*validate.Errors, error) {
	return validate.NewErrors(), nil
}

// ValidateUpdate gets run every time you call "pop.ValidateAndUpdate" method.
// This method is not required and may be deleted.
func (i *Item) ValidateUpdate(tx *pop.Connection) (*validate.Errors, error) {
	return validate.NewErrors(), nil
}
