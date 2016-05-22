-module(convert_test).
-include_lib("eunit/include/eunit.hrl").
-include("sbp_message_codes.hrl").


-define(MSGS, [
            {[?HELLO, Realm, #{}],
             #{type => hello, details => #{}, realm => Realm} },
            {[?WELCOME, 234, #{}],
             #{type => welcome, details => #{}, session_id => 234}},
            {[?ABORT, #{}, Error],
             #{type => abort, details => #{}, reason => Error}},
            {[?PUBLISH, 456, #{}, Topic],
             #{type => publish, options => #{}, topic => Topic,
               request_id => 456} },
            {[?PUBLISH, 456, #{}, Topic, Arg],
             #{type => publish, options => #{}, topic => Topic,
               request_id => 456, arguments => Arg }},
            {[?PUBLISH, 456, #{}, Topic, [], ArgKw ],
             #{type => publish, options => #{}, topic => Topic,
               request_id => 456, arguments_kw => ArgKw, arguments => [] } },
            {[?PUBLISHED, 123, 456],
             #{type => published, request_id => 123, publication_id => 456}},
            {[?SUBSCRIBE, 123, #{}, Topic],
             #{type => subscribe, request_id => 123, options => #{},
               topic => Topic}},
            {[?SUBSCRIBED, 123, 456],
             #{type => subscribed, request_id => 123, subscription_id => 456}},
            {[?UNSUBSCRIBE, 123, 456],
             #{type => unsubscribe, request_id => 123, subscription_id => 456}},
            {[?UNSUBSCRIBED, 123],
             #{type => unsubscribed, request_id => 123}},
            {[?EVENT, 456, 789, #{}],
             #{type => event, subscription_id => 456, publication_id => 789,
               details => #{}}},
            {[?EVENT, 456, 789, #{}, Arg],
             #{type => event, subscription_id => 456, publication_id => 789,
               details => #{}, arguments => Arg}},
            {[?EVENT, 456, 789, #{}, [], ArgKw],
             #{type => event, subscription_id => 456, publication_id => 789,
               details => #{}, arguments => [], arguments_kw => ArgKw}},
            {[?CALL, 123, #{}, Procedure],
             #{type => call, request_id => 123, options => #{},
               procedure => Procedure}},
            {[?CALL, 123, #{}, Procedure, Arg],
             #{type => call, request_id => 123, options => #{},
               procedure => Procedure, arguments => Arg}},
            {[?CALL, 123, #{}, Procedure, [], ArgKw],
             #{type => call, request_id => 123, options => #{},
               procedure => Procedure, arguments_kw=> ArgKw, arguments => []}},
            {[?RESULT, 123, #{}],
             #{type => result, request_id => 123, details => #{}}},
            {[?RESULT, 123, #{}, Arg],
             #{type => result, request_id => 123, details => #{},
               arguments => Arg}},
            {[?RESULT, 123, #{}, [], ArgKw],
             #{type => result, request_id => 123, details => #{},
               arguments => [], arguments_kw => ArgKw}},
            {[?REGISTER, 123, #{}, Procedure],
             #{type => register, request_id => 123, options => #{},
               procedure => Procedure}},
            {[?REGISTERED, 123, 456],
             #{type => registered, request_id => 123, registration_id => 456}},
            {[?UNREGISTER, 123, 456],
             #{type => unregister, request_id => 123, registration_id => 456 }},
            {[?UNREGISTERED, 123],
             #{type => unregistered, request_id => 123}},
            {[?INVOCATION, 123, 456, #{}],
             #{type => invocation, request_id => 123, registration_id => 456,
              details => #{}}},
            {[?INVOCATION, 123, 456, #{}, Arg],
             #{type => invocation, request_id => 123, registration_id => 456,
              details => #{}, arguments => Arg}},
            {[?INVOCATION, 123, 456, #{}, [], ArgKw],
             #{type => invocation, request_id => 123, registration_id => 456,
              details => #{}, arguments => [], arguments_kw => ArgKw}},
            {[?YIELD, 123, #{}],
             #{type => yield, request_id => 123, options => #{}}},
            {[?YIELD, 123, #{}, Arg],
             #{type => yield, request_id => 123, options => #{},
               arguments => Arg}},
            {[?YIELD, 123, #{}, [], ArgKw],
             #{type => yield, request_id => 123, options => #{},
               arguments => [], arguments_kw => ArgKw}},
            {[?GOODBYE, #{}, Error],
             #{type => goodbye, details => #{},
               reason => Error }},
            %% ADVANCED MESSAGES
            {[?CHALLENGE, <<"sample method">>, #{}],
             #{type => challenge, extra => #{},
               auth_method => <<"sample method">> }},
            {[?CHALLENGE, <<"wampcra">>, #{}],
             #{type => challenge, extra => #{}, auth_method => wampcra }},
            {[?AUTHENTICATE, <<"AFFE">>, #{}],
             #{type => authenticate, extra => #{},
               signature => <<"AFFE">> }},
            {[?CANCEL, 123, #{}],
             #{type => cancel, options => #{}, request_id => 123 }},
            {[?INTERRUPT, 123, #{}],
             #{type => interrupt, options => #{}, request_id => 123 }}
           ]).

-define(TYPE_MAPPING, [
                    {?SUBSCRIBE, subscribe},
                    {?UNSUBSCRIBE, unsubscribe},
                    {?PUBLISH, publish},
                    {?REGISTER, register},
                    {?UNREGISTER, unregister},
                    {?CALL, call},
                    {?INVOCATION, invocation} ]).

basic_convert_test_() ->
    Realm = <<"test.uri">>,
    Error = <<"wamp.error.test">>,
    Topic = <<"topic.test">>,
    Arg = [1,2,3],
    ArgKw = #{<<"key">> => <<"value">>},
    Procedure = <<"test.procedure">>,

    ConvertToErl = fun(Wamp, Exp) ->
                           io:format("converting ~p to erl~n",[Wamp]),
                           Erl = sbp_converter:to_erl(Wamp),
                           io:format("   result:~p~n",[Erl]),
                           io:format("   expecting:~p~n",[Exp]),
                           Erl
                   end,
    ConvertToWamp = fun(Erl, Exp) ->
                            io:format("converting ~p to wamp~n", [Erl]),
                            Wamp = sbp_converter:to_wamp(Erl),
                            io:format("   result:~p~n",[Wamp]),
                            io:format("   expecting:~p~n",[Exp]),
                            Wamp

                    end,
    ToErl = fun({Wamp, Exp}, List) ->
                    [ ?_assertEqual(Exp, ConvertToErl(Wamp, Exp) ) | List]
            end,
    ToWamp = fun({Exp, Erl}, List) ->
                     [ ?_assertEqual(Exp, ConvertToWamp(Erl, Exp) ) | List]
             end,
    ToError =fun({WampType, ErlType}, List) ->
                     [{[?ERROR, WampType, 123, #{}, Error],
                       #{type => error, request_type => ErlType,
                         request_id => 123, details => #{}, error => Error}},
                      {[?ERROR, WampType, 123, #{}, Error, Arg],
                       #{type => error, request_type => ErlType,
                         request_id => 123, details => #{}, error => Error,
                        arguments => Arg}},
                      {[?ERROR, WampType, 123, #{}, Error, [], ArgKw],
                       #{type => error, request_type => ErlType,
                         request_id => 123, details => #{}, error => Error,
                        arguments => [], arguments_kw => ArgKw}}
                      | List]
             end,
    AllMsgs = lists:reverse(lists:foldl(ToError, lists:reverse(?MSGS),
                                        ?TYPE_MAPPING)),
    ToErlList = lists:foldl(ToErl, [], AllMsgs),
    ToWampList = lists:foldl(ToWamp, [], AllMsgs),
    lists:reverse(ToErlList) ++ lists:reverse(ToWampList).

