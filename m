Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFF74C0032E
	for <intel-xe@archiver.kernel.org>; Fri, 20 Oct 2023 20:53:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 516AB10E5E7;
	Fri, 20 Oct 2023 20:53:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0370510E5E7
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Oct 2023 20:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697835232; x=1729371232;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=KFT6wchMHgp6OPhTOwtcX3MG6QowxS056JlxBVGGWns=;
 b=AkcFCXfiuMbDAiFQqS7D58L67//ItTcVGp5oVmyrSKnJ0IA8VMbkPYqz
 AcUIaFNOc9a7od+M3mJphgAge9x5K/QtJF/4l2xt5s9hupM7y9M0cqR3g
 4k+v3Zc3naO40LCm4DoBMbMV4sRB+0+HlPS4BeLMHa4nw+w4W/72P2brj
 p934EpPG7SzfR8YJAN2caqZLOaPftYoamHgmBlNCXrInK6WaGPtvjWT8D
 a6sfKoSZ3sgMMRkHP9zDJly6wqDrG6+H5r8yyOYiYcWV5NmXOWmeJm7cJ
 ieSXinCda7Zw5tqRZjVKg6lpmmobZ0w+mV3GniK2G1bItzgSjKg3H3s6c A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="390461087"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; d="scan'208";a="390461087"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2023 13:53:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="5218084"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Oct 2023 13:52:35 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 20 Oct 2023 13:53:47 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 20 Oct 2023 13:53:46 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 20 Oct 2023 13:53:46 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 20 Oct 2023 13:53:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hxN9yxN+Ve655aHGtEmP8Pigg5jOSaenVFjVT30TrWwjSpg7z10hW2KYgYvaNufJZd6Yb1raV2kYtufw1ftKn5jXP4jejYnV6QA6quDgmW8T4STwVxDgpVQp2pU4Bglh9FjlXnbDl42nEdNybSYG9zB4dCg0jPTxt99Mmi9nPbPr6fnhccKl84p4v3wHFUI7p8SQCWMiARaJW6X6em4k6GaP0Iwh94s+FKq72n3jPK2MH7fIZhFCf95y6ZaWUeIY2+kHLaNO4ca6e2PAgOFaBA0jgT0MLwEWlgpjXCeT5cKRGh04USOjuvL92PX8GD53EmjaaVcr2p8y+wOo5o4T0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KFT6wchMHgp6OPhTOwtcX3MG6QowxS056JlxBVGGWns=;
 b=HUpqG62jGJpo4F2TPB5h/z5gdZMrAU9NWr7+ke7NtMAzU1YqqNiGpBSVe4awZvDji0S0agFa/ggAX5kgq0BxAjT0cjlmNyVnRU2DFTfcGvP1Z3ZzjRibeWAenhyT0gFDqFo+zgvSJxu7YgCTP682vT3HCYami+69D9PRPPBFOY+UfNNKq6uHS7YXF2KKyNeKkgP3KYUpr0nGCFXuw9lAv8u+N5CYIo+SOOT3s/xBf1BM5sE0qn/JMB4alKzhwAv3dHilqXJcBxaq5AehA3yheR9qKBtnSL+ezrRygNIpszRjZO8/quckEfabhq1KUn2isQ9Ce8jVo9I13qsrCxTdPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by SA2PR11MB4860.namprd11.prod.outlook.com (2603:10b6:806:11b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26; Fri, 20 Oct
 2023 20:53:45 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::eb3d:e9c7:a247:7915]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::eb3d:e9c7:a247:7915%4]) with mapi id 15.20.6907.022; Fri, 20 Oct 2023
 20:53:45 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Welty, Brian" <brian.welty@intel.com>, "Dandamudi, Priyanka"
 <priyanka.dandamudi@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "Kumar, Janga Rahul"
 <janga.rahul.kumar@intel.com>
Thread-Topic: [Intel-xe] [PATCH] drm/xe/xe_exec_queue: Add check for access
 counter granularity
