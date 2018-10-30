package com.brandonjulie.travelexpress.entities;

import javax.persistence.*;
import java.math.BigDecimal;

@Entity
@Table(name = "transaction", schema = "travel_express", catalog = "")
public class TransactionEntity {
    private int id;
    private BigDecimal amont;
    private int idPayer;
    private int idReceiver;

    @Id
    @Column(name = "id", nullable = false)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "amont", nullable = true, precision = 2)
    public BigDecimal getAmont() {
        return amont;
    }

    public void setAmont(BigDecimal amont) {
        this.amont = amont;
    }

    @Basic
    @Column(name = "id_payer", nullable = false)
    public int getIdPayer() {
        return idPayer;
    }

    public void setIdPayer(int idPayer) {
        this.idPayer = idPayer;
    }

    @Basic
    @Column(name = "id_receiver", nullable = false)
    public int getIdReceiver() {
        return idReceiver;
    }

    public void setIdReceiver(int idReceiver) {
        this.idReceiver = idReceiver;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        TransactionEntity that = (TransactionEntity) o;

        if (id != that.id) return false;
        if (idPayer != that.idPayer) return false;
        if (idReceiver != that.idReceiver) return false;
        if (amont != null ? !amont.equals(that.amont) : that.amont != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (amont != null ? amont.hashCode() : 0);
        result = 31 * result + idPayer;
        result = 31 * result + idReceiver;
        return result;
    }
}
