    ____  _________ ____  ___  ______________  __
   / __ \/  _/ ___// __ \/   |/_  __/ ____/ / / /
  / / / // / \__ \/ /_/ / /| | / / / /   / /_/ / 
 / /_/ // / ___/ / ____/ ___ |/ / / /___/ __  /  
/_____/___//____/_/   /_/  |_/_/  \____/_/ /_/   
                                                 
===================================================================


ABOUT:
Dispatch is used to easily harden Windows system.
This is a small side project that was made due to the fustration of other automated system hardening scripts either not working or really having no idea how to use it.

This is all scripted in batch and powershell to have no compatibility or dependency issues, and the framework easily editable. This is specifically for Windows 10. Windows 7 and Windows 2012 server *should* work as well.

Since this is is a side project I will do the best I can to fix as many bugs time will give me. I'm also not the best coder around so hopefully someone will help... hopefully. And as always do not use this in a production environment lol.

========================================

USAGE:
To use it, run 'framework.cmd' as administrator. Type 'help' in the console and you should see a list of commands.

To add plugins just make your own plugin.cmd (HAS TO BE A .cmd EXTENSION, NOT .bat) and add it to one of the appropriate folders. The framework will detect and list/use it automatically.

Remember to use a virtual machine when testing this. Bugs are still rampant and alot of refining is needed. 
Make sure to restart the machine in order for the tweaks and changes to be in place.

========================================

HELP:
Testers are currently DrDavid101 and Goerick (me). Anymore testers are welcome!

If you have a way to edit the MMC or gpedit via command line or powershell or anything automated let me know! 

========================================

Everything on Modules, api, and Stigs *should* work
Scanner is broken
Use alpha with caution



