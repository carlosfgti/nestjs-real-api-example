import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { EvaluationModule } from './evaluation/evaluation.module';
import { CoursesModule } from './courses/courses.module';

@Module({
  imports: [EvaluationModule, CoursesModule],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
