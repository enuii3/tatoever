# frozen_string_literal: true

module RuboCop
  module Cop
    module RSpec
      # Checks for consistent method usage for negating expectations.
      #
      # @example
      #   # bad
      #   it '...' do
      #     expect(false).to_not be_true
      #   end
      #
      #   # good
      #   it '...' do
      #     expect(false).not_to be_true
      #   end
      class NotToNot < Base
        extend AutoCorrector
        include ConfigurableEnforcedStyle

        MSG = 'Prefer `%<replacement>s` over `%<original>s`.'

        def_node_matcher :not_to_not_offense, '(send _ % ...)'

        def on_send(node)
          not_to_not_offense(node, alternative_style) do
            add_offense(node.loc.selector) do |corrector|
              corrector.replace(node.loc.selector, style.to_s)
            end
          end
        end

        private

        def message(_node)
          format(MSG, replacement: style, original: alternative_style)
        end
      end
    end
  end
end
