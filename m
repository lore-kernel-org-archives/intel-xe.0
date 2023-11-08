Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2316C4332F
	for <intel-xe@archiver.kernel.org>; Wed,  8 Nov 2023 18:26:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98B4910E810;
	Wed,  8 Nov 2023 18:26:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2266110E810
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Nov 2023 18:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699467976; x=1731003976;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=DcuAgH8p4HxQwrae46OkvWnGLPn2ubxqpawcTSB0oDo=;
 b=LfxU9MlBq4M2rT4UNuVaPOGB9vIfty0RHmL1uvIC3mBy63lQFdh3+lr9
 /bOyMiyXOAwiGumV4redUqOHM5TXTl+aTHbkcv+gTj6h/nczEB9yCPYs5
 /euWgT9OYSMxgDGxf3dmo+Cd8ohMkucAVlpZJoWo0maXk+8N8DRq7RWvy
 tPAG0MLZhEHXQ0ozRsFcCu073uQzTZDYP3UUG1WRHqnPnpjEshpuh/UAF
 yryQM2IcHhW2djPIWqgAnPi74leVLW363M23YUQz8PRCGTZ5yRJyr7iCD
 bMCihigb02sNHELEPBPkH1ZhEXiP59tXUIbN5groxhdTfiblihalOT5cb A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="456324065"
X-IronPort-AV: E=Sophos;i="6.03,287,1694761200"; d="scan'208";a="456324065"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2023 10:26:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="853821303"
X-IronPort-AV: E=Sophos;i="6.03,286,1694761200"; d="scan'208";a="853821303"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Nov 2023 10:26:00 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 8 Nov 2023 10:26:00 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 8 Nov 2023 10:26:00 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 8 Nov 2023 10:25:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G8ebyzCCfXC8NvkBV0CPOcKbee3y32UOKWbBt/5ut1lwKpOJ91scxmU22Qad4P2OdaKTgrAYq8I1zyW8Kk3CdVd6sNmsCjIWo5DuEXKxmFlMAvM+m12gcCFrSzlZ/ugoIBIvOE7fhSJH4m0+GVloPfhtPuWbBZWPdMQVzvb/xnkCUx0g4g97zhLuxHM0NF2VwQEE64EGE5FlEJAn5wJT9tnwqCSbdxmHCs/VCSax/adfvt78xYYyjpbRHhbUY6UCyR7tayHXqqzDy8uxSeEBOhm9H5G4oC+U3Lzaq9SlJs2uFrXd2sgClN7tsNiYUKayoLx/VEeth6soCQk+J/3spA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DcuAgH8p4HxQwrae46OkvWnGLPn2ubxqpawcTSB0oDo=;
 b=OtxHzpmwk62bdzQEzRTw/nIS0iE551ONlD64nZv8maZUN+Zs2Jc3yoLUWQgmAACleOIUu/D3qMm3vBpI8ZriRl3NsuX3qpCX0nhIBoUc31PDrTA8QndlUEw768Lr6TRIiyA0qsZFc9z/5y4vB2Z6ootZvj5+Q3BTjXFsy9DrzzU3G67KzL+kaG3E1G+VXtsgeCAA3vbcmbmrtq6Ikq6Ii/kGQMgLyEx0hwCWbQNMnMiu99N8Nw9o/BS9Q1E8DHKPHlxmvmf7PMzrqRIWfTknUStNGbdoBaYFyht7qCUBrwpRk5uiVNJEsvHrwxe+vXGO+M5BEH5NLNqBxZQiJ9/fQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by DS7PR11MB6247.namprd11.prod.outlook.com (2603:10b6:8:98::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Wed, 8 Nov
 2023 18:25:49 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::a1d6:e770:d3a9:cb36]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::a1d6:e770:d3a9:cb36%6]) with mapi id 15.20.6977.018; Wed, 8 Nov 2023
 18:25:48 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [Intel-xe] [PATCH v3] drm/xe: clear the serviced bits on
 INTR_IDENTITY_REG
Thread-Index: AQHaDpq1WkjsAZWnEUevlBLn4FtccbBwtdSAgAAOvLA=
Date: Wed, 8 Nov 2023 18:25:48 +0000
Message-ID: <CH0PR11MB5444AB9E8D5703AFDC13CDDDE5A8A@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20231103210324.1115369-1-jonathan.cavitt@intel.com>
 <169946465775.2923027.10312136051986614777.b4-ty@intel.com>
