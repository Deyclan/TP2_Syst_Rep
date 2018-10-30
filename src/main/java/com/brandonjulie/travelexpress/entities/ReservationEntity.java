package com.brandonjulie.travelexpress.entities;

import javax.persistence.*;

@Entity
@Table(name = "reservation", schema = "travel_express", catalog = "")
public class ReservationEntity {
    private int id;
    private Byte confirmed;

    @Id
    @Column(name = "id", nullable = false)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "confirmed", nullable = true)
    public Byte getConfirmed() {
        return confirmed;
    }

    public void setConfirmed(Byte confirmed) {
        this.confirmed = confirmed;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        ReservationEntity that = (ReservationEntity) o;

        if (id != that.id) return false;
        if (confirmed != null ? !confirmed.equals(that.confirmed) : that.confirmed != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (confirmed != null ? confirmed.hashCode() : 0);
        return result;
    }
}
