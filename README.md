# Hot-code-loading

First open 3 erlang terminals using same cookie  

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

about start function in test2.erl moduel %%start function takes an input as node() Start function will call the builtin function %%spawn%%% this function will creats a new process, spawn(Node,test1,loop,[]) here Node is unbound variable whatever we pass the node name process to be created at that node Here from vamsi1 node we will passa another node name as a argument to the start function
(vamsi1@local)9> Pid1! hii.
hii

(vamsi2@local)4> [<0.48.0>,hii]


Now modify the code in test 2.erl remove the comments(%%) in  the existing module to add extra clauses to the module

I am adding one more clause to receive loop here switch is an atom what i make here is tail recursive to the 
       loop function but if you see that i specified module name as well ,what this actually means if i make a call to function
        sepecified nodule name as well ,I tell erlang to use latest version of the module ,here we force to specify use the 
        latest beam

and compile it in node3 and load the module in vams2@local.

(vamsi2@local)4> l(test2).
{module,test2}

Ater loading also still you are getting hii message 

(vamsi2@local)5> [<0.48.0>,hii]


(vamsi1@local)12> Pid1! hii.
hii


(vamsi2@local)5> [<0.48.0>,hii]

%I am adding one more clause to receive loop here switch is an atom what i make here is tail recursive to the 
    %   loop function but if you see that i specified module name as well ,what this actually means if i make a %call to function
 %       sepecified nodule name as well ,I tell erlang to use latest version of the module ,here we force to %specify use the latest beam 

switch->
    test2:loop();


and now send message to Pid1! switch 
%I tell erlang to use latest version of the module ,here we force to specify use the latest beam 

and afert that
(vamsi1@local)13> Pid1! switch.
switch

(vamsi1@local)15> Pid1! hii.   
hii
see the below output in other node 

[<0.48.0>,hello]





