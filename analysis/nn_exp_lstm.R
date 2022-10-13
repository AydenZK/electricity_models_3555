# Flags for hyperparameter tuning
FLAGS <- flags(
  flag_integer("lstm_units", 32),
  flag_integer("dense_units1", 32),
  flag_integer("dense_units2", 32),
  flag_integer("batch_size", 32),
  flag_numeric("learning_rate", 0.01)
)

# Model
set.seed(2022)
model <- keras_model_sequential() %>%
  layer_lstm(units = FLAGS$lstm_units) %>%
  layer_dense(units = FLAGS$dense_units1, activation="relu") %>%
  layer_dense(units = FLAGS$dense_units2, activation="relu") %>%
  layer_dense(1, activation="linear")

# LR scheduler
#lr_schedule <- learning_rate_schedule_cosine_decay(initial_learning_rate=FLAGS$learning_rate, decay_steps = FLAGS$decay_steps)


# Compile w/ optimiser and loss
model %>% compile(optimizer = optimizer_adam(learning_rate = FLAGS$learning_rate), loss = 'mean_absolute_error', metrics=c("mape"))

# Early stopping
early_stopping <- callback_early_stopping(monitor="loss", min_delta = 10, patience=6, mode="min")

# Fit 
set.seed(2022)
history <- model %>% 
  fit(
    x = as.matrix(X_train), 
    y = as.matrix(y_train), 
    validation_split = 0.2, 
    batch_size = FLAGS$batch_size,
    epochs = 35,
    callbacks = list(early_stopping)
  )

plot(history)
