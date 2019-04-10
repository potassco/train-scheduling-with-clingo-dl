{ late(T,V,D,W) : visit(T,V) } :- potlate(T,V,D,W). 

next(T,V,D,D') :- potlate(T,V,D,_), potlate(T,E,D',_), D<D',
                  not potlate(T,E,D'',_) : potlate(T,E,D'',_), D''>D, D''<D'. 
:- not late(T,E,D,_), late(T,E,D',_), next(T,E,D,D').

&diff{ 0-(T,V) } <= -D  :- late(T,V,D,W).
&diff{ (T,V)-0 } <=  N  :- not late(T,V,D,W), potlate(T,V,D,W), 
                           N=D-1, visit(T,V).

#minimize{ W,T,V,D : late(T,V,D,W) }.
