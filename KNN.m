## Copyright (C) 2021 Andrei
##
## This program is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <https://www.gnu.org/licenses/>.

## -*- texinfo -*-
## @deftypefn {} {@var{retval} =} KNN (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Andrei <Andrei@DESKTOP-PK505U9>
## Created: 2021-08-09

function prediction = KNN(labels, Y, test, k)

  % Initializează predicția
  prediction = -1;

  % Initializează distanțele
  [m n] = size (Y);
  distance = zeros(m, 1);

  % Calculează distanța Euclidiană pentru fiecare rând în Y și vectorul de test

    for i = 1 : m
      sum = 0;
      for j = 1 : n
      sum += (Y(i, j) - test(1, j)) * (Y(i, j) - test(1, j));
    endfor 
      distance(i, 1) = sqrt(sum);
  endfor

  % Ordonează distanțele în ordine crescătoare și păstrează primele k valori
  [~, aux] = sort(distance);
  k_labels = labels(aux(1:k));

  % Calculează predicția ca mediana celor k valori cele mai apropiate
  prediction = median(k_labels);

endfunction
