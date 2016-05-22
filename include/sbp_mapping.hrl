%%
%% Copyright (c) 2014-2016 Bas Wegh
%%

-define(ERROR_MAPPING,
        [ {goodbye_and_out, <<"wamp.error.goodbye_and_out">>},
          {authorization_failed, <<"wamp.error.authorization_failed">>},
          {canceled, <<"wamp.error.canceled">>},
          {close_realm, <<"wamp.error.close_realm">>},
          {disclose_not_allowed, <<"wamp.error.disclose_me.not_allowed">>},
          {invalid_argument, <<"wamp.error.invalid_argument">>},
          {invalid_uri, <<"wamp.error.invalid_uri">>},
          {no_such_procedure, <<"wamp.error.no_such_procedure">>},
          {no_such_realm, <<"wamp.error.no_such_realm">>},
          {no_such_registration, <<"wamp.error.no_such_registration">>},
          {no_such_role, <<"wamp.error.no_such_role">>},
          {no_such_subscription, <<"wamp.error.no_such_subscription">>},
          {not_authorized, <<"wamp.error.not_authorized">>},
          {procedure_already_exists, <<"wamp.error.procedure_already_exists">>},
          {system_shutdown, <<"wamp.error.system_shutdown">>}
        ]).
-define(AUTH_METHOD_MAPPING,
        [ {wampcra, <<"wampcra">>}
        ]).

-define(HELLO_MAPPING,
        [ {agent, <<"agent">>, false},
          {anonymous, <<"anonymous">>, false},
          {authid, <<"authid">>, false},
          {authmethod, <<"authmethod">>, false},
          {authmethods, <<"authmethods">>, list},
          {authprovider, <<"authprovider">>, false},
          {authrole, <<"authrole">>, false},
          {broker, <<"broker">>, dict},
          {call_canceling, <<"call_canceling">>, false},
          {call_timeout, <<"call_timeout">>, false},
          {call_trustlevels, <<"call_trustlevels">>, false},
          {callee, <<"callee">>, dict},
          {callee_blackwhite_listing, <<"callee_blackwhite_listing">>, false},
          {caller, <<"caller">>, dict},
          {caller_exclusion, <<"caller_exclusion">>, false},
          {caller_identification, <<"caller_identification">>, false},
          {challenge, <<"challenge">>, false},
          {dealer, <<"dealer">>, dict},
          {disclose_me, <<"disclose_me">>, false},
          {eligible, <<"eligible">>, false},
          {event_history, <<"event_history">>, false},
          {exclude, <<"exclude">>, false},
          {exclude_me, <<"exclude_me">>, false},
          {features, <<"features">>, dict},
          {iterations, <<"iterations">>, false},
          {keylen, <<"keylen">>, false},
          {match, <<"match">>, value},
          {partitioned_pubsub, <<"partitioned_pubsub">>, false},
          {partitioned_rpc, <<"partitioned_rpc">>, false},
          {pattern_based_registration, <<"pattern_based_registration">>, false},
          {pattern_based_subscription, <<"pattern_based_subscription">>, false},
          {prefix, <<"prefix">>, false},
          {progress, <<"progress">>, false},
          {progressive_call_results, <<"progressive_call_results">>, false},
          {publication_trustlevels, <<"publication_trustlevels">>, false},
          {publisher, <<"publisher">>, dict},
          {publisher_exclusion, <<"publisher_exclusion">>, false},
          {publisher_identification, <<"publisher_identification">>, false},
          {receive_progress, <<"receive_progress">>, false},
          {roles, <<"roles">>, dict},
          {salt, <<"salt">>, false},
          {shared_registration, <<"shared_registration">>, false},
          {subscriber, <<"subscriber">>, dict},
          {subscriber_blackwhite_listing, <<"subscriber_blackwhite_listing">>, false},
          {subscriber_list, <<"subscriber_list">>, false},
          {subscriber_metaevents, <<"subscriber_metaevents">>, false},
          {timeout, <<"timeout">>, false},
          {wampcra, <<"wampcra">>, false},
          {wildcard, <<"wildcard">>, false}
        ]).

-define(DICT_MAPPING,
        [ {agent, <<"agent">>, false},
          {anonymous, <<"anonymous">>, false},
          {authid, <<"authid">>, false},
          {authmethod, <<"authmethod">>, false},
          {authmethods, <<"authmethods">>, list},
          {authprovider, <<"authprovider">>, false},
          {authrole, <<"authrole">>, false},
          {broker, <<"broker">>, dict},
          {call_canceling, <<"call_canceling">>, false},
          {call_timeout, <<"call_timeout">>, false},
          {call_trustlevels, <<"call_trustlevels">>, false},
          {callee, <<"callee">>, false},
          {callee_blackwhite_listing, <<"callee_blackwhite_listing">>, false},
          {caller, <<"caller">>, false},
          {caller_exclusion, <<"caller_exclusion">>, false},
          {caller_identification, <<"caller_identification">>, false},
          {challenge, <<"challenge">>, false},
          {dealer, <<"dealer">>, dict},
          {disclose_me, <<"disclose_me">>, false},
          {eligible, <<"eligible">>, false},
          {event_history, <<"event_history">>, false},
          {exclude, <<"exclude">>, false},
          {exclude_me, <<"exclude_me">>, false},
          {features, <<"features">>, dict},
          {first, <<"first">>, false},
          {invoke, <<"invoke">>, value},
          {iterations, <<"iterations">>, false},
          {keylen, <<"keylen">>, false},
          {last, <<"last">>, false},
          {match, <<"match">>, value},
          {partitioned_pubsub, <<"partitioned_pubsub">>, false},
          {partitioned_rpc, <<"partitioned_rpc">>, false},
          {pattern_based_registration, <<"pattern_based_registration">>, false},
          {pattern_based_subscription, <<"pattern_based_subscription">>, false},
          {prefix, <<"prefix">>, false},
          {progress, <<"progress">>, false},
          {progressive_call_results, <<"progressive_call_results">>, false},
          {publication_trustlevels, <<"publication_trustlevels">>, false},
          {publisher, <<"publisher">>, false},
          {publisher_exclusion, <<"publisher_exclusion">>, false},
          {publisher_identification, <<"publisher_identification">>, false},
          {random, <<"random">>, false},
          {receive_progress, <<"receive_progress">>, false},
          {roles, <<"roles">>, dict},
          {roundrobin, <<"roundrobin">>, false},
          {salt, <<"salt">>, false},
          {shared_registration, <<"shared_registration">>, false},
          {single, <<"single">>, false},
          {subscriber, <<"subscriber">>, dict},
          {subscriber_blackwhite_listing, <<"subscriber_blackwhite_listing">>, false},
          {subscriber_list, <<"subscriber_list">>, false},
          {subscriber_metaevents, <<"subscriber_metaevents">>, false},
          {timeout, <<"timeout">>, false},
          {wampcra, <<"wampcra">>, false},
          {wildcard, <<"wildcard">>, false}
        ]).
