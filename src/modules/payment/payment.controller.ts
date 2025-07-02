import { Controller, Get, Query } from '@nestjs/common';
import { PaymentService } from './payment.service';
import { ApiQuery } from '@nestjs/swagger';
import { Payment } from './payment.entity';

@Controller('payment')
export class PaymentController {
  constructor(private readonly paymentService: PaymentService) {}

  @Get()
  @ApiQuery({ name: 'month', required: false })
  findAll(@Query('month') month?: Date): Promise<Payment[]> {
    return this.paymentService.findAllWithFilter({
      month: month ? new Date(month) : undefined,
    });
  }
}
