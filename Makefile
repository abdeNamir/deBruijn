##
## EPITECH PROJECT, 2019
## Project Name
## File description:
## deBruijn
##

NAME	=	deBruijn

SRC	=	app/Main.hs	\
		src/Parsing.hs

all:	$(NAME)

$(NAME): $(SRC)
	stack build --copy-bins --local-bin-path .

clean:
	stack clean
	rm .stack-work deBruijn.cabal -rf

fclean:	clean
	$(RM) $(NAME)

re: fclean all