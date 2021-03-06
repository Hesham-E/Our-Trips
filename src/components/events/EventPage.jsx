import React from "react";
import Header from "../account/HeaderAccount";
import Event from "./EventDesc";
import { Link } from "react-router-dom";
import styles from "./EventPage.module.css";

const EventPage = (props) => {
  return (
    <div>
      <Header user={props.user} />
      <div className={styles.mainDiv}>
        <div className={styles.alignDiv}>
          <span className={styles.text1}>Event</span>
          <button className="div1">
            <Link to="/account" className="button1">
              Return
            </Link>
          </button>
        </div>
        <Event event={props.event} />
      </div>
    </div>
  );
};

export default EventPage;
