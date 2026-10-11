resource "google_data_loss_prevention_content_policy" "data_loss_prevention_content_policies" {
  for_each = var.data_loss_prevention_content_policies

  parent          = each.value.parent
  deletion_policy = each.value.deletion_policy
  display_name    = each.value.display_name

  dynamic "rules" {
    for_each = each.value.rules
    content {
      action {
        return_verdict = rules.value.action.return_verdict
      }
      dynamic "conditions" {
        for_each = rules.value.conditions != null ? rules.value.conditions : []
        content {
          dynamic "info_type_condition" {
            for_each = conditions.value.info_type_condition != null ? [conditions.value.info_type_condition] : []
            content {
              dynamic "any_info_type" {
                for_each = info_type_condition.value.any_info_type != null ? [info_type_condition.value.any_info_type] : []
                content {
                }
              }
              dynamic "info_types" {
                for_each = info_type_condition.value.info_types != null ? [info_type_condition.value.info_types] : []
                content {
                  info_type_names = info_types.value.info_type_names
                }
              }
              min_count = info_type_condition.value.min_count
            }
          }
        }
      }
    }
  }

  dynamic "default_action" {
    for_each = each.value.default_action != null ? [each.value.default_action] : []
    content {
      return_verdict = default_action.value.return_verdict
    }
  }

  dynamic "failed_to_scan_supported_file_type" {
    for_each = each.value.failed_to_scan_supported_file_type != null ? [each.value.failed_to_scan_supported_file_type] : []
    content {
      return_verdict = failed_to_scan_supported_file_type.value.return_verdict
    }
  }

  dynamic "input_too_large" {
    for_each = each.value.input_too_large != null ? [each.value.input_too_large] : []
    content {
      return_verdict = input_too_large.value.return_verdict
    }
  }

  dynamic "inspect_config" {
    for_each = each.value.inspect_config != null ? [each.value.inspect_config] : []
    content {
      content_options = inspect_config.value.content_options
      dynamic "custom_info_types" {
        for_each = inspect_config.value.custom_info_types != null ? inspect_config.value.custom_info_types : []
        content {
          dynamic "detection_rules" {
            for_each = custom_info_types.value.detection_rules != null ? custom_info_types.value.detection_rules : []
            content {
              dynamic "hotword_rule" {
                for_each = detection_rules.value.hotword_rule != null ? [detection_rules.value.hotword_rule] : []
                content {
                  hotword_regex {
                    group_indexes = hotword_rule.value.hotword_regex.group_indexes
                    pattern       = hotword_rule.value.hotword_regex.pattern
                  }
                  likelihood_adjustment {
                    fixed_likelihood    = hotword_rule.value.likelihood_adjustment.fixed_likelihood
                    relative_likelihood = hotword_rule.value.likelihood_adjustment.relative_likelihood
                  }
                  proximity {
                    window_after  = hotword_rule.value.proximity.window_after
                    window_before = hotword_rule.value.proximity.window_before
                  }
                }
              }
            }
          }
          dynamic "dictionary" {
            for_each = custom_info_types.value.dictionary != null ? [custom_info_types.value.dictionary] : []
            content {
              dynamic "cloud_storage_path" {
                for_each = dictionary.value.cloud_storage_path != null ? [dictionary.value.cloud_storage_path] : []
                content {
                  path = cloud_storage_path.value.path
                }
              }
              dynamic "word_list" {
                for_each = dictionary.value.word_list != null ? [dictionary.value.word_list] : []
                content {
                  words = word_list.value.words
                }
              }
            }
          }
          exclusion_type = custom_info_types.value.exclusion_type
          dynamic "file_label_info_type" {
            for_each = custom_info_types.value.file_label_info_type != null ? [custom_info_types.value.file_label_info_type] : []
            content {
              dynamic "google_drive_label" {
                for_each = file_label_info_type.value.google_drive_label != null ? [file_label_info_type.value.google_drive_label] : []
                content {
                  dynamic "label_fields_to_match" {
                    for_each = google_drive_label.value.label_fields_to_match != null ? google_drive_label.value.label_fields_to_match : []
                    content {
                      id    = label_fields_to_match.value.id
                      value = label_fields_to_match.value.value
                    }
                  }
                  label_id = google_drive_label.value.label_id
                }
              }
              dynamic "sensitivity_label" {
                for_each = file_label_info_type.value.sensitivity_label != null ? [file_label_info_type.value.sensitivity_label] : []
                content {
                  guid = sensitivity_label.value.guid
                }
              }
            }
          }
          info_type {
            name = custom_info_types.value.info_type.name
            dynamic "sensitivity_score" {
              for_each = custom_info_types.value.info_type.sensitivity_score != null ? [custom_info_types.value.info_type.sensitivity_score] : []
              content {
                score = sensitivity_score.value.score
              }
            }
            version = custom_info_types.value.info_type.version
          }
          likelihood = custom_info_types.value.likelihood
          dynamic "metadata_key_value_expression" {
            for_each = custom_info_types.value.metadata_key_value_expression != null ? [custom_info_types.value.metadata_key_value_expression] : []
            content {
              key_regex   = metadata_key_value_expression.value.key_regex
              value_regex = metadata_key_value_expression.value.value_regex
            }
          }
          dynamic "regex" {
            for_each = custom_info_types.value.regex != null ? [custom_info_types.value.regex] : []
            content {
              group_indexes = regex.value.group_indexes
              pattern       = regex.value.pattern
            }
          }
          dynamic "sensitivity_score" {
            for_each = custom_info_types.value.sensitivity_score != null ? [custom_info_types.value.sensitivity_score] : []
            content {
              score = sensitivity_score.value.score
            }
          }
          dynamic "stored_type" {
            for_each = custom_info_types.value.stored_type != null ? [custom_info_types.value.stored_type] : []
            content {
              name = stored_type.value.name
            }
          }
          dynamic "surrogate_type" {
            for_each = custom_info_types.value.surrogate_type != null ? [custom_info_types.value.surrogate_type] : []
            content {
            }
          }
        }
      }
      exclude_info_types = inspect_config.value.exclude_info_types
      include_quote      = inspect_config.value.include_quote
      dynamic "info_types" {
        for_each = inspect_config.value.info_types != null ? inspect_config.value.info_types : []
        content {
          name = info_types.value.name
          dynamic "sensitivity_score" {
            for_each = info_types.value.sensitivity_score != null ? [info_types.value.sensitivity_score] : []
            content {
              score = sensitivity_score.value.score
            }
          }
          version = info_types.value.version
        }
      }
      dynamic "limits" {
        for_each = inspect_config.value.limits != null ? [inspect_config.value.limits] : []
        content {
          dynamic "max_findings_per_info_type" {
            for_each = limits.value.max_findings_per_info_type != null ? limits.value.max_findings_per_info_type : []
            content {
              dynamic "info_type" {
                for_each = max_findings_per_info_type.value.info_type != null ? [max_findings_per_info_type.value.info_type] : []
                content {
                  name = info_type.value.name
                  dynamic "sensitivity_score" {
                    for_each = info_type.value.sensitivity_score != null ? [info_type.value.sensitivity_score] : []
                    content {
                      score = sensitivity_score.value.score
                    }
                  }
                  version = info_type.value.version
                }
              }
              max_findings = max_findings_per_info_type.value.max_findings
            }
          }
          max_findings_per_item    = limits.value.max_findings_per_item
          max_findings_per_request = limits.value.max_findings_per_request
        }
      }
      min_likelihood = inspect_config.value.min_likelihood
      dynamic "min_likelihood_per_info_type" {
        for_each = inspect_config.value.min_likelihood_per_info_type != null ? inspect_config.value.min_likelihood_per_info_type : []
        content {
          dynamic "info_type" {
            for_each = min_likelihood_per_info_type.value.info_type != null ? [min_likelihood_per_info_type.value.info_type] : []
            content {
              name = info_type.value.name
              dynamic "sensitivity_score" {
                for_each = info_type.value.sensitivity_score != null ? [info_type.value.sensitivity_score] : []
                content {
                  score = sensitivity_score.value.score
                }
              }
              version = info_type.value.version
            }
          }
          min_likelihood = min_likelihood_per_info_type.value.min_likelihood
        }
      }
      dynamic "rule_set" {
        for_each = inspect_config.value.rule_set != null ? inspect_config.value.rule_set : []
        content {
          dynamic "info_types" {
            for_each = rule_set.value.info_types
            content {
              name = info_types.value.name
              dynamic "sensitivity_score" {
                for_each = info_types.value.sensitivity_score != null ? [info_types.value.sensitivity_score] : []
                content {
                  score = sensitivity_score.value.score
                }
              }
              version = info_types.value.version
            }
          }
          dynamic "rules" {
            for_each = rule_set.value.rules
            content {
              dynamic "adjustment_rule" {
                for_each = rules.value.adjustment_rule != null ? [rules.value.adjustment_rule] : []
                content {
                  dynamic "adjust_by_image_findings" {
                    for_each = adjustment_rule.value.adjust_by_image_findings != null ? [adjustment_rule.value.adjust_by_image_findings] : []
                    content {
                      dynamic "image_containment_type" {
                        for_each = adjust_by_image_findings.value.image_containment_type != null ? [adjust_by_image_findings.value.image_containment_type] : []
                        content {
                          dynamic "encloses" {
                            for_each = image_containment_type.value.encloses != null ? [image_containment_type.value.encloses] : []
                            content {
                            }
                          }
                          dynamic "fully_inside" {
                            for_each = image_containment_type.value.fully_inside != null ? [image_containment_type.value.fully_inside] : []
                            content {
                            }
                          }
                          dynamic "overlaps" {
                            for_each = image_containment_type.value.overlaps != null ? [image_containment_type.value.overlaps] : []
                            content {
                            }
                          }
                        }
                      }
                      dynamic "info_types" {
                        for_each = adjust_by_image_findings.value.info_types
                        content {
                          name = info_types.value.name
                          dynamic "sensitivity_score" {
                            for_each = info_types.value.sensitivity_score != null ? [info_types.value.sensitivity_score] : []
                            content {
                              score = sensitivity_score.value.score
                            }
                          }
                          version = info_types.value.version
                        }
                      }
                      min_likelihood = adjust_by_image_findings.value.min_likelihood
                    }
                  }
                  dynamic "adjust_by_matching_info_types" {
                    for_each = adjustment_rule.value.adjust_by_matching_info_types != null ? [adjustment_rule.value.adjust_by_matching_info_types] : []
                    content {
                      dynamic "info_types" {
                        for_each = adjust_by_matching_info_types.value.info_types
                        content {
                          name = info_types.value.name
                          dynamic "sensitivity_score" {
                            for_each = info_types.value.sensitivity_score != null ? [info_types.value.sensitivity_score] : []
                            content {
                              score = sensitivity_score.value.score
                            }
                          }
                          version = info_types.value.version
                        }
                      }
                      matching_type  = adjust_by_matching_info_types.value.matching_type
                      min_likelihood = adjust_by_matching_info_types.value.min_likelihood
                    }
                  }
                  likelihood_adjustment {
                    fixed_likelihood = adjustment_rule.value.likelihood_adjustment.fixed_likelihood
                  }
                }
              }
              dynamic "exclusion_rule" {
                for_each = rules.value.exclusion_rule != null ? [rules.value.exclusion_rule] : []
                content {
                  dynamic "dictionary" {
                    for_each = exclusion_rule.value.dictionary != null ? [exclusion_rule.value.dictionary] : []
                    content {
                      dynamic "cloud_storage_path" {
                        for_each = dictionary.value.cloud_storage_path != null ? [dictionary.value.cloud_storage_path] : []
                        content {
                          path = cloud_storage_path.value.path
                        }
                      }
                      dynamic "word_list" {
                        for_each = dictionary.value.word_list != null ? [dictionary.value.word_list] : []
                        content {
                          words = word_list.value.words
                        }
                      }
                    }
                  }
                  dynamic "exclude_by_hotword" {
                    for_each = exclusion_rule.value.exclude_by_hotword != null ? [exclusion_rule.value.exclude_by_hotword] : []
                    content {
                      hotword_regex {
                        group_indexes = exclude_by_hotword.value.hotword_regex.group_indexes
                        pattern       = exclude_by_hotword.value.hotword_regex.pattern
                      }
                      proximity {
                        window_after  = exclude_by_hotword.value.proximity.window_after
                        window_before = exclude_by_hotword.value.proximity.window_before
                      }
                    }
                  }
                  dynamic "exclude_by_image_findings" {
                    for_each = exclusion_rule.value.exclude_by_image_findings != null ? [exclusion_rule.value.exclude_by_image_findings] : []
                    content {
                      dynamic "image_containment_type" {
                        for_each = exclude_by_image_findings.value.image_containment_type != null ? [exclude_by_image_findings.value.image_containment_type] : []
                        content {
                          dynamic "encloses" {
                            for_each = image_containment_type.value.encloses != null ? [image_containment_type.value.encloses] : []
                            content {
                            }
                          }
                          dynamic "fully_inside" {
                            for_each = image_containment_type.value.fully_inside != null ? [image_containment_type.value.fully_inside] : []
                            content {
                            }
                          }
                          dynamic "overlaps" {
                            for_each = image_containment_type.value.overlaps != null ? [image_containment_type.value.overlaps] : []
                            content {
                            }
                          }
                        }
                      }
                      dynamic "info_types" {
                        for_each = exclude_by_image_findings.value.info_types
                        content {
                          name = info_types.value.name
                          dynamic "sensitivity_score" {
                            for_each = info_types.value.sensitivity_score != null ? [info_types.value.sensitivity_score] : []
                            content {
                              score = sensitivity_score.value.score
                            }
                          }
                          version = info_types.value.version
                        }
                      }
                    }
                  }
                  dynamic "exclude_info_types" {
                    for_each = exclusion_rule.value.exclude_info_types != null ? [exclusion_rule.value.exclude_info_types] : []
                    content {
                      dynamic "info_types" {
                        for_each = exclude_info_types.value.info_types
                        content {
                          name = info_types.value.name
                          dynamic "sensitivity_score" {
                            for_each = info_types.value.sensitivity_score != null ? [info_types.value.sensitivity_score] : []
                            content {
                              score = sensitivity_score.value.score
                            }
                          }
                          version = info_types.value.version
                        }
                      }
                    }
                  }
                  matching_type = exclusion_rule.value.matching_type
                  dynamic "regex" {
                    for_each = exclusion_rule.value.regex != null ? [exclusion_rule.value.regex] : []
                    content {
                      group_indexes = regex.value.group_indexes
                      pattern       = regex.value.pattern
                    }
                  }
                }
              }
              dynamic "hotword_rule" {
                for_each = rules.value.hotword_rule != null ? [rules.value.hotword_rule] : []
                content {
                  hotword_regex {
                    group_indexes = hotword_rule.value.hotword_regex.group_indexes
                    pattern       = hotword_rule.value.hotword_regex.pattern
                  }
                  likelihood_adjustment {
                    fixed_likelihood    = hotword_rule.value.likelihood_adjustment.fixed_likelihood
                    relative_likelihood = hotword_rule.value.likelihood_adjustment.relative_likelihood
                  }
                  proximity {
                    window_after  = hotword_rule.value.proximity.window_after
                    window_before = hotword_rule.value.proximity.window_before
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  dynamic "logging_configs" {
    for_each = each.value.logging_configs != null ? each.value.logging_configs : []
    content {
      dynamic "log_to_big_query" {
        for_each = logging_configs.value.log_to_big_query != null ? [logging_configs.value.log_to_big_query] : []
        content {
          dataset_id = log_to_big_query.value.dataset_id
          project_id = log_to_big_query.value.project_id
          table_id   = log_to_big_query.value.table_id
        }
      }
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }

  dynamic "unsupported_file_type" {
    for_each = each.value.unsupported_file_type != null ? [each.value.unsupported_file_type] : []
    content {
      return_verdict = unsupported_file_type.value.return_verdict
    }
  }
}

