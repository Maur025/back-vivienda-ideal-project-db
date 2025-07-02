import { BaseAuditEntity } from 'src/common/entity/base-audit-entity';
import { Column, Entity, JoinColumn, ManyToOne } from 'typeorm';
import { Property } from '../property/property.entity';
import { Client } from '../client/client.entity';
import { Agent } from '../agent/agent.entity';

@Entity({ name: 'visits' })
export class Visit extends BaseAuditEntity {
  @Column({ name: 'visit_date', type: 'datetime', nullable: false })
  visitDate: Date;

  @Column({ name: 'code', length: 50, nullable: true })
  code: string;

  @Column({ name: 'property_id', type: 'uuid', nullable: false })
  propertyId: string;

  @ManyToOne(() => Property)
  @JoinColumn({ name: 'property_id', referencedColumnName: 'id' })
  property: Property;

  @Column({ name: 'client_id', type: 'uuid', nullable: false })
  clientId: string;

  @ManyToOne(() => Client)
  @JoinColumn({ name: 'client_id', referencedColumnName: 'id' })
  client: Client;

  @Column({ name: 'agent_id', type: 'uuid', nullable: false })
  agentId: string;

  @ManyToOne(() => Agent)
  @JoinColumn({ name: 'agent_id', referencedColumnName: 'id' })
  agent: Agent;
}
