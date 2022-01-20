using MitigationsService as service from '../../srv/navigation-service';

annotate service.Mitigations with {
    ID          @title : 'ID';
    ID          @UI.ExcludeFromNavigationContext : true;
    description @title : 'Description';
    owner       @title : 'Owner';
    timeline    @title : 'Timeline';
    risks       @title : 'Risks';
    mit_number  @title : 'Mitigation Number';
    classification @title : 'classification';
    classification @Common.SemanticObject : 'Risks';
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
        SelectionFields: [classification],
		LineItem: [
            {Value: ID},
            {Value: classification},
			{Value: owner},
            {Value: timeline},
            {Value: description}
		],
		Facets: [
			{$Type: 'UI.ReferenceFacet', Label: 'Main', Target: '@UI.FieldGroup#Main'}
		],
		FieldGroup#Main: {
			Data: [
                {Value: classification},
                {Value: owner},
                {Value: timeline},
                {Value: description}
			]
		}
	},
);
