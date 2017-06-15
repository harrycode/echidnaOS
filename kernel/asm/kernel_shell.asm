global kernel_shell

extern task_start
extern start_tasks

section .data

%define shell_size          shell_end - shell
shell:                      incbin "../shell/shell.bin"
shell_end:

section .text

bits 32

kernel_shell:
    push shell_size
    push shell
    call task_start
    call start_tasks
