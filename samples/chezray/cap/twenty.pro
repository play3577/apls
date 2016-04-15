%% Code generated by crypto on 3/26/2002.

:- dcg_terminal(draw).
:- noNonTerminals.

twenty :-
    solution(twenty,[0, 1, 2, 3, 4, 5, 6, 7, 8, 9], X).

solution(twenty) -->   [H], H > 0, H < 6,
   [Y], 
   evaluate(0 + Y + Y + Y + Y , SCarry6, D), 
   [D], 
   [T], T > 0, 
   evaluate(SCarry6 + T + T + T + T , SCarry5, E), 
   [E], 
   [N], 
   [R], 
   evaluate(SCarry5 + R + R + N + N , SCarry4, R), 
   [I], 
   evaluate(SCarry4 + I + I + E + E , SCarry3, D), 
   [W], 
   evaluate(SCarry3 + H + H + W + W , SCarry2, N), 
   evaluate(SCarry2 + T + T + T + T , SCarry1, U), 
   [U], 
   evaluate(SCarry1 , 0, H), 
   displayGram(7, 6, 
               ['U', 'W', 'I', 'R', 'N', 'E', 'T', 'D', 'Y', 'H'], 
                      [U, W, I, R, N, E, T, D, Y, H]	).

pos('T', 2, 1, 0).
pos('H', 3, 1, 0).
pos('I', 4, 1, 0).
pos('R', 5, 1, 0).
pos('T', 6, 1, 0).
pos('Y', 7, 1, 0).
pos('T', 2, 2, 0).
pos('H', 3, 2, 0).
pos('I', 4, 2, 0).
pos('R', 5, 2, 0).
pos('T', 6, 2, 0).
pos('Y', 7, 2, 0).
pos('T', 2, 3, 0).
pos('W', 3, 3, 0).
pos('E', 4, 3, 0).
pos('N', 5, 3, 0).
pos('T', 6, 3, 0).
pos('Y', 7, 3, 0).
pos('T', 2, 4, 0).
pos('W', 3, 4, 0).
pos('E', 4, 4, 0).
pos('N', 5, 4, 0).
pos('T', 6, 4, 0).
pos('Y', 7, 4, 0).
pos('H', 1, 6, 0).
pos('U', 2, 6, 0).
pos('N', 3, 6, 0).
pos('D', 4, 6, 0).
pos('R', 5, 6, 0).
pos('E', 6, 6, 0).
pos('D', 7, 6, 0).
barLine(1, 5, real).