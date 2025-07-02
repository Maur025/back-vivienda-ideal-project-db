import { BaseAuditEntity } from 'src/common/entity/base-audit-entity';
import { Column, Entity } from 'typeorm';

@Entity({ name: 'contract_types' })
export class ContractType extends BaseAuditEntity {
  @Column({ name: 'name', nullable: false })
  name: string;

  @Column({ name: 'code', nullable: false })
  code: string;
}
