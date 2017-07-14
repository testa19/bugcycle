# Bugcycle

## Stop “Bicycle” Reinventing!!! 

RoR project which will help to find “Bicycle” as quick as possible.


### Design suggestions: 
* Users; 
* Bicycle Categories (each bicycle has only one category); 
* “Bicycles”. Attributes: name, image (​Bug​cycles must have a face!, please make few size versions), description. 
* “Bicycle” Likes. User can  “like” any “bicycle” only once. 
* Bicycle commits (validation: no more than 1 commit per Bicycle) (​Additional: if marked as used I it wont show in the search result anymore) 
 
### Key Features:  
* Ajax Search by title and description. (no gems).  
(Additional: bikes that were already used by current user are excluded. Case insensitive ) 
* Filtering by Categories 
* Pagination (gem) 
* Authentication (Devise) 
* Each bike has unique name (Additional: case insensitive). 
* Additional: Authorization via CanCanCan or Pundit. 

### Flow: 
* bundle install; 
* db preparing; 
* db seeding; 
* start server  `rails server --binding=0.0.0.0`; 
* Sign in with credentials email: `pierre@michaux.com`; password: `progenitor`; 

Main branch: ‘dev’, each feature developed in separate branch and merged into dev branch via PR. 
Time: 3-4 days. 
Rails version: 5.0.4
Ruby version: 2.3.3 (x86_64-linux)