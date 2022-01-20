using RisksService as service from '../../srv/navigation-service';

annotate service.Risks with {
    ID          @title : 'ID';
    ID          @UI.ExcludeFromNavigationContext : true;
    miti_ID     @title : 'Mitigation ID';
    title       @title: 'Title';
	prio        @title: 'Priority';
	descr       @title: 'Description';
	miti        @title: 'Mitigation';
	impact      @title: 'Impact';
    classification @title : 'classification';
    classification @Common.SemanticObject : 'Mitigations';
}

annotate service.Risks with @(
    	UI: {
		HeaderInfo: {
			TypeName: 'Risk',
			TypeNamePlural: 'Risks',
			Title          : {
                $Type : 'UI.DataField',
                Value : title
            },
			Description : {
				$Type: 'UI.DataField',
				Value: descr
			}
		},
		SelectionFields: [classification],
		LineItem: [

            {Value: ID},
            {Value: miti_ID },
            {Value:classification},
            // {
            //     $Type:'UI.DataFieldWithIntentBasedNavigation', 
            //     Value: miti.ID,
            //     SemanticObject: 'Mitigations',
            //     Action: 'manage'
                
            // },
            // {
            //     $Type:'UI.DataFieldForIntentBasedNavigation',
            //     Label:'Action for Navigation TEST', 
            //     SemanticObject: 'Mitigations',
            //     Action: 'manage'
            // },
            {Value: title},
			{
				Value: prio,
				Criticality: criticality
			},
			{
				Value: impact,
				Criticality: criticality
			}
		],
		Facets: [
			{$Type: 'UI.ReferenceFacet', Label: 'Information', Target: '@UI.FieldGroup#Main'}
		],
		FieldGroup#Main: {
			Data: [
			    {Value: classification},
                {Value: title},
				{
					Value: prio,
					Criticality: criticality
				},
				{
					Value: impact,
					Criticality: criticality
				}
			]
		},
	},
);

