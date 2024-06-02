![image](https://github.com/mariacfs15/atividade10--raroacademy-MARIACRISTINA-SILVA/assets/97346690/db933e41-0ec0-4d34-91db-83cc8b5124d9)

                                                                  Atividade 10

O objetivo desta atividade é avaliar sua capacidade de implementar testes automatizados com RobotFramework

Enunciado

●	Esta atividade será realizada no aplicativo Product Registration

1.	Crie um repositório no Github chamado atividade10-raroacademy-SEUNOME
   
2.	Crie seu projeto de automação seguindo o'que foi passado nas aulas
   
3.	Implemente validações no Product Registration tais como:
-	Validar a funcionalidade de products
-	Validar a funcionalidade de backup/restore
-	Validar a funcionalidade de data export/import
-	Validar a funcionalidade de report
Conforme falado em sala de aula, os testes seguirão o padrão do curso, as keywords de teste devem estar no padrão BDD, os cenários que for possível utilizarem o conceito [Template].

OBS: Todo conteúdo que foi passado em sala de aula, é o suﬁciente para realizar essa atividade
OBS²: Utilizar o formato de PageObjects.
 
Especiﬁcações:

Gestão de Produtos:
Para cadastrar um novo produto, o usuário precisa preencher a descrição, a quantidade em estoque e seu valor unitário.
Para controlar a quantidade de produto em estoque, deverão existir opções de acrescentar e decrementar a quantidade de produto. Mas o estoque não pode ﬁcar negativo.
As informações do produtos podem ser editadas, e, a partir do momento em que não for interessante manter o produto em estoque, ele poderá ser excluído. A pesquisa de produtos está disponível para o usuário.

Gestão de Informações:
No dia-a-dia, para ter acesso a informações, o usuário poderá visualizar o inventário de estoque bem como as entradas e saídas de produtos, através dos relatórios.
As entradas e saídas de produtos serão ﬁltradas por um período de tempo e esse resultado será exibido em um pdf. As opções de visualizar o documento e enviá-lo por e-mail estarão disponíveis para o usuário. O usuário não poderá emitir o relatório sem informar um período. Já para o inventário de estoque, não será necessário um ﬁltro por período, mas as opções para visualizar o relatório e disponibilizá-lo por email também devem estar disponíveis.

Manutenção :
Para não perder suas informações, o usuário irá realizar um backup de todas as informações do sistema. E, de posse dessas informações, o restore poderá ser feito.
Os registros de produtos, suas entradas e saídas e grupos poderão ser importadas para um arquivo.csv. Para gerar o arquivo, é necessário que estes registros tenham sido realizados anteriormente.
O usuário poderá importar novos produtos, bem como suas entradas e saídas e também grupos de produtos.
Todos os arquivos gerados pelo sistema e a serem importados para o sistemas devem ﬁcar na pasta Estoque.
