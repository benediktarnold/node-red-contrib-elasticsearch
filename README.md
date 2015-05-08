[![Build Status](https://travis-ci.org/benediktarnold/node-red-contrib-elasticsearch.svg?branch=master)](https://travis-ci.org/benediktarnold/node-red-contrib-elasticsearch)

#node-red-contrib-elasticsearch
A node-red node to write messages to elasticsearch

##Install
Run the following command in the root directory of your Node-RED install

	npm install node-red-contrib-elasticsearch
	
##Documentation
	Inputs : msg
	Outputs : none
	ES result : document will be created with msg fields
##TODO
	- add an input for index name
	- add an input for document type
	- and an ouput with error if any, doc id, status of ES after operation ... etc
