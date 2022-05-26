# termtext
Bash script function outputs, resizes and wraps text based on terminal window size.
```terminal

Example: term_text center double danger ${test_text}

            ╔════════════════════════════════════════════════════════════════════════════════╗            
            ║                                  Lorem ipsum                                   ║            
            ║                                                                                ║            
            ║   dolor sit amet, consectetur adipiscing elit. Cras in odio mauris. Integer    ║            
            ║   aliquam urna quis lobortis iaculis. Proin non efficitur lectus, eu euismod   ║            
            ║   est. In et mauris arcu. Integer feugiat, elit eget lobortis faucibus, diam   ║            
            ║   quam sollicitudin mi, quis laoreet sapien sem nec leo. In viverra, libero    ║            
            ║   quis varius aliquam, nisi dolor bibendum lectus, a pretium tortor dolor at   ║            
            ║                                     enim.                                      ║            
            ╚════════════════════════════════════════════════════════════════════════════════╝            

Example: term_text left single warning ${test_text}

            +--------------------------------------------------------------------------------+            
            |  Lorem ipsum                                                                   |            
            |                                                                                |            
            |  dolor sit amet, consectetur adipiscing elit. Cras in odio mauris. Integer     |            
            |  aliquam urna quis lobortis iaculis. Proin non efficitur lectus, eu euismod    |            
            |  est. In et mauris arcu. Integer feugiat, elit eget lobortis faucibus, diam    |            
            |  quam sollicitudin mi, quis laoreet sapien sem nec leo. In viverra, libero     |            
            |  quis varius aliquam, nisi dolor bibendum lectus, a pretium tortor dolor at    |            
            |  enim.                                                                         |            
            +--------------------------------------------------------------------------------+            

Example: term_text center asterisk success ${test_text}

            **********************************************************************************            
            *                                  Lorem ipsum                                   *            
            *                                                                                *            
            *   dolor sit amet, consectetur adipiscing elit. Cras in odio mauris. Integer    *            
            *   aliquam urna quis lobortis iaculis. Proin non efficitur lectus, eu euismod   *            
            *   est. In et mauris arcu. Integer feugiat, elit eget lobortis faucibus, diam   *            
            *   quam sollicitudin mi, quis laoreet sapien sem nec leo. In viverra, libero    *            
            *   quis varius aliquam, nisi dolor bibendum lectus, a pretium tortor dolor at   *            
            *                                     enim.                                      *            
            **********************************************************************************            

Example: term_text left none info ${test_text}

                                                                                                          
               Lorem ipsum                                                                                
                                                                                                          
               dolor sit amet, consectetur adipiscing elit. Cras in odio mauris. Integer                  
               aliquam urna quis lobortis iaculis. Proin non efficitur lectus, eu euismod                 
               est. In et mauris arcu. Integer feugiat, elit eget lobortis faucibus, diam                 
               quam sollicitudin mi, quis laoreet sapien sem nec leo. In viverra, libero                  
               quis varius aliquam, nisi dolor bibendum lectus, a pretium tortor dolor at                 
               enim.                                                                                      
                                                                                                          

Example: term_text right none none ${test_text}

                                                                                                          
                                                                                Lorem ipsum               
                                                                                                          
                  dolor sit amet, consectetur adipiscing elit. Cras in odio mauris. Integer               
                 aliquam urna quis lobortis iaculis. Proin non efficitur lectus, eu euismod               
                 est. In et mauris arcu. Integer feugiat, elit eget lobortis faucibus, diam               
                  quam sollicitudin mi, quis laoreet sapien sem nec leo. In viverra, libero               
                 quis varius aliquam, nisi dolor bibendum lectus, a pretium tortor dolor at               
                                                                                      enim. 
                                                                                     
```
