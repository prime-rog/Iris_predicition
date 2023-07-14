my_packages = c("randomForest" , "data.table" , "ggplot" , "ggthemes")

install_if_missing = function(p)
{
        if(p %in% rownames(install.packages()==FALSE))
        {
                install.packages(p)
        }
}

invisible(sapply(my_packages, install_if_missing))