# Notes for interacting with the postgreSQL database directly using psql:
1. '\list' to show all the databases
2. '\c database_name' to access specific database
3. '\dt' to show all tables in the db.
4. 'SELECT * FROM tablename;' to show contents of specific table.

# Notes for testing a pull request before merging them:

## 1. Ensure Your Local main Branch is Up-to-date: 'git fetch origin' (First, fetch the latest changes)
   Then, switch to the main branch and pull the latest changes:
   'git checkout main'
   'git pull origin main'
   
## 2. Fetch and Checkout the Pull Request Branch
For example: The pull request is from the branch CeliaF on the contributor's fork. To test it, you can check out this branch directly.
First, you'll need to fetch the changes:
'git fetch origin BranchToBeTested:BranchToBeTested'
This fetches the BranchToBeTested branch from the remote repository and creates a local branch named BranchToBeTested.
Now, check out this branch:
'git checkout BranchToBeTested'

## 3. Merge the main Branch into BranchToBeTested to Simulate the Merge
This will allow you to test the changes as they would appear once merged into the production code.
Do a merge without committing to see potential conflicts and changes:
'git merge main --no-commit --no-ff'
--no-commit: This ensures that the merge won't be automatically committed. It allows you to see the changes and possibly resolve conflicts before committing.
--no-ff: This ensures a merge commit is created even if the branch could be fast-forwarded. This is closer to what happens when you press the merge button on GitHub.

## 4. Test the Changes
At this point, you should run the project, execute any relevant tests, and manually inspect the changes to ensure everything works as expected.
Resolve Conflicts (if any)
If there were any merge conflicts, you'll need to resolve them. After resolving, you can commit the changes:
'git commit -m "Test merge"'

## Remember, the above steps are to simulate and test the merge locally. They do not affect the actual pull request on GitHub. 
## Once you're satisfied with the testing, you can go to GitHub and approve and merge the pull request.


