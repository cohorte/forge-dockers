for /f %%i in ('docker volume ls -qf "dangling=true"') do docker volume rm %%i
