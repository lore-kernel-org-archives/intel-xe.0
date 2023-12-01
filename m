Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA500C4167B
	for <intel-xe@archiver.kernel.org>; Fri,  1 Dec 2023 08:47:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C84510E81E;
	Fri,  1 Dec 2023 08:47:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18BA510E81E
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Dec 2023 08:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701420471; x=1732956471;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=l4oDxFMUWRq8ZanHxHZXhVwr6v8pEwno/0gn5yaAbaU=;
 b=S1oPp2l6FCN8DR1f48f+pkMhIjrWbZ/5AL2qGBLCtNZPVXQHn4ZF0OQq
 wVT3RHxS7xixtdjkC2vSxq3FkbXIXbHkAWN63XxkAnDQNEVISL/nfIdUN
 v7j365UraUgsob6AUZgB+M22AhiU2sBgROD3xFuYIUBcGCiWETSaLL+eM
 xksLk3CsDE/O52Yox8Qwlbdr/3ia/FOBN7cjI3QPbwa5cZb0NpyxRt4o8
 UAsSVrotOGzlr1xbC9G/scyv4IvJgPAeTymjHTaWggplRY3NmbFOnigKu
 glBnmk+sVXPTphSZw1fALNQPy1O3Fbsa2v5Mk77KHKc1m974r7my5ECb3 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="6707980"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; 
   d="scan'208";a="6707980"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2023 00:47:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="860481877"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; d="scan'208";a="860481877"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Dec 2023 00:47:50 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 1 Dec 2023 00:47:50 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 1 Dec 2023 00:47:49 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Fri, 1 Dec 2023 00:47:49 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Fri, 1 Dec 2023 00:47:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hAnD56P3dZTvhncSldyZ9cpgZ7kv5k3ooVSOOgcjIUdtCxKEGl4INP2cnHd+AzqE3hAcwiC0pH/aRcIehNPSID70Bkx2LpWiE6gD7UTfqokSO8qu/KnPwXsB3/IJay6ZjT0cd0e0mzEOUtpleJeCCKwV3qtfslA+EURjiEGoKct9HGpa0diNWI0loeWbk9EV48mn9FtXPaq/hP/Ij49sK9dzwfzbzA9UYXesBPGo6yQ9j9O1ouVOtyXkzg8S/0IjUGGJvuEO6fy6mCuu+/bwMPH3sUd1POLt9+/FH+VcEp9m52rWnmQ2GFkjaaC2lPiI7etedoic67vsv+58k8OJeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l4oDxFMUWRq8ZanHxHZXhVwr6v8pEwno/0gn5yaAbaU=;
 b=D83vkrrkzrCJqeVubFmaM9X2S8X1+TojukK4tEn12rvZ+TPU+e1kKhzR2ltj6t8WJrL6W1ZUWcLZkKR0h7hM97CI3u7BhXmypNIGuQX4AD0owv8aLx/FZzaLuEuLt+tm290RuWuQe1tf0df8ivtZ0UbG0+BG8Z8Vh+2lWuUulT9QJDsT70C4xw8fgJHlfu5p0LEdX6Q4w9bRTABdqXTjT9TqqZYwV4p4KDj2QJOsZQfpO8pvA7vaAxBDacMC4WDaFu7U3UQMith78MYZiiAp66sIwIQ99czsYPZ6xJUe1LEc+Qq453EgkWYARRr8XCvGKDEXWs8M2r2Z9fhxlPX9fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6344.namprd11.prod.outlook.com (2603:10b6:930:3b::6)
 by DS0PR11MB7444.namprd11.prod.outlook.com (2603:10b6:8:146::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.27; Fri, 1 Dec
 2023 08:47:47 +0000
Received: from CY5PR11MB6344.namprd11.prod.outlook.com
 ([fe80::d720:57b4:c6ef:ddd8]) by CY5PR11MB6344.namprd11.prod.outlook.com
 ([fe80::d720:57b4:c6ef:ddd8%4]) with mapi id 15.20.7046.015; Fri, 1 Dec 2023
 08:47:47 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Manna, Animesh" <animesh.manna@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [Intel-xe] [PATCH v2 0/6] DSB refactoring
Thread-Index: AQHaI16kzv9su7M56U24tbUV/WpPTrCUHzow
Date: Fri, 1 Dec 2023 08:47:47 +0000
Message-ID: <CY5PR11MB6344686F06644EBD12094FC6F481A@CY5PR11MB6344.namprd11.prod.outlook.com>
References: <20231130071407.606176-1-animesh.manna@intel.com>
In-Reply-To: <20231130071407.606176-1-animesh.manna@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6344:EE_|DS0PR11MB7444:EE_
x-ms-office365-filtering-correlation-id: bed44321-a828-471e-7c38-08dbf24a319c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6cWjs5DzigMYrf0BymRCDS1dYqwzPmR7VsFCDG3/x3TnIpBPekayDipanSruaSXvW29LHHwi1oKUBm/KDvy8GwLV8jxVkRwTziXu2DgPMY7HXVK40EjZyWUc6hT5dgXF5H8b6zzR82Fea+SuPBotkKWb+W+CCn0x9RBTeeGK1Ry34KE6FAo/3J0aUwQkosCohiwOmBabOt3Z0kYGJ0PVRfPdSGezoKvONA3XiU57/zGHqLPvtqZk2TF4dcgMhqWp+H4MBzT/3blWdfVZrxcPJyWWDs2CWR5/t9UUTqd64PpjZw87H/J9uFotJv6xJBXlDR9OeMOx3DkRmXTTIUSaIS/cHWGoOnARKTXhG8X9AUqJoBROokCj80CicGon6qlQZ4kLNGYFaTrGKwzov2CzbWJqPhO1wOQpV9QDu9EpGmVocb1jnPmVIZtevr7j4Upa7cX0ndm3SyogmB+lzU0n4X9yThAdU5aNfBU9+XNGJYQM188kpeYdd/p6bwQWGxzuwX087lGES5DGklLCLG68iYe3eJmaj7fwHn/xLENHtRO8hXl6tFVYnYerrne8SCGRVPHpK6scjBjixxXkCnBlIDnJ7XcpnXH8rVz0dQixML69SFmAWmLh0eJpjPUazLU/
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6344.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(376002)(136003)(396003)(39860400002)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(2906002)(52536014)(8676002)(8936002)(55016003)(41300700001)(26005)(76116006)(110136005)(316002)(66476007)(64756008)(66556008)(66946007)(66446008)(5660300002)(9686003)(53546011)(6506007)(7696005)(83380400001)(122000001)(86362001)(82960400001)(38100700002)(33656002)(71200400001)(478600001)(38070700009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OC9tYzloSllXeG1ncHJKdUFxYUN5RzRqTGplVXlQN3l5MkFOOVhNVzNyL3p5?=
 =?utf-8?B?U1h4dzlhQnZHMWY0YjN1czBHMzYvWW90WlU3eDl4MjV1L3IxdmExSUlzNTRD?=
 =?utf-8?B?NjNvek5QVGhsV0orZ1VHclBROVc0cGlkaU1LWityNGpuSkl6Q3BFb2F5SjRt?=
 =?utf-8?B?ZDhneWw3bDJhT1hYdCtWVVRCNVZ4djFaMU9nbjZqbDRmUmwyWWY3TW8xbFlZ?=
 =?utf-8?B?NDBYcnVNdjlsWStZL2xjT0o5ZWRsem0za3Rucnk0ZVk4RVpqVk9aK1VIQm81?=
 =?utf-8?B?M01UK2t1czVPcTJWdGVzbmJXeUhPVDJIcjRjS1ZIN2tCNmR3MVpSQ3NWTWd6?=
 =?utf-8?B?cHBsSHl5ckFNYXQ5QkVtTEFicXhINEc4ZG9NczFlRUtLWnZxdGJnNVlZMWs0?=
 =?utf-8?B?b2M0VExIZVdVdDN0L01Xd09kUDMxeitSMGRXYmo0NUtWSlhUZmVreSttTi9Y?=
 =?utf-8?B?TDRucFQvTVVSSU9xOUY2OVFpcjhMUWF2cFFqczVLMmVpQkdpb2VpenNOcGRU?=
 =?utf-8?B?bWttTnI1R1V4WVovWVVqeGxzQ0VrK01IanJRd3MvaWlaKzFmMjB5R1krU2Vz?=
 =?utf-8?B?bWkwNy9jelRSMlRuRlBQVEIvbzVyV1crMVZxK09hWU1ZWitucTRTRmcrbExv?=
 =?utf-8?B?VURCbXBCVlBZUDlCL3h3TVk1S0kxVE41MFJiTXFBQisybjVDcjN6aTJUTWh3?=
 =?utf-8?B?ZGM4K0JjMjB3UUQxUmlIYVlsKzJXOGxSZ251UTlObWNCRHFmYzdyWjYwTHpq?=
 =?utf-8?B?cWxxT3F4eEdaeXhJSThIR0RyajYyamJ1NEdHb0pQM0ZidDRHMVA1Qmh5cGVh?=
 =?utf-8?B?SFZna0xheTJPUy9zNXRjcElDcCtKMVc0S1hoTTdaY0lhd1o0NndtNklxaU9V?=
 =?utf-8?B?ZVVsUjRWa2ZmblRaNFIySzRkbWlSSkFTMnlmN3Rack5FczlZeGE5b1R4YmdK?=
 =?utf-8?B?RURSUWtrZDIxQnVSWDg2N3lDNzJaczhYZ0Iwcm1UbVBIM3VUeFJad1lCS1lu?=
 =?utf-8?B?dFJZSzBuK0R1anJmM3F3dWs0Nlo4Q0gxcWxVM1RRSHVUS29LN2t3QlFpNnhZ?=
 =?utf-8?B?bEpvdmhOUVdEUllKNEtPWnU0QzlZcUdETmtsVkdybG5rdHVkblRjbGNZYzYy?=
 =?utf-8?B?TTYrMXJlZXNmdHY3dlNTUGlNcjg1K0lzaUE5S25IeUV2V3RXTGQxbVdvVDVl?=
 =?utf-8?B?NDRvcjhKaVlxcXhYUGV6Y28ybVZJekJsOUd0bFExMFJGRUo3L3Q5b0x3eVdu?=
 =?utf-8?B?M0NrZjFQRnRQR09VTlppanluQTlNM09tMnNtRVBpUXBMdDdGQ0FZQ0ExOWg5?=
 =?utf-8?B?QUc3dlc2U0haazVqc0I4dllMR1JtbHczV2FGd1AweThiQmFLeCtRUTBCd29w?=
 =?utf-8?B?WjVVaDRlVWFLbVFUWE5ORUV1a1NLWnhJM2lwR1NlTXRwUEhpTkJSYjBZNSt4?=
 =?utf-8?B?eVU1VEVkLzJ2bjNYNzd5WEpGZEs0ZjZocVVCanZGZDJ0SVVCQTRSWHFOU0JI?=
 =?utf-8?B?NlhMRndjVWJoclEvcDRTQnVnYXNzNnA2VXRMUnRkTC9lK1JibjE5djJFanY2?=
 =?utf-8?B?ZHhFdm9sMUJnY285eFZXcjZEc1dmbDBoTC9pM0VpRnlZOHdoUW9EVkZsS3ZH?=
 =?utf-8?B?UzB1R01XcGFVNHdXV2pZQlhSWWcvaGlDSGdEaXR5b0JWQ0ZCNms4bWhEMXgz?=
 =?utf-8?B?VnVUN3JITVV1SDBFVS91b3NFdEJXd2FHNURCRmZ6aWRmMHByZ2xrRzdTM1g3?=
 =?utf-8?B?TitWcndRYjdJblZZK3psczV3Z1prSmZJeGRyUDFKRm9WVmY1V1BpVHBucDdE?=
 =?utf-8?B?dWJuc2tSL2w0SEkza3lEQzJ3OHEwK0VRNWtXK2x4SkwrY3BKSGZCWk9aaXBv?=
 =?utf-8?B?OVl3L0lrRlFnK2xkZFNhZElsYksyNFVLRDhYZnphNVVWQ2JpQUo4QmJKWlE3?=
 =?utf-8?B?QVI3cFRCVlZobWxnelNZS1R5YjRYa3RxM0RodUJuZDl3emxuT2ZHRHN2Z2tH?=
 =?utf-8?B?VWoza3BwVHB5SFZhaWxaQ3h6bVF1ZGlldloxcCtXcnQrNjJaeTh5Z04zdE5Q?=
 =?utf-8?B?UUN5cEE3Sk1rUERmMW5RUHhLaC9rL0FYcktzdmZHRko4RkpIS3ZTWlNVTUtR?=
 =?utf-8?Q?YSua4JJ5NGykMx+195lHuD8KV?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6344.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bed44321-a828-471e-7c38-08dbf24a319c
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2023 08:47:47.6802 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0N9bP7J4JK5kqrbr4c+diF25/PMiBfnBvg0HJwgfF3Fz3ZNagHLUQAp1Gd34u0AYYWaMEcQA4elhGDfH2155Jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7444
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 0/6] DSB refactoring
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSW50ZWwteGUgPGludGVs
LXhlLWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgQW5pbWVzaA0K
PiBNYW5uYQ0KPiBTZW50OiBUaHVyc2RheSwgTm92ZW1iZXIgMzAsIDIwMjMgMTI6NDQgUE0NCj4g
VG86IGludGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBTdWJqZWN0OiBbSW50ZWwteGVd
IFtQQVRDSCB2MiAwLzZdIERTQiByZWZhY3RvcmluZw0KPiANCj4gRFNCIHJlZmFjdG9yaW5nIGZv
ciB4ZSBhZnRlciBjaGVycnktcGlja2luZyBEU0IgaW1wbGVtZW50YXRpb24gb2YgaTkxNS4NCj4g
DQo+IFNpZ25lZC1vZmYtYnk6IEFuaW1lc2ggTWFubmEgPGFuaW1lc2gubWFubmFAaW50ZWwuY29t
Pg0KDQpBY2tlZC1ieTogVW1hIFNoYW5rYXIgPHVtYS5zaGFua2FyQGludGVsLmNvbT4NCg0KPiBB
bmltZXNoIE1hbm5hICgzKToNCj4gICBSZXZlcnQgIkZJWE1FOiBkcm0vaTkxNS9kc2I6IHhlIGNo
YW5nZXMgZm9yIGRzYiINCj4gICBkcm0vaTkxNS9kc2I6IERTQiBjb2RlIHJlZmFjdG9yaW5nDQo+
ICAgZHJtL3hlL2RzYjogRFNCIGltcGxlbWVudGF0aW9uIGZvciB4ZQ0KPiANCj4gVmlsbGUgU3ly
asOkbMOkICgzKToNCj4gICBkcm0vaTkxNS9kc2I6IEFsbG9jYXRlIGNvbW1hbmQgYnVmZmVyIGZy
b20gbG9jYWwgbWVtb3J5DQo+ICAgZHJtL2k5MTUvZHNiOiBDb3JyZWN0IERTQiBjb21tYW5kIGJ1
ZmZlciBjYWNoZSBjb2hlcmVuY3kgc2V0dGluZ3MNCj4gICBkcm0vaTkxNS9kc2I6IFJlLWluc3Rh
dGUgRFNCIGZvciBMVVQgdXBkYXRlcw0KPiANCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L01ha2Vm
aWxlICAgICAgICAgICAgICAgICB8ICAgMSArDQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNw
bGF5L2ludGVsX2NvbG9yLmMgICAgfCAgIDMgLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlz
cGxheS9pbnRlbF9kc2IuYyAgICAgIHwgMTUzICsrKystLS0tLS0tLS0tLS0tLQ0KPiAgLi4uL2dw
dS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RzYl9idWZmZXIuYyAgIHwgIDgyICsrKysrKysrKysN
Cj4gIC4uLi9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kc2JfYnVmZmVyLmggICB8ICAyOSAr
KysrDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgfCAg
IDEgKw0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL2Rpc3BsYXkveGVfZHNiX2J1ZmZlci5jICAgIHwg
IDcwICsrKysrKysrDQo+ICA3IGZpbGVzIGNoYW5nZWQsIDIxOCBpbnNlcnRpb25zKCspLCAxMjEg
ZGVsZXRpb25zKC0pICBjcmVhdGUgbW9kZSAxMDA2NDQNCj4gZHJpdmVycy9ncHUvZHJtL2k5MTUv
ZGlzcGxheS9pbnRlbF9kc2JfYnVmZmVyLmMNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJz
L2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RzYl9idWZmZXIuaA0KPiAgY3JlYXRlIG1vZGUg
MTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS94ZS9kaXNwbGF5L3hlX2RzYl9idWZmZXIuYw0KPiANCj4g
LS0NCj4gMi4yOS4wDQoNCg==
