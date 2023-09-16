/*** host not known
vi /Users/d/.ssh/known_hosts
dd
:wq
***/

/dcs04/legacy-dcs01-igm/segevlab/data

save /users/amuzaal1/donor_live

#R
ssh amuzaal1@jhpce01.jhsph.edu
ssh -X amuzaal1@jhpce01.jhsph.edu
qrsh -l mem_free=70G,h_vmem=70G
module load conda_R
module load rstudio
rstudio

jhpce-rstudio-server
<CTRL>-C
-L 41325:compute-094:41325


jhpce-rstudio-server
~C
ssh > -L 41325:compute-086:41325
safari/browser: http://localhost:41325
amuzaal1
password
-KL 41325

echo rstudio -b do HW4_MuzaaleAbi.Rmd -> test.sh
qsub -l mf=17G,h_vmem=50G,h_fsize=50G  test.sh

#Stata 
qrsh -l h_vmem=70G
stata-mp
scp /users/d/desktop/my.nber.data.do amuzaal1@jhpce01.jhsph.edu:/users/amuzaal1/
*/
mem_free = specific
h_vem = hard limit 
echo stata-mp -b do  my.nber.data.do -> my.nber.data.sh
qsub -l mf=17G,h_vmem=100G my.nber.data.sh 

qsub -l mem_free=20G,h_vmem=20G my.nber.data.sh //reached 100% but couldn't save .dta
qsub -l mem_free=100G,h_vmem=100G my.nber.data.sh //reached 100% but couldn't save .dta
qsub -l mem_free=20G,h_vmem=100G my.nber.data.sh //reached 100% but couldn't save .dta
qsub -l mf=17G,h_vmem=70G,h_fsize=50G my.nber.data.sh //failed at 93%
qstat -j 2969617 | grep error 
qstat
cat *.log 
qacct -f /cm/shared/apps/sge/sge-8.1.9/default/common/accounFng_20230220_0300.txt -j JOBID
scp amuzaal1@jhpce01.jhsph.edu:/users/amuzaal1/srtrdonors.dta /users/d/desktop/
*/

scp /dcs01/igm/segevlab/data/srtr1707_donorids/docs/LivDonIDFormat.docx /users/d/desktop/
scp amuzaal1@jhpce01.jhsph.edu:/users/amuzaal1/donor_live.dta /users/d/desktop/

#1
cd /dcs01/igm/segevlab/data/usrds2016
cd data
ls -l
cd usrds2015
ls -l
cd core
ls -l
qrsh
stata-mp
use pde2013 in 1/1000,clear
use como_* using medevid in 1/10,clear

//claims: det inc pd ps rev
//core: rxhist.dta rxhist60.dta tx.dta death.dta waitlist_ki.dta
//crosswalk: usrdsid_multiple_xref.dta xref_phs_2016.dta
//hospital: hosp_2010on.dta
//sas: all the above in sas7bcat
//transplant: tx*.dta sort of files

#2
cp ~amassie/mock_cdrg/don_liv_fol.dta /users/amuzaal1
cp ~amassie/mock_cdrg/donor_live.dta /users/amuzaal1
cd ..
cd claims
cd pd
ls -l
stata-mp
cf _all using $core16/patients

#3

qrsh -l h_vmem=50G
echo stata-mp -b do  12_benzo_emm.7.29.do ->  benzo_emm.7.29.sh
qsub -l mf=1.5G,h_vmem=1.5G,h_fsize=1.5G  benzo_emm.7.29.sh
qstat
qdel 3896325
nano abi.sh
./abi.sh
bash abi.sh
cat twinStudy.log
qstat 
qmem
rm abi*
rmdir usrds
cat *.log
less *.log
285723

#

scp /users/d/desktop/*.do amuzaal1@jhpce01.jhsph.edu:/users/amuzaal1
*/
scp amuzaal1@jhpce01.jhsph.edu:/users/amuzaal1/*.dta /users/d/desktop/
*/
ssh amuzaal1@jhpce01.jhsph.edu 
cp don_id.dta docs /users/amuzaal1/

#5

01_build.do; 5G 
02_lig_claim.do; 50G
02b_como_claim.do; 50G
03_join.do; 5G
pd_exp.do; 

01_benzo_exp.do      08:10:00-08:20:26 N=77,489,793
02_benzo_pat.do      08:29:41-08:35:06 N=34,271,001
03_benzo_medev.do    08:41:58-08:42:09 N=247,728
04_benzo_employ.do   08:46:31-08:46:36 N=247,728
05_benzo_elig.do     08:50:33-08:51:33 N=6,051,271
06_benzo_tvar.do     09:13:47-09:23:41 N=3,736,288
07_benzo_cohort.do   09:26:59-09:27:23 N=3,631,464
08_benzo_baseline.do 09:33:15-09:34:30 N=111,086
10_benzo_emm0307.do  18:55:06-02:33:43 N=NA
