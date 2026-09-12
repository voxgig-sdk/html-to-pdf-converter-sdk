import { HtmlToPdfConverterEntityBase } from '../HtmlToPdfConverterEntityBase';
import type { HtmlToPdfConverterSDK } from '../HtmlToPdfConverterSDK';
import type { Control } from '../types';
import type { PdfGeneration, PdfGenerationCreateData } from '../HtmlToPdfConverterTypes';
declare class PdfGenerationEntity extends HtmlToPdfConverterEntityBase<PdfGeneration> {
    constructor(client: HtmlToPdfConverterSDK, entopts: any);
    make(this: PdfGenerationEntity): PdfGenerationEntity;
    create(this: any, reqdata?: PdfGenerationCreateData, ctrl?: Control): Promise<PdfGenerationEntity>;
}
export { PdfGenerationEntity };
