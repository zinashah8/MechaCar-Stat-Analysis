```{r}
library(tidyverse) #import tidyverse package
```

```{r}
mechaCarData <- read_csv("Resources/MechaCar_mpg.csv") #import MechaCar data
head(mechaCarData) #display first rows of imported data
```

```{r}
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + AWD + ground_clearance,data=mechaCarData) #generate multiple linear regression model
```

```{r}
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + AWD + ground_clearance,data=mechaCarData)) #generate summary statistics
```

```{r}
suspension_coil_data <- read_csv("Resources/Suspension_Coil.csv") #import suspension coil data
head(suspension_coil_data)
```

```{r}
total_summary <- suspension_coil_data %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI), .groups = 'keep') #create total summary table
total_summary
```

```{r}
lot_summary <- suspension_coil_data %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI), .groups = 'keep') #create lot summary table
lot_summary
```

```{r}
global_sample_table <- suspension_coil_data %>% sample_n(50) #randomly sample 50 data points
```

```{r}
plt <- ggplot(suspension_coil_data,aes(x=PSI)) #import all coil data into ggplot2
plt + geom_density() #visualize distribution with density plot
```

```{r}
plt <- ggplot(global_sample_table,aes(x=PSI)) #import sample coil data into ggplot2
plt + geom_density() #visualize distribution with density plot
```

```{r}
plt <- ggplot(global_sample_table,aes(x=log10(PSI))) #import sample coil data into ggplot2
plt + geom_density() #visualize distribution with density plot
```

```{r}
t.test(global_sample_table$PSI,mu=mean(suspension_coil_data$PSI)) #compare sample versus population mean
```

```{r}
psi_lot1_sample <- suspension_coil_data %>% subset(Manufacturing_Lot=='Lot1') %>% sample_n(25) #create a sample table of 25 data points with Lot 1
t.test(psi_lot1_sample$PSI,mu=mean(suspension_coil_data$PSI)) #compare Lot1 sample versus population mean
```

```{r}
psi_lot2_sample <- suspension_coil_data %>% subset(Manufacturing_Lot=='Lot2') %>% sample_n(25) #create a sample table of 25 data points with Lot 2
t.test(psi_lot2_sample$PSI,mu=mean(suspension_coil_data$PSI)) #compare Lot2 sample versus population mean
```

```{r}
psi_lot3_sample <- suspension_coil_data %>% subset(Manufacturing_Lot=='Lot3') %>% sample_n(25) #create a sample table of 25 data points with Lot 3
t.test(psi_lot3_sample$PSI,mu=mean(suspension_coil_data$PSI)) #compare Lot3 sample versus population mean
```
