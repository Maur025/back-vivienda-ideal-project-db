import { BaseAuditEntity } from 'src/common/entity/base-audit-entity';
import { Column, Entity, JoinColumn, ManyToOne } from 'typeorm';
import { City } from '../city/city.entity';
import { Branch } from '../branch/branch.entity';
import { Client } from '../client/client.entity';
import { PropertyType } from '../property-type/property-type.entity';

@Entity({ name: 'properties' })
export class Property extends BaseAuditEntity {
  @Column({ name: 'name', length: 255, nullable: false })
  name: string;

  @Column({ name: 'description', length: 500, nullable: true })
  description: string;

  @Column({ name: 'price', type: 'decimal', precision: 18, scale: 2 })
  price: string;

  @Column({ name: 'available', type: 'boolean', default: true })
  available: boolean = true;

  @Column({ name: 'city_id', type: 'uuid', nullable: false })
  cityId: string;

  @ManyToOne(() => City)
  @JoinColumn({ name: 'city_id', referencedColumnName: 'id' })
  city: City;

  @Column({ name: 'branch_id', type: 'uuid', nullable: false })
  branchId: string;

  @ManyToOne(() => Branch)
  @JoinColumn({ name: 'branch_id', referencedColumnName: 'id' })
  branch: Branch;

  @Column({ name: 'client_id', type: 'uuid', nullable: false })
  clientId: string;

  @ManyToOne(() => Client)
  @JoinColumn({ name: 'client_id', referencedColumnName: 'id' })
  client: Client;

  @Column({ name: 'property_type_id', type: 'uuid', nullable: false })
  propertyTypeId: string;

  @ManyToOne(() => PropertyType)
  @JoinColumn({ name: 'property_type_id', referencedColumnName: 'id' })
  propertyType: PropertyType;
}
