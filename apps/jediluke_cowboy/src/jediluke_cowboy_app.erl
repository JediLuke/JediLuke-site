%%%-------------------------------------------------------------------
%% @doc jediluke_cowboy public API
%% @end
%%%-------------------------------------------------------------------

-module(jediluke_cowboy_app).

-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).

%%====================================================================
%% API
%%====================================================================

start(_StartType, _StartArgs) ->
	configure_cowboy(),
    jediluke_cowboy_sup:start_link().

%%--------------------------------------------------------------------
stop(_State) ->
    ok.

%%====================================================================
%% Internal functions
%%====================================================================

% Configure cowboy webserver
configure_cowboy() ->
	% {ok, _} = application:ensure_all_started(cowboy),
	Dispatch = cowboy_router:compile([
        {'_', [
        	{"/", cowboy_static, {priv_file, jediluke_cowboy, "static/index.html"}}
        ]}
    ]),
    {ok, _} = cowboy:start_clear(http, 100, [{port, 8080}], #{
    	env => #{dispatch => Dispatch}
    }),
    ok.