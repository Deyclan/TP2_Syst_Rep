package com.brandonjulie.travelexpress.entities;

import javax.persistence.*;
import java.math.BigDecimal;
import java.sql.Date;
import java.util.Collection;

@Entity
@Table(name = "travel", schema = "travel_express", catalog = "")
public class TravelEntity {
    private int id;
    private Date date;
    private String fromAdress;
    private String toAdress;
    private BigDecimal cost;
    private Integer seatsNumber;
    private Byte smoke;
    private Byte phone;
    private Byte luggage;
    private Integer state;
    private int idOfferer;
    private Collection<ReservationEntity> reservationsById;
    private UserEntity userByIdOfferer;

    @Id
    @Column(name = "id", nullable = false)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "date", nullable = true)
    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    @Basic
    @Column(name = "from_adress", nullable = true, length = 200)
    public String getFromAdress() {
        return fromAdress;
    }

    public void setFromAdress(String fromAdress) {
        this.fromAdress = fromAdress;
    }

    @Basic
    @Column(name = "to_adress", nullable = true, length = 200)
    public String getToAdress() {
        return toAdress;
    }

    public void setToAdress(String toAdress) {
        this.toAdress = toAdress;
    }

    @Basic
    @Column(name = "cost", nullable = false, precision = 2)
    public BigDecimal getCost() {
        return cost;
    }

    public void setCost(BigDecimal cost) {
        this.cost = cost;
    }

    @Basic
    @Column(name = "seats_number", nullable = true)
    public Integer getSeatsNumber() {
        return seatsNumber;
    }

    public void setSeatsNumber(Integer seatsNumber) {
        this.seatsNumber = seatsNumber;
    }

    @Basic
    @Column(name = "smoke", nullable = true)
    public Byte getSmoke() {
        return smoke;
    }

    public void setSmoke(Byte smoke) {
        this.smoke = smoke;
    }

    @Basic
    @Column(name = "phone", nullable = true)
    public Byte getPhone() {
        return phone;
    }

    public void setPhone(Byte phone) {
        this.phone = phone;
    }

    @Basic
    @Column(name = "luggage", nullable = true)
    public Byte getLuggage() {
        return luggage;
    }

    public void setLuggage(Byte luggage) {
        this.luggage = luggage;
    }

    @Basic
    @Column(name = "state", nullable = true)
    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        TravelEntity that = (TravelEntity) o;

        if (id != that.id) return false;
        if (date != null ? !date.equals(that.date) : that.date != null) return false;
        if (fromAdress != null ? !fromAdress.equals(that.fromAdress) : that.fromAdress != null) return false;
        if (toAdress != null ? !toAdress.equals(that.toAdress) : that.toAdress != null) return false;
        if (cost != null ? !cost.equals(that.cost) : that.cost != null) return false;
        if (seatsNumber != null ? !seatsNumber.equals(that.seatsNumber) : that.seatsNumber != null) return false;
        if (smoke != null ? !smoke.equals(that.smoke) : that.smoke != null) return false;
        if (phone != null ? !phone.equals(that.phone) : that.phone != null) return false;
        if (luggage != null ? !luggage.equals(that.luggage) : that.luggage != null) return false;
        if (state != null ? !state.equals(that.state) : that.state != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (date != null ? date.hashCode() : 0);
        result = 31 * result + (fromAdress != null ? fromAdress.hashCode() : 0);
        result = 31 * result + (toAdress != null ? toAdress.hashCode() : 0);
        result = 31 * result + (cost != null ? cost.hashCode() : 0);
        result = 31 * result + (seatsNumber != null ? seatsNumber.hashCode() : 0);
        result = 31 * result + (smoke != null ? smoke.hashCode() : 0);
        result = 31 * result + (phone != null ? phone.hashCode() : 0);
        result = 31 * result + (luggage != null ? luggage.hashCode() : 0);
        result = 31 * result + (state != null ? state.hashCode() : 0);
        return result;
    }

    @Basic
    @Column(name = "id_offerer", nullable = false)
    public int getIdOfferer() {
        return idOfferer;
    }

    public void setIdOfferer(int idOfferer) {
        this.idOfferer = idOfferer;
    }

    @OneToMany(mappedBy = "travelByIdTravel")
    public Collection<ReservationEntity> getReservationsById() {
        return reservationsById;
    }

    public void setReservationsById(Collection<ReservationEntity> reservationsById) {
        this.reservationsById = reservationsById;
    }

    @ManyToOne
    @JoinColumn(name = "id_offerer", referencedColumnName = "id", nullable = false)
    public UserEntity getUserByIdOfferer() {
        return userByIdOfferer;
    }

    public void setUserByIdOfferer(UserEntity userByIdOfferer) {
        this.userByIdOfferer = userByIdOfferer;
    }
}
