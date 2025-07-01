import { BaseEntity } from 'src/common/entity/base-entity';
import { Column, Entity } from 'typeorm';

@Entity({ name: 'client_types' })
export class ClientType extends BaseEntity {
  @Column({ name: 'name', length: 255, nullable: false })
  name: string;

  @Column({ name: 'code', nullable: false })
  code: string;
}
