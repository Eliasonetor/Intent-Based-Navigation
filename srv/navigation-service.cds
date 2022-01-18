using { sap.ui.navigationmanagement as my } from '../db/schema';
@path: 'risks'
service RisksService {
  entity Risks as projection on my.Risks;
    annotate Risks with @odata.draft.enabled;
}
@path: 'mitigations'
service MitigationsService
{
    entity Mitigations as projection on my.Mitigations;
        annotate Mitigations with @odata.draft.enabled;
}