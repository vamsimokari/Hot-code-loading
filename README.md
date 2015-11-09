# Hot-code-loading

First open 3 erlang terminals with same cookie using 

vamsi@local:~$ erl -sname vamsi1
Erlang/OTP 17 [erts-6.3] [source] [64-bit] [smp:2:2] [async-threads:10] [hipe] [kernel-poll:false]

Eshell V6.3  (abort with ^G)
(vamsi1@local)1> erlang:set_cookie(node(),qwerty).
true

vamsi@local:~$ erl -sname vamsi2
Erlang/OTP 17 [erts-6.3] [source] [64-bit] [smp:2:2] [async-threads:10] [hipe] [kernel-poll:false]

Eshell V6.3  (abort with ^G)
(vamsi2@local)1> erlang:set_cookie(node(),qwerty).
true
(vamsi2@local)2> 



(vamsi3@local)1> erlang:set_cookie(node(),qwerty).
true


After that compile the module on vamsi1@local node
(vamsi1@local)2> c(test2).
test2.erl: no such file or directory
error

%% file is not in that directory change the directory to Desktop 
(vamsi1@local)3> pwd().
/home/vamsi
ok
(vamsi1@local)4> cd("/home/vamsi/Desktop").
/home/vamsi/Desktop
ok
(vamsi1@local)5> pwd().                    
/home/vamsi/Desktop
ok
(vamsi1@local)6> c(test2).                 
{ok,test2}


also check weather weather other 2 nodes are able to ping or not 
(vamsi1@local)7> net_adm:ping(vamsi2@local).
pong

(vamsi1@local)8> Pid1=test2:start(vamsi2@local).
<9900.48.0>
(vamsi1@local)9> Pid1! hii.
hii

(vamsi2@local)4> [<0.48.0>,hii]







