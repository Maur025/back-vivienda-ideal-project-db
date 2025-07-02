import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Payment } from './payment.entity';
import { Repository } from 'typeorm';

@Injectable()
export class PaymentService {
  constructor(
    @InjectRepository(Payment) private readonly repository: Repository<Payment>,
  ) {}

  findAllWithFilter({ month }: { month?: Date }): Promise<Payment[]> {
    const query = this.repository
      .createQueryBuilder('payment')
      .innerJoinAndSelect('payment.contract', 'contract')
      .leftJoinAndSelect('contract.clientContracting', 'clientContracting')
      .leftJoinAndSelect('contract.property', 'property')
      .leftJoinAndSelect('contract.contractType', 'contractType')
      .leftJoinAndSelect('contract.contractState', 'contractState')
      .innerJoinAndSelect('payment.paymentPlans', 'paymentPlan')
      .leftJoinAndSelect('paymentPlan.pays', 'pay')
      .where('pay.id IS NULL');

    if (month) {
      const onlyMonth = month.getMonth() + 1; // getMonth() returns 0-11

      query.andWhere('MONTH(payment.date) = :month', { month: onlyMonth });
    }

    return query.getMany();
  }
}
