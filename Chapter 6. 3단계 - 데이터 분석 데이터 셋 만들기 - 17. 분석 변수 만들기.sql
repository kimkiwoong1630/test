/* 17. 분석 변수 만들기 */

        
	   select m.movieid , m.title_nm , m.realse_year
	         , case when m.genres_nm like '%Action%'      then 1 else 0 end action_yn
	         , case when m.genres_nm like '%Adventure%'   then 1 else 0 end Adventure_yn
	         , case when m.genres_nm like '%Animation%'   then 1 else 0 end Animation_yn
	         , case when m.genres_nm like '%Children%'    then 1 else 0 end Children_yn
	         , case when m.genres_nm like '%Comedy%'      then 1 else 0 end Comedy_yn
	         , case when m.genres_nm like '%Crime%'       then 1 else 0 end Crime_yn
	         , case when m.genres_nm like '%Documentary%' then 1 else 0 end Documentary_yn
	         , case when m.genres_nm like '%Drama%'       then 1 else 0 end Drama_yn
	         , case when m.genres_nm like '%Fantasy%'     then 1 else 0 end Fantasy_yn
	         , case when m.genres_nm like '%Film-Noir%'   then 1 else 0 end Film_Noir_yn
	         , case when m.genres_nm like '%Horror%'      then 1 else 0 end Horror_yn
	         , case when m.genres_nm like '%Musical%'     then 1 else 0 end Musical_yn
	         , case when m.genres_nm like '%Mystery%'     then 1 else 0 end Mystery_yn
	         , case when m.genres_nm like '%Romance%'     then 1 else 0 end Romance_yn
	         , case when m.genres_nm like '%Sci-Fi%'      then 1 else 0 end Sci_Fi_yn       
	         , case when m.genres_nm like '%Thriller%'    then 1 else 0 end Thriller_yn
	         , case when m.genres_nm like '%War%'         then 1 else 0 end War_yn
	         , case when m.genres_nm like '%Western%'     then 1 else 0 end Western_yn
	     from movie m;