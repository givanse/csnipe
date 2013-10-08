#include <stdlib.h>

/**                                                                              
  * Get a random number in the following range:                                  
  *     lowerLmt <= random number <= upperLmt                                
  * 
  * Remember to set a seed at the application level, ex:
  *     srand((unsigned) time(NULL)); 
  */                                                                             
unsigned int get_random_number(unsigned int lowerLmt,                          
                               unsigned int upperLmt) {                        
                                                                                 
    if(lowerLmt == upperLmt)                                                 
        return lowerLmt;                                                       
                                                                                 
    if(lowerLmt > upperLmt)                                                
        return lowerLmt;

    int rndNum;                                                                       
                                                                                 
    /* restrict to upperLmt */                                                
    int divisor = RAND_MAX / (upperLmt + 1);                                   
    /* loop instead of modulus for an even distribution */ 
    do {                                                                         
        rndNum = rand() / divisor;                                                    
    } while(rndNum > upperLmt);
                                                                                 
    /* restrict to lowerLmt */                                                 
    if(rndNum < lowerLmt)                                                           
        rndNum += lowerLmt;                                                         
                                                                                 
    return rndNum;                                                                    
}

/*EOF*/
