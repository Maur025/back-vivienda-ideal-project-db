import { Entity, Column, PrimaryGeneratedColumn } from 'typeorm';

@Entity()
export class Rent {
  @Column({ name: 'id' })
  @PrimaryGeneratedColumn('uuid')
  id: string;

  @Column({ name: 'name' })
  name: string;
}
