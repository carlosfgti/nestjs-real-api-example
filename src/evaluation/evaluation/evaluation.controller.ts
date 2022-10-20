import { Controller, Get } from '@nestjs/common';

@Controller('evaluations')
export class EvaluationController {
  @Get()
  findAll(): string {
    return 'Find All Evaluations';
  }
}
