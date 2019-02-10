%task 1 (modulus)
mod_(_, 0, _, _) :- !.
mod_(FST, SND, REM, QUOT) :- FST < SND, !.
mod_(FST, SND, REM, QUOT) :- mod_(FST, SND, REM, QUOT, 0).
mod_(FST, SND, TEMP, QUOT, TEMP) :- FST < SND, QUOT is FST,!.
mod_(FST, SND, REM, QUOT, TEMP) :- NEXT is FST - SND,
                                   NEXT_TEMP is TEMP + 1,
                                   mod_(NEXT, SND, REM, QUOT, NEXT_TEMP).

%task2 (power)
pow_(_, 0, 1) :- !.
pow_(X, N, RES) :- N1 is N - 1,
                   pow_(X, N1, RES1),
                   RES is RES1 * X.

powLog(_, 0, 1) :- !.
powLog(X, POW, RES) :- mod(POW, 2) =:= 1,
                   X1 is X ** 2,
                   POW_N is POW >> 1,
                   powLog(X1, POW_N, RES1),
                   RES is X * RES1, !.
powLog(X, POW, RES) :- mod(POW, 2) =:= 0,
                   X1 is X ** 2,
                   POW_N is POW >> 1,
                   powLog(X1, POW_N, RES1),
                   RES is RES1, !.

%task 3 (fibonacci)
fib(0, 0) :- !.
fib(1, 1) :- !.
fib(N, RES) :- NM1 is N - 1,
               NM2 is N - 2,
               fib(NM1, R1),
               fib(NM2, R2),
               RES is R1 + R2.

% task 4 (prime divisors)
wrPrimes(NUM) :- NUM < 2, !.
wrPrimes(NUM) :- prime(NUM, DIVISOR, 2),
                 write(DIVISOR), write("\n"),
                 DIV_NUM is div(NUM, DIVISOR),
                 wrPrimes(DIV_NUM).

prime(NUM ,_, ACC) :- NUM < ACC, !.
prime(NUM, DIV, ACC) :- mod(NUM, ACC) =:= 0,
                        DIV is ACC, !.
prime(NUM, DIV, ACC) :- ACC_NEXT is ACC + 1,
                        prime(NUM, DIV, ACC_NEXT).

% task 5 (series)
ser(RANGE, RES) :- ser(RANGE, RES, 1, 1, 1), !.
ser(RANGE, RES, ITER, FRAC, ACC) :- RANGE is ITER, RES is ACC, !.
ser(RANGE, RES, ITER, FRAC, ACC) :- ITER_NEXT is ITER + 1,
                                    FRAC_NEXT is FRAC / ITER_NEXT,
                                    ACC_NEXT is ACC + FRAC_NEXT,
                                    ser(RANGE, RES, ITER_NEXT, FRAC_NEXT, ACC_NEXT).
