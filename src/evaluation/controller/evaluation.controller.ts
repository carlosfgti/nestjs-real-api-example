import { Controller, Get } from '@nestjs/common';
import { EvaluationEntity } from '../entity/evaluation.entity';
import { EvaluationService } from '../service/evaluation.service';

@Controller('evaluations')
export class EvaluationController {
  constructor(private evaluationService: EvaluationService) {}

  @Get('/')
  findAll(): EvaluationEntity[] {
    return this.evaluationService.findAll();
  }
}
