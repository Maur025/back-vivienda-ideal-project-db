import { BaseAuditEntity } from 'src/common/entity/base-audit-entity';
import { Column, Entity, JoinColumn, ManyToOne, OneToMany } from 'typeorm';
import { Property } from '../property/property.entity';
import { Client } from '../client/client.entity';
import { Agent } from '../agent/agent.entity';
import { ContractState } from '../contract-state/contract-state.entity';
import { ContractType } from '../contract-type/contract-type.entity';
import { Commission } from '../commission/commission.entity';
import { Payment } from '../payment/payment.entity';

@Entity({ name: 'contracts' })
export class Contract extends BaseAuditEntity {
  @Column({ name: 'start_date', type: 'datetime', nullable: false })
  startDate: Date;

  @Column({ name: 'end_date', type: 'datetime', nullable: true })
  endDate: Date;

  @Column({
    name: 'total',
    type: 'decimal',
    precision: 18,
    scale: 2,
    nullable: false,
  })
  total: string;

  @Column({ name: 'contract_state_id', nullable: false })
  contractStateId: string;

  @Column({ name: 'contract_number', nullable: false })
  contractNumber: string;

  @ManyToOne(() => ContractState)
  @JoinColumn({ name: 'contract_state_id', referencedColumnName: 'id' })
  contractState: ContractState;

  @Column({ name: 'property_id', type: 'uuid', nullable: false })
  propertyId: string;

  @ManyToOne(() => Property)
  @JoinColumn({ name: 'property_id', referencedColumnName: 'id' })
  property: Property;

  @Column({ name: 'client_contrating_id', type: 'uuid', nullable: false })
  clientContratingId: string;

  @ManyToOne(() => Client)
  @JoinColumn({ name: 'client_contrating_id', referencedColumnName: 'id' })
  clientContracting: Client;

  @Column({ name: 'client_obligor_id', type: 'uuid', nullable: false })
  clientObligorId: string;

  @ManyToOne(() => Client)
  @JoinColumn({ name: 'client_obligor_id', referencedColumnName: 'id' })
  clientObligor: Client;

  @Column({ name: 'agent_id', type: 'uuid', nullable: false })
  agentId: string;

  @ManyToOne(() => Agent)
  @JoinColumn({ name: 'agent_id', referencedColumnName: 'id' })
  agent: Agent;

  @Column({ name: 'contract_type_id', type: 'uuid', nullable: false })
  contractTypeId: string;

  @ManyToOne(() => ContractType)
  @JoinColumn({ name: 'contract_type_id', referencedColumnName: 'id' })
  contractType: ContractType;

  @OneToMany(() => Commission, (commission) => commission.contract)
  commissions: Commission[];

  @OneToMany(() => Payment, (payment) => payment.contract)
  payments: Payment[];
}
