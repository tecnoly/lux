import { Request, Response } from "express";
import { controller, httpGet, interfaces, request, response } from "inversify-express-utils";
import { HTTP_CODE, MESSAGE } from "../constants";
import ApiResponse from "../utils/apiResponse";

@controller("/healthz")
export class HealthzController implements interfaces.Controller  {

    @httpGet("/")
    private async health(@request() req: Request, @response() res: Response) {
        return ApiResponse.success(res, null, HTTP_CODE.SUCCESS, MESSAGE.SUCCESS);
    }
}