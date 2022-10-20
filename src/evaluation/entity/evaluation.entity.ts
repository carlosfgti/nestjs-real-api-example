import { Entity, Column, PrimaryGeneratedColumn } from 'typeorm';

@Entity({ name: 'evaluations' })
export class EvaluationEntity {
  @PrimaryGeneratedColumn()
  id: number;

  @Column('text')
  description: string;

  @Column()
  date: Date;

  @Column()
  isVisible: boolean;
}
