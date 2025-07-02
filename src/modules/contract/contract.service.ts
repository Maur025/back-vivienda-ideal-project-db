import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Contract } from './contract.entity';
import { Repository } from 'typeorm';

@Injectable()
export class ContractService {
  constructor(
    @InjectRepository(Contract)
    private readonly repository: Repository<Contract>,
  ) {}

  findAll(): Promise<Contract[]> {
    return this.repository.find({
      relations: [
        'contractType',
        'agent',
        'clientObligor',
        'clientContracting',
        'property',
        'contractState',
      ],
    });
  }

  findAllWithFilter({
    contractStateId,
    contractTypeId,
    clientContractingId,
    clientObligorId,
    from,
    to,
  }: {
    contractStateId?: string;
    contractTypeId?: string;
    clientContractingId?: string;
    clientObligorId?: string;
    from?: Date;
    to?: Date;
  }): Promise<Contract[]> {
    const query = this.repository
      ?.createQueryBuilder('contract')
      .leftJoinAndSelect('contract.contractType', 'contractType')
      .leftJoinAndSelect('contract.contractState', 'contractState')
      .leftJoinAndSelect('contract.clientContracting', 'clientContracting')
      .leftJoinAndSelect('contract.clientObligor', 'clientObligor')
      .leftJoinAndSelect('contract.property', 'property');

    if (contractStateId) {
      query.andWhere('contract.contractStateId = :contractStateId', {
        contractStateId,
      });
    }

    if (contractTypeId) {
      query.andWhere('contract.contractTypeId = :contractTypeId', {
        contractTypeId,
      });
    }

    if (clientContractingId) {
      query.andWhere('contract.clientContractingId = :clientContractingId', {
        clientContractingId,
      });
    }

    if (clientObligorId) {
      query.andWhere('contract.clientObligorId = :clientObligorId', {
        clientObligorId,
      });
    }

    if (from && to) {
      const fromDate = from;
      fromDate.setHours(0, 0, 0, 0); // Normalize to start of the day
      const toDate = to;
      toDate.setHours(23, 59, 59, 999); // Normalize to end of the day

      query.andWhere(
        'contract.startDate >= :from AND contract.endDate <= :to',
        {
          from: fromDate,
          to: toDate,
        },
      );
    } else if (from) {
      const fromDate = from;
      fromDate.setHours(0, 0, 0, 0); // Normalize to start of the day

      query.andWhere('contract.startDate >= :from', {
        from: from,
      });
    } else if (to) {
      const toDate = to;
      toDate.setHours(23, 59, 59, 999); // Normalize to end of the day

      query.andWhere('contract.endDate <= :to', {
        to: toDate,
      });
    }

    return query.getMany();
  }

  findTotalsBycontractType(dateRequest: Date) {
    const monthUse = dateRequest.getMonth() + 1; // getMonth() returns 0-11, so we add 1 for the month number
    const yearUse = dateRequest.getFullYear(); // getFullYear() returns the full year

    return this.repository
      .createQueryBuilder('contract')
      .leftJoin('contract.contractType', 'contractType')
      .leftJoin('contract.commissions', 'commission')
      .leftJoin('contract.payments', 'payment')
      .leftJoin('payment.paymentPlans', 'paymentPlan')
      .leftJoin('paymentPlan.pays', 'pay')
      .select('contract.contractTypeId', 'contractTypeId')
      .addSelect('SUM(contract.total)', 'total')
      .addSelect('contractType.name', 'name')
      .addSelect('SUM(commission.amount)', 'commissions')
      .addSelect('SUM(pay.amount)', 'pays')
      .where(
        'MONTH(contract.startDate) = :month AND YEAR(contract.startDate) = :year',
        { month: monthUse, year: yearUse },
      )
      .groupBy('contract.contractTypeId,contractType.name')
      .getRawMany();
  }
}
