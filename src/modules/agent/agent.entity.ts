import { BaseAuditEntity } from 'src/common/entity/base-audit-entity';
import { Column, Entity, JoinColumn, ManyToOne } from 'typeorm';
import { Branch } from '../branch/branch.entity';

@Entity({ name: 'agents' })
export class Agent extends BaseAuditEntity {
  @Column({ name: 'name', length: 255, nullable: false })
  name: string;

  @Column({ name: 'email', length: 255, nullable: true })
  email: string;

  @Column({ name: 'phone', length: 25, nullable: true })
  phone: string;

  @Column({ name: 'branch_id', type: 'uuid', nullable: false })
  branchId: string;

  @ManyToOne(() => Branch)
  @JoinColumn({ name: 'branch_id', referencedColumnName: 'id' })
  branch: Branch;
}
