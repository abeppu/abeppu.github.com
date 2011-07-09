
      function appendToData(x){
	if(data.length > 0){
	    return;
        }
        data = x.query.results.quote;
        for(var i=0;i<data.length;i++){
          data[i].timestamp = (new Date(data[i].date).getTime() / 1000);
        }		  
        data = data.sort(function(x, y){ return x.timestamp > y.timestamp ? 1 : -1});			
        buildChart(data);		  
      }

      function buildQuery(){
        var symbol = window.location.hash;
        if(symbol === ""){
           symbol = "AMZN";
        }
        symbol = symbol.replace("#", "");		  
        var base = "select * from yahoo.finance.historicaldata where symbol = \"{0}\" and startDate = \"{1}\" and endDate = \"{2}\"";
        var query = base.format(symbol, getDateString(start), getDateString(end));
        query = encodeURIComponent(query);		    
        var url = "http://query.yahooapis.com/v1/public/yql?q={0}&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys&callback=appendToData".format(query);
        return url;
      }
      function fetchData(){		  
        url = buildQuery();		  
        scriptElement = document.createElement("SCRIPT");
        scriptElement.type = "text/javascript";
        // i add to the url the call back function
        scriptElement.src = url;
        document.getElementsByTagName("HEAD")[0].appendChild(scriptElement);
      }