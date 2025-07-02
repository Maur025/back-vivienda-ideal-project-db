import { BaseAuditEntity } from 'src/common/entity/base-audit-entity';
import { Column, Entity, JoinColumn, ManyToOne } from 'typeorm';
import { Contract } from '../contract/contract.entity';
import { Agent } from '../agent/agent.entity';

@Entity({ name: 'commissions' })
export class Commission extends BaseAuditEntity {
  @Column({
    name: 'amount',
    type: 'decimal',
    precision: 18,
    scale: 2,
    nullable: false,
  })
  amount: string;

  @Column({
    name: 'percentage',
    type: 'decimal',
    precision: 5,
    scale: 2,
    nullable: false,
  })
  percentage: string;

  @Column({ name: 'contract_id', type: 'uuid', nullable: false })
  contractId: string;

  @ManyToOne(() => Contract)
  @JoinColumn({ name: 'contract_id', referencedColumnName: 'id' })
  contract: Contract;

  @Column({ name: 'agent_id', type: 'uuid', nullable: false })
  agentId: string;

  @ManyToOne(() => Agent)
  @JoinColumn({ name: 'agent_id', referencedColumnName: 'id' })
  agent: Agent;
}
