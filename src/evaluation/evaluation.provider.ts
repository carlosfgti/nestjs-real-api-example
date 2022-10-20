import { DataSource } from 'typeorm';
import { EvaluationEntity } from './entity/evaluation.entity';

export const evaluationProviders = [
  {
    provide: 'EVALUATION_REPOSITORY',
    useFactory: (dataSource: DataSource) =>
      dataSource.getRepository(EvaluationEntity),
    inject: ['DATA_SOURCE'],
  },
];
