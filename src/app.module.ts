import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { ConfigModule, ConfigService } from '@nestjs/config';
import { TypeOrmModule } from '@nestjs/typeorm';
import { CityModule } from './modules/city/city.module';
import { BranchModule } from './modules/branch/branch.module';
import { CommissionModule } from './modules/commission/commission.module';
import { ContractModule } from './modules/contract/contract.module';
import { PaymentModule } from './modules/payment/payment.module';
import { PropertyModule } from './modules/property/property.module';
import { PaymentMethodModule } from './modules/payment-method/payment-method.module';
import { PayModule } from './modules/pay/pay.module';
import { PaymentPlanModule } from './modules/payment-plan/payment-plan.module';
import { VisitModule } from './modules/visit/visit.module';
import { FeedbackModule } from './modules/feedback/feedback.module';
import { ClientModule } from './modules/client/client.module';
import { AgentModule } from './modules/agent/agent.module';
import { ClientTypeModule } from './modules/client-type/client-type.module';
import { PropertyTypeModule } from './modules/property-type/property-type.module';
import { ContractStateModule } from './modules/contract-state/contract-state.module';
import { ContractTypeModule } from './modules/contract-type/contract-type.module';

@Module({
  imports: [
    ConfigModule.forRoot({
      isGlobal: true,
    }),
    TypeOrmModule.forRootAsync({
      inject: [ConfigService],
      useFactory: (config: ConfigService) => ({
        type: 'mysql',
        host: config.get<string>('DB_HOST', 'localhost'),
        port: config.get<number>('DB_PORT', 3306),
        username: config.get<string>('DB_USERNAME', ''),
        password: config.get<string>('DB_PASSWORD', ''),
        database: config.get<string>('DB_NAME', 'viviendaIdealDb'),
        entities: [`${__dirname}/**/*.entity{.ts,.js}`],
        synchronize: !config.get<boolean>('PRODUCION', false),
        logging: true,
      }),
    }),
    CityModule,
    BranchModule,
    CommissionModule,
    ContractModule,
    PaymentModule,
    PropertyModule,
    PaymentMethodModule,
    PayModule,
    PaymentPlanModule,
    VisitModule,
    FeedbackModule,
    ClientModule,
    AgentModule,
    ClientTypeModule,
    PropertyTypeModule,
    ContractStateModule,
    ContractTypeModule,
  ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
