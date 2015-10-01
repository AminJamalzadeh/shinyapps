# generate data
N <- 500
xy1 <- data.frame(lat = rnorm(N, mean = 45.70468, sd = 0.1),
                  lng = rnorm(N, mean = 14.24103, sd = 0.2),
                  group = "primorsko")
xy2 <- data.frame(lat = rnorm(N, mean = 45.94966, sd = 0.1),
                  lng = rnorm(N, mean = 14.52667, sd = 0.2),
                  group = "menisijsko")
xy3 <- data.frame(lat = rnorm(N, mean = 45.60869, sd = 0.1),
                  lng = rnorm(N, mean = 14.78485, sd = 0.2),
                  group = "kocevsko")

xy <- rbind(xy1, xy2, xy3)
xy$note <- paste(sample(letters, nrow(xy), replace = TRUE),
                 sample(letters, nrow(xy), replace = TRUE),
                 sample(letters, nrow(xy), replace = TRUE),
                 sample(letters, nrow(xy), replace = TRUE),
                 sample(letters, nrow(xy), replace = TRUE),
                 sample(letters, nrow(xy), replace = TRUE), sep = "")
write.table(xy, file = "./data/random_pts.txt", row.names = FALSE)
