import { Module } from '@nestjs/common';
import { EvaluationService } from './evaluation.service';
import { EvaluationController } from './evaluation.controller';
import { PrismaModule } from 'src/prisma/prisma.module';

@Module({
  controllers: [EvaluationController],
  providers: [EvaluationService],
  imports: [PrismaModule],
})
export class EvaluationModule {}
