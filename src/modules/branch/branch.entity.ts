import { BaseEntity } from 'src/common/entity/base-entity';
import { Column, Entity, JoinColumn, ManyToOne } from 'typeorm';
import { City } from '../city/city.entity';

@Entity({ name: 'branches' })
export class Branch extends BaseEntity {
  @Column({ name: 'name', length: 100, nullable: false })
  name: string;

  @Column({ name: 'address', length: 255, nullable: true })
  address: string;

  @Column({ name: 'phone', length: 25, nullable: true })
  phone: string;

  @Column({ name: 'city_id', type: 'uuid', nullable: false })
  cityId: string;

  @ManyToOne(() => City)
  @JoinColumn({ name: 'city_id', referencedColumnName: 'id' })
  city: City;
}
