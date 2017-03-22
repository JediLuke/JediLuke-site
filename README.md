jediluke_cowboy
=====

A complete Erlang release of a cowboy webserver project, hosting my simple blog/website.

Build
-----

Create a release

	rebar3 as prod release

Start the release (su priveledges required to use port 80 on FreeBSD)

	sudo ./_build/prod/rel/jediluke_cowboy/bin/jediluke_cowboy start
