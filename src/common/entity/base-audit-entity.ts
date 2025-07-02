import { BaseEntity } from './base-entity';
import {
  Column,
  CreateDateColumn,
  UpdateDateColumn,
  VersionColumn,
} from 'typeorm';

export abstract class BaseAuditEntity extends BaseEntity {
  @CreateDateColumn({
    name: 'created_at',
  })
  createdAt: Date;

  @Column({ name: 'created_by', nullable: true })
  createdBy: string;

  @UpdateDateColumn({ name: 'updated_at' })
  updatedAt: Date;

  @Column({ name: 'updated_by', nullable: true })
  updatedBy: string;

  @VersionColumn({ name: 'version', default: 0 })
  version: number;
}