Thread-Index: AQHaAxF1+wrIzE8cIkKzH3comDHk3LBTIrqAgAAD+5A=
Date: Fri, 20 Oct 2023 20:53:44 +0000
Message-ID: <SA1PR11MB699186942E7398375737271792DBA@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20231020045013.2042971-1-priyanka.dandamudi@intel.com>
 <f5212ef2-6cd5-4b1a-a1b0-422dd0e10063@intel.com>
In-Reply-To: <f5212ef2-6cd5-4b1a-a1b0-422dd0e10063@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|SA2PR11MB4860:EE_
x-ms-office365-filtering-correlation-id: d203a395-81e2-4fb5-89f3-08dbd1aea666
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5Yno80kEnYM+hIghCk8U9t6mv1egE6w5UGIjqdOnz+zttpjLROdrUSLTAiPooZ1C61VU/UsEm7Cll85tNzWa9tLVK8ofEJIdLCy7GFdcMf5VZm67Jkp4VlUBZtrLbUBwuHz+f4LbWoNxD5s4QNZTuQ5EMdCwtOFew21dgZbDV30VKimJ0dUrEsjy0QCZfl5hBSlOYRycffdJ4yzj36x4cpTr2C0sjD31ghPmhzBbsOWxYbbOCwaynu6kbYoshSZV0+Tin/KVYIMObDI26ChKpOVEIgY7p24HUV/U80Uo4zZrL1mL218IqzWe2KgZDjSCsAUZCRa5UfvRL9bdByh7/IHo5BZKmXI+yQeI8i8Iaq/oKeql5OYbEfYEoABgjw99goz8s3sFRBm2pPJXO20MGEwsN/ZFBF8GNNxxf2+875W/EPtqayfLbj3dhGpLglw0clpMyHH7W2AOyceHBOoNRPt3Iq8BoNxSDAUqds4roXgsSuFqhS0KZHIwv3ve5XwrHnnPEbdTM7C7nQxICnUlEsq/zqK2riR4nLjsXFfp28wGm4tvaVzeYj/kDWkgrpfnizD6IAuGYFIBSYtmWlTV0NWgdiWXZqydUil4I9Ks6iAk0MPfliJxVEgI5uVG8ISg
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(366004)(346002)(396003)(39860400002)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(41300700001)(8936002)(38070700009)(2906002)(52536014)(5660300002)(8676002)(76116006)(66946007)(110136005)(53546011)(9686003)(66556008)(66446008)(66476007)(316002)(64756008)(6636002)(71200400001)(7696005)(6506007)(26005)(478600001)(83380400001)(38100700002)(122000001)(82960400001)(86362001)(33656002)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZDhWamZOdnU0cmp3dDVYWThBdzdZdnJTWlNoU3RYN2p0RE5lSGZILzhYSjlZ?=
 =?utf-8?B?aDlSdkp5NW9NNjN6eS9MY0U2bzlLSllhMjh6NWdqT1pEZnRVVVNGNWZYSEt0?=
 =?utf-8?B?VFNvcGJZNVV2dUFCWEExTFhqTnNYT1ZqSmJNZDBqVU9FN29vMDNjcGxyNFo3?=
 =?utf-8?B?VFdzKzJLazZrUEVTQ0lHR1ZpVzBUcmJtdVVBMkZRbmF5Q2xJQSt5azQ4VlQ2?=
 =?utf-8?B?MTZ5b3RlTGJiMjQ1SS96MkFwOEZuS0dPVjFtbzlEVkRRZzFSdXVYNmFOb21o?=
 =?utf-8?B?NDJwc2lzVHVhMjM3MTQvOEx3bVoyTUlJODFJRFZRM0l3NE1YS2JITVVYbFRk?=
 =?utf-8?B?cnFBUjA0NmhOS1ZrUGw2UDhSc1RwdnkxakpaWUpsSVpmMjR2U1ozS04xSlhm?=
 =?utf-8?B?eVRSMVZYKzQ1aThVTndoMHZkYVZyUzZ6WmRQMG1BNFN0aDB4ZTJSTDIwMVVv?=
 =?utf-8?B?N1Q2UTl3SG82OSs2MGN0cjZDRVNRc1V1U1BHWnpOb0VWaXlRYmV5c0puTERM?=
 =?utf-8?B?bmFLUzNlZ2dmK1lpYVJWVUlKMUNtYlUrVURzVndDWlRQSG45U0IyQk5BYXR0?=
 =?utf-8?B?YU80NGpyTzYxZC9lTkxTWVdESFA2NDlhc0F2SlRFUXRHWDlrS2ZFbThsSmQr?=
 =?utf-8?B?MFVGN3A2a0tlUW5PcWxFUlp4a1plWVhUZzJIRzFPeDl1LzNHMlpwdzJ3TjQw?=
 =?utf-8?B?T3duOXMwRGV6TDM5LzBRZFZCcHlHMUU3TUZOS3ViWFFCRUJxNFJwMUU5SmpC?=
 =?utf-8?B?MnovUFdiMWdVV2JwZE13eHNZNGxyNU93N1hkYlNvaC9Kc3lNT2FwNUpSWk1x?=
 =?utf-8?B?TXlDWnNyVlFKak1SNytOMVdaK0lwbUduTWtBTlhjRkdXWW1nQ01iTUdacktn?=
 =?utf-8?B?NkVEVjh0UWZoRnlKRVpaS2JNVkw4NStiNnd3UWZRVU9DZHBqdWc4NkRHV2t0?=
 =?utf-8?B?ZVJ3a2ZZL1pNcmJ1Z2g5c3M5OTBmQ0draUc3RWtRSitLK1NoNUlzL2I4YUZH?=
 =?utf-8?B?YnVqajdOaWIzRDZhQzVCeFRFSUc5RUlnU2FxcmZhbG1wTkN1K0dybmJVRTJa?=
 =?utf-8?B?QkkzckJlYlBGMmJYRUFOdXY0MDZMQlBzUGdTNzV5Y3BIeURUdkt1WDEvbC9q?=
 =?utf-8?B?Wm9KemV5MzkzaVR4eW5UemJwRGQrZVU2dHIvaWtLUUpyNWY5TmJnN0pHaU80?=
 =?utf-8?B?dUNXU2YrNlRnNzQwRjlsc2oyR2szNUJPS2ZpR0xqUnNKbDRMa29IOUR0dHVO?=
 =?utf-8?B?V2Vjc3h6TUh5eEdUOS9GSzJUdzFYbGZsclFKVXhiRFh6RnovRWdZblpBNjhn?=
 =?utf-8?B?ZkZMSUNxZG02dTIrQ3A4WVlUSlkzWXA1eEhtT1p2RnhvcGExeWpmbllpOFpG?=
 =?utf-8?B?MFl5VEoxYlYyaHhLRGNiK3FRS1RxUWpSKzk0TUN0ZCtwMG5RMWhaZDR4Vkwy?=
 =?utf-8?B?VTYzWGZ5UTdEaC9HNkNxTGVmcmRWNU9zRDhDUDRCbnY1UVdWUVljR3dlOUpM?=
 =?utf-8?B?VWFrNFZjaTMrVGZHYitvK1BEWEJlb1BKVi9EdjQzdlpOVkJSajlCVUo4bWo3?=
 =?utf-8?B?bmJTQ2U3NU1kWVZTTE5PNzJkZEtFeEhXVmV4UWFaRTVEc04xYWgxNVlBN2Fr?=
 =?utf-8?B?VmVZL1BnQ0pCTHpJNEE4cnFSbXdtamZ4eGhJQkw0ZTVoeXR0UUllbkdTSmZM?=
 =?utf-8?B?SlVyWnhJb2Q4N29GeVJPWXVTTUdDdS8xdzVDNDVjOTFGZExoNzlPQTdlWWtx?=
 =?utf-8?B?NUtzcjVpRnJvdmw4V2tJZWpYK29kOU9YNUhNTm8vU3JpUVNSZkx1NHVnM2xE?=
 =?utf-8?B?WHpvNDgrczBXaTJNazQ0S2V6eEMrcTVqbUd5WG9Nck1pTHlhUlVueUpiWVp6?=
 =?utf-8?B?cXBKaDV3bGFBRms3eUlldEpTTEZDMURSWjZJdnNsd0x5SXZFUHY3QmFkd2pI?=
 =?utf-8?B?UWh1Z040NTV1dVJTSHcvWVpoc3ppTzQ4RlJmZlpvRCtGU01TZ2EzYVVhZkt1?=
 =?utf-8?B?c1VRQWRlbGlmemIxaDVOaStkak95dnA4QTdLV1BSVjRnbnE4N2p4T2M2WkU2?=
 =?utf-8?B?U0NTeWhuR00ySnpGK2FTL0hKTTdGSXRGQnNBRm1DSTlySkJpRHU5R0w5K3dq?=
 =?utf-8?Q?HcYY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d203a395-81e2-4fb5-89f3-08dbd1aea666
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2023 20:53:44.8793 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i+SH94NF6WeTY/9WjD5VcyVhDoB0Dd0p8qarfBZrq7YbOWKczxs/sYMelNBHMHJbHfVrwjEj9cyshEpC/9fTAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4860
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/xe_exec_queue: Add check for access
 counter granularity
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

