import { Injectable } from '@nestjs/common';
import { PrismaService } from 'src/prisma/prisma.service';

@Injectable()
export class CoursesService {
  constructor(private prisma: PrismaService) {}

  findAll() {
    return this.prisma.courses.findMany();
  }

  findOne(id: number) {
    return this.prisma.courses.findUnique({ where: { id } });
  }
}
