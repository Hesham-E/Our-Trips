import React, { Component } from "react";
import { Nav } from "react-bootstrap";
import { Link } from "react-router-dom";
import styles from "./NavigationBar.module.css";

class NavigationBar extends Component {
  render() {
    return (
      <Nav className="navbar navbar-dark bg-secondary">
        <div className="container-fluid">
          <h1 className={styles.brandName}>
            Our Trips
          </h1>

          <div>
          <Link to="/" className={styles.navLinks}>
            Home
          </Link>
          <Link to="/publictrips" className={styles.navLinks}>
            Public Trips
          </Link>
          <Link to="/privatetrips" className={styles.navLinks}>
            Private Trips
          </Link>
          <Link to="/account" className={styles.navLinks}>
            My Account
          </Link>
          </div>
         
        </div>

      </Nav>
    );
  }
}

export default NavigationBar;