DQoNClRoYW5rcywNCk9haw0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206
IFdlbHR5LCBCcmlhbiA8YnJpYW4ud2VsdHlAaW50ZWwuY29tPg0KPiBTZW50OiBGcmlkYXksIE9j
dG9iZXIgMjAsIDIwMjMgNDozMiBQTQ0KPiBUbzogRGFuZGFtdWRpLCBQcml5YW5rYSA8cHJpeWFu
a2EuZGFuZGFtdWRpQGludGVsLmNvbT47IFplbmcsIE9haw0KPiA8b2FrLnplbmdAaW50ZWwuY29t
PjsgaW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBLdW1hciwgSmFuZ2EgUmFodWwNCj4g
PGphbmdhLnJhaHVsLmt1bWFyQGludGVsLmNvbT4NCj4gU3ViamVjdDogUmU6IFtJbnRlbC14ZV0g
W1BBVENIXSBkcm0veGUveGVfZXhlY19xdWV1ZTogQWRkIGNoZWNrIGZvciBhY2Nlc3MNCj4gY291
bnRlciBncmFudWxhcml0eQ0KPiANCj4gDQo+IE9uIDEwLzE5LzIwMjMgOTo1MCBQTSwgcHJpeWFu
a2EuZGFuZGFtdWRpQGludGVsLmNvbSB3cm90ZToNCj4gPiBGcm9tOiBQcml5YW5rYSBEYW5kYW11
ZGkgPHByaXlhbmthLmRhbmRhbXVkaUBpbnRlbC5jb20+DQo+ID4NCj4gPiBBZGQgY29uZGl0aW9u
YWwgY2hlY2sgZm9yIGFjY2VzcyBjb3VudGVyIGdyYW51bGFyaXR5Lg0KPiA+IFRoaXMgY2hlY2sg
d2lsbCByZXR1cm4gLUVJTlZBTCBpZiBncmFudWxhcml0eSBpcyBiZXlvbmQgNjRNDQo+ID4gd2hp
Y2ggaXMgYSBoYXJkd2FyZSBsaW1pdGF0aW9uLg0KPiA+DQo+ID4gdjI6IERlZmluZWQNCj4gPiBY
RV9BQ0NfR1JBTlVMQVJJVFlfMTI4SyAwDQo+ID4gWEVfQUNDX0dSQU5VTEFSSVRZXzJNIDENCj4g
PiBYRV9BQ0NfR1JBTlVMQVJJVFlfMTZNIDINCj4gPiBYRV9BQ0NfR1JBTlVMQVJJVFlfNjRNIDMN
Cj4gPiBhcyBwYXJ0IG9mIHVBUEkuDQo+ID4gU28sIHRoYXQgdXNlciBjYW4gYWxzbyB1c2UgaXQu
KE9haykNCj4gPg0KPiA+IENjOiBPYWsgWmVuZyA8b2FrLnplbmdAaW50ZWwuY29tPg0KPiA+IENj
OiBKYW5nYSBSYWh1bCBLdW1hciA8amFuZ2EucmFodWwua3VtYXJAaW50ZWwuY29tPg0KPiA+IFNp
Z25lZC1vZmYtYnk6IFByaXlhbmthIERhbmRhbXVkaSA8cHJpeWFua2EuZGFuZGFtdWRpQGludGVs
LmNvbT4NCj4gPiBSZXZpZXdlZC1ieTogT2FrIFplbmcgPG9hay56ZW5nQGludGVsLmNvbT4NCj4g
PiAtLS0NCj4gPiAgIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9leGVjX3F1ZXVlLmMgfCAzICsrKw0K
PiA+ICAgaW5jbHVkZS91YXBpL2RybS94ZV9kcm0uaCAgICAgICAgICB8IDUgKysrKysNCj4gPiAg
IDIgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX2V4ZWNfcXVldWUuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS94
ZS94ZV9leGVjX3F1ZXVlLmMNCj4gPiBpbmRleCBkZDYxYzQyNjdlMjQuLjRmZDQ0YTkyMDNlNCAx
MDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZXhlY19xdWV1ZS5jDQo+ID4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2V4ZWNfcXVldWUuYw0KPiA+IEBAIC0zOTMsNiAr
MzkzLDkgQEAgc3RhdGljIGludCBleGVjX3F1ZXVlX3NldF9hY2NfZ3JhbnVsYXJpdHkoc3RydWN0
DQo+IHhlX2RldmljZSAqeGUsIHN0cnVjdCB4ZV9leGVjX3ENCj4gPiAgIAlpZiAoWEVfSU9DVExf
REJHKHhlLCAheGUtPmluZm8uc3VwcG9ydHNfdXNtKSkNCj4gPiAgIAkJcmV0dXJuIC1FSU5WQUw7
DQo+ID4NCj4gPiArCWlmICh2YWx1ZSA+IFhFX0FDQ19HUkFOVUxBUklUWV82NE0pDQo+ID4gKwkJ
cmV0dXJuIC1FSU5WQUw7DQo+ID4gKw0KPiA+ICAgCXEtPnVzbS5hY2NfZ3JhbnVsYXJpdHkgPSB2
YWx1ZTsNCj4gPg0KPiA+ICAgCXJldHVybiAwOw0KPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3Vh
cGkvZHJtL3hlX2RybS5oIGIvaW5jbHVkZS91YXBpL2RybS94ZV9kcm0uaA0KPiA+IGluZGV4IDI0
YmY4ZjBmNTJlOC4uOGI1ZTdlMjEyZjYxIDEwMDY0NA0KPiA+IC0tLSBhL2luY2x1ZGUvdWFwaS9k
cm0veGVfZHJtLmgNCj4gPiArKysgYi9pbmNsdWRlL3VhcGkvZHJtL3hlX2RybS5oDQo+ID4gQEAg
LTEyNiw2ICsxMjYsMTEgQEAgc3RydWN0IHhlX3VzZXJfZXh0ZW5zaW9uIHsNCj4gPiAgICNkZWZp
bmUgRFJNX0lPQ1RMX1hFX1dBSVRfVVNFUl9GRU5DRQ0KPiAJRFJNX0lPV1IoRFJNX0NPTU1BTkRf
QkFTRSArIERSTV9YRV9XQUlUX1VTRVJfRkVOQ0UsDQo+IHN0cnVjdCBkcm1feGVfd2FpdF91c2Vy
X2ZlbmNlKQ0KPiA+ICAgI2RlZmluZSBEUk1fSU9DVExfWEVfVk1fTUFEVklTRQ0KPiBEUk1fSU9X
KERSTV9DT01NQU5EX0JBU0UgKyBEUk1fWEVfVk1fTUFEVklTRSwgc3RydWN0DQo+IGRybV94ZV92
bV9tYWR2aXNlKQ0KPiA+DQo+IA0KPiBNYXliZSBpdCdzIG9idmlvdXMsIGJ1dCBJIHRoaW5rIG5p
Y2UgdG8gYWRkIGEgY29tbWVudCBoZXJlIGJlZm9yZSB0aGUNCj4gZGVmaW5lcywNCg0KQWdyZWVk
LCBjYWxsaW5nIGl0ICJncmFudWxhcml0eSIgaXMgYSBsaXR0bGUgY29uZnVzaW5nLCBpLmUuLCBf
MTI4SyBtZWFucyBtb25pdG9yIDMyeDRrIHJlZ2lvbnMsIHNvIHRvdGFsIG9mIDEyOGsgcmVnaW9u
IG1vbml0b3JlZC4gTWF5YmUgc2F5IHNvbWV0aGluZyBsaWtlIGJlbG93LCBzZWUgaW5saW5lDQoN
Cj4gLyogRm9yIHVzZSB3aXRoIFhFX0VYRUNfUVVFVUVfU0VUX1BST1BFUlRZX0FDQ19HUkFOVUxB
UklUWSAqLw0KPiANCi8qTW9uaXRvciAxMjhLQiBjb250aWd1b3VzIHJlZ2lvbiB3aXRoIDRLIHN1
Yi1ncmFudWxhcml0eSovDQo+ID4gKyNkZWZpbmUgWEVfQUNDX0dSQU5VTEFSSVRZXzEyOEsgMA0K
TW9uaXRvciAyTUIgY29udGlndW91cyByZWdpb24gd2l0aCA2NEtCIHN1Yi1ncmFudWxhcml0eQ0K
PiA+ICsjZGVmaW5lIFhFX0FDQ19HUkFOVUxBUklUWV8yTSAxDQpNb25pdG9yIDE2TUIgY29udGln
dW91cyByZWdpb24gd2l0aCA1MTJLQiBzdWItZ3JhbnVsYXJpdHkNCj4gPiArI2RlZmluZSBYRV9B
Q0NfR1JBTlVMQVJJVFlfMTZNIDINCk1vbml0b3IgNjRNQiBjb250aWd1b3VzIHJlZ2lvbiB3aXRo
IDJNIHN1Yi1ncmFudWxhcml0eQ0KDQpPYWsNCj4gPiArI2RlZmluZSBYRV9BQ0NfR1JBTlVMQVJJ
VFlfNjRNIDMNCj4gDQo+IEFuZCBhIGJpdCBiZXR0ZXIgdG8gcGxhY2UgdGhlc2UgZnVydGhlciBk
b3duIGJlbG93LCBiZWZvcmUgdGhlDQo+IGRybV94ZV9leGVjX3F1ZXVlX3NldF9wcm9wZXJ0eSBz
dHJ1Y3R1cmUgaXMgZGVmaW5lZC4NCj4gDQo+IC1Ccmlhbg0KPiANCj4gDQo+ID4gKw0KPiA+ICAg
LyoqIHN0cnVjdCBkcm1feGVfZW5naW5lX2NsYXNzX2luc3RhbmNlIC0gaW5zdGFuY2Ugb2YgYW4g
ZW5naW5lIGNsYXNzICovDQo+ID4gICBzdHJ1Y3QgZHJtX3hlX2VuZ2luZV9jbGFzc19pbnN0YW5j
ZSB7DQo+ID4gICAjZGVmaW5lIERSTV9YRV9FTkdJTkVfQ0xBU1NfUkVOREVSCQkwDQo=
