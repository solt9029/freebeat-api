module Types
  class BaseInputObject < GraphQL::Schema::InputObject
    argument_class Types::BaseArgument

    def to_params
      to_h.with_indifferent_access.transform_keys(&:underscore)
    end
  end
end
