##
## EPITECH PROJECT, 2023
## Wolfram
## File description:
## MAKEFILE file.
##

.PHONY: all

all:
	stack build
	cp `stack path --local-install-root`/bin/wolfram .

clean:
	stack clean
	rm -f wolfram
