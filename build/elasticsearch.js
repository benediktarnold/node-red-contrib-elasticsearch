var elasticsearch;

elasticsearch = require('elasticsearch');

module.exports = function(RED) {
  var ElasticsearchNode;
  ElasticsearchNode = function(config) {
    var node;
    RED.nodes.createNode(this, config);
    node = this;
    return node.on("input", function(msg) {
      var es;
      es = new elasticsearch.Client({
        host: config.host + ":" + config.port,
        apiVersion: '1.3',
        log: 'trace'
      });
      console.log(config);
      return es.create({
        index: config.index,
        type: config.documenttype,
        body: msg
      }, function(error, response) {
        if (error) {
          node.error(error, response);
        }
        return es.close;
      });
    });
  };
  return RED.nodes.registerType("elasticsearch", ElasticsearchNode);
};
