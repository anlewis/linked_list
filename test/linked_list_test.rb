require 'minitest/autorun'
require './lib/linked_list'
require './lib/node'
require 'pry'

class LinkedListTest < Minitest::Test

  def setup
    @linked_list = LinkedList.new
  end

  def test_linked_list_exists
    assert_instance_of LinkedList, @linked_list
  end

  def test_linked_list_initializes_with_empty_head
    assert_nil @linked_list.head
  end

  def test_append_adds_node_with_data
    append_return = @linked_list.append(5)

    assert_equal append_return, 5
    assert_instance_of LinkedList, @linked_list
    assert_instance_of Node, @linked_list.head
  end

  def test_new_node_has_empty_next_node
    @linked_list.append(5)

    assert_nil @linked_list.head.next_node
  end

  def test_count_returns_a_count_of_node
    @linked_list.append(5)

    assert_equal 1, @linked_list.count
  end

  def test_to_s_turns_node_data_to_string
    @linked_list.append(5)

    assert_equal "5", @linked_list.to_s
  end

  def test_can_add_two_nodes
    @linked_list.append(5)

    assert_nil @linked_list.head.next_node

    @linked_list.append(4)

    assert_instance_of Node, @linked_list.head.next_node
  end

  def test_count_returns_a_count_of_nodes
    @linked_list.append(5)
    @linked_list.append(4)

    assert_equal 2, @linked_list.count
  end

  def test_to_s_turns_all_node_data_to_string
    @linked_list.append(5)
    @linked_list.append(4)

    assert_equal "54", @linked_list.to_s
  end

  def test_prepend_prepends_data_to_list
    @linked_list.append(5)
    @linked_list.append(4)
    prepend_return = @linked_list.prepend(3)

    assert_equal 3, prepend_return
    assert_equal 3, @linked_list.count
    assert_equal "354", @linked_list.to_s
  end

  def test_insert_adds_node_at_specific_location
    @linked_list.append(5)
    @linked_list.append(4)
    @linked_list.prepend(3)
    insert_return = @linked_list.insert(1, 8)

    assert_equal 8, insert_return
    assert_equal "3854", @linked_list.to_s
  end
end