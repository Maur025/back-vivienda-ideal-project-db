import { BaseAuditEntity } from 'src/common/entity/base-audit-entity';
import { Column, Entity, JoinColumn, ManyToOne } from 'typeorm';
import { Visit } from '../visit/visit.entity';

@Entity({ name: 'feedbacks' })
export class Feedback extends BaseAuditEntity {
  @Column({ name: 'comment', length: 500, nullable: false })
  comment: string;

  @Column({ name: 'rating', type: 'int', nullable: false })
  rating: number;

  @Column({ name: 'date', type: 'datetime', nullable: false })
  date: Date;

  @Column({ name: 'visit_id', type: 'uuid', nullable: false })
  visitId: string;

  @ManyToOne(() => Visit)
  @JoinColumn({ name: 'visit_id', referencedColumnName: 'id' })
  visit: Visit;
}
