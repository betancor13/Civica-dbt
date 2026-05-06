{% docs doc_fct_orders %}

Esta es la tabla de hechos principal de la empresa. Contiene un registro por cada pedido realizado en nuestro sistema. 

**Información importante:**
* Si un pedido tiene coste 0, suele tratarse de un cupón de regalo o una promoción.
* Esta tabla debe cruzarse con `dim_users` para obtener los datos demográficos del cliente.

{% enddocs %}