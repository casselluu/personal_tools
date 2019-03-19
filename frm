#!/usr/local/bin/python
#this program is for the alias of rm program
#after i commit so many mistake i decide to wirte a program to replace the rm command
import os
import time
from hmmer_parser import *
def fake_rm_file(argv):
    #predefine the folder that store the trash files
    trash_folder=r"/home/fanxuezhe/files/trash"
    #judge if there is the trash folder and if there is no such a folder build it or keep it
    if os.path.exists(trash_folder) and os.path.isdir(trash_folder):
        pass
    elif not os.path.exists(trash_folder):
        mkdir_folder(trash_folder)
    #get the local time and use the time to build a new folder to store the file 
    local_time=time.localtime(time.time())
    #format the time
    format_time=str(local_time[0])+"-"+str(local_time[1])+"-"+str(local_time[2])
    #make a trash folder for this day
    trash_day_folder=trash_folder+"/"+format_time
    #make a new folder for this day
    if os.path.exists(trash_day_folder) and os.path.isdir(trash_day_folder):
        pass
    elif not os.path.exists(trash_day_folder):
        mkdir_folder(trash_day_folder)
    #if there is parameter following the program
    if argv:
        #calculate the numbers of the parameter
        len_para=len(argv)
        for i in range(1,len_para):
            #get the file name or the folder name 
            name_n=argv[i]
            mv_file_folder(name_n,trash_day_folder)
"""            #decide the name_n is folder or is file
            if  os.path.isdir(name_n):
                #move file to the trash folder
                #check if there is file which has the same name with the file to be removed
                if os.path.exists(os.path.join(trash_day_folder,name_n)):
                    os.rename(name_n,name_n+"1") 
                    shutil.copytree(name_n,os.path.join(trash_day_folder,name_n))
                    os.rmdir(name_n)
                    print "folder:",name_n," will be deleted"
            #if the name_n is a file,just copy it to the trash folder of today
            elif os.path.isfile(name_n):
                shutil.copy(name_n,trash_day_folder)
                os.remove(name_n)
                print "file:","name_n","will be deleted"
"""
#define a module,the function of this modlue is to mv the file to the target folder
#the path_n is the folder that file will be moved to 
def mv_file_folder(name_n,trash_day_folder):
    #if te object to be removed is a folder
    if  os.path.isdir(name_n):
        name_n=name_n.strip("/")
	#move file to the trash folder
	#check if there is file which has the same name with the file to be removed
	if os.path.exists(os.path.join(trash_day_folder,name_n)):
            name_new=name_n+"1"
            #get the current directory
            #current_dir=os.getcwd()
            #old_path_file=current_dir+"/"+name_n
            #new_file_path=current_dir
            #shutil.move(old_path_file,new_file_path)
            os.system("mv %s %s"%(name_n,name_new))
            #os.rename(name_n,name_new)
	    #shutil.move(name_n,os.path.join(trash_day_folder,name_new))
            
            mv_file_folder(name_n+"1",trash_day_folder)
        elif not os.path.exists(os.path.join(trash_day_folder,name_n)):
	    shutil.copytree(name_n,os.path.join(trash_day_folder,name_n))
	    os.system("rm -r %s"%name_n)
	    print "folder:",name_n," will be deleted"
    #if the name_n is a file,just copy it to the trash folder of today
    elif os.path.isfile(name_n):
        file_name=os.path.split(name_n)[-1]
        if os.path.exists(os.path.join(trash_day_folder,file_name)):
            os.rename(name_n,name_n+"1")
            mv_file_folder(name_n+"1",trash_day_folder)
        elif not os.path.exists(os.path.join(trash_day_folder,name_n)):
	    shutil.copy(name_n,trash_day_folder)
	    os.remove(name_n)
	    print "file:",name_n,"will be deleted"
    elif not os.path.exists(name_n):
        print "there is no file named:",name_n,"please recheck"

    
if __name__=="__main__":
    from sys import argv
    print "there is files that will be deleted:",argv[1:]
    fake_rm_file(argv)
    #fake_rm_file(argv) 
