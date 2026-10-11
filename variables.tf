variable "data_loss_prevention_content_policies" {
  description = <<EOT
Map of data_loss_prevention_content_policies, attributes below
Required:
    - parent
    - rules (block):
        - action (required, block):
            - return_verdict (optional)
        - conditions (optional, block):
            - info_type_condition (optional, block):
                - any_info_type (optional, block):
                - info_types (optional, block):
                    - info_type_names (required)
                - min_count (optional)
Optional:
    - deletion_policy
    - display_name
    - default_action (block):
        - return_verdict (optional)
    - failed_to_scan_supported_file_type (block):
        - return_verdict (optional)
    - input_too_large (block):
        - return_verdict (optional)
    - inspect_config (block):
        - content_options (optional)
        - custom_info_types (optional, block):
            - detection_rules (optional, block):
                - hotword_rule (optional, block):
                    - hotword_regex (required, block):
                        - group_indexes (optional)
                        - pattern (required)
                    - likelihood_adjustment (required, block):
                        - fixed_likelihood (optional)
                        - relative_likelihood (optional)
                    - proximity (required, block):
                        - window_after (optional)
                        - window_before (optional)
            - dictionary (optional, block):
                - cloud_storage_path (optional, block):
                    - path (required)
                - word_list (optional, block):
                    - words (required)
            - exclusion_type (optional)
            - file_label_info_type (optional, block):
                - google_drive_label (optional, block):
                    - label_fields_to_match (optional, block):
                        - id (required)
                        - value (required)
                    - label_id (required)
                - sensitivity_label (optional, block):
                    - guid (required)
            - info_type (required, block):
                - name (required)
                - sensitivity_score (optional, block):
                    - score (required)
                - version (optional)
            - likelihood (optional)
            - metadata_key_value_expression (optional, block):
                - key_regex (required)
                - value_regex (required)
            - regex (optional, block):
                - group_indexes (optional)
                - pattern (required)
            - sensitivity_score (optional, block):
                - score (required)
            - stored_type (optional, block):
                - name (required)
            - surrogate_type (optional, block):
        - exclude_info_types (optional)
        - include_quote (optional)
        - info_types (optional, block):
            - name (required)
            - sensitivity_score (optional, block):
                - score (required)
            - version (optional)
        - limits (optional, block):
            - max_findings_per_info_type (optional, block):
                - info_type (optional, block):
                    - name (required)
                    - sensitivity_score (optional, block):
                        - score (required)
                    - version (optional)
                - max_findings (required)
            - max_findings_per_item (required)
            - max_findings_per_request (required)
        - min_likelihood (optional)
        - min_likelihood_per_info_type (optional, block):
            - info_type (optional, block):
                - name (required)
                - sensitivity_score (optional, block):
                    - score (required)
                - version (optional)
            - min_likelihood (required)
        - rule_set (optional, block):
            - info_types (required, block):
                - name (required)
                - sensitivity_score (optional, block):
                    - score (required)
                - version (optional)
            - rules (required, block):
                - adjustment_rule (optional, block):
                    - adjust_by_image_findings (optional, block):
                        - image_containment_type (optional, block):
                            - encloses (optional, block):
                            - fully_inside (optional, block):
                            - overlaps (optional, block):
                        - info_types (required, block):
                            - name (required)
                            - sensitivity_score (optional, block):
                                - score (required)
                            - version (optional)
                        - min_likelihood (required)
                    - adjust_by_matching_info_types (optional, block):
                        - info_types (required, block):
                            - name (required)
                            - sensitivity_score (optional, block):
                                - score (required)
                            - version (optional)
                        - matching_type (required)
                        - min_likelihood (required)
                    - likelihood_adjustment (required, block):
                        - fixed_likelihood (required)
                - exclusion_rule (optional, block):
                    - dictionary (optional, block):
                        - cloud_storage_path (optional, block):
                            - path (required)
                        - word_list (optional, block):
                            - words (required)
                    - exclude_by_hotword (optional, block):
                        - hotword_regex (required, block):
                            - group_indexes (optional)
                            - pattern (required)
                        - proximity (required, block):
                            - window_after (optional)
                            - window_before (optional)
                    - exclude_by_image_findings (optional, block):
                        - image_containment_type (optional, block):
                            - encloses (optional, block):
                            - fully_inside (optional, block):
                            - overlaps (optional, block):
                        - info_types (required, block):
                            - name (required)
                            - sensitivity_score (optional, block):
                                - score (required)
                            - version (optional)
                    - exclude_info_types (optional, block):
                        - info_types (required, block):
                            - name (required)
                            - sensitivity_score (optional, block):
                                - score (required)
                            - version (optional)
                    - matching_type (required)
                    - regex (optional, block):
                        - group_indexes (optional)
                        - pattern (required)
                - hotword_rule (optional, block):
                    - hotword_regex (required, block):
                        - group_indexes (optional)
                        - pattern (required)
                    - likelihood_adjustment (required, block):
                        - fixed_likelihood (optional)
                        - relative_likelihood (optional)
                    - proximity (required, block):
                        - window_after (optional)
                        - window_before (optional)
    - logging_configs (block):
        - log_to_big_query (optional, block):
            - dataset_id (required)
            - project_id (required)
            - table_id (required)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
    - unsupported_file_type (block):
        - return_verdict (optional)
EOT

  type = map(object({
    parent          = string
    deletion_policy = optional(string)
    display_name    = optional(string)
    rules = list(object({
      action = object({
        return_verdict = optional(string)
      })
      conditions = optional(list(object({
        info_type_condition = optional(object({
          any_info_type = optional(object({
          }))
          info_types = optional(object({
            info_type_names = list(string)
          }))
          min_count = optional(number)
        }))
      })))
    }))
    default_action = optional(object({
      return_verdict = optional(string)
    }))
    failed_to_scan_supported_file_type = optional(object({
      return_verdict = optional(string)
    }))
    input_too_large = optional(object({
      return_verdict = optional(string)
    }))
    inspect_config = optional(object({
      content_options = optional(list(string))
      custom_info_types = optional(list(object({
        detection_rules = optional(list(object({
          hotword_rule = optional(object({
            hotword_regex = object({
              group_indexes = optional(list(number))
              pattern       = string
            })
            likelihood_adjustment = object({
              fixed_likelihood    = optional(string)
              relative_likelihood = optional(number)
            })
            proximity = object({
              window_after  = optional(number)
              window_before = optional(number)
            })
          }))
        })))
        dictionary = optional(object({
          cloud_storage_path = optional(object({
            path = string
          }))
          word_list = optional(object({
            words = list(string)
          }))
        }))
        exclusion_type = optional(string)
        file_label_info_type = optional(object({
          google_drive_label = optional(object({
            label_fields_to_match = optional(list(object({
              id    = string
              value = string
            })))
            label_id = string
          }))
          sensitivity_label = optional(object({
            guid = string
          }))
        }))
        info_type = object({
          name = string
          sensitivity_score = optional(object({
            score = string
          }))
          version = optional(string)
        })
        likelihood = optional(string)
        metadata_key_value_expression = optional(object({
          key_regex   = string
          value_regex = string
        }))
        regex = optional(object({
          group_indexes = optional(list(number))
          pattern       = string
        }))
        sensitivity_score = optional(object({
          score = string
        }))
        stored_type = optional(object({
          name = string
        }))
        surrogate_type = optional(object({
        }))
      })))
      exclude_info_types = optional(bool)
      include_quote      = optional(bool)
      info_types = optional(list(object({
        name = string
        sensitivity_score = optional(object({
          score = string
        }))
        version = optional(string)
      })))
      limits = optional(object({
        max_findings_per_info_type = optional(list(object({
          info_type = optional(object({
            name = string
            sensitivity_score = optional(object({
              score = string
            }))
            version = optional(string)
          }))
          max_findings = number
        })))
        max_findings_per_item    = number
        max_findings_per_request = number
      }))
      min_likelihood = optional(string)
      min_likelihood_per_info_type = optional(list(object({
        info_type = optional(object({
          name = string
          sensitivity_score = optional(object({
            score = string
          }))
          version = optional(string)
        }))
        min_likelihood = string
      })))
      rule_set = optional(list(object({
        info_types = list(object({
          name = string
          sensitivity_score = optional(object({
            score = string
          }))
          version = optional(string)
        }))
        rules = list(object({
          adjustment_rule = optional(object({
            adjust_by_image_findings = optional(object({
              image_containment_type = optional(object({
                encloses = optional(object({
                }))
                fully_inside = optional(object({
                }))
                overlaps = optional(object({
                }))
              }))
              info_types = list(object({
                name = string
                sensitivity_score = optional(object({
                  score = string
                }))
                version = optional(string)
              }))
              min_likelihood = string
            }))
            adjust_by_matching_info_types = optional(object({
              info_types = list(object({
                name = string
                sensitivity_score = optional(object({
                  score = string
                }))
                version = optional(string)
              }))
              matching_type  = string
              min_likelihood = string
            }))
            likelihood_adjustment = object({
              fixed_likelihood = string
            })
          }))
          exclusion_rule = optional(object({
            dictionary = optional(object({
              cloud_storage_path = optional(object({
                path = string
              }))
              word_list = optional(object({
                words = list(string)
              }))
            }))
            exclude_by_hotword = optional(object({
              hotword_regex = object({
                group_indexes = optional(list(number))
                pattern       = string
              })
              proximity = object({
                window_after  = optional(number)
                window_before = optional(number)
              })
            }))
            exclude_by_image_findings = optional(object({
              image_containment_type = optional(object({
                encloses = optional(object({
                }))
                fully_inside = optional(object({
                }))
                overlaps = optional(object({
                }))
              }))
              info_types = list(object({
                name = string
                sensitivity_score = optional(object({
                  score = string
                }))
                version = optional(string)
              }))
            }))
            exclude_info_types = optional(object({
              info_types = list(object({
                name = string
                sensitivity_score = optional(object({
                  score = string
                }))
                version = optional(string)
              }))
            }))
            matching_type = string
            regex = optional(object({
              group_indexes = optional(list(number))
              pattern       = string
            }))
          }))
          hotword_rule = optional(object({
            hotword_regex = object({
              group_indexes = optional(list(number))
              pattern       = string
            })
            likelihood_adjustment = object({
              fixed_likelihood    = optional(string)
              relative_likelihood = optional(number)
            })
            proximity = object({
              window_after  = optional(number)
              window_before = optional(number)
            })
          }))
        }))
      })))
    }))
    logging_configs = optional(list(object({
      log_to_big_query = optional(object({
        dataset_id = string
        project_id = string
        table_id   = string
      }))
    })))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
    unsupported_file_type = optional(object({
      return_verdict = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.data_loss_prevention_content_policies : (
        length(v.rules) >= 1
      )
    ])
    error_message = "Each rules list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.data_loss_prevention_content_policies : (
        v.inspect_config == null || (v.inspect_config.rule_set == null || alltrue([for item in v.inspect_config.rule_set : (length(item.info_types) >= 1)]))
      )
    ])
    error_message = "Each info_types list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.data_loss_prevention_content_policies : (
        v.inspect_config == null || (v.inspect_config.rule_set == null || alltrue([for item in v.inspect_config.rule_set : (length(item.rules) >= 1)]))
      )
    ])
    error_message = "Each rules list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.data_loss_prevention_content_policies : (
        v.inspect_config == null || (v.inspect_config.rule_set == null || alltrue([for item in v.inspect_config.rule_set : (alltrue([for item in item.rules : (item.adjustment_rule == null || (item.adjustment_rule.adjust_by_image_findings == null || (length(item.adjustment_rule.adjust_by_image_findings.info_types) >= 1)))]))]))
      )
    ])
    error_message = "Each info_types list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.data_loss_prevention_content_policies : (
        v.inspect_config == null || (v.inspect_config.rule_set == null || alltrue([for item in v.inspect_config.rule_set : (alltrue([for item in item.rules : (item.adjustment_rule == null || (item.adjustment_rule.adjust_by_matching_info_types == null || (length(item.adjustment_rule.adjust_by_matching_info_types.info_types) >= 1)))]))]))
      )
    ])
    error_message = "Each info_types list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.data_loss_prevention_content_policies : (
        v.inspect_config == null || (v.inspect_config.rule_set == null || alltrue([for item in v.inspect_config.rule_set : (alltrue([for item in item.rules : (item.exclusion_rule == null || (item.exclusion_rule.exclude_by_image_findings == null || (length(item.exclusion_rule.exclude_by_image_findings.info_types) >= 1)))]))]))
      )
    ])
    error_message = "Each info_types list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.data_loss_prevention_content_policies : (
        v.inspect_config == null || (v.inspect_config.rule_set == null || alltrue([for item in v.inspect_config.rule_set : (alltrue([for item in item.rules : (item.exclusion_rule == null || (item.exclusion_rule.exclude_info_types == null || (length(item.exclusion_rule.exclude_info_types.info_types) >= 1)))]))]))
      )
    ])
    error_message = "Each info_types list must contain at least 1 items"
  }
  # Note: 27 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

