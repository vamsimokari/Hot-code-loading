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
%%              switch->
%%                        test2:loop();
%%                hii->
%%                       erlang:display([self(),hello]),
%5                       loop();
        
        %I am adding one more clause to receive loop here switch is an atom what i make here is tail recursive to the 
        %loop function but if you see that i specified module name as well ,what this actually means if i make a call to function
        %sepecified nodule name as well ,I tell erlang to use latest version of the module ,here we force to specify use the 
        %latest beam 
                Anything->  
                        erlang:display([self(),Anything]),
                loop()
        end.
