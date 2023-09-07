#!/bin/bash                                                                                                                                   
  # Check if a directory path was provided as an argument                                                                                       
  if [ $# -lt 2 ]; then                                                                                                                         
      echo "Please provide a variable name and value as arguments."                                                                                    
      exit 1                                                                                                                                    
  fi                       
  var_name="p$1"
  #remove the last p1 to add new                                                                                                                    
    sed -i "/$var_name/d" ~/.bashrc 
  # Set the directory path as a global variable named p1 in the .bashrc file                                                                    
  echo "export $var_name=$2" >> ~/.bashrc                                                                                                              

  # Reload the .bashrc file to apply the changes                                                                                                
  source ~/.bashrc                                                                                                                              

  echo "$var_name is now set to $2"
