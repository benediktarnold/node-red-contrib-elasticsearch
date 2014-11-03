elasticsearch = require 'elasticsearch'
module.exports = (RED)->
	ElasticsearchNode = (config) ->
		RED.nodes.createNode(this,config)
		node = this
		node.on "input", (msg)->
			es = new elasticsearch.Client
				host: config.host+":"+config.port
				apiVersion: '1.3'
				log: 'trace'
			es.create
				index: config.index
				type: "bla"
				body: msg
			, (error, response) ->
				if (error)
					node.error error, response
				else
					node.warn "written to elasticsearch"
				es.close

	RED.nodes.registerType("elasticsearch",ElasticsearchNode);
