import { Module } from '@nestjs/common';
import { EvaluationController } from './controller/evaluation.controller';
import { evaluationProviders } from './evaluation.provider';
import { EvaluationService } from './service/evaluation.service';

@Module({
  controllers: [EvaluationController],
  providers: [...evaluationProviders, EvaluationService],
})
export class EvaluationModule {}
