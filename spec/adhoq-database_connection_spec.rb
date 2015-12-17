require_relative './spec_helper'
require 'tempfile'

RSpec.describe Adhoq::DatabaseConnection do
  describe '#call' do
    let(:config) {
      {
        adapter: 'sqlite3',
        database: 'adhoq_database_test',
      }
    }

    context 'create with .load_file' do
      let(:config_file) {
        Tempfile.new.tap do |tempfile|
          File.write(tempfile.path, config.to_yaml)
        end
      }
      let(:connection) {
        Adhoq::DatabaseConnection.load_file('SqliteDatabase1', config_file.path)
      }

      subject { connection.call }

      it 'can execute' do
        expect(subject.exec_query('SELECT 1').rows).to eq([[1]])
      end
    end

    context 'create with #new' do
      let(:connection) {
        Adhoq::DatabaseConnection.new('SqliteDatabase2', config)
      }

      subject { connection.call }

      it 'can execute' do
        expect(subject.exec_query('SELECT 1').rows).to eq([[1]])
      end
    end
  end
end
