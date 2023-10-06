Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37A01E92FFB
	for <intel-xe@archiver.kernel.org>; Fri,  6 Oct 2023 10:21:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0042610E06B;
	Fri,  6 Oct 2023 10:21:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0929C10E06B
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Oct 2023 10:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696587709; x=1728123709;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Ly5CkV94wUnOvKIaO3qqsPdOvDJ075twzY58H7lqwo8=;
 b=WjicwqwrCocaBQk/bCJ0lxS6vnRc4UVD9qq4Hniq3/WFqmPGPMT8XddD
 qcqMy0EpJ4kHVr1shG3nLN/shS7wBy+ek2MmIlJob1J4eGbGPqtScMyXJ
 g+J3x/EmKyqGSfkNutbk1V7SGY5wn6nD5twm+rY4Xfo4ojVDPDq/C7c3O
 9zM5y37W3Bhl/Hos+xaTonTSWlzwIABdsYmRbcL4ZjjwDs28OE3/ztSvn
 9MKLUGGa0hR+rCe8ZN/0P8iEQ9/RtTKHrSHxuJrlkgvXZLHBRMdAkqAXx
 v9LoT5Y8N2kmyF/TWFkCvkA6MrgdVGDeXskYrbsv6mqXVuu1kriTcqvek w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="383614165"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="383614165"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2023 03:21:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="728797041"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="728797041"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Oct 2023 03:21:47 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 6 Oct 2023 03:21:47 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 6 Oct 2023 03:21:46 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 6 Oct 2023 03:21:46 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 6 Oct 2023 03:21:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cOP06P5yN0k2lXDNAaTrAar7g0QTC77vm/qZN1ilyrbFOcMfsVr2cYLrUHQtWijBlD9wsSmiM4Xde8D3L6K3FhuH1Eti3tu+UETnNL66/TTUwNCp4udCx04otKEkPqzcU2bf6WuTmFysfCT2eAA8KGdVKVaxVmwunjHWSM4zYZ/7ZbYwlP41CJ4WCskvE1scIaCV0ih3tKciH6aB7fRk5wNvFraM4MNWheftV5CNbLl610nicLOHUuuiLcJyDDGaa42ggHB7H3yD9ycphNTTuu0XKQyy3gq1G1WlGzky3rRSkYG++7tbzTC7dR/rcoZ1Ql46HhJGNL4qSTKD2xjnvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ly5CkV94wUnOvKIaO3qqsPdOvDJ075twzY58H7lqwo8=;
 b=Ck2m+uD8ORGJhrnF8nYYUPwXk7xsZBvzttA7RE17tnpx/NBpt5p2rF+drwuqNA75J44tyMWA9Qz6O8vbEHvZI19ihv2AH+LSHkv8cmxmuLbtRrLUzvnbDXiyCySSK2OyRdywN5u4e5xS9VmVzJLY6i8V7kKaq0UrgBwOqSMYXT9VHbgbT/eYS5h/78X9CB6VNGNMG6YQno7PzlMiDhoY2ZxTOGhRsjgfvDE/TsPJOCxb3nWcVGX5l4f1vgPPVa5laF17T2zrQgAgmw/nyu/ooh/vPZL7twrTl9SblhG0g0p2yHgK6br4OQTXc8GgswEIXP95Wj0X/5vaTJ0f347vzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) by
 SA2PR11MB5209.namprd11.prod.outlook.com (2603:10b6:806:110::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.30; Fri, 6 Oct
 2023 10:21:44 +0000
Received: from DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::42bc:8d57:e26f:ecd4]) by DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::42bc:8d57:e26f:ecd4%3]) with mapi id 15.20.6838.033; Fri, 6 Oct 2023
 10:21:44 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [PATCH 3/3] drm/xe: Create a dummy version for vga decode
Thread-Index: AQHZ95Mtw/v8SUodRUyOSLNOaaVsPbA8GrAAgABvMYA=
Date: Fri, 6 Oct 2023 10:21:44 +0000
Message-ID: <DM4PR11MB636056AF070BCF09E2195AE4F4C9A@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20231005135918.2345364-1-uma.shankar@intel.com>
 <20231005135918.2345364-4-uma.shankar@intel.com>
 <DM6PR11MB3177B057D7A83AB91CE0D54ABAC9A@DM6PR11MB3177.namprd11.prod.outlook.com>
