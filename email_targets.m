function email_targets(gmail_address,password,gift_graph)

targets = decode_targets(gift_graph);

for i = 1:gift_graph.n
  if ~isfield(gift_graph,'assignment')
    error('gift_graph does not yet have matchings')
  end
  
  % Then this code will set up the preferences properly:
  setpref('Internet','E_mail',gmail_address);
  setpref('Internet','SMTP_Server','smtp.gmail.com');
  setpref('Internet','SMTP_Username',gmail_address);
  setpref('Internet','SMTP_Password',password);
  props = java.lang.System.getProperties;
  props.setProperty('mail.smtp.auth','true');
  props.setProperty('mail.smtp.socketFactory.class', 'javax.net.ssl.SSLSocketFactory');
  props.setProperty('mail.smtp.socketFactory.port','465');
  
  % Send the email. Note that the first input is the address you are sending the email to
  sendmail(gift_graph.email(i),'GIFT-O-TRON HAS GENERATED YOUR GIFT RECIPIENT!',...
  [upper(gift_graph.name(i)) 'The great Gift-o-tron has generated you a gift recipient. you are to make a gift for ' ...
  upper(targets(i)) ' ALL HAIL THE MACHINE OVERLORDS! --GIFT-O-TRON 8999.'])
end