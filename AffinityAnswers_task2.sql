use Rfam;



#a.1 How many types of tigers can be found in the taxonomy table of the dataset? 
SELECT COUNT(DISTINCT ncbi_id) , COUNT(DISTINCT species) from taxonomy;


#a.2 What is the "ncbi_id" of the Sumatran Tiger?
select ncbi_id from Rfam.taxonomy WHERE species  ='Sumatran Tiger';
select ncbi_id from Rfam.taxonomy_websearch tw  WHERE species  ='Sumatran Tiger';
select ncbi_id from Rfam.family_ncbi fn  WHERE species  ='Sumatran Tiger';

select * from taxonomy t ;
select * from family_ncbi ;
select * from genome ;


#c. Which type of rice has the longest DNA sequence? (hint: use the rfamseq and the taxonomy tables)
select MAX(`length`) from rfamseq r ;
select * from rfamseq r ;
select * from taxonomy t ;


#d. We want to paginate a list of the family names and their longest DNA sequence 
#lengths (in descending order of length) where only families that have DNA sequence lengths greater than 1,000,000 are included. 
#Give a query that will return the 9th page when there are 15 results per page.


select author as Fam_name, f.rfam_id  , fn.rfam_acc , rs.`length`  from family f 
left join family_ncbi fn on f.rfam_id = fn.rfam_id 
left join rfamseq rs  on fn.ncbi_id = rs.ncbi_id 
where rs.`length` > 1000000  ;


DECLARE @PageNumber as INT
DECLARE @RowsOfPage as INT
SET @PageNumber=9 
SET @RowsOfPage=15
select Fam_name, f.rfam_id 
from family f left join family_ncbi fn on f.rfam_id = fn.rfam_id left join rfamseq rs  on fn.ncbi_id = rs.ncbi_id 
ORDER BY max (length)  
OFFSET (@PageNumber-1)*@RowsOfPage ROWS
FETCH NEXT @RowsOfPage ROWS ONLY


