In-Reply-To: <DM6PR11MB3177B057D7A83AB91CE0D54ABAC9A@DM6PR11MB3177.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6360:EE_|SA2PR11MB5209:EE_
x-ms-office365-filtering-correlation-id: a7e09db5-1a8d-40fb-d0ea-08dbc6560a51
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: r1rO5f8KgJZ+AUFbuTm7RxQN1+H/eLZHHCBLEBp2SIsrXHCRak/Wa4DKOLoFB9EjUpIVB73tjcJpNn+ftJOVvG3mzCOp4LackapiaPkeqrLm+kjRlVlru4Em/X1M6JUUONAengz49V9fwS0xXvnZ+IzzAMhWivuMq0+9LxnRIJa//OWcI5TlnAtkUso17MtlEEhIn+Kssyj/E+DiXxajDXfzIfHNQsRNBJ5IARZVht/oi+z0juJ3dBg4EWQBqF5XcL4j4IgC7uW9jFvlDkuWoOiF3957kocIGz7DZ9LrDFHKHELsr7I4pw+LyD1VjNWon7xb7Dq6wShSKC71fwFQrfOcaeWPcGh/DF5ssFwhtIVNyp7tIMi0MPwOfg0gFvDMLnzVTlzKI+hm4Sly9KZvZeIfJEwf1OGyxoTo9NhFOiBdPvrNKmhvxOZPAsKiXzmeUICLQEccnecR196eRPWW7/UhSPMHvVnBjqHcxF1LHRy9nube04UstRKTWmXoyvPaKJ5YGyPBNt0+l6zH7QRQ66enyFDb43iYNmL/gb2S0lqg3GojZXVoSDjfohWJuqQr15RcqrWEe3pQIUm0KG1tM4KQUaQC4jubnXlKm+J8/6RpOomvT9xolp7qHBJLf0pa
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6360.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(39860400002)(376002)(136003)(396003)(230922051799003)(451199024)(1800799009)(64100799003)(186009)(7696005)(6506007)(9686003)(2906002)(53546011)(33656002)(38100700002)(83380400001)(122000001)(86362001)(82960400001)(38070700005)(55016003)(107886003)(26005)(8676002)(52536014)(8936002)(316002)(4326008)(478600001)(5660300002)(76116006)(110136005)(41300700001)(66476007)(64756008)(66946007)(71200400001)(66556008)(66446008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WHhMSDRkYXllaXRDUWxFRXJXa2YrV2lTREt5dDlFRElKNUF0TGhYclNiSXpR?=
 =?utf-8?B?RlUzL1NFVy9NYmNUL0dDTExBMERRVHNWYzAwNW9GdzhsTm83cks2TEUzK0JE?=
 =?utf-8?B?U20zMXc0eFNQd0p0dC9NS2FBVXpvSXBOZll5eVZmZU01TnA0aVlmeFNJaFE3?=
 =?utf-8?B?dHNLd1dSUTFUajY1VjNReFUyT0tEbEEwTElBT3BYMktBcjNYbVZ1bHhKTzNB?=
 =?utf-8?B?UEo3NkxOdk8vd1hIcWRVUG5WenNQYnNkWmhHNldpU041Y2JlS21xVkFJUW5C?=
 =?utf-8?B?c25GWVVmbGtlSVF1VFBQaDJhVUxsZWM4OWJwRVBrUEZxSU9qL0dUOWVPV0p6?=
 =?utf-8?B?aHV6SmFIZEJMT0IwNFBxbTQ5NHF6SnBTU01tOE02WkRnaWZtcFpKQWFKMnhM?=
 =?utf-8?B?d3R0K3JxWCtPZnpDaFg4ektLZ1pOaWFqSzdsWE1ndGFqTzR4OE94bmlDcEJG?=
 =?utf-8?B?R080bTJFUHgvbzZ5a1RIMUpqYUE2UGNaTUlqRFlycy9lVlJZdXhlMjk5WVVv?=
 =?utf-8?B?N0RwREpLN3Y2UzFUeE5MbDB2T3J2QmpUVTZ1d3B5RVdBRFNtWnRFUEIwUHhm?=
 =?utf-8?B?Z3lvUHFEL2NIb1d5VjdhK0lJWFUwZlhKSWxsaldsWVYvaWdYQnVjcFNreHBY?=
 =?utf-8?B?NytHcmxYQUNiL2U2eDVTbVdaY05aNjMyNE9KUGh6Qng1Umd2NHJ4ZmRPN29k?=
 =?utf-8?B?eG9ya0ZVeDBnbW93MWxYK1REN01WdXZqaWRud25oVk14RHhreU9zMURtSGFt?=
 =?utf-8?B?d2JRRXdjMmV0RUE5SVZYVzlXZm4yZFQvVWlTZVhHTkwwZk1CVFR3RmJqalRi?=
 =?utf-8?B?K0U5MmRjRGgvalJnZ2NPdWNLWFV1YXNGU0NIalphZ3ZEMlRWTXhLUlRvL0Z2?=
 =?utf-8?B?clByV2hsNXZWU2NrcTB1YnNEUnlvVkhSOEFvUSt2dDJ3Y0pLMWQrRG9rdklj?=
 =?utf-8?B?NmdwVXRUSFY2REJxMCsxSzBUVVBRbVl2TU92WEhvTmpmZFo2ZmJsdHc3MVJ6?=
 =?utf-8?B?RU9XZ2xJK29SMGFpL01JaGhQcUdKMndJdC80bXpxVXJlQlNZcURjQWNVaStz?=
 =?utf-8?B?WnVZd1ZPdEVpcnpvNFcxbW1EdDhQRy9yNTRNdFpOR3p2Z2cxVXJWSjI5ZHNQ?=
 =?utf-8?B?c0JScXE3a0JQS1ZsWEdRbjhzNS9UcFBVOGdDQ2RpOFVjMFdLRzFaVGhqcktO?=
 =?utf-8?B?R0k4R3JjUFR2NGJiM0pVaHBUQjdvelkxRFZOVHdlbFcwZUJIejdJblk5UkVP?=
 =?utf-8?B?dnJsdk5TTVp2MjIvaXRuMVFadUUwVWsxYU5TYmJlUEJscHJ0Qjh3SG85Ni9B?=
 =?utf-8?B?eWJSWERzQkgzamlBN2FBRW9qcUhQdVZFVE9IcWpTMGJnaklyQjRoKzF0bWZH?=
 =?utf-8?B?YkVWRnpaK2RCTVlrbmpHakZxbkRHMGV4V0JQYm5ZTmE3d0RHSWdDSE9WYkcr?=
 =?utf-8?B?eFNvV3BNNWZPdW5HT0ZBSGRPYVgvL0x2aWxVZ0pmRUhIYVlDeDdYUEZQNnJk?=
 =?utf-8?B?eGlYWTd2N1ZhWE0vbWkwUWR6TGtLTW5lK0FCLzFTdmNGNVNHWUhvaHJtRDhN?=
 =?utf-8?B?UUlNR0YvbVNlVFBpM3lWaDBFRXZhWnllbk8rSnpLLzRhMCswbE1xeEFvUnpr?=
 =?utf-8?B?SUtVR2w1TEI4R1U2akk5SkhubDlvSU8yUmFFLzhYc3JjR0l2VjA2MVdvSGZZ?=
 =?utf-8?B?cWoxMFVyTnd1ekV2WW9ZOUpPQ2NteE02VlQvRU9ERjdsWC8vWDlKZ2VlTnNJ?=
 =?utf-8?B?b1c3dVhkOHNSMVZ5U2dWWUlOSjZiUVBJTm1rZEVVdFF3Vk9UWmZvVWtMczlR?=
 =?utf-8?B?UkxheG9SRHFNdi9kcXFrcnNTanNZenFDbVM0eFJGdzZ1Y1M2Yk5MTkxvWUp3?=
 =?utf-8?B?Vjdpbk1TemcxZFAwM1FFZjcvMytxQ21oZFIvQW0yQU0wdzU2R2R4bFlRSXlJ?=
 =?utf-8?B?dEFvWlUzb3VFUXpyeDVDalFlOG52bWRJWi9xdkJZOUFFKzdwZFlaVndMNlFO?=
 =?utf-8?B?SUJhak1ZRVR6NmlHbFBjZXVXZlFla3hVQzNkdnlPeWxYRjRDb3JIeWJnQjFE?=
 =?utf-8?B?VkhhUlA2T3kwbWVPSVdoWVpHOGlDbW5OMzhMU3RxQ3Buc2JXQUs2OVBOdXZa?=
 =?utf-8?Q?blCLUK7BCX0qWBYcTxjful9hx?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7e09db5-1a8d-40fb-d0ea-08dbc6560a51
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Oct 2023 10:21:44.5166 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vSn/tHmsiK6bFpeTKIdIjMifZysPo5vxqvrC2jtu7SSmMd/+csTOAnBSEKsRJQFXCAgsqe6sBi88nv6P0CJ6Tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5209
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 3/3] drm/xe: Create a dummy version for vga
 decode
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
Cc: "Nikula, Jani" <jani.nikula@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTXVydGh5LCBBcnVuIFIg
PGFydW4uci5tdXJ0aHlAaW50ZWwuY29tPg0KPiBTZW50OiBGcmlkYXksIE9jdG9iZXIgNiwgMjAy
MyA4OjU3IEFNDQo+IFRvOiBTaGFua2FyLCBVbWEgPHVtYS5zaGFua2FyQGludGVsLmNvbT47IGlu
dGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogTmlrdWxhLCBKYW5pIDxqYW5pLm5p
a3VsYUBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFJFOiBbUEFUQ0ggMy8zXSBkcm0veGU6IENyZWF0
ZSBhIGR1bW15IHZlcnNpb24gZm9yIHZnYSBkZWNvZGUNCj4gDQo+IA0KPiA+IC0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tDQo+ID4gRnJvbTogU2hhbmthciwgVW1hIDx1bWEuc2hhbmthckBpbnRl
bC5jb20+DQo+ID4gU2VudDogVGh1cnNkYXksIE9jdG9iZXIgNSwgMjAyMyA3OjI5IFBNDQo+ID4g
VG86IGludGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiA+IENjOiBOaWt1bGEsIEphbmkg
PGphbmkubmlrdWxhQGludGVsLmNvbT47IE11cnRoeSwgQXJ1biBSDQo+ID4gPGFydW4uci5tdXJ0
aHlAaW50ZWwuY29tPjsgU2hhbmthciwgVW1hIDx1bWEuc2hhbmthckBpbnRlbC5jb20+DQo+ID4g
U3ViamVjdDogW1BBVENIIDMvM10gZHJtL3hlOiBDcmVhdGUgYSBkdW1teSB2ZXJzaW9uIGZvciB2
Z2EgZGVjb2RlDQo+ID4NCj4gPiBUaGlzIGltcGxlbWVudHMgYW4gZXhjbHVzaXZlIHZlcnNpb24g
b2YgdmdhIGRlY29kZSBmb3IgeGUuDQo+ID4gUmVzdCBvZiB0aGUgZGlzcGxheSBjaGFuZ2VzIHdp
bGwgYmUgcmUtdXNlZCBmcm9tIGk5MTUuDQo+IEltcGxlbWVudGF0aW9uIEkgeWV0IHRvIGNvbWUg
aW4gdGhlIGZvbGxvdyB1cCBwYXRjaGVzLiBIZXJlIHdlIGFyZSBqdXN0IGFkZGluZw0KPiB0aGUg
ZnVuY3Rpb24gZGVmaW5pdGlvbnMuDQoNClllYWgsIHdpbGwgcmUtcGhyYXNlIHRoaXMuDQoNCj4g
Pg0KPiA+IEN1cnJlbnRseSBpdCBhZGRzIGp1c3QgYSBkdW1teSBpbXBsZW1lbnRhdGlvbi4gVkdB
IGRlY29kZSBuZWVkcyB0byBiZQ0KPiA+IGhhbmRsZWQgY29ycmVjdGx5IGluIGk5MTUsIHByb3Bl
ciBpbXBsZW1lbnRhdGlvbiB3aWxsIGJlIGFkb3B0ZWQgb25jZQ0KPiA+IHRoZSBpOTE1IGNoYW5n
ZXMgYXJlIGZpbmFsaXplZCBhbmQgbWVyZ2VkIHVwc3RyZWFtLg0KPiBNZXJnZWQgaW4gdXBzdHJl
YW0uDQoNClN1cmUsIHdpbGwgY29ycmVjdCBpdC4NCg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTog
VW1hIFNoYW5rYXIgPHVtYS5zaGFua2FyQGludGVsLmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVy
cy9ncHUvZHJtL3hlL01ha2VmaWxlICAgICAgICAgICAgICAgICAgfCAgMSArDQo+ID4gIGRyaXZl
cnMvZ3B1L2RybS94ZS9kaXNwbGF5L3hlX2Rpc3BsYXlfbWlzYy5jIHwgMTMgKysrKysrKysrKysr
Kw0KPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKykNCj4gPiAgY3JlYXRlIG1v
ZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS94ZS9kaXNwbGF5L3hlX2Rpc3BsYXlfbWlzYy5jDQo+
ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL01ha2VmaWxlIGIvZHJpdmVy
cy9ncHUvZHJtL3hlL01ha2VmaWxlDQo+ID4gaW5kZXgNCj4gPiBkZmYxMzg2ZWU2YjMuLjE3NWEz
NTczNjZkOSAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUvTWFrZWZpbGUNCj4g
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUvTWFrZWZpbGUNCj4gPiBAQCAtMTUwLDYgKzE1MCw3
IEBAIHhlLSQoQ09ORklHX0RSTV9YRV9ESVNQTEFZKSArPSBcDQo+ID4gIAlkaXNwbGF5L3hlX2hk
Y3BfZ3NjLm8gXA0KPiA+ICAJZGlzcGxheS94ZV9wbGFuZV9pbml0aWFsLm8gXA0KPiA+ICAJZGlz
cGxheS94ZV9kaXNwbGF5X3Jwcy5vIFwNCj4gPiArCWRpc3BsYXkveGVfZGlzcGxheV9taXNjLm8g
XA0KPiA+ICAJZGlzcGxheS9leHQvaTkxNV9pcnEubyBcDQo+ID4gIAlkaXNwbGF5L2V4dC9pOTE1
X3V0aWxzLm8NCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUvZGlzcGxh
eS94ZV9kaXNwbGF5X21pc2MuYw0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL3hlL2Rpc3BsYXkveGVf
ZGlzcGxheV9taXNjLmMNCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+IGluZGV4IDAwMDAw
MDAwMDAwMC4uNGYyMzkyZjkxMWNlDQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS94ZS9kaXNwbGF5L3hlX2Rpc3BsYXlfbWlzYy5jDQo+ID4gQEAgLTAsMCArMSwx
MyBAQA0KPiA+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogTUlUDQo+ID4gKy8qDQo+ID4g
KyAqIENvcHlyaWdodCDCqSAyMDIzIEludGVsIENvcnBvcmF0aW9uICAqLw0KPiA+ICsNCj4gPiAr
I2luY2x1ZGUgImludGVsX2Rpc3BsYXlfdHlwZXMuaCINCj4gPiArDQo+ID4gK3N0cnVjdCBwY2lf
ZGV2Ow0KPiA+ICsNCj4gPiArdW5zaWduZWQgaW50IGludGVsX2dtY2hfdmdhX3NldF9kZWNvZGUo
c3RydWN0IHBjaV9kZXYgKnBkZXYsIGJvb2wNCj4gPiArZW5hYmxlX2RlY29kZSkgew0KPiBJcyBh
IFRPRE86IHJlcXVpcmVkIG92ZXIgaGVyZT8NCg0KWWVzLCB3aWxsIGFkZCBpdC4NCg0KVGhhbmtz
IEFydW4gZm9yIHRoZSBmZWVkYmFjayBhbmQgcmV2aWV3cywgd2lsbCBtb2RpZnkgYW5kIHNlbmQg
bmV4dCB2ZXJzaW9uLg0KDQpSZWdhcmRzLA0KVW1hIFNoYW5rYXINCiANCj4gPiArCXJldHVybiAw
Ow0KPiA+ICt9DQo+ID4gLS0NCj4gPiAyLjQyLjANCj4gDQo+IFRoYW5rcyBhbmQgUmVnYXJkcywN
Cj4gQXJ1biBSIE11cnRoeQ0KPiAtLS0tLS0tLS0tLS0tLS0tLS0tLQ0K
