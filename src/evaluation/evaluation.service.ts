import { Injectable } from '@nestjs/common';
import { PrismaService } from 'src/prisma/prisma.service';
import { CreateEvaluationDto } from './dto/create-evaluation.dto';
import { UpdateEvaluationDto } from './dto/update-evaluation.dto';

@Injectable()
export class EvaluationService {
  constructor(private prisma: PrismaService) {}

  create(createEvaluationDto: CreateEvaluationDto) {
    return 'This action adds a new evaluation';
  }

  findAll() {
    return this.prisma.course_evaluation.findMany();
  }

  findOne(id: number) {
    return `This action returns a #${id} evaluation`;
  }

  update(id: number, updateEvaluationDto: UpdateEvaluationDto) {
    return `This action updates a #${id} evaluation`;
  }

  remove(id: number) {
    return `This action removes a #${id} evaluation`;
  }
}
