%---------------
% Spanish
%

ssentence(M, ['¿',CapFirst|Rest], []) :-
  var(M),
  capitalize(First, CapFirst),
  ssent(M, ['¿',First|Rest], []).
ssentence(M, [CapFirst|Rest], []) :-
  var(M),
  capitalize(First, CapFirst),
  ssent(M, [First|Rest], []).
ssentence(M, S, []) :-
  var(S),
  ssent(M, Sx, []),
  (Sx = ['¿',First|Rest] ->
     capitalize(First,CapFirst),
     S = ['¿',CapFirst|Rest]
    ;
     Sx = [First|Rest],
     capitalize(First,CapFirst),
     S = [CapFirst|Rest]).  

ssent( identity(subj(S),obj(O)) ) -->
  ssubject(S,G), sisverb(_), sobject(O,G), speriod.
ssent( identity_question(subj(S),obj(O)) ) -->
  smarkquestion, sisverb(_), ssubject(S,G), sobject(O,G), squestionmark.
ssent( identity_question(subj(S),obj(O)) ) -->
  smarkquestion, spronoun(O,interrogative), sisverb(_), ssubject(S,_), squestionmark.
ssent( identity(not,subj(S),obj(O)) ) -->
  ssubject(S,G), [no], sisverb(_), ssubject(O,G), speriod.
ssent( attribute(subj(S),attr(A)) ) -->
  ssubject(S,G), sisverb(_), sadjlist(A,G), speriod.
ssent( attribute(not,subj(S),attr(A)) ) -->
  ssubject(S,G), [no], sisverb(_), sadjlist(A,G), speriod.
ssend( attribute_question(subj(S),attr(A)) ) -->
  smarkquestion, sisverb(_), ssubject(S,G), sadjlist(A,G), squestionmark.

ssubject(S,G) --> spronoun(S,G).

sobject(noun(O,[]),G) --> sarticle(_,G), snoun(O,G).
sobject(noun(O,[MOD]),G) -->
  sarticle(_,G), snoun(O,G), sadj(MOD,G).

sarticle(M,G) --> [X], { dict(sdict,M,X,[ps=article,g=G]) }.

sisverb(M) --> [X], { dict(sdict,M,X,[ps=verb,is]) }.

spronoun(M,interrogative) --> [X], { dict(sdict,M,X,[ps=pronoun,interrogative]) }.
spronoun(M,G) --> [X], { dict(sdict,M,X,[ps=pronoun,g=G]) }.

snoun(M,G) --> [X], { dict(sdict,M,X,[ps=noun,g=G]) }.

sadj(M,G) --> [X], { dict(sdict,M,X,[ps=adj,g=G]) }.

speriod --> ['. '].
squestionmark --> ['?'].
smarkquestion --> ['¿'].

swrite_sentence(['¿',First|Rest]) :-
  !, write('¿'), write(First),
  swrite_sent(Rest).
swrite_sentence([First|Rest]) :-
  write(First),
  swrite_sent(Rest).

swrite_sent([]).
swrite_sent(['. ']) :-
  write('. '), !.
swrite_sent(['?']) :-
  write('?'), !.
swrite_sent([X|Y]) :-
  write($ $), write(X),
  swrite_sent(Y).

sdict(a, un, [ps=article,g=masc]).
sdict(a, una, [ps=article,g=fem]).
sdict(black, negro, [ps=adj,g=masc]).
sdict(black, negra, [ps=adj,g=fem]).
sdict(book, libro, [ps=noun,g=masc]).
sdict(box, caja, [ps=noun,g=fem]).
sdict(dictionary, diccionario, [ps=noun,g=masc]).
sdict(farthat, este, [ps=pronoun]).
sdict(is, es, [ps=verb,is]).
sdict(red, rojo, [ps=adj,g=masc]).
sdict(red, roja, [ps=adj,g=fem]).
sdict(what, que, [ps=pronoun,interrogative]).
sdict(pencil, lapiz, [ps=noun,g=masc]).
sdict(that, ese, [ps=adj,g=masc]).
sdict(that, esa, [ps=adj,g=fem]).
sdict(that, 'ése', [ps=pronoun,g=masc]).
sdict(that, 'ésa', [ps=pronoun,g=fem]).
sdict(this, este, [ps=adj,g=masc]).
sdict(this, esta, [ps=adj,g=fem]).
sdict(this, 'éste', [ps=pronoun,g=masc]).
sdict(this, 'ésta', [ps=pronoun,g=fem]).
