# Open Traits Registry

rails generate scaffold Dataset dataset_name:string doi_dataset:string doi_reference:string description:text license:string taxonomic_group:string user:references

rails generate scaffold Trait trait_name:string trait_guid:string description:text user:references

rails generate scaffold Trait trait_name:string trait_guid:string description:text user:references

rails generate migration AddDatasetToTraits dataset:references

rails generate scaffold Taxon taxon_name:string taxon_guid:string dataset:references

rails generate migration DatasetsTrait dataset:references trait:references
datasets_traits

rails generate migration RemoveUserFromTrait

rails generate migration AddDatabasetoTrait





rails generate controller Microposts

Dataset name
Brief description
DOI or URL
Terms of use
List of traits* (for searching, and also for broader controlled vocabulary/ontology)
Geographic extent (for searching)
Taxonomic group* (for searching)
Temporal extent (for searching)

Recommended or if applicable
DOI for paper to cite (or actual citation if no DOI)
Description
List of taxa (for improved searching)
Other useful classes (e.g., life stage, body part, etc.) if the dataset more focused
Data standard used? – if not the OT standard Caterina is working on. 



class CreateDatasets < ActiveRecord::Migration[5.0]
  def change
    create_table :datasets do |t|
      t.string :dataset_name
      t.string :doi_dataset
      t.string :doi_reference
      t.text :description
      t.string :license
      t.string :taxonomic_group

      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

class AddPaperToDatasets < ActiveRecord::Migration[5.0]
  def change
    add_column :datasets, :paper, :string
  end
end


class CreateTraits < ActiveRecord::Migration[5.0]
  def change
    create_table :traits do |t|
      t.string :trait_name
      t.string :trait_guid

      t.timestamps
    end
  end
end


# To get started with the app, clone the repo and then install the needed gems:

```
$ cd /path/to/repos
$ git clone https://bitbucket.org/railstutorial/sample_app_4th_ed.git sample_app_reference
$ cd sample_app_reference
$ bundle install --without production
```

Next, migrate the database:

```
$ rails db:migrate
```

Finally, run the test suite to verify that everything is working correctly:

```
$ rails test
```

If the test suite passes, you'll be ready to run the app in a local server:

```
$ rails server
```

To check out the code for a particular chapter, first find the branch name using

```
$ git branch -a
```

A branch called `remotes/orgin/foo-bar` can be checked out using `git checkout foo-bar`.

Next, copy the contents of the `Gemfile` using a text editor and then use

```
$ git checkout chapter-branch-name
```

to check out the chapter branch. Finally, copy the contents into the `Gemfile` and run

```
$ bundle update
```

At this point, the branch should be working. (You have to copy the `Gemfile` contents because it's incredibly hard to keep all branches up-to-date, so only the main one is guaranteed to be current.)

For more information, see the
[*Ruby on Rails Tutorial* book](http://www.railstutorial.org/book).
