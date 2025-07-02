import { BaseAuditEntity } from 'src/common/entity/base-audit-entity';
import { Column, Entity, JoinColumn, ManyToOne, OneToMany } from 'typeorm';
import { Payment } from '../payment/payment.entity';
import { Pay } from '../pay/pay.entity';

@Entity({ name: 'payment_plans' })
export class PaymentPlan extends BaseAuditEntity {
  @Column({
    name: 'amount',
    type: 'decimal',
    precision: 18,
    scale: 2,
    nullable: false,
  })
  amount: string;

  @Column({ name: 'date', type: 'datetime', nullable: false })
  date: Date;

  @Column({ name: 'payment_id', type: 'uuid', nullable: false })
  paymentId: string;

  @ManyToOne(() => Payment)
  @JoinColumn({ name: 'payment_id', referencedColumnName: 'id' })
  payment: Payment;

  @OneToMany(() => Pay, (pay) => pay.paymentPlan)
  pays: Pay[];
}
