# Makefile for generate printable STL files.
# Copyright (c) 2021 Mihail Korkin <korkin_mv@protonmail.ch>.
# License: MIT.

SRC_DIR = src
PRINT_DIR = print

SRC = $(SRC_DIR)/lamp.scad $(SRC_DIR)/stand.scad
PRINT = $(SRC:$(SRC_DIR)/%.scad=$(PRINT_DIR)/%.stl)

.PHONY: all clean
all: $(PRINT)

$(PRINT): $(PRINT_DIR)

$(PRINT_DIR):
	mkdir -p $@

$(PRINT_DIR)/%.stl: $(SRC_DIR)/%.scad
	openscad -o $@ $<

clean:
	rm -rf $(PRINT_DIR)
