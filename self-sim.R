library(genius)
library(dplyr)
library(ggplot2)
# get lyrics for album
tgc <- genius_album("The Greeting Committee", "I'm Afraid I'm Not Angry")

# calculate self similarity by group (thank you dplyr v 0.8!!!)
self_sim_tgc <- tgc %>% 
  dplyr::group_by(track_title, track_n) %>% 
  dplyr::group_map(.f = ~calc_self_sim(.x, lyric))

self_sim_tgc %>%
  ungroup() %>% 
  mutate(track_n = as.factor(track_n)) %>% 
  ggplot(aes(x = x_id, y = y_id, fill = identical)) +
  geom_tile() +
  scale_fill_manual(values = c("white", "black")) +
  theme_minimal() +
  theme(legend.position = "none",
        axis.text = element_blank()) +
  scale_y_continuous(trans = "reverse") +
  facet_wrap(~track_title, ncol = 2, scales = "free") +
  labs(x = "", y = "", title = "I'm Afraid I'm Not Angry",
       subtitle = "Lyric self-similarity")

