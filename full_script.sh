#!/usr/bin/env bash

# -e: exit whenever one of the commands failed.
set -e

# Part 1. Basic Shell Commands
# Print something to the screen
echo "Let's get started"

# Make a directory for our future work
mkdir demo_dir
# Listing files/directory
ls 
mkdir -p demo_dir2/sub_dir
ls *
# "Move" into that directory
cd demo_dir
# "Jump out" of it
cd ..
# Try to remove it
rmdir demo_dir

# Create an empty file
touch an_empty_file
ls -l 
touch an_empty_file
ls -l 
# Getting help
touch --help
ls --help
man ls

# Remove that file
rm an_empty_file

# Recursively remove
for idx in $(seq 0 10); do
    touch "demo_dir2/file_${idx}";
done
ls demo_dir2
tree
rm -r demo_dir2
ls

# Moving files
touch a_new_file a_second_file a_third_file
mv a_new_file A_NEW_FILE
mkdir demo_dir
mv A_NEW_FILE demo_dir
ls 

# Copying files
cp resources/twinkle.txt .
cat twinkle.txt
tail twinkle.txt
tail -n3 twinkle.txt
head -n3 twinkle.txt
less twinkle.txt

# Look for (grep)
grep star twinkle.txt
# 1 line after
grep -A1 star twinkle.txt
# 1 line before
grep -B1 star twinkle.txt
# 1 line before and after
grep -C1 star twinkle.txt

# Count words
grep star twinkle.txt | wc -w
# Count lines
grep star twinkle.txt | wc -l
wc --help

# Listing files
ls 
ls -l
ls -a
touch .a_hidden_file
ls -h 
ls -lath

# Taking difference
cp resources/twinkle.txt twinkle2.txt
cp resources/twinkle_copy.txt twinkle3.txt
diff twinkle2.txt twinkle3.txt
 
# Listing numbers
seq 1 12
# Listing with intervals
seq 1 0.533 10
# with format
seq -f '%.2f' 1 0.533 10

# Substitute 
sed 's/star/moonns/g' twinkle.txt
# Substitute in-place
sed -i 's/star/moonns/g' twinkle.txt
# More advanced substitution
sed 's/\ \([a-z]*\)ns/\ \1/g' twinkle.txt

# awk -- Select particular records in a file
ls -l | awk '{print $2}'

pgrep

ps -x

kill

ln

watch

tar



# Part 2. Shell logics
## Pipe |
echo "stars and moon\nSun and Mars" | grep "moon"

## Or || 
ls not_exist_file || echo 'Cannot find file, creating it.'; touch not_exist_file

## And &&
ls not_exist_file2 && echo 'Cannot find file, creating it.'; touch not_exist_file2


## Background process &
for idx in $(seq 0 10) 
do
    echo $idx; 
    sleep 1;
done &

job

## Disowning a job
disown

## Standard output
### Overwrite >
echo "First line" > test_file.txt && cat test_file.txt
### Append >>
echo "Second line" >> test_file.txt && cat test_file.txt

### It actually overwrites
echo "A new line" > test_file.txt && cat test_file.txt

## Heredoc
cat < test_file.txt

## End-of-file
cat << EOF
Content between the EOF tags
  can is printed like so.
- is a poinrt
'an apple'
EOF

echo "Content between the EOF tags\n  can is printed like so.\n- is a poinrt\n'an apple'\n"

cat << EOF > new_test_file.txt
One can even output it 
to a file, or pipe it for
the next command.
EOF

var='yes'
if [ "$var" = "yes" ]
then
    echo "This is the true statement"
else
    echo "This is the false statement"
fi

echo \ 
    "This is a long command"; \
    ls \
    -d . ;\
    cat \
    new_test_file.txt


## Regex -- Regular Expression
# Practice: https://regex101.com
# Cheatsheet: https://web.mit.edu/hackl/www/lab/turkshop/slides/regex-cheatsheet.pdf

grep twinkle twinkle2.txt | sed 's/\(tw.*kle\).*/\1/'
grep "^When" twinkle2.txt

# Part 3. Text-editors
# 
# a. nano
#
# b. vi, vim, nvim
# vimtutor
#
# c. emac
# Part 4. File permissions
#

chmod

chown

chgrp

# Part 5. Shell programming

bash resources/some_maths.sh

chmod +x resources/say_hello.sh
resources/say_hello.sh -n Tom 
resources/say_hello.sh --num 4 -n Tom 
resources/say_hello.sh --num 3 -n "Tom and Mary"

# Bonus


# Part 6. Programs
curl 

shasum

wget 


# Part 7. Advanced topics
#
# a) rc files
# The rc file is the 'run command' file
# Essentially, it is used for predefining certain functions/varibles
# that the user will need, it is basically a configuation file.

source resources/demo_bashrc
. ./resources/demo_bashrc

# b) Makefile
#
# c) SSH
# The simplest command is
# ssh username@hostname

# d) rsync
#
# e) cron / crontab
#
# f) Multiplexer
#
# g) script 
#

# Part 8. Git 

echo "Let's create a Git repo"

mkdir git_repo && cd git_repo

# Initialise the directory as a Git Repository
git init .

echo "# A testing repo" > README.md

# Adding the modified file to stage
git add README.md
# Commit the change
git commit -m 'Create README.md'

# 









