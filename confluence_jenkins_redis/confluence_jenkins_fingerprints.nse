local table = require "table"

fingerprints = {};

table.insert(fingerprints, {
    category = 'jenkins',
    probes = {
      {
        path = '/login',
        method = 'GET'
      }
    },
    matches = {
      {
        match = '<title>Jenkins</title>',
        output = 'Jenkins service'
      }
    }
  });

table.insert(fingerprints, {
    category = 'confluence',
    probes = {
      {
        path = '/aboutconfluencepage.action',
        method = 'GET'
      }
    },
    matches = {
      {
        match = 'Atlassian Confluence',
        output = 'Confluence server'
      }
    }
  });
