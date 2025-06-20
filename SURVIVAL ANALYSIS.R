# Installing package
install.packages("survival")

# Loading package
library(survival)

# Dataset information
?lung

# Fitting the survival model
Survival_Function = survfit(Surv(lung$time, 
                                 lung$status == 2)~1)

Survival_Function

# Plotting the function
plot(Survival_Function)

# Fitting the Cox model
Cox_mod <- coxph(Surv(lung$time, 
                      lung$status == 2)~., data = lung)

# Summarizing the model
summary(Cox_mod)

# Fitting survfit()
Cox <- survfit(Cox_mod)

# Plotting the function
plot(Cox)

##Survival analysis in R

library(dplyr)
library(survminer)
library(survival)
?lung

head(lung)
class(lung)
dim(lung)
View(lung)

as_tibble(lung)
lung <- as_tibble(lung)
lung

s <- Surv(lung$time, lung$status)
class(s)
s
head(lung)

##fit a survival curve
survfit(s~1)
survfit(Surv(time, status)~1, data=lung)
sfit <- survfit(Surv(time, status)~1, data=lung)
sfit
summary(sfit)

# ?summary.survfit
range(lung$time)
seq(0, 1100, 100)

summary(sfit, times=seq(0, 1000, 100))

##Kaplan-Meier Plots
sfit <- survfit(Surv(time, status)~sex, data=lung)
plot(sfit)


library(survminer)
ggsurvplot(sfit)

ggsurvplot(sfit, conf.int=TRUE, pval=TRUE, risk.table=TRUE, 
           legend.labs=c("Male", "Female"), legend.title="Sex",  
           palette=c("dodgerblue2", "orchid2"), 
           title="Kaplan-Meier Curve for Lung Cancer Survival", 
           risk.table.height=.15)







