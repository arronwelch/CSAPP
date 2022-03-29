find . | grep '\.sh$' | xargs cat | wc -l

# $ find . > outfile0
# $ grep '\.sh$' < outfile0 > outfile1
# $ xargs cat < outfile1 > outfile2
# $ wc -l < outfile2
