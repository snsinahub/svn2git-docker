# SVN2GIT docker

## Commands

### Get list of authors
```BASH
# Checkout
svn co --username your_name https://svn.server.com/repository

# List authors 
svn log --quiet | grep "^r" | awk '{print $3}' | sort | uniq > authors.txt
```

### Build
```BASH
docker build -t svn2git . --no-cache --network=host
# OR
docker build -t svn2git . 

```

### Run
```BASH
docker run -d -v <local-path>:/app/repos svn2git
# Example
docker run -d -v /tmp/svn/repos:/app/repos svn2git

```

### Inside docker
```BASH
svn2git https://svn.apache.org/repos/asf/zookeeper/ --authors authors.txt --verbose
cd <git-folder>

```

#### Push to github 
```BASH
git gc
git add .
git commit -m "Initial commit"
git branch -M main
git remote add origin url
git push -u origin main          
git config --global push.followTags true
```

## Known issues
- for some reason sometimes this may happen when trying to enter a password for `svn2git` command: The issue `Keeps on asking Password and then dies`
  - Here is the solution: `I have this issue. I figured out that you need to press ENTER once first, nothing will happen, and then you can type your password and press ENTER again. For some reason, it does not read the input as soon as the prompt appears.` source: [Keeps on asking Password and then dies](https://github.com/nirvdrum/svn2git/issues/280)
## External links
[svn2git](https://github.com/nirvdrum/svn2git)
