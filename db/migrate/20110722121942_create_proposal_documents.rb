class CreateProposalDocuments < ActiveRecord::Migration
  def change
    create_table :proposal_documents do |t|
      t.string :document
      t.references :proposal
      t.timestamps
    end
  end
end
