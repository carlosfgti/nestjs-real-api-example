import { Injectable } from '@nestjs/common';
import { EvaluationEntity } from 'src/evaluation/entity/evaluation.entity';

@Injectable()
export class EvaluationService {
  findAll(): EvaluationEntity[] {
    return [new EvaluationEntity()];
  }
}
