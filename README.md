# Exercício LU PentaDiagonal - Algoritmos Numéricos
Desenvolvido por [Evandro Falcão Della Valentina de Oliveira](https://github.com/Evandro-FDVO).

Este projeto foi criado com o [GNU Octave](https://www.gnu.org/software/octave/index) versão 6.2.0.

## Escopo
* Exercício em Octave - Decomposição LU com matriz penta-diagonal sem simetria;

* Requisitos para as Matrizes de entrada:

  * Matriz A deve ser pentadiagonal (sinétrica ou não);
  * Ax=b
  * f>e>d && f>g>h

* Exemplo:
```
  A = | f1 e1 d1 0  0  | ,   b = | b1 |
      | g1 f2 e2 d2 0  |         | b2 |
      | h1 g2 f3 e3 d3 |         | b3 |
      | 0  h2 g3 f4 e4 |         | b4 |
      | 0  0  h3 g4 f5 |         | b5 |
```


Onde, 
```
 d = [d1, d2, d3]
 e = [e1, e2, e3, e4]
 f = [f1, f2, f3, f4, f5]
 g = [g1, g2, g3, g4]
 h = [h1, h2, h3]
```

## Tecnologias
* GNU Octave 6.2.0;

## Como Instalar
* Baixe ou clone este repositório usando `git clone https://github.com/Evandro-FDVO/LU_PentaDiagonal.git`;

## Como Executar
* Utilizando o IDE de sua preferência , execute os códigos localmente;

## Dúvidas
* Para obter ajuda no GNU Octave use a aba `ajuda` ou acesse [Documentação GNU Octave](https://octave.org/doc/v6.3.0/index.html);
