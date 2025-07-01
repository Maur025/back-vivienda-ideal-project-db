import { BaseAuditEntity } from 'src/common/entity/base-audit-entity';
import { Column, Entity, JoinTable, ManyToMany } from 'typeorm';
import { ClientType } from '../client-type/client-type.entity';

@Entity({ name: 'clients' })
export class Client extends BaseAuditEntity {
  @Column({ name: 'name', length: 255, nullable: false })
  name: string;

  @Column({ name: 'document', length: 30, nullable: false })
  document: string;

  @Column({ name: 'email', length: 255, nullable: true })
  email: string;

  @Column({ name: 'phone', length: 25, nullable: true })
  phone: string;

  @Column({ name: 'address', length: 255, nullable: true })
  address: string;

  @ManyToMany(() => ClientType)
  @JoinTable({
    name: 'client_client_types',
    joinColumn: { name: 'client_id', referencedColumnName: 'id' },
    inverseJoinColumn: { name: 'client_type_id', referencedColumnName: 'id' },
  })
  clientTypes: ClientType[];
}
