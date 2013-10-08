#include "util.c"

/**
 * Shuffle an array of pointers.
 */
void array_shuffle(int arrSize, void **ptrsArr) {        
    /* Fisher & Yates shuffle, modern version (Knuth) */                         
    int i;                                                                       
    for(i = arrSize - 1; i >= 1; i--) {                                        
        /* j ← random integer with 0 ≤ j ≤ i */                                  
        int j = get_random_number(0, i);                                         
        /* exchange a[j] and a[i] */                                             
        void *tmp = ptrsArr[i];                                            
        ptrsArr[i] = ptrsArr[j];                                     
        ptrsArr[j] = tmp;                                                  
    }                                                                            
}   

/* EOF */
