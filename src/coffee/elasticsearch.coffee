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
			console.log config
			es.create
				index: config.index
				type: config.documenttype
				body: msg.payload
			, (error, response) ->
				if (error)
					node.error error, response
				es.close

	RED.nodes.registerType("elasticsearch",ElasticsearchNode);
