require "spec_helper"

describe Zemanta do
	it "should respond to #VERSION" do
		Zemanta::VERSION.should_not be_nil
	end

	it "can use ENV variable for api_key" do
		ENV["ZEMANTA_KEY"].should_not be_nil
	end

	it "has some methods" do
		client = Zemanta.new ENV["ZEMANTA_KEY"]
		client.should respond_to :suggest
		client.should respond_to :suggest_markup
		client.should respond_to :preferences
	end

	context "Initialization process" do
		it "has api_key from ENV" do
			Zemanta.api_key.should == ENV["ZEMANTA_KEY"]
		end
		
		it "should break if no #api_key is present" do
			client = Zemanta.new "AAA"
			client.api_key.should == "AAA"

			Zemanta.api_key = "BBB"
			Zemanta.api_key.should == "BBB"
			client_2 = Zemanta.new
			client_2.api_key.should == "BBB"
		end

		it "should break on fake api_key" do
			client = Zemanta.new("FAKE")
			expect{
				suggests = client.suggest("fake it till u make it...")
			}.to raise_error
		end
	end

	context "#suggest method" do
		let(:z){ Zemanta.new(ENV["ZEMANTA_KEY"]) }

		it "can #suggest to some text" do
			suggests = z.suggest("
				The Phoenix Mars Lander has successfully deployed its robotic arm and
				tested other instruments including a laser designed to detect dust,
				clouds, and fog. 
			")

			suggests['articles'].should_not be_nil
			suggests['images'].should_not be_nil
			suggests['markup'].should_not be_nil
			suggests['signature'].should_not be_nil
			suggests['keywords'].should_not be_nil
			suggests['rid'].should_not be_nil
			suggests['categories'].should_not be_nil
			suggests['rich_objects'].should_not be_nil
		end

		it "can do some additional #attributes" do
			suggests = z.suggest("
				Ronald Reagan je bil 40. predsednik ZDA v letih 1981-1989 in 33. guverner drzave Kalifornija v letih 1967-1975.
				Pred vstopom v politiko je bil Reagan tudi napovedovalec, filmski igralec in predsednik Ameriskega zdruzenja igralcev.
			",{
				return_images: 0,
				articles_limit: 2
			})

			suggests['articles'].size.should == 2
			suggests['images'].should be_nil
		end

=begin
		it "has \"magic\" methods" do
			suggests = z.suggest("
				Ronald Reagan je bil 40. predsednik ZDA v letih 1981-1989 in 33. guverner drzave Kalifornija v letih 1967-1975.
				Pred vstopom v politiko je bil Reagan tudi napovedovalec, filmski igralec in predsednik Ameriskega zdruzenja igralcev.
			")

			suggests.should respond_to :articles
			suggests['articles'].should == suggests.articles
		end
=end

	end

end