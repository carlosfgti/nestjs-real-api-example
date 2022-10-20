import { Controller, Get } from '@nestjs/common';
import { EvaluationEntity } from '../entity/evaluation.entity';
import { EvaluationService } from '../service/evaluation.service';

@Controller('evaluations')
export class EvaluationController {
  constructor(private evaluationService: EvaluationService) {}

  @Get('/')
  async findAll(): Promise<EvaluationEntity[]> {
    return await this.evaluationService.findAll();
  }
}
