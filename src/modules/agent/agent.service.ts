import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Agent } from './agent.entity';
import { Repository } from 'typeorm';

@Injectable()
export class AgentService {
  constructor(
    @InjectRepository(Agent) private readonly repository: Repository<Agent>,
  ) {}

  findAllWithCommissions() {
    return this.repository
      .createQueryBuilder('agent')
      .leftJoin('agent.commissions', 'commission')
      .leftJoin('agent.contracts', 'contract')
      .select('agent.name', 'name')
      .addSelect(
        'ROUND(COALESCE(AVG(commission.percentage),0),2)',
        'percentage',
      )
      .addSelect('COUNT(DISTINCT contract.id)', 'contractQuantity')
      .addSelect('SUM(COALESCE(commission.amount,0))', 'totalAmount')
      .addSelect('agent.id', 'id')
      .groupBy('agent.id')
      .getRawMany();
  }
}
