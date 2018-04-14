package grifts

import (
	"github.com/gobuffalo/buffalo"
	"github.com/raylee/hackathon/actions"
)

func init() {
	buffalo.Grifts(actions.App())
}
