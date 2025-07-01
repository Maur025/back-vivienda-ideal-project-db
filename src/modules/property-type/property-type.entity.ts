import { BaseEntity } from 'src/common/entity/base-entity';
import { Column, Entity } from 'typeorm';

@Entity({ name: 'property_types' })
export class PropertyType extends BaseEntity {
  @Column({ name: 'name', length: 255, nullable: false })
  name: string;

  @Column({ name: 'code', nullable: false })
  code: string;
}
