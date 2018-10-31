package com.brandonjulie.travelexpress.entities;

import javax.persistence.*;

@Entity
@Table(name = "reservation", schema = "travel_express", catalog = "")
public class ReservationEntity {
    private int id;
    private Byte confirmed;
    private int idTravel;
    private int idReserver;
    private int idTransaction;
    private TravelEntity travelByIdTravel;
    private UserEntity userByIdReserver;
    private TransactionEntity transactionByIdTransaction;

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

    @Basic
    @Column(name = "id_travel", nullable = false)
    public int getIdTravel() {
        return idTravel;
    }

    public void setIdTravel(int idTravel) {
        this.idTravel = idTravel;
    }

    @Basic
    @Column(name = "id_reserver", nullable = false)
    public int getIdReserver() {
        return idReserver;
    }

    public void setIdReserver(int idReserver) {
        this.idReserver = idReserver;
    }

    @Basic
    @Column(name = "id_transaction", nullable = false)
    public int getIdTransaction() {
        return idTransaction;
    }

    public void setIdTransaction(int idTransaction) {
        this.idTransaction = idTransaction;
    }

    @ManyToOne
    @JoinColumn(name = "id_travel", referencedColumnName = "id", nullable = false)
    public TravelEntity getTravelByIdTravel() {
        return travelByIdTravel;
    }

    public void setTravelByIdTravel(TravelEntity travelByIdTravel) {
        this.travelByIdTravel = travelByIdTravel;
    }

    @ManyToOne
    @JoinColumn(name = "id_reserver", referencedColumnName = "id", nullable = false)
    public UserEntity getUserByIdReserver() {
        return userByIdReserver;
    }

    public void setUserByIdReserver(UserEntity userByIdReserver) {
        this.userByIdReserver = userByIdReserver;
    }

    @ManyToOne
    @JoinColumn(name = "id_transaction", referencedColumnName = "id", nullable = false)
    public TransactionEntity getTransactionByIdTransaction() {
        return transactionByIdTransaction;
    }

    public void setTransactionByIdTransaction(TransactionEntity transactionByIdTransaction) {
        this.transactionByIdTransaction = transactionByIdTransaction;
    }
}
