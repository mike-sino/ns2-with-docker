BEGIN{  
         average=0.0;  
}  
{  
         if($1=="1"){  
                   average=average + $2;  
         }  
         if($1=="2"){  
                   average=average + $2;  
         }  
         if($1=="3"){  
                   average=average + $2;  
         }  
         if($1=="4"){  
                   average=average + $2;  
         }  
         if($1=="5"){  
                   average=average + $2;  
         }  
}  
END {  
         printf "%d %.4f \n",time, (average/5) >> outfile;  
}  