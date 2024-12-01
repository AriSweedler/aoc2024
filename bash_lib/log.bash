c_rst="\e[0m"
c_red="\e[31m"
c_green="\e[32m"
c_yellow="\e[33m"

function preamble() { echo -n "$(date "+%T") [aoc]"; }
function log::info() { echo -e "${c_green}$(preamble) INFO::${c_rst} $*" >&2; }
function log::warn() { echo -e   "${c_red}$(preamble) ERR::${c_rst} $*" >&2; }
function log::err()  { echo -e   "${c_red}$(preamble) ERR::${c_rst} $*" >&2; }
