# iCare
A Mobile Application to help nursing Students access their study materials easily.



# Contributing Guidelines

Welcome to iCare - A mobile Application for Nursing students.

## Frok this Repository
Fork this repository by clicking on the fork button on the top of this page. This will create a copy of this repository in your account.

## Clone this Repository
Now clone the forked repository to your machine. Go to your GitHub account, open the forked repository, click on the code button and then click the copy to *clipboard* icon.

Open a terminal and run the following git command:

``` git clone "url you just copied" ```

where "url you just copied" (without the quotation marks) is the url to this repository (your fork of this project). See the previous steps to obtain the url.

For example:
```git clone https://github.com/this-is-you/iCare.git```

where ```this-is-you``` is your GitHub username. Here you're copying the contents of the iCare repository on GitHub to your computer.

## Create a branch
Change to the repository directory on your computer (if you are not already there):

```cd iCare```

Now create a branch using the ```git checkout``` command:

For Example ```git checkout -b add-word-documentation```

(The name of the branch does not need to have the word add in it, but it's a reasonable thing to include because the purpose of this branch is to add your name to a list.)

## Make necessary changes and commit those changes

Now open the files you want to edit or simply add your code files and folders to the git project.
(For the first Android code, it will be better to simply copy all android code to your branch).

Save the File

If you go to the project directory and execute the command ```git status```, you'll see there are all changes you have made.

Add those changes to the branch you just created using the git add command:

```git add root-android-folder```

Now commit those changes using the ```git commit``` command:

For Example: ```git commit -m "Add initial android code to the repo"```

## Push changes to GitHub

Push your changes using the command ```git push```:

```git push origin <add-your-branch-name>```

Like : ```git push origin add-word-documentation```

## Submit your changes for review

If you go to your repository on GitHub, you'll see a ```Compare & pull request``` button. Click on that button.

Create the Pull Request and wait for a Review

___________________________
## NOTICE
    * Make double sure that your Code works before pushing to GitHub
    * Always be consistent with the Code styling
    * Always finish the task you have been assigned to
    * If in case you do not finish, Alert the team in time
    * The Master Branch is for the final Product. DO not Push Directly to it(It wont work or Will be ignored)
