import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { UserModule } from './user/user.module';
import { ContentModule } from './content/content.module';
import { CommentModule } from './comment/comment.module';

@Module({
  imports: [UserModule, ContentModule, CommentModule],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
