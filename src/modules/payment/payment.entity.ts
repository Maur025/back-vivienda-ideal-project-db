import { BaseAuditEntity } from 'src/common/entity/base-audit-entity';
import { Column, Entity, JoinColumn, ManyToOne, OneToMany } from 'typeorm';
import { PaymentType } from '../payment-type/payment-type.entity';
import { Contract } from '../contract/contract.entity';
import { PaymentPlan } from '../payment-plan/payment-plan.entity';

@Entity({ name: 'payments' })
export class Payment extends BaseAuditEntity {
  @Column({
    name: 'total',
    type: 'decimal',
    precision: 18,
    scale: 2,
    nullable: false,
  })
  total: string;

  @Column({ name: 'date', type: 'datetime', nullable: false })
  date: Date;

  @Column({ name: 'fee_number', type: 'int', nullable: false })
  feeNumber: number;

  @Column({ name: 'contract_id', type: 'uuid', nullable: false })
  contractId: string;

  @ManyToOne(() => Contract)
  @JoinColumn({ name: 'contract_id', referencedColumnName: 'id' })
  contract: Contract;

  @Column({ name: 'payment_type_id', type: 'uuid', nullable: false })
  paymentTypeId: string;

  @ManyToOne(() => PaymentType)
  @JoinColumn({ name: 'payment_type_id', referencedColumnName: 'id' })
  paymentType: PaymentType;

  @OneToMany(() => PaymentPlan, (paymentPlan) => paymentPlan.payment)
  paymentPlans: PaymentPlan[];
}
