import {
  Controller,
  Get,
  Param,
  Post,
  Body,
} from '@nestjs/common';
import { User } from '@prisma/client';
import { UserService } from './user.service';
@Controller('user')
export class UserController {
  constructor(private readonly userService: UserService) {}
  @Get()
  async getAllTodo(): Promise<User[]> {
    return this.userService.getAllUsers();
  }
  @Post()
  async createTodo(@Body() postData: User): Promise<User> {
    return this.userService.createUser(postData);
  }
  @Get(':id')
  async getTodo(@Param('id') id: number): Promise<User | null> {
    return this.userService.getUser(id);
  }
}
