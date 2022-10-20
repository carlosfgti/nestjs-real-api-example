import { Controller, Get } from '@nestjs/common';
import { EvaluationService } from '../service/evaluation/evaluation.service';

@Controller('evaluations')
export class EvaluationController {
  constructor(private evaluationService: EvaluationService) {}

  @Get()
  findAll(): string {
    return 'Find All Evaluations';
  }
}
