import { BeforeInsert, Column, PrimaryColumn } from 'typeorm';
import { v4 as uuidv4 } from 'uuid';

export abstract class BaseEntity {
  @PrimaryColumn({ name: 'id', type: 'uuid', default: () => 'UUID_v4()' })
  id: string;

  @Column({ name: 'deleted', nullable: false, default: false })
  deleted: boolean = false;

  @BeforeInsert()
  generateId() {
    if (!this.id) {
      this.id = uuidv4();
    }
  }
}
