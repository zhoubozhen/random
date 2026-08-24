# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# >>> conda initialize >>>
if [ -f "$HOME/anaconda3/etc/profile.d/conda.sh" ]; then
    . "$HOME/anaconda3/etc/profile.d/conda.sh"
fi
# <<< conda initialize <<<

# block unwanted auto "conda activate base"
if declare -f conda >/dev/null 2>&1; then
    eval "$(declare -f conda | sed '1s/^conda /__conda_original /')"

    conda() {
        if [[ "$1" == "activate" && "${2:-}" == "base" ]]; then
            return 0
        fi
        __conda_original "$@"
    }
fi

export PS1='[\u@\h \W]$ '
alias small='conda activate small'
alias devito='conda activate devito'
alias trans='conda activate transcranial'
alias mpi='source /home/bozhen2/zbz_start/mpi/mpi.sh'
alias nsd='conda activate nsd'
alias conda_de='conda deactivate'

alias give='chmod +x'

alias reload='source ~/.bashrc'
alias backup='cp ~/.bashrc /home/bozhen2/bashrc_backup/.bashrc_$(date +%Y%m%d)'

alias init_cluster='/home/bozhen2/my_packages/fista_tranPACT/my_code/init_cluster_workdir.sh'
alias init_local='/home/bozhen2/my_packages/fista_tranPACT/my_code/init_local_workdir.sh'
alias init_exp_local='/home/bozhen2/my_packages/fista_tranPACT/my_code/init_local_exp.sh'
alias init_exp_cluster='/home/bozhen2/my_packages/fista_tranPACT/my_code/init_cluster_exp.sh'
alias init_mpi='/home/bozhen2/my_packages/mpi_fista_tranPACT/my_code/init_mpi_local.sh'
alias init_mpi_cluster='/home/bozhen2/my_packages/mpi_fista_tranPACT/my_code/init_mpi_cluster.sh'

alias see='watch -n 1 nvidia-smi'
alias nv='nvidia-smi'

alias a9='ssh bozhen2@anastasio9.bioen.illinois.edu'
alias a8='ssh bozhen2@anastasio8.bioen.illinois.edu'
alias ein='ssh bozhen2@einstein.bioen.illinois.edu'
alias h01='ssh bozhen2@anastasio-h01.bioen.illinois.edu'
alias a6='ssh bozhen2@anastasio6.bioen.illinois.edu'
alias w3='ssh bozhen2@anastasio-wk-03.bioen.illinois.edu'

alias cq='condor_q'
alias ckill='condor_rm'
alias cs='condor_status'
alias csub='condor_submit'
alias cgpu='/home/bozhen2/zbz_start/cgpu/cgpu.sh'

alias para='/home/bozhen2/software/ParaView-6.0.1-MPI-Linux-Python3.12-x86_64/bin/pvserver --force-offscreen-rendering'

alias tmux_make='tmux new -s work'
alias tmux_kill='tmux kill-server'
alias tmux_a='tmux attach -t'

alias remove='for f in * .[!.]* ..?*; do rm -rf "/home/bozhen2/Pictures/trash/$f"; mv "$f" /home/bozhen2/Pictures/trash/ 2>/dev/null; done'

# ---- auto load NVHPC (for devito) ----
if command -v module >/dev/null 2>&1; then
    module load nvidia-hpc-sdk-multi/25.1-rh8 >/dev/null 2>&1
    module load cuda-toolkit/12.2 >/dev/null 2>&1
fi

export CC=nvc
export CXX=nvc++
export CUDA_DEVICE_ORDER=PCI_BUS_ID
