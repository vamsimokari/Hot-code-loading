-module(test2).
-compile(export_all).
%start(Node)=Pid()
%Node=atom(), The node where print-process shall be started,
%%starts a print process and returns the process id of newly
%% created process
start(Node)->
        spawn(Node,test2,loop,[]).

loop()->
        receive
%%                switch->
%%                        test2:loop();
%%                hii->
%%                       erlang:display([self(),hello]),
%5                       loop();
                hello->
                        erlang:display([self(),hiii]),
                        loop();
                Anything->  
                        erlang:display([self(),Anything]),
                loop()
        end.
