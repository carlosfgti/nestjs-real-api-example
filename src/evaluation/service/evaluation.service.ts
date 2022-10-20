import { Inject, Injectable } from '@nestjs/common';
import { Repository } from 'typeorm';
import { EvaluationEntity } from 'src/evaluation/entity/evaluation.entity';

@Injectable()
export class EvaluationService {
  constructor(
    @Inject('EVALUATION_REPOSITORY')
    private evaluationRepository: Repository<EvaluationEntity>,
  ) {}

  async findAll(): Promise<EvaluationEntity[]> {
    return await this.evaluationRepository.find();
  }
}
