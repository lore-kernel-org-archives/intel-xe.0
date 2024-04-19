Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3734C4345F
	for <intel-xe@archiver.kernel.org>; Fri, 19 Apr 2024 18:36:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C5E910FC25;
	Fri, 19 Apr 2024 18:36:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R5n2ssrE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B59CB10FC25
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Apr 2024 18:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713551798; x=1745087798;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1wzzpxPjxJvAxN383M9pNXhRmh5zElEnpxM/yjITbQE=;
 b=R5n2ssrEhjB+cSmMQUj9AAkbE8KE8Fvpz0Vu3gJ1DNcW1QBRIIihJJ+M
 68P38US4HHwShCnw9CP4nMsUhlih7LCRPgkljN5yB/cefszQiIiQo1IeR
 GLNtDHP5wfVb19RaeWppopU6/1yTjhzkUAmxri2HwM7Rwm/UU/mLnTfku
 eoBGpgnW1dp93S8/iyl0thO8t1P3/i3Fkzo6Mtp4eDBIcB6+s86COsOO7
 n6q3QwRzzRic3hMItj5kSLdNPgvBPJ18BP+qglW/RBT6+47e/O12+vY6a
 x60RGyv2Zj9N3jNy8Jm3eYHYiL1gEfTaIKt+yYPVF3JGu2kEegUTJmhxz g==;
X-CSE-ConnectionGUID: FjJLuT8aTSWQRivtKQ/M2g==
X-CSE-MsgGUID: /DcUWKtLRKa45JiLcBsDWA==
X-IronPort-AV: E=McAfee;i="6600,9927,11049"; a="12949616"
X-IronPort-AV: E=Sophos;i="6.07,214,1708416000"; d="scan'208";a="12949616"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 11:36:37 -0700
X-CSE-ConnectionGUID: 9Ze2ON9BSOK7GrB4wfvcKw==
X-CSE-MsgGUID: 7kIXmDaTRMSg1lZ3rx3Org==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,214,1708416000"; d="scan'208";a="23855299"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Apr 2024 11:36:37 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 19 Apr 2024 11:36:36 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 19 Apr 2024 11:36:36 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 19 Apr 2024 11:36:36 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 19 Apr 2024 11:36:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CgqBFhQjpWULv/SGG8LQTqwxUM0l3/ttfzEncovfFST1bG34QnrP/8PbuNa/aCI7p0LUADcUaljTCOoRRT3Ipo7UQa4yWBdkiVV9hQUPqYvbWEN+unbyN1WhaMt+XHFVZKlQkG4Mdv7RWEQSweIMopgFH83vb220GN3PKsUs1XO4x+jyYwOND92i+Nt0pVHAKA/4zlYnWqDUQ6SJBxgjTQHaLF2umXKyZk1jdPYQL3p19TVJT1yOh2ju69Vh+7osXYMaSouwtwVo2YmDz7M6+WAFUHbZuekqQxwMp/WiS6gRhcuOwx+Kh70N8NJ1qtXFePA+9VHw9kZR8iGThmHxLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1wzzpxPjxJvAxN383M9pNXhRmh5zElEnpxM/yjITbQE=;
 b=DzVSptkdj7u0fxxFvNIo03zwUvOOsJOkeC5PWXNZQvZTbCRpUD1YG91SXh62ArD8c9yjm8t0FA76zS3sb68MPh9YKTAoeeKYjjqqamcr2dxsS37u3iBOGyslfcKXhyeB8EfSvXXpWQ2w2rIszLRIaxenkzbR8zJyoNI0Q0J0R+YxVcTmjFRhrfNcZLu1TjBHAXhNQDps5ZffTnrIO3smCLxMQiqrdYBwvkn7ZH1U0cxA/6PxH4QWL2zhfu777BECBg8V5uO/2zdx0RJTZ6g1njKmG4IfQcf0FiCdYN5nAAtJRXGICYDhgwualCHIUaJ+J10w42vfAixMdQ7kiMBEvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by IA1PR11MB7367.namprd11.prod.outlook.com (2603:10b6:208:421::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.16; Fri, 19 Apr
 2024 18:36:34 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d%5]) with mapi id 15.20.7472.037; Fri, 19 Apr 2024
 18:36:33 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: Nirmoy Das <nirmoy.das@linux.intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Nerlige Ramappa, Umesh" <umesh.nerlige.ramappa@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>
