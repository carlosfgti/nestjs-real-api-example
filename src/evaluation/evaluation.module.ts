import { Module } from '@nestjs/common';
import { EvaluationController } from './controller/evaluation.controller';
import { EvaluationService } from './service/evaluation/evaluation.service';

@Module({
  controllers: [EvaluationController],
  providers: [EvaluationService],
})
export class EvaluationModule {}