In-Reply-To: <169946465775.2923027.10312136051986614777.b4-ty@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|DS7PR11MB6247:EE_
x-ms-office365-filtering-correlation-id: ae417ce5-5c5b-4170-fe7e-08dbe08821bf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IJi2eoZaWmXuVWol4p1ZJdZffVXKNFMweSAol8b/RpggiugSIl89ArG6KLcX7Fb67iS8vPksk7CHq61pazQb3pYBmSgILPK+lUuU3wY/D6S97GM9Q+LMKuLRMyXpwlempboXPZ8+VUC5LLSuqAELxkF5qLYmI3HXF50cjNl0QaXVM05Q/oCwJ8ff1oFTvZXUg0koh9PWa82fLP8f4jTfEN5mJb4U5czsTdzNd+WrSz+K5MLw+8N3mYGrqPB+vMYiLsrK98R6c+0Yr49hvjRM8HXOGMj3mZePsjqG0+fXQc3Abgoa1mdV1WuYcze/gfWIDPTtgcaUZCYHOHExm3QVRMEjplaWBqTIELNguELLydrie520H2Z4SuO8FU0hw8MeylNFvTG8rMYxOx6uZxmSh3oPkK4ToiFHMiBKEvyf9UpdN8mvyGQ8CrhPbygw875HXPPTqeGPZ67KHMf9zR9dpi6i1ZOc9Mw9ojhffpxUARCKWBQZmGCRHBSJU4lpJAYHk+XG3TTAUZXcerGZDM+DE4srAcOpVrwOKqyo1RnXq9/tZuOQO3ilM50UTeu5GI7fQQsAT2V400/xxsQvzjf6QGUmtXaaNDQ2JEWd5bAvn7NTBigVyE5M7R1QCVd6+X1M
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(39860400002)(376002)(396003)(366004)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(55016003)(478600001)(38070700009)(33656002)(86362001)(82960400001)(83380400001)(122000001)(38100700002)(76116006)(53546011)(7696005)(9686003)(71200400001)(110136005)(64756008)(54906003)(66446008)(26005)(316002)(107886003)(6506007)(41300700001)(4744005)(66556008)(2906002)(66946007)(66476007)(52536014)(5660300002)(8676002)(8936002)(4326008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OFhEdUUrWDJFQ0ZMazJQUE9oUytZVlBOU2dDbUhhT1ZHUnBmbzg3czMvVjN2?=
 =?utf-8?B?TXpidWIxdjVrSVYwbEhlUGh5ZCtLNGNPVFo4bkdOcVlNVE1iSS9tOWltM01Q?=
 =?utf-8?B?VEJjMnpUb2ZaZHVpQllOMVpHSk81WmRpa1FnaXpRcVVBaDl3bHBKTGJrV3pI?=
 =?utf-8?B?eUQvN3dCUFd0eGZTcmZtS0hRbGRyZVUzOFp0ZWdpK2FBa1hMRitlQm1YUG9N?=
 =?utf-8?B?TFV5UHpKcFpmRjE1eGFWak80dXBFNjR4S2I2OHkrMUxiS0JOenJudStNK1p1?=
 =?utf-8?B?QXF4d1l3YlBaeWk1eW5ZcUNxTzZYSkZkbFlDaXNyc2QvRUJVUkZvQm1jV3ZN?=
 =?utf-8?B?RnVxOUl0QkVMR0ZzVkRnU3RtN3pERWh0S0FLQXB2aEMrcktKQTh2bzFEb0Rp?=
 =?utf-8?B?V011UEpVZWluMGlsWTdJZk92K21keGFFZThKUW9oYkNxWVpPbXBXV2ZaRE9s?=
 =?utf-8?B?NEVJY3BVL0EvdXRhSmRLUjA2ZjUvVXhDRTlFWUw2RDlGUEVzUjViQ29CdnFU?=
 =?utf-8?B?OEM4c1RxZE4wYWh1blBlWEJPTCtxZEFnNW9SbGhLS0NTcUgrZkdjbnRYSGt6?=
 =?utf-8?B?UVAwdE5xODlxTlRtdzd4NkZZNU1qbEZJdThjb2ljZ3pRV05TNlpYZnVCc2g1?=
 =?utf-8?B?bFNzeVRlSlZIaXk3clhqbDhoR3NIOFpzQmlMdUJvNXg4bmFkZXR4dHFXNEJy?=
 =?utf-8?B?Z2cvZzRwM3Fod3hxZEgzaUQvRVlwVlkzN1lDQ3Q2Umt0YWtjcHJUV0hyaUlK?=
 =?utf-8?B?RlRoNk1SVjA3c0l2K1hXdHBXSjRxaWRCSSs4M1g0K0hIWnlPbitjbGFZdk9l?=
 =?utf-8?B?QWdGTldEUHlvaStGeUVBdXAwaGcwVVRBQ0dFL1BYNXhpWmpDTUw0R3R2Q2tO?=
 =?utf-8?B?aDNzUWFxUTFNcGJ3ZS9YZllodzhkcHVWYkZNUXNOYUlhenUwMDZzMks1dnNI?=
 =?utf-8?B?T0VSUll0YTArWC80aUNoZWZVdkhSTFNlVktaRXZBTHpBSndpenBLS0VqekJx?=
 =?utf-8?B?SWRiYmdEd0VvQ3UvdDhQUklnYkZacGNtUk02ZmUrbmgybU1MWER4blozUWhB?=
 =?utf-8?B?NzNFeTVranhHMmliYVVRYXozOVhXU3MvWnFsL2U2OWN4d3diMW5VMUF5WXBX?=
 =?utf-8?B?ZHZZdk5lVHlGR2JmNWhQb2xKL0o4K081dFJWSmdYckIxQy9RTE1qemVUQjZk?=
 =?utf-8?B?OXVmUXA4YlEyQ202amFCam4rQXI3QVNUM3p5Vy9iRS9yRXJRUzNYT1NLZGtL?=
 =?utf-8?B?UTN4V2tGcFJuNCtmT1VDNzU0N0pOL1NoOVFnMEhtWWJqZUw5OVdDSi9Ebndo?=
 =?utf-8?B?N0VwYk50UkQrakxhcytzRGNiU243dytlQzBJVTVaQWhld3J5c0NMbTh5ckNl?=
 =?utf-8?B?Mm1rM2JNSWE5NTQ0aU1vcHV0dnIvOWZPZXlRcTMzTHNQOWFjdG9ydUNlL2U3?=
 =?utf-8?B?TWEyd3NTTEJLN2t4eGpxM09haERkektqNFVsR21QbFZKR1FKVFZQVEVFZ1Rz?=
 =?utf-8?B?WVBYQ1pCV1VGakZDMGxMVHN6TnJydzRZNnI3WUgvd1dzU29TTm1WZlhPN2x3?=
 =?utf-8?B?OFppUEJIZUV6TWgvZXdmYVcyNm54a05MS0gxTkxlSWVscXBpNUorRno3UUVD?=
 =?utf-8?B?RXRIUjFCS3ZkWjAxMzQzRUdMUzJTWDRpcFBHNnpiQkxwbGZoWHp3WDM5Tm5P?=
 =?utf-8?B?aDBQcXNpNE5sRW0xeEhmblV2NGJqdkxzRUdvYUF1YmhQdEpIYnBETlRWdExN?=
 =?utf-8?B?OXRFOHIyT1dUamVpN3FGQTh6Y3d4T3ZmSXd4U2dUNFR6R2VQUnNuOXkzRmZ1?=
 =?utf-8?B?WEY3empvU3oxVnl5ZlBEYUNjMGdFeUFnemQ0RkVHTTAyTGJ5aUdmazZzVHJ0?=
 =?utf-8?B?eDFFc1R6OFZLN0l5QzdFUFlDUmlLVld2K2ZtTCtiZ2pEL085emZzUG5IZVJz?=
 =?utf-8?B?b3RGSEJhay9uSDZaZUZOcUtybU1JQURXaDBFRGpjc2MvSmxrQ3RmdDFFbHQ1?=
 =?utf-8?B?UllYME52OW0yLzU3Yjc3WWFEeTV1czdSMCtpa0hVMXRpWS9LRU00eXhCVDNu?=
 =?utf-8?B?UUtJN2ozaWpmVmlZRHZ3SVpVb0hCV2ZhTmNKUHh1ZXpXKzVXT05NMFZDY0NX?=
 =?utf-8?Q?BYkleqEfaK/6QteSrg+iZRYU0?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae417ce5-5c5b-4170-fe7e-08dbe08821bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2023 18:25:48.8907 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Nwz/0aOoKqMPi4eGVUK9SVitErqdKBBcSJdWfwj3Odm/hrI7hj+nQ3fHwtC1yTkWGWwOpm65qiljWOEElt1U/kyVD/iO85v4A7EK7ucid/4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6247
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3] drm/xe: clear the serviced bits on
 INTR_IDENTITY_REG
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Cc: "Gupta, saurabhg" <saurabhg.gupta@intel.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IERlIE1hcmNoaSwgTHVjYXMgPGx1Y2Fz
LmRlbWFyY2hpQGludGVsLmNvbT4gDQpTZW50OiBXZWRuZXNkYXksIE5vdmVtYmVyIDgsIDIwMjMg
OTozMiBBTQ0KVG86IGludGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgQ2F2aXR0LCBKb25h
dGhhbiA8am9uYXRoYW4uY2F2aXR0QGludGVsLmNvbT4NCkNjOiBEZSBNYXJjaGksIEx1Y2FzIDxs
dWNhcy5kZW1hcmNoaUBpbnRlbC5jb20+OyBWaXZpLCBSb2RyaWdvIDxyb2RyaWdvLnZpdmlAaW50
ZWwuY29tPjsgR3VwdGEsIHNhdXJhYmhnIDxzYXVyYWJoZy5ndXB0YUBpbnRlbC5jb20+DQpTdWJq
ZWN0OiBSZTogW0ludGVsLXhlXSBbUEFUQ0ggdjNdIGRybS94ZTogY2xlYXIgdGhlIHNlcnZpY2Vk
IGJpdHMgb24gSU5UUl9JREVOVElUWV9SRUcNCj4gDQo+IA0KPiBPbiBGcmksIDAzIE5vdiAyMDIz
IDE0OjAzOjI0IC0wNzAwLCBKb25hdGhhbiBDYXZpdHQgd3JvdGU6DQo+ID4gVGhlIHNwZWMgZm9y
IHRoaXMgcmVnaXN0ZXIsIGxpa2UgbWFueSBvdGhlciBpbnRlcnJ1cHQgcmVsYXRlZCBvbmVzLA0K
PiA+IGFza3Mgc29mdHdhcmUgdG8gd3JpdGUgYmFjayAnMScgdG8gY2xlYXIgdGhlIHNlcnZpY2Vk
IGJpdHMuIExldCdzDQo+ID4gcmVzcGVjdCB0aGUgc3BlYy4NCj4gPiANCj4gPiB2MjoNCj4gPiAt
IFVwZGF0ZSBjb21taXQgbWVzc2FnZQ0KPiA+IC0gQWRkIG1pc3NpbmcgQ0MNCj4gPiANCj4gPiBb
Li4uXQ0KPiANCj4gSSByZW1vdmVkIHRoZSB2MyBsb2cgYW5kIGFwcGxpZWQuIEV2ZXJ5dGhpbmcg
aW4gdGhpcyBicmFuY2ggaXMgYmVpbmcgcmViYXNlZA0KPiBhbmQgd2UgdXN1YWxseSBkb24ndCBh
ZGQgaXQgdG8gdGhlIGNvbW1pdCBtZXNzYWdlLg0KPiANCj4gVHRoYW5rcyENCg0KDQpUaGFuayB5
b3UgZm9yIGFwcGx5aW5nIHRoaXMhDQotSm9uYXRoYW4gQ2F2aXR0DQoNCg0KPiANCj4gWzEvMV0g
ZHJtL3hlOiBjbGVhciB0aGUgc2VydmljZWQgYml0cyBvbiBJTlRSX0lERU5USVRZX1JFRw0KPiAg
ICAgICBjb21taXQ6IDdhMGRhNjA2ZjFmY2Y0YjU5ZDcxNjQ0MTlmMWNjZDFjNDhkMzY2YWYNCj4g
DQo+IEJlc3QgcmVnYXJkcywNCj4gLS0gDQo+IEx1Y2FzIERlIE1hcmNoaSA8bHVjYXMuZGVtYXJj
aGlAaW50ZWwuY29tPg0KPiANCg==