Subject: RE: [PATCH 3/7] drm/xe: Promote xe_hw_engine_class_to_str()
Thread-Topic: [PATCH 3/7] drm/xe: Promote xe_hw_engine_class_to_str()
Thread-Index: AQHaj6r8LkDCRxC0MECUEy4ObC6jTrFqo6iAgAVN7EA=
Date: Fri, 19 Apr 2024 18:36:33 +0000
Message-ID: <SA1PR11MB699186EA8568E96255B7B3E8920D2@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20240416030454.3739862-1-lucas.demarchi@intel.com>
 <20240416030454.3739862-4-lucas.demarchi@intel.com>
 <22cc7c5d-3fea-4a5e-ada3-1d2d0d5fb18e@linux.intel.com>
In-Reply-To: <22cc7c5d-3fea-4a5e-ada3-1d2d0d5fb18e@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|IA1PR11MB7367:EE_
x-ms-office365-filtering-correlation-id: 42480b3e-39bf-4192-23f1-08dc609fa329
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|1800799015|376005|366007|38070700009;
x-microsoft-antispam-message-info: 2PvdUXWobtesv0e4Phvj3OXTBeGMmNkvK5YeWWApk2WgryzjGEXVq0uqVzQW3hO6jgFS4ZMPUl0pkxzOi55BiYmDDAXRb9Ou5AKInYJuHZ712WO6/I7klY4u6hjZXvG7eLTrAgqtlMwtIbhXy+IvKkdt7YVLmrrQvlEQ24jd9e+Cy36EPFQNjLXc54GnwS8pD7AvPqMLVJTuFQmiKQCSnCJZRpSYhgYnuyRWBh5gxCTX9Epx/dQnUCp8yI4pkWcVf6cV7OrQHBNKYSCfFsC44mPE7KUF5CCHwfioQ15Q4TId7UNSAMLm1rGqHmTmRFZbdyFXfgFqXh9tb+ujhOXRvKjfw/QoVmLt3It5jle8Zyt0ZJrHKvNjUfB/+myFDz98qjRduRPay0vpO1lW2o6zk4yPzwVypPhjnLNLwcszHIPLtF1zM3wK/bLxQTYOKJvVdtCizjuydgCLXJcZqryPgTmZLQDmIoYekoY9mrb7aJGSdwD4v3jVUr/LSe18lMsj+x3c+S8hwlm77Roc7yy/VXbsQkyfOHq8nkJGPG6aJF2HW1potevsX2++CjZlshEHrki7cQjHojLBcblb9LOd6DRH52wXUumi+csZlverOU9Y/j8CumysaD5oBLWASy/jUWchruMpWrv3qVg+KpafpM5fChYa/qO6zfFCzeCCIbpRwWEQgeSJHrkPEbXlcrJcYLNO2xMjm8ahQbHlfVs+qhnRh/V6mvhNWEsTNjCGLrQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dk5yTGJKSXVOME9nWnl2R1IyWlkrQm16aDF5ZWExdXJqbTNRTkp3OEE5K1VB?=
 =?utf-8?B?MWJkTW50RlA3ckk0bndEQUNHS2J5cDEzb1ZYd2wxMkNMVy9od1JNR2xCQUJz?=
 =?utf-8?B?Sm44MnVscHByZmxlUzE0Um9hRTlSOUJHdHJSaE5VTDdpZC83cDJ6WXZWcHFs?=
 =?utf-8?B?UHZkdWMxZlFoQ1Z0SDgxbHFpMmNQZE5KbE13Z2lVbGE3RlVlK0hHbjV1azU5?=
 =?utf-8?B?TEl0L2pSTG92SXBBakFCTXhmdGJxaURnQ3RyMmNJTjNhWjFDSnB0OTIreW85?=
 =?utf-8?B?SnVka0hrNWhpem5VdWxLVUZEY2h4TTZmNityNWswN1B2U3ZaVndLdVhDZ0pt?=
 =?utf-8?B?Qm1FeGM4QlZGZkxXSFZ2VnNia2xHbGl6RkM1Wnd6TlcvWUdOVmFWV3ZtT0ZK?=
 =?utf-8?B?N0xYS3h0RGQxK1NjNXZuTitha2U3YkNZVzVKLzhMUm1IaWFrQkw3TncxQnhC?=
 =?utf-8?B?V3RYcm56dEtiOTlvbXBlTG9yUFhaRzZaWWpXTThRcm9rTmMvRW9NYjhRTkti?=
 =?utf-8?B?MGI3ODBKU0E4M1RVR3ZrTHNwLzByMGlra21yQmdiOEVEZEU5TVcyR21MdHZ1?=
 =?utf-8?B?OGVqYTdNTzF0c3krT2J3VWg4ZjEyV3dIK2Y2UDN4MWxqaUhObzlXSG1BMEdB?=
 =?utf-8?B?bWFjU05DWUFRVTFmV25QbnV3bGFDeUV4dE5xQVcyaUZsN29uUUlaRkdRQXA4?=
 =?utf-8?B?WTM0ck1YU2hCUm1EUHRWQlF0VHhReTRkREl3cE5scVM0K1lVT2RFS2V2SzB1?=
 =?utf-8?B?M0FCYmMxV1dSdi9FK0NPRmd6Rzc4R0M5SEVoVnlXL1B2Zk5QSVB6d3N2OG45?=
 =?utf-8?B?T21VTGdxK1ZvbDNhVzYxOWVQS1hjNEFjTHlSc3JsclNJNGJuODBIaFBUTU1p?=
 =?utf-8?B?cE5PNlNwUjA5UU1zVWp6alg2R2tuSkRUNElVV1d2ZFlVUlJwMFZSeU5CL050?=
 =?utf-8?B?MnV4NzQ5WnpVeFpYZGNTcnlZcDFmelVDYXlneXdYcTd0RjdMdkVrTGhCT2to?=
 =?utf-8?B?UzE2L2Y0YlNZN2Yxamwyd2hPVG5KNjJwYW5qd3FTdTlvYUVTODBvY3dkQTV6?=
 =?utf-8?B?MkNPbE9keEhrS3RqWCt2ZjU4bzAvdWJXVTh4THdvZFlzcDY0OGkrd1dCTS9X?=
 =?utf-8?B?M0xHNU4rVkh5VFpDWm91R3NrUXRTczExUVJMNGtSL2hqOGhQOEk1YUhPSmxL?=
 =?utf-8?B?MkFpbi9GZXF2TWhIL3poeEQ2M1gzWEl1K0NmQnVCeDI5dEM2WFh4K3ZJU0Ju?=
 =?utf-8?B?Q0pVK0RiaUJhYWlKcFcvMHhwMTBZSXB6OVE5QkFqdTVaT0pqU1V6OEJIZith?=
 =?utf-8?B?TnFGZ3dRYS9nU2kzT0xNUjVRN1d2SytZY1IwVk5pTHhVaVlJMlFJNDV3S1RY?=
 =?utf-8?B?eWdnK24xZ0c5WlNZT1VoMTc3anNIUjNOSmxqVm5MYjRUVHJ5L0NaS0d2Ujda?=
 =?utf-8?B?Y2JoRVVhbzlHWVR3QmdRdnBpc0VFc3NQZldqd3BoR3dDYmEwcmt0dGJTZk1D?=
 =?utf-8?B?TktySlNmT2doWE1zS2ZOaHJteGlEY2tqV1dwdExUZEI3NGhlOWtyRmc0Qmxy?=
 =?utf-8?B?RVlKT05BSGdSY0pFZ0VqM3pDUXNJU2RVYi9TUmRuclI3UHY3Yno1NFdET2Jr?=
 =?utf-8?B?RnhoenpOOEVYUVAvWGduQjJQeFJxVGtBK3RrbjFIRmlpVG9yMjZYZmtrRVk5?=
 =?utf-8?B?N2FlY0kzazlFbG92SzdjUVdud0ZoT0dJdkVWK3BhWGJPRWxvR3RXK3JWNTRi?=
 =?utf-8?B?ei9jaVNwQUxPNWtNdExWWmZPZDFjRjJzRUdUNlVhRWw5U0hxUzk1QkY3K1c0?=
 =?utf-8?B?QlBBVEVRbnFvSER6WmpDQWd5dGZoa1BrZklhYytIK2xDRHdsd2k5bWFTTGd6?=
 =?utf-8?B?OEkxTlNuczBJN0ovTGN6VWtyenRaSW9MQU84QTJmdWlaZ3pxY2ltN0tFTyts?=
 =?utf-8?B?RmlMV3F2YjIwQWp0YThJNVdlQTZRa1FOTXNYZVpZYzJLS1NhbmJ4OFVOMjQ5?=
 =?utf-8?B?UVlYaXlWU1I1R1hQYUl5cU9kb3lHTG9NMWVKR3pPekxSTldaSzZxU2FNclR0?=
 =?utf-8?B?dHpaNjJudHpHdTF0c0VqUnNOVWhxdGlJMFk2MEl6bnN0VGtsYkZXSDI3RG40?=
 =?utf-8?Q?3p5luVJsAxAUCVHliPepWVCTa?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42480b3e-39bf-4192-23f1-08dc609fa329
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2024 18:36:33.3050 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GE0SSKb8FXPaquF7lh7oRlPDUmFtf3Jya31Am72/OS6m9VQt+MRzgm5hajYp2ghg+jk88FwKq9biLQ5ADF3FPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7367
X-OriginatorOrg: intel.com
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

