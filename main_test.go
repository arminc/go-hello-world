package main

import "testing"

func TestSomething(t *testing.T) {
	if "A" != "A" {
		t.Error("Expected A")
	}
}
