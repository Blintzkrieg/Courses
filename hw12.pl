simple_s(s(NP,VP)) --> np(NP), vp(VP).
simple_t(s(NP, VP)) --> np(NP), vpt(VP).

s2(s(S1,C,CC,S2)) --> simple_t(S1), comma(C), cc(CC), simple_s(S2).
s4(s(S1,C,CC,S2)) --> simple_s(S1), comma(C), cc(CC), simple_s(S2).

s3(s(S1,C,S2)) --> simple_t(S1), comma(C), s3(S2).
s3(s(S1,C,S2)) --> simple_s(S1), comma(C), s3(S2).
s3(S) --> s2(S).
s3(S) --> s4(S).

s(s(S1,C,S2)) --> simple_t(S1), comma(C), s3(S2).
s(S) --> s2(S).
s(S) --> simple_s(S).

np(np(N)) --> nn(N) ; prp(N) ; nnp(N).
np(np(NN1,NN2)) --> nn(NN1), nn(NN2).

vp(vp(VBD,NP)) --> vbd(VBD), np(NP).
vpt(vp(VBD,NP)) --> v(VBD,nogap),np(NP).
vp(vp(VBP,NP)) --> vbp(VBP), np(NP).
vp(vp(V)) --> vbp(V) ; vbd(V).

nn(nn(W)) --> [W], {member(W, [fish, rice, roast, beef])}.
nnp(nnp()) --> [W], {member(W, [bill, harry, john])}.
prp(prp(W)) --> [W], {member(W, [i])}.
vbd(vbd(W)) --> [W], {member(W, [ate, fished])}.
vbp(vbp(W)) --> [W], {member(W, [eat, fish])}.

vp(vp(VBD))--> vbdi(VBD).
vbdi(vbd(ate))--> [ate].
v(vbd(ate),X)-->vbd(X).
vbd(gap)-->[].
vbd(nogap)-->[ate].

cc(cc(and)) --> [and].
comma(','(',')) --> [','].

/** Test sentences:
s(Parse,[i,ate,fish,',',and,harry,roast,beef],[]).
s(Parse,[i,ate,fish,',',rice,',',and,harry,roast,beef],[]).
s(Parse,[i,ate,fish,',',bill,rice,',',and,harry,roast,beef],[]).

* s(Parse,[i,fish,',',bill,rice,',',and,harry,ate,roast,beef],[]).
* s(Parse,[i,fish,',',bill,ate,rice,',',and,harry,ate,roast,beef],[]).
* s(Parse,[i,fish,',',bill,ate,rice,',',and,harry,roast,beef],[]).

* s(Parse,[i,ate,fish,',',bill,',',and,harry,roast,beef],[]).
* s(Parse,[i,ate,fish,',',bill,rice,',',and,harry],[]).

s(Parse,[john,ate],[]).
nnp(Parse,[W],[]).
*/