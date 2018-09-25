trigger changeValueAfter on Account (after insert) {


	    Account accounts = new Account();
	  
	    for (Account a: Trigger.new) {  
	    	//here the magic by creating a new instance using the same id
	        Account aux  = new Account(Id = '0016F00002S4c8fQAB');       
	        aux.Name =  a.Id + 'V111aluesdfsfdsdf forced to be set after by an extrange req';
                update aux;
	    }     
	    //then update the new instance list. 
	    update accounts;
    
}