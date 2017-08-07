# Convention Roomate Matcher

There are many conventions every year that thousands of people attend. Many times these attendees would like to save some money since the tickets to the convention can be quite pricey. The convention roomate matcher allows attendees from all over the world to find a roomate and share the costs of lodging. There are many qualifiers that help to create the perfect match:

## Most Important Match Qualifiers:
  * Convention Name / Location
  * Gender
  * check-in / check-out dates

## Secondary Match Qualifiers:
  * smoker
  * age
  * home city

The CRM (Convention Roomate Matcher) will begin by trying to match all 6 qualifiers. If no matches are found then the search will remove the secondary match qualifiers from the search.

## The CRM needs to include specific conventions.
  * Event planners can create an entry for their specific convention and can send the link to all the attendees of the convention.
  * Attendees can follow the link to then fill-in their specific information to find a match
  * Some attendees may have already used the CRM from a different convention and can simply supply their email address to utilize their previous entry
  * The attendees that have used the CRM before may have changed their home location and will need to update this information

## User Stories:
  1. Debby Tucker is an event planner who is looking for extra resources to provide for the attendees of the convention she is planning. Debby is planning BMES and has never used the CRM before. She needs to add a convention to the CRM and to create a link to the website for her attendees to be able to use to find possible roomates.
  2. Jessica Hernandez is attending the BMES conference and wants to find someone to split the costs of lodging. She is looking for another female who is a similar age and who also doesn't smoke so she can feel comfortable lodging with this stranger.
  3. Joey Terrance is attending BMES and honestly doesn't care about saving money, but he has used the CRM in the past and is still really good friends with the person he roomed with before and wants to be able to meet another great friend by rooming with a new person at the BMES conference.
  4. Debby Tucker is furious that the convention center cancelled her booking for the BMES conference and suddenly needs to change the start and end dates of the convention. She wants to be able to update the dates on the CRM and email all of the users who have already been matched to let them know of the change. (P.S. Debby Tucker is Jennifer Shopsin's mother and this would NEVER happen to her, but perhaps this could happen to another event planner.)
  5. Lauren Shilling is attending the Perinatal Women's Mental Health convention and has already used the CRM for a former convention. Lauren moved from Washington, DC to San Francisco, CA since she last used the CRM and needs to update this information to find the best possible match.
  6. Harrison Palin lives in a remote town in Alaska and unfortunately is not able to find a match that lives close by. The search will have to be expanded to find a match that is still of the same gender, attending the same convention and has the same requested check-in and check-out dates.

## Views:
  * index - homepage that will include a spot for add convention or user login
  * convention - form to add convention to db
  * conventions - lists all of the conventions
  * user login - gives option for former users or for new users
    * former user - give email address -> verify correct info
        * user_convention specific - add convention, give check-in and check-out dates
    * new user - fill in form for all requested data
  * match - list all possible matches

## Models:
  * Convention
  * User
  * City

## Data:
  * GeoLite2-City-Locations-en.csv (downloaded csv file from https://dev.maxmind.com/geoip/geoip2/geolite2/)

## Signed off by:
* Angie and Matt