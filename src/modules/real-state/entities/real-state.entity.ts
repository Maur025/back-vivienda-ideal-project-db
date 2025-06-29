import { Entity, Column, PrimaryGeneratedColumn } from 'typeorm';

@Entity()
export class RealState {
  @Column({ name: 'id' })
  @PrimaryGeneratedColumn('uuid')
  id: string;

  @Column({ name: 'name' })
  name: string;
}
