import { Controller, Get, Query } from '@nestjs/common';
import { ContractService } from './contract.service';
import { Contract } from './contract.entity';
import { ApiQuery } from '@nestjs/swagger';

@Controller('contract')
export class ContractController {
  constructor(private readonly contractService: ContractService) {}

  @Get()
  @ApiQuery({ name: 'contractStateId', required: false })
  @ApiQuery({ name: 'contractTypeId', required: false })
  @ApiQuery({ name: 'clientContractingId', required: false })
  @ApiQuery({ name: 'clientObligorId', required: false })
  @ApiQuery({ name: 'from', required: false, type: String })
  @ApiQuery({ name: 'to', required: false, type: String })
  findAll(
    @Query('contractStateId') contractStateId?: string,
    @Query('contractTypeId') contractTypeId?: string,
    @Query('clientContractingId') clientContractingId?: string,
    @Query('clientObligorId') clientObligorId?: string,
    @Query('from') from?: Date,
    @Query('to') to?: Date,
  ): Promise<Contract[]> {
    return this.contractService.findAllWithFilter({
      contractStateId,
      contractTypeId,
      clientContractingId,
      clientObligorId,
      from,
      to,
    });
  }

  @Get('contract-types')
  findAllContractTypes() {
    return this.contractService.findTotalsBycontractType();
  }
}
