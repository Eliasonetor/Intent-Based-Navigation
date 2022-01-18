using MitigationsService as service from '../../srv/navigation-service';

annotate service.Mitigations with {
    description @title : 'Description';
    owner       @title : 'Owner';
    timeline    @title : 'Timeline';
    risks       @title : 'Risks';
    mit_number  @title : 'Mitigation Number'
}

annotate service.Mitigations with @(
	UI: {
		HeaderInfo: {
			TypeName: 'Mitigation',
			TypeNamePlural: 'Mitigations',
			Title          : {
                $Type : 'UI.DataField',
                Value : owner
            },
			Description : {
				$Type: 'UI.DataField',
				Value: description
			}
		},
		SelectionFields: [timeline],
		LineItem: [
            {Value: mit_number},
			{Value: owner},
            {Value: timeline},
            {Value: description}
		],
		Facets: [
			{$Type: 'UI.ReferenceFacet', Label: 'Main', Target: '@UI.FieldGroup#Main'}
		],
		FieldGroup#Main: {
			Data: [
                {Value: mit_number},
                {Value: owner},
                {Value: timeline},
                {Value: description}
			]
		}
	},
);
