import { BaseAuditEntity } from 'src/common/entity/base-audit-entity';
import { Column, Entity, JoinColumn, ManyToOne, OneToMany } from 'typeorm';
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

  @Column({ name: 'reference_number', nullable: true })
  referenceNumber: string;

  @Column({ name: 'contract_id', type: 'uuid', nullable: false })
  contractId: string;

  @ManyToOne(() => Contract)
  @JoinColumn({ name: 'contract_id', referencedColumnName: 'id' })
  contract: Contract;

  @OneToMany(() => PaymentPlan, (paymentPlan) => paymentPlan.payment)
  paymentPlans: PaymentPlan[];
}
