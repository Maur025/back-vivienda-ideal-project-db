import { BaseEntity } from 'src/common/entity/base-entity';
import { Column, Entity } from 'typeorm';

@Entity({ name: 'cities' })
export class City extends BaseEntity {
  @Column({ name: 'name', length: 100, nullable: false })
  name: string;
}
