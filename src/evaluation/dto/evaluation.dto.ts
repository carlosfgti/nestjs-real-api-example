import { IsDateString, IsNumber, IsString } from 'class-validator';

export class EvaluationDto {
  @IsNumber()
  id: number;

  @IsString()
  description: string;

  @IsDateString()
  date: Date;
}
