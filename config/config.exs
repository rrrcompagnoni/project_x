import Config

config :logger, level: :warn

config :crawly,
  closespider_timeout: 3,
  concurrent_requests_per_domain: :erlang.system_info(:logical_processors_available),
  middlewares: [
    Crawly.Middlewares.DomainFilter,
    Crawly.Middlewares.UniqueRequest,
    {Crawly.Middlewares.UserAgent,
     user_agents: ["Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:80.0) Gecko/20100101 Firefox/80.0"]}
  ],
  pipelines: [
    Crawly.Pipelines.JSONEncoder,
    {Crawly.Pipelines.WriteToFile, include_timestamp: false, extension: "json", folder: "/tmp"}
  ]
