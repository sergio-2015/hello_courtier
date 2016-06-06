require 'capybara'
require 'capybara/dsl'
require 'capybara/poltergeist'


Capybara.default_max_wait_time = 10
Capybara.configure do |c|
  c.javascript_driver = :poltergeist
  c.default_driver = :poltergeist
end

Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app,
    js_errors: false,
    :phantomjs_options => ['--debug=no', '--ignore-ssl-errors=yes', '--ssl-protocol=TLSv1'],
    :debug => false,
    :headers => { 'User-Agent' => "Mozilla/5.0 (Macintosh; Intel Mac OS X)" }
  )
end

task :scrap_pagesjaunes => :environment do

  @region = ["Alsace", "R42"]

  Capybara.app_host = "http://www.pagesjaunes.fr"
  include Capybara::DSL
  page.driver.browser.clear_cookies
  visit('/')
  # save_and_open_page
  sleep 2
  visit("/annuaire/chercherlespros?quoiqui=courtier+credit+immobilier&ou=#{@region[0]}&idOu=#{@region[1]}&proximite=0")

  @broker_pj_ids = []
  page_nb = find('#SEL-compteur').text.slice(-1).to_i
  puts "ok nb de pages trouvé = #{page_nb}"

  find('.link_pagination.next.pj-lb.pj-link').trigger('click')
  puts "ok page suivante cliquée"

  if page_nb > 1
    (1..page_nb).each do |nb|
      if nb == 1
        puts URI.parse(current_url)
        collecte_id_brokers
      elsif nb > 1
        visit("/annuaire/chercherlespros?quoiqui=courtier+credit+immobilier&ou=#{@region[0]}&idOu=#{@region[1]}&proximite=0&page=#{nb}")
        sleep 2
        puts URI.parse(current_url)
        collecte_id_brokers
      end
    end
  elsif page_nb == 1
    collecte_id_brokers
  end

  # (1..page_nb).each do |nb|
  #   puts nb
  #   if nb > 1
  #     find('.link_pagination.next.pj-lb.pj-link').trigger('click')
  #     # visit("/annuaire/chercherlespros?quoiqui=courtier+credit&ou=Alsace&idOu=R42&proximite=0&page=#{nb}")
  #     collecte_id_brokers
  #   else
  #     collecte_id_brokers
  #   end
  # end

  puts @broker_pj_ids.count
  @broker_pj_ids.uniq!
  puts @broker_pj_ids.count.to_s + " " + "dédoublonné"
  @already_collected_pjids = BrokerAgency.all.pluck(:pjid)
  i = 1
  @broker_pj_ids.each do |id|
    if @already_collected_pjids.include?(id)
    else
      create_the_broker_agency(id, i)
      i = i + 1
    end
  end
end


def collecte_id_brokers
  liste_des_resultats = find('#listResults')
  within liste_des_resultats do
    a = page.all(:css, '.bi-bloc')
    a.each do |a|
      raw_id = a[:id]
      raw_id.slice!(0..7)
      @broker_pj_ids << raw_id
    end
  end
end

def create_the_broker_agency(id, i)
  new_agency = BrokerAgency.new
  new_agency.broker_id = 1
  puts i
  # if @already_collected_pjids.inlcude?(id)

  # else
    visit("/pros/detail?bloc_id=#{id}")
    new_agency.pjid = id
    puts id
    bloc_nom = find('div.denom')
    within bloc_nom do
      @nom = find('h1').text
    end
    new_agency.name = @nom
    puts @nom
    @num_tel = find('meta[property="og:business:contact_data:phone_number"]', visible: false)[:content]
    new_agency.phone_number = @num_tel.gsub(/\s+/, "")
    puts @num_tel
    @adresse = find('meta[property="og:business:contact_data:street_address"]', visible: false)[:content]
    new_agency.street = @adresse
    puts @adresse
    @code_postal = find('meta[property="og:business:contact_data:postal_code"]', visible: false)[:content]
    new_agency.zipcode = @code_postal
    puts @code_postal
    @ville = find('meta[property="og:business:contact_data:locality"]', visible: false)[:content]
    new_agency.city = @ville
    puts @ville
    @latitude = find('meta[property="og:place:location:latitude"]', visible: false)[:content]
    new_agency.latitude = @latitude
    puts @latitude
    @longitude = find('meta[property="og:place:location:longitude"]', visible: false)[:content]
    new_agency.longitude = @longitude
    puts @longitude
    new_agency.complete_adress = @adresse + ", " + @code_postal + " " + @ville
    puts new_agency.complete_adress

    # siret
    begin
      bloc_siret = find('div.row.siret')
      within(bloc_siret) do
        @siret = find('span.valeur').text
      end
      new_agency.siret = @siret
      puts @siret
    rescue Exception => e
      puts "pas de siret"
    end

    # site web
    begin
      if find(:xpath, "//HTML[1]/BODY[1]/SECTION[1]/DIV[2]/SECTION[1]/DIV[6]")[:id] == "ancreBlocAvis"
        @site_web = find(:xpath, "//HTML[1]/BODY[1]/SECTION[1]/DIV[2]/SECTION[1]/DIV[9]/DIV[1]/DIV[4]/UL[1]/LI[1]/A[1]/SPAN[2]").text
        @site_web = "http://" + @site_web

      elsif find(:xpath, "//HTML[1]/BODY[1]/SECTION[1]/DIV[2]/SECTION[1]/DIV[6]")[:id] == "blocAvis"
        @site_web = find(:xpath, "//HTML[1]/BODY[1]/SECTION[1]/DIV[2]/SECTION[1]/DIV[8]/DIV[1]/DIV[4]/UL[1]/LI[1]/A[1]/SPAN[2]").text
        @site_web = "http://" + @site_web
      end
      if @site_web != nil
        new_agency.website = @site_web
      end
      puts @site_web
    rescue Exception => e
      puts "pas de site web"
    end

    new_agency.save

    if new_agency.save != true

    end

    puts "********************************************************"
    # save_and_open_page
  # end
end




