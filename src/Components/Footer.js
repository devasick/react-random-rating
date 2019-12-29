import React from "react";

function Footer() {
  return (
    <footer className="page-footer">
    <div className="container">
      <div className="row">
        <div className="col l8 s12">
          <h5 className="white-text">Hexad GmbH</h5>
          <p className="grey-text text-lighten-4">Hexad GmbH ist ein international renommiertes Unternehmen in Wolfsburg, Deutschland, welches auf modernste Technologien spezialisiert ist. Als innovativer und zukunftsorientierter Dienstleister ist die Hexad GmbH in den Bereichen Unternehmensportale, mobile Anwendungen, Software-Entwicklung, agiles Projektmanagement und im Software-Testing. Insbesondere für die Integration von Geschäftsprozessen in der Automobilbranche bieten wir ein breites Dienstleistungsspektrum von der Entwicklung anspruchsvoller kundenspezifischer Anwendungen und Web-Portalen bis hin zu mobilen Anwendungen, von der Idee bis zum Support. Wir bieten Weltklasse-Lösungen für die Integration von Geschäftsprozessen in der Automobilbranche.
</p>
        </div>
        <div className="col l4  s12">
          <h5 className="white-text">Links</h5>
          <ul>
            <li><a className="grey-text text-lighten-3" href="#!">Home</a></li>
            <li><a className="grey-text text-lighten-3" href="#!">About Us</a></li>
            <li><a className="grey-text text-lighten-3" href="#!">Career</a></li>
            <li><a className="grey-text text-lighten-3" href="#!">Services</a></li>
            <li><a className="grey-text text-lighten-3" href="#!">Contact Us</a></li>
          </ul>
        </div>
      </div>
    </div>
    <div className="footer-copyright">
      <div className="container">
      © 2019 Copyright www.asickweb.com
      </div>
    </div>
  </footer>
  );
}

export default Footer;