UmV2aWV3ZWQtYnk6IE9hayBaZW5nIDxvYWsuemVuZ0BpbnRlbC5jb20+DQoNCj4gLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSW50ZWwteGUgPGludGVsLXhlLWJvdW5jZXNAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YNCj4gTmlybW95IERhcw0KPiBTZW50OiBU
dWVzZGF5LCBBcHJpbCAxNiwgMjAyNCA1OjM2IEFNDQo+IFRvOiBEZSBNYXJjaGksIEx1Y2FzIDxs
dWNhcy5kZW1hcmNoaUBpbnRlbC5jb20+OyBpbnRlbC0NCj4geGVAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnDQo+IENjOiBOZXJsaWdlIFJhbWFwcGEsIFVtZXNoIDx1bWVzaC5uZXJsaWdlLnJhbWFwcGFA
aW50ZWwuY29tPjsgVHZydGtvDQo+IFVyc3VsaW4gPHR1cnN1bGluQHVyc3VsaW4ubmV0Pg0KPiBT
dWJqZWN0OiBSZTogW1BBVENIIDMvN10gZHJtL3hlOiBQcm9tb3RlIHhlX2h3X2VuZ2luZV9jbGFz
c190b19zdHIoKQ0KPiANCj4gDQo+IE9uIDQvMTYvMjAyNCA1OjA0IEFNLCBMdWNhcyBEZSBNYXJj
aGkgd3JvdGU6DQo+ID4gTW92ZSBpdCBvdXQgb2YgdGhlIHN5c2ZzIGNvbXBpbGF0aW9uIHVuaXQg
c28gaXQgY2FuIGJlIHJlLXVzZWQgaW4gb3RoZXINCj4gPiBwbGFjZXMuDQo+ID4NCj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBMdWNhcyBEZSBNYXJjaGkgPGx1Y2FzLmRlbWFyY2hpQGludGVsLmNvbT4NCj4g
UmV2aWV3ZWQtYnk6IE5pcm1veSBEYXMgPG5pcm1veS5kYXNAaW50ZWwuY29tPg0KPiA+IC0tLQ0K
PiA+ICAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2h3X2VuZ2luZS5jICAgICAgICAgICAgIHwgMTgg
KysrKysrKysrKysrKysrKysrDQo+ID4gICBkcml2ZXJzL2dwdS9kcm0veGUveGVfaHdfZW5naW5l
LmggICAgICAgICAgICAgfCAgMiArKw0KPiA+ICAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2h3X2Vu
Z2luZV9jbGFzc19zeXNmcy5jIHwgMTggLS0tLS0tLS0tLS0tLS0tLS0tDQo+ID4gICAzIGZpbGVz
IGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKyksIDE4IGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9od19lbmdpbmUuYw0KPiBiL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV9od19lbmdpbmUuYw0KPiA+IGluZGV4IGE2ODhiYjJkOTZjZS4uOGY3MmYz
MjRlZWU3IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9od19lbmdpbmUu
Yw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9od19lbmdpbmUuYw0KPiA+IEBAIC05
NTksMyArOTU5LDIxIEBAIGJvb2wgeGVfaHdfZW5naW5lX2lzX3Jlc2VydmVkKHN0cnVjdA0KPiB4
ZV9od19lbmdpbmUgKmh3ZSkNCj4gPiAgIAlyZXR1cm4geGUtPmluZm8uaGFzX3VzbSAmJiBod2Ut
PmNsYXNzID09DQo+IFhFX0VOR0lORV9DTEFTU19DT1BZICYmDQo+ID4gICAJCWh3ZS0+aW5zdGFu
Y2UgPT0gZ3QtPnVzbS5yZXNlcnZlZF9iY3NfaW5zdGFuY2U7DQo+ID4gICB9DQo+ID4gKw0KPiA+
ICtjb25zdCBjaGFyICp4ZV9od19lbmdpbmVfY2xhc3NfdG9fc3RyKGVudW0geGVfZW5naW5lX2Ns
YXNzIGNsYXNzKQ0KPiA+ICt7DQo+ID4gKwlzd2l0Y2ggKGNsYXNzKSB7DQo+ID4gKwljYXNlIFhF
X0VOR0lORV9DTEFTU19SRU5ERVI6DQo+ID4gKwkJcmV0dXJuICJyY3MiOw0KPiA+ICsJY2FzZSBY
RV9FTkdJTkVfQ0xBU1NfVklERU9fREVDT0RFOg0KPiA+ICsJCXJldHVybiAidmNzIjsNCj4gPiAr
CWNhc2UgWEVfRU5HSU5FX0NMQVNTX1ZJREVPX0VOSEFOQ0U6DQo+ID4gKwkJcmV0dXJuICJ2ZWNz
IjsNCj4gPiArCWNhc2UgWEVfRU5HSU5FX0NMQVNTX0NPUFk6DQo+ID4gKwkJcmV0dXJuICJiY3Mi
Ow0KPiA+ICsJY2FzZSBYRV9FTkdJTkVfQ0xBU1NfQ09NUFVURToNCj4gPiArCQlyZXR1cm4gImNj
cyI7DQo+ID4gKwlkZWZhdWx0Og0KPiA+ICsJCXJldHVybiBOVUxMOw0KPiA+ICsJfQ0KPiA+ICt9
DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9od19lbmdpbmUuaA0KPiBi
L2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9od19lbmdpbmUuaA0KPiA+IGluZGV4IDcxOTY4ZWUyZjYw
MC4uODQzZGUxNTllNDdjIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9o
d19lbmdpbmUuaA0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9od19lbmdpbmUuaA0K
PiA+IEBAIC02Nyw0ICs2Nyw2IEBAIHN0YXRpYyBpbmxpbmUgYm9vbCB4ZV9od19lbmdpbmVfaXNf
dmFsaWQoc3RydWN0DQo+IHhlX2h3X2VuZ2luZSAqaHdlKQ0KPiA+ICAgCXJldHVybiBod2UtPm5h
bWU7DQo+ID4gICB9DQo+ID4NCj4gPiArY29uc3QgY2hhciAqeGVfaHdfZW5naW5lX2NsYXNzX3Rv
X3N0cihlbnVtIHhlX2VuZ2luZV9jbGFzcyBjbGFzcyk7DQo+ID4gKw0KPiA+ICAgI2VuZGlmDQo+
ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9od19lbmdpbmVfY2xhc3Nfc3lz
ZnMuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9od19lbmdpbmVfY2xhc3Nfc3lzZnMuYw0K
PiA+IGluZGV4IGM1MDg0ZDk0YzQ0Mi4uNGU5ZGI2Mjk5YzdjIDEwMDY0NA0KPiA+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV9od19lbmdpbmVfY2xhc3Nfc3lzZnMuYw0KPiA+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV9od19lbmdpbmVfY2xhc3Nfc3lzZnMuYw0KPiA+IEBAIC02MjQs
MjQgKzYyNCw2IEBAIHN0YXRpYyB2b2lkIGh3X2VuZ2luZV9jbGFzc19zeXNmc19maW5pKHN0cnVj
dA0KPiBkcm1fZGV2aWNlICpkcm0sIHZvaWQgKmFyZykNCj4gPiAgIAlrb2JqZWN0X3B1dChrb2Jq
KTsNCj4gPiAgIH0NCj4gPg0KPiA+IC1zdGF0aWMgY29uc3QgY2hhciAqeGVfaHdfZW5naW5lX2Ns
YXNzX3RvX3N0cihlbnVtIHhlX2VuZ2luZV9jbGFzcw0KPiBjbGFzcykNCj4gPiAtew0KPiA+IC0J
c3dpdGNoIChjbGFzcykgew0KPiA+IC0JY2FzZSBYRV9FTkdJTkVfQ0xBU1NfUkVOREVSOg0KPiA+
IC0JCXJldHVybiAicmNzIjsNCj4gPiAtCWNhc2UgWEVfRU5HSU5FX0NMQVNTX1ZJREVPX0RFQ09E
RToNCj4gPiAtCQlyZXR1cm4gInZjcyI7DQo+ID4gLQljYXNlIFhFX0VOR0lORV9DTEFTU19WSURF
T19FTkhBTkNFOg0KPiA+IC0JCXJldHVybiAidmVjcyI7DQo+ID4gLQljYXNlIFhFX0VOR0lORV9D
TEFTU19DT1BZOg0KPiA+IC0JCXJldHVybiAiYmNzIjsNCj4gPiAtCWNhc2UgWEVfRU5HSU5FX0NM
QVNTX0NPTVBVVEU6DQo+ID4gLQkJcmV0dXJuICJjY3MiOw0KPiA+IC0JZGVmYXVsdDoNCj4gPiAt
CQlyZXR1cm4gTlVMTDsNCj4gPiAtCX0NCj4gPiAtfQ0KPiA+IC0NCj4gPiAgIC8qKg0KPiA+ICAg
ICogeGVfaHdfZW5naW5lX2NsYXNzX3N5c2ZzX2luaXQgLSBJbml0IEhXIGVuZ2luZSBjbGFzc2Vz
IG9uIEdULg0KPiA+ICAgICogQGd0OiBYZSBHVC4NCg==
