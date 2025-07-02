import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Property } from './property.entity';
import { Repository } from 'typeorm';

@Injectable()
export class PropertyService {
  constructor(
    @InjectRepository(Property)
    private readonly repository: Repository<Property>,
  ) {}

  findAllWithVisits() {
    return this.repository
      .createQueryBuilder('property')
      .leftJoin('property.visits', 'visit')
      .leftJoin('visit.client', 'client')
      .select('property.name', 'name')
      .addSelect('GROUP_CONCAT(DISTINCT client.name)', 'clients')
      .addSelect('COUNT(visit.id)', 'visitQuantity')
      .groupBy('property.id')
      .orderBy('visitQuantity', 'DESC')
      .getRawMany();
  }
}
