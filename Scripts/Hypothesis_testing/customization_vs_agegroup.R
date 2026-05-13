df <- read.csv("./starbucks_customer_ordering_patterns.csv")
dir.create("Resources/Hypothesis_testing", recursive = TRUE, showWarnings = FALSE)
pdf("Resources/Hypothesis_testing/Age_vs_Customizations_Plot.pdf", width = 8, height = 6)

# create boxplot
boxplot(num_customizations ~ customer_age_group,
    data = df,
    main = "Number of Customizations by Customer Age Group",
    xlab = "Age Group",
    ylab = "Number of Customizations",
    col = c("#E6E6FA", "#7B68EE", "#483D8B", "#191970", "#000080")
)

dev.off()

# run Kruskal-Wallis test
kw_test_customizations <- kruskal.test(num_customizations ~ as.factor(customer_age_group), data = df)
print(kw_test_customizations)

# Post-Hoc Test (if the p-value above is < 0.05)
# It will show which specific age groups differ from one another
posthoc_customizations <- pairwise.wilcox.test(df$num_customizations,
    df$customer_age_group,
    p.adjust.method = "bonferroni",
    exact = FALSE
)
print(posthoc_customizations)
