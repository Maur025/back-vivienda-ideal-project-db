import { BaseAuditEntity } from 'src/common/entity/base-audit-entity';
import { Column, Entity, JoinColumn, ManyToOne } from 'typeorm';
import { PaymentMethod } from '../payment-method/payment-method.entity';
import { PaymentPlan } from '../payment-plan/payment-plan.entity';

@Entity({ name: 'pays' })
export class Pay extends BaseAuditEntity {
  @Column({ name: 'amount', type: 'decimal', precision: 18, scale: 2 })
  amount: string;

  @Column({ name: 'balance', type: 'decimal', precision: 18, scale: 2 })
  balance: string;

  @Column({ name: 'date', type: 'datetime' })
  date: Date;

  @Column({ name: 'payment_method_id', type: 'uuid', nullable: false })
  paymentMethodId: string;

  @ManyToOne(() => PaymentMethod)
  @JoinColumn({ name: 'payment_method_id', referencedColumnName: 'id' })
  paymentMethod: PaymentMethod;

  @Column({ name: 'payment_plan_id', type: 'uuid', nullable: false })
  paymentPlanId: string;

  @ManyToOne(() => PaymentPlan)
  @JoinColumn({ name: 'payment_plan_id', referencedColumnName: 'id' })
  paymentPlan: PaymentPlan;
}
