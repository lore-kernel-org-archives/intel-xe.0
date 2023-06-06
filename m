Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C65D8C77B7A
	for <intel-xe@archiver.kernel.org>; Tue,  6 Jun 2023 12:56:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 966C010E341;
	Tue,  6 Jun 2023 12:56:58 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD45F10E341
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Jun 2023 12:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686056217; x=1717592217;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=l6sdFUcJrBzGCWNHHNxdKniYwfnNyu/pR028LKRyCn0=;
 b=MlKqCZvNh5/BRQJNrjdtmFr8PM7UljGeDzd2zlWUN0KmUrNAmLaXLEJc
 gD4VHzpmEk9RN2z+RzjyugvQyEkZDaLNAOT8M1MkQEKANlpaNkDhPj4Ka
 ef4l9cMHMJUe+0UTJJCpJvekT9g1bOi8Q4rgG5v303UH6DgFWEkTAoB5D
 T1oQ9o1TkgVm+7wUYKisv9s93265sagIafKR7US7S2lD/brx7rbvozdKW
 WfT53Nqr5r2NXJ1NiAzDPfwTxl7lWoLytWvvVIa7nXzXuJzc5dacHcyjm
 JBmJ9rtI+CaFZIP7YMrRMyU1ALkNMo6gFsUtxNCmA1UrWrZJwFrLZZz8e g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="341301327"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; d="scan'208";a="341301327"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 05:56:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="955742032"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; d="scan'208";a="955742032"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga006.fm.intel.com with ESMTP; 06 Jun 2023 05:56:54 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 6 Jun 2023 05:56:53 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 6 Jun 2023 05:56:53 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 6 Jun 2023 05:56:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mQ1doTf6h8+DXMDr51tSOBIg1dpYRh8ICwrdywTe7qD3QnIkKP4Sg+Uu/GwOCJ7YwLPZgaEdJMSL+G1TvrXL/XJOIaY+M9AU+QzVTMaeoKA6Gdelty7WvBHix8G+jjedecjkVT0KyFsJsSRZaPnj5NMntIA53AMPREdejW1ej0ZgMiJhxXhr5TAAXJaYN5Q2PxDDaI3pgGWC6MQYE0+dn7OzuUmsWP8yaQotpFt+++GrXfXLCvsAxjhfZQIYPqQlbYce/YcXqE7Vhf7kmGx8wRcL/vB8CcQEIWzIheTu7cGTAmjlGbNV7UYYTok4F+ta1a/HzyFjqWVJ5Rm8YkkFaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l6sdFUcJrBzGCWNHHNxdKniYwfnNyu/pR028LKRyCn0=;
 b=KXj3aEpPayA/e2aFVBnI1u0IMRHLXGlaggfpqsYxs9iCfIpb8O7xODJOnOFIfRGk6mobqgdojeLfEK0loYZ4eJWZaQFDWGb5qxGPM2uHw9ycWihDZhiLhQDG3NiEGtNMehRwdl3u5ncGTwigbl7p4RfO0w0EEsI005vGABIdPJgQX7RAkDai0aQqgPtDSESw/aI4Xgup+LdR21FTsfp0fQu6wg7FcZFanMAX/huxH62V7FDnSq5KgG4vf0RMw8PcTiEe2mh3vjyvFYLMG2PjpxqLow7eZ+Fu2s2jIXKdcxHAo7iioKVnN31B036Qz/aU5knvCJ/86Rr4Y5b7yA7ARQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by SJ1PR11MB6130.namprd11.prod.outlook.com (2603:10b6:a03:45f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Tue, 6 Jun
 2023 12:56:52 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::3204:9161:6e53:13f8]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::3204:9161:6e53:13f8%6]) with mapi id 15.20.6455.030; Tue, 6 Jun 2023
 12:56:52 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [Intel-xe] [PATCH 3/3] drm/xe: Add sysfs entry to report per
 tile memory size
Thread-Index: AQHZmGcXkDYuNuVE5EG7O9XvY827Ea99pSsAgAAWi9A=
Date: Tue, 6 Jun 2023 12:56:51 +0000
Message-ID: <SJ1PR11MB6204EB9F10A9B1E284AF76288152A@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20230606111255.2072426-1-tejas.upadhyay@intel.com>
 <20230606111255.2072426-4-tejas.upadhyay@intel.com>
 <caf6c008-6aa7-a37e-1728-fc131a282875@intel.com>
In-Reply-To: <caf6c008-6aa7-a37e-1728-fc131a282875@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|SJ1PR11MB6130:EE_
x-ms-office365-filtering-correlation-id: 61f98c28-3a6a-4ec1-e709-08db668d7f95
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hjPLB0xOkqqvUMRsLhHdORCTUcv8qVO6ZCHFwcXrPR0gGpH6uZCQA6OAPFkGIPq1E65Z0gjBj9WoC4Kko50O2Tri3kOnJG/0wpqVnvUh9gJkDHzTF0gGHxwnOTPzVPvXITBGqZ+J0RKFn9s978S2dwEDx4yEKJ75bwlJbVbCWRR1MKQVhbfpQmDZYZ+3HwLFJUqZ+SreBHjKNdT2aI0qL6gVZfcXBltBOqf0HKzCRJbvc0ByASEaPvkYQumPMmnUo27Wl/plV1UV0N1VhkFTqo3H+YFvHnBdG91kO/TDZIfv6fDgdkKH6mHoyUdn/SItknnpg/S/9VaPKQJVA8tS5Bi53/64RqaISjS4tcKSjXLLJ1bRX4FoqY4eYk4Fg4dhTBBNKcpG7TITgMiym0fuRzWVmAVied2M6idPFNU7tb4IC/A0aXYbPRI4YiGR67GQUQd8yglanYNv1hlynRjgbCSUSvXWeyHd1XzZnft8mbIY+a06uRbdlO5m1XzhBLsn2f8uezgDcRIRD/l8BmNwaw5OKuK2D0DNfbCnreqpVj3/MPhr0tf7N0ZAorZ/ZQ9Mau3stUkefi+6ZLgsJMaJkT/aKA+rrPY4C+IgKAXDW6idONkwtvcHvetLOu2BBO3M
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(136003)(366004)(376002)(396003)(39860400002)(451199021)(110136005)(71200400001)(478600001)(8936002)(52536014)(5660300002)(8676002)(33656002)(86362001)(38070700005)(2906002)(66476007)(122000001)(66446008)(64756008)(66556008)(66946007)(316002)(55016003)(76116006)(82960400001)(6506007)(38100700002)(41300700001)(53546011)(9686003)(186003)(26005)(83380400001)(7696005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cS80dzdQYnN5SkxYdnVLWkNFbEREclhKZVo3MXdlZmdIMkErMlkvZU5IR1Jh?=
 =?utf-8?B?aWNIcGQ2L3BHbGRtQWNidS9hbEVhMjRsNlhLQjFWbzBlUlZ2a2Y0ZmlvT2RO?=
 =?utf-8?B?RXRtMlpWMkhHdnNYVEdXZkNUamlzM3JlUDhtZ1FhNVhlMVdxQVk0QU5SWmJn?=
 =?utf-8?B?NnNKTkRWWDVaNkJ0c3J1MkRlQ1V2K0pHL08zZ2FiTlVoY2FqZ2xlNTBmVFVy?=
 =?utf-8?B?RFZSaGd4cVY0Q2ZySWVvVmFQb0tLd281QzdXbWJxUENKWUpVeFBWMDJNSUtY?=
 =?utf-8?B?TGowZHJvY3hHdzYzeGZJQXY4d21uODQ3Q2FTTklJUytTTk8wTW1KNUx4TGpB?=
 =?utf-8?B?RHNyYnZtUzZ3dTAzSkl5LzNDTUZMaVJiQk1Ja1hrM2Q3azVMcDBIYk02b243?=
 =?utf-8?B?Sll2WWV5YVlzM0dkV1VtN3F0ZzM0NlJmWlFRYnBzREUvK1RReXJuNk1yUkZs?=
 =?utf-8?B?ODlDWEwwblh0L0JQY1RaK05OYjB0d1hvdmF6N2JJZDlITnc5UUZOdW5FbGht?=
 =?utf-8?B?UXZobHhLbGdsczFsR21uQTJMWUhndDEzTGx0eFhobnJOTXUySGtlTHh5eDNp?=
 =?utf-8?B?ZUEyRzJvTWppMElmYXBISTVkcWRaYnUyMGE0a0piS0k5cG5ObVpnSEFSVTVp?=
 =?utf-8?B?NWdaQjhsNS8rSm9Eb0hQZkovVkg3TkY4THlMdUI4aEpuNFoxbWxQWEdsem8r?=
 =?utf-8?B?OER2Q0M0SW9EdjgxdW0vWWR3SGJySDQ4UWNoRTh0ZlB1SlF6S09RNkZ4R2Uw?=
 =?utf-8?B?dkJjY0c5ZFFUbVBadU5JRXhHRFBtajluQkxTa0k1OWwwVW5ZME9MSWJPUXVy?=
 =?utf-8?B?UFlVWVFPTHRqVy9wRUNWd1lQK1hpNVBDYnlPdERIMEZTek5WclMrNjQ2RjEz?=
 =?utf-8?B?ek83ekJsRkdGazJVeW9ZcEVVWmJydDRSTnZubG9pVVhlajVJR2h6aE5qeW5I?=
 =?utf-8?B?V0tpbDJhYm1GT0hjSktWMm04OGxVMUg0N3hLMkpFUU5IeEVJbEhJeXRXZTBU?=
 =?utf-8?B?NWFzYjNTeS9tNE5qOEJPSU9ZQjRQNkwwMmdjcW9kYkNKd1FCQk02OCthL2RB?=
 =?utf-8?B?Mm5uRG51ZUpubFFHTHZ6MTFoaXdCMDMyYlpSSXZYZUUrQ3cySERzRXBCQ0w1?=
 =?utf-8?B?WEoreTlYMDdJRWFlY1N0dmI5UU9rakhmeHRxR2JnSmtBLzRlQ2E3N3BqZERY?=
 =?utf-8?B?eXoxK3JCV1dpbFVFRmNIMzA3MDQ5ckZKazFmK3dHbHBZY0NvN2xRVUw1Vm1y?=
 =?utf-8?B?dkFvMVpLZDkwbEhlblM0ckV1UkRERWEwL2Z3RloxQ1pPUUpWSlM2ZTVrQld0?=
 =?utf-8?B?WThic3lBY0JCV3dVZmxkQ3hNRm41TEVZTU02RTNBenJaNVJCam1uSkxWUUJw?=
 =?utf-8?B?ZDdCbnUzNmNoZlZKeXVKVEFUV0tqMFBBYTMzT3lGMXRGNGxxWXNDQ2JsQVRn?=
 =?utf-8?B?b0RjZjRMY2w2Nzh6S0xJSmp0cnR1eER4T0VaMkFEUytVRkN2L05CbzVYcVpM?=
 =?utf-8?B?L1RuRGJvbkFZOTZzRHdkOEhjTWxaZkhWWk4zYmg5SDRNVE1YVnFJVFFDQ0Ez?=
 =?utf-8?B?ZGg3ZHZkU1F3QVlBZndNaytuTGlQZTA5TlF2UXh3OURoOFRURmNvQ2J2d1hL?=
 =?utf-8?B?Z2Npa1dpQjZzRVNSYnBuVUJ1ZnJ2dFprcFpLQlQxNWV6dG1BeGFvZnVTTlJ2?=
 =?utf-8?B?Qjc2UjNvdUZrOFc0Yk9VZVF3cUdyT25Wc0Evb1VERCtnQnk0M3RxdzdJQjVk?=
 =?utf-8?B?N3FlWDhwNXpES29weVNxd3FIZWZkQloyTDlLMnJOVzlqbTBNSTNpR3RxSmxr?=
 =?utf-8?B?QWZlTS9hTUg5YUZGdTBsZ1RXQy9BMXBXci9QY21nZ1ZOc1pIaGR6NEdFMTdV?=
 =?utf-8?B?MHdOVFc5QzdoT3k1b1NEMHBGdGg5WmoxazBWalhwMXlIS0xwc1p0NTdqdlNR?=
 =?utf-8?B?K1NCVUhKcW1tbTRoa0N0ZkgvUzUvOU96dGdoOEdaaTUvMFRsOXFJMWZmU3JN?=
 =?utf-8?B?ZWhiRkVydDBvcHNoS3NsWURvS2tVVE5zOUIyZ1RsMG80Q3ZnVm1VVUJ6eEty?=
 =?utf-8?B?QzRlRkVKVlVXVks3VXRwRlovVXlvT01XTHdJenZJNHljdmpja0tFazZ3dG4y?=
 =?utf-8?Q?VeoTxvLoIjI40hunC5omPviqJ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61f98c28-3a6a-4ec1-e709-08db668d7f95
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2023 12:56:51.9593 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7GXxwMXcDZsTozpFBVeQT3Q+Ulm91NLHzjJv6DGcb67vW9o5vxp8pzGBbnULemVyMFvwKGcdxYtK0uPPmc/RY02qR1NgciVDRnf2ddp9fwQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6130
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 3/3] drm/xe: Add sysfs entry to report per
 tile memory size
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSWRkYW1zZXR0eSwgQXJh
dmluZCA8YXJhdmluZC5pZGRhbXNldHR5QGludGVsLmNvbT4NCj4gU2VudDogVHVlc2RheSwgSnVu
ZSA2LCAyMDIzIDU6MDUgUE0NCj4gVG86IFVwYWRoeWF5LCBUZWphcyA8dGVqYXMudXBhZGh5YXlA
aW50ZWwuY29tPjsgaW50ZWwtDQo+IHhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBTdWJqZWN0
OiBSZTogW0ludGVsLXhlXSBbUEFUQ0ggMy8zXSBkcm0veGU6IEFkZCBzeXNmcyBlbnRyeSB0byBy
ZXBvcnQgcGVyIHRpbGUNCj4gbWVtb3J5IHNpemUNCj4gDQo+IA0KPiANCj4gT24gMDYtMDYtMjAy
MyAxNjo0MiwgVGVqYXMgVXBhZGh5YXkgd3JvdGU6DQo+ID4gQWRkIHN5c2ZzIGVudHJ5IHRvIHJl
YWQgcGVyIHRpbGUgcGh5c2ljYWwgbWVtb3J5IGluY2x1ZGluZyBzdG9sZW4NCj4gPiBtZW1vcnku
DQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBUZWphcyBVcGFkaHlheSA8dGVqYXMudXBhZGh5YXlA
aW50ZWwuY29tPg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlX3R5
cGVzLmggfCAgNSArKysNCj4gPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX21taW8uYyAgICAgICAg
IHwgIDEgKw0KPiA+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfdGlsZV9zeXNmcy5jICAgfCA0Nw0K
PiArKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ID4gIDMgZmlsZXMgY2hhbmdlZCwgNTMg
aW5zZXJ0aW9ucygrKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94
ZV9kZXZpY2VfdHlwZXMuaA0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZV90eXBl
cy5oDQo+ID4gaW5kZXggZGI2MWRhNGQ2MjEyLi43YjU0NDNhZWJkMDAgMTAwNjQ0DQo+ID4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZV90eXBlcy5oDQo+ID4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX2RldmljZV90eXBlcy5oDQo+ID4gQEAgLTEwNyw2ICsxMDcsMTEgQEAg
c3RydWN0IHhlX3RpbGUgew0KPiA+DQo+ID4gIAkvKiogQG1lbTogbWVtb3J5IG1hbmFnZW1lbnQg
aW5mbyBmb3IgdGlsZSAqLw0KPiA+ICAJc3RydWN0IHsNCj4gPiArCQkvKioNCj4gPiArCQkgKiBA
YWN0dWFsX3BoeXNpY2FsX21lbTogVHJhY2sgYWN0dWFsIExNRU0gc2l6ZQ0KPiA+ICsJCSAqIGlu
Y2x1ZGluZyBzdG9sZW4gbWVtIGZvciB0aWxlDQo+ID4gKwkJICovDQo+ID4gKwkJcmVzb3VyY2Vf
c2l6ZV90IGFjdHVhbF9waHlzaWNhbF9tZW07DQo+ID4gIAkJLyoqDQo+ID4gIAkJICogQHZyYW06
IFZSQU0gaW5mbyBmb3IgdGlsZS4NCj4gPiAgCQkgKg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0veGUveGVfbW1pby5jDQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfbW1pby5j
IGluZGV4IDQ3NWIxNGZlNDM1Ni4uODZhN2M2NWMzMDFmDQo+IDEwMDY0NA0KPiA+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV9tbWlvLmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfbW1pby5jDQo+ID4gQEAgLTI4Myw2ICsyODMsNyBAQCBpbnQgeGVfbW1pb19wcm9iZV92cmFt
KHN0cnVjdCB4ZV9kZXZpY2UgKnhlKQ0KPiA+ICAJCWlmIChlcnIpDQo+ID4gIAkJCXJldHVybiBl
cnI7DQo+ID4NCj4gPiArCQl0aWxlLT5tZW0uYWN0dWFsX3BoeXNpY2FsX21lbSA9IHRpbGVfc2l6
ZTsNCj4gPiAgCQl0aWxlLT5tZW0udnJhbS5pb19zdGFydCA9IHhlLT5tZW0udnJhbS5pb19zdGFy
dCArDQo+IHRpbGVfb2Zmc2V0Ow0KPiA+ICAJCXRpbGUtPm1lbS52cmFtLmlvX3NpemUgPSBtaW5f
dCh1NjQsIHZyYW1fc2l6ZSwgaW9fc2l6ZSk7DQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX3RpbGVfc3lzZnMuYw0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hl
X3RpbGVfc3lzZnMuYw0KPiA+IGluZGV4IDgyMWJkNDlkZTI3Ny4uZDQ4YzU5OWU4Y2MxIDEwMDY0
NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV90aWxlX3N5c2ZzLmMNCj4gPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0veGUveGVfdGlsZV9zeXNmcy5jDQo+ID4gQEAgLTIyLDYgKzIyLDQz
IEBAIHN0YXRpYyBzdHJ1Y3Qga29ial90eXBlIHhlX3RpbGVfc3lzZnNfa29ial90eXBlID0gew0K
PiA+ICAJLnN5c2ZzX29wcyA9ICZrb2JqX3N5c2ZzX29wcywNCj4gPiAgfTsNCj4gPg0KPiA+ICt0
eXBlZGVmIHNzaXplX3QgKCpzaG93KShzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBkZXZpY2Vf
YXR0cmlidXRlDQo+ID4gKyphdHRyLCBjaGFyICpidWYpOw0KPiA+ICsNCj4gPiArc3RydWN0IHhl
X2V4dF9hdHRyIHsNCj4gPiArCXN0cnVjdCBkZXZpY2VfYXR0cmlidXRlIGF0dHI7DQo+ID4gKwlz
aG93IHhlX3Nob3c7DQo+ID4gK307DQo+ID4gKw0KPiA+ICsJc3RhdGljIHNzaXplX3QNCj4gPiAr
eGVfc3lzZnNfc2hvdyhzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBkZXZpY2VfYXR0cmlidXRl
ICphdHRyLCBjaGFyDQo+ID4gKypidWYpIHsNCj4gPiArCXNzaXplX3QgdmFsdWU7DQo+ID4gKwlz
dHJ1Y3QgeGVfZXh0X2F0dHIgKmVhID0gY29udGFpbmVyX29mKGF0dHIsIHN0cnVjdCB4ZV9leHRf
YXR0ciwNCj4gPiArYXR0cik7DQo+ID4gKw0KPiA+ICsJdmFsdWUgPSBlYS0+eGVfc2hvdyhkZXYs
IGF0dHIsIGJ1Zik7DQo+ID4gKw0KPiA+ICsJcmV0dXJuIHZhbHVlOw0KPiA+ICt9DQo+ID4gKw0K
PiA+ICsJc3RhdGljIHNzaXplX3QNCj4gPiArYWRkcl9yYW5nZV9zaG93KHN0cnVjdCBkZXZpY2Ug
KmtkZXYsIHN0cnVjdCBkZXZpY2VfYXR0cmlidXRlICphdHRyLA0KPiA+ICtjaGFyICpidWYpIHsN
Cj4gPiArCXN0cnVjdCB4ZV90aWxlICp0aWxlID0ga29ial90b190aWxlKCZrZGV2LT5rb2JqKTsN
Cj4gPiArDQo+ID4gKwlyZXR1cm4gc3lzZnNfZW1pdChidWYsICIlcGFcbiIsICZ0aWxlLT5tZW0u
YWN0dWFsX3BoeXNpY2FsX21lbSk7IH0NCj4gPiArDQo+ID4gKyNkZWZpbmUgWEVfREVWSUNFX0FU
VFJfUk8oX25hbWUsIF9zaG93KSBcDQo+ID4gKwlzdHJ1Y3QgeGVfZXh0X2F0dHIgZGV2X2F0dHJf
IyNfbmFtZSA9IFwgeyBfX0FUVFIoX25hbWUsIDA0NDQsDQo+ID4gK3hlX3N5c2ZzX3Nob3csIE5V
TEwpLCBfc2hvd30NCj4gDQo+IHdoeSBkbyB5b3UgbmVlZCB0byBkbyB0aGlzIHdheSwgY2FuJ3Qg
d2Ugc2ltcGx5IHVzZSBERVZJQ0VfQVRUUl9STw0KDQpJIHRoaW5rIGl0IGlzIHBvc3NpYmxlLCBJ
IHdpbGwgY2hlY2sgb24gdGhpcy4NCg0KVGhhbmtzLA0KVGVqYXMNCj4gDQo+IFRoYW5rcywNCj4g
QXJhdmluZC4NCj4gPiArDQo+ID4gK3N0YXRpYyBYRV9ERVZJQ0VfQVRUUl9STyhhZGRyX3Jhbmdl
LCBhZGRyX3JhbmdlX3Nob3cpOw0KPiA+ICsNCj4gPiArc3RhdGljIGNvbnN0IHN0cnVjdCBhdHRy
aWJ1dGUgKmFkZHJfcmFuZ2VfYXR0cnNbXSA9IHsNCj4gPiArCSZkZXZfYXR0cl9hZGRyX3Jhbmdl
LmF0dHIuYXR0ciwNCj4gPiArCU5VTEwNCj4gPiArfTsNCj4gPiArDQo+ID4gIHN0YXRpYyB2b2lk
IHRpbGVfc3lzZnNfZmluaShzdHJ1Y3QgZHJtX2RldmljZSAqZHJtLCB2b2lkICphcmcpICB7DQo+
ID4gIAlzdHJ1Y3QgeGVfdGlsZSAqdGlsZSA9IGFyZzsNCj4gPiBAQCAtNTAsOSArODcsMTkgQEAg
aW50IHhlX3RpbGVfc3lzZnNfaW5pdChzdHJ1Y3QgeGVfdGlsZSAqdGlsZSkNCj4gPg0KPiA+ICAJ
dGlsZS0+c3lzZnMgPSAma2ctPmJhc2U7DQo+ID4NCj4gPiArCWlmIChzeXNmc19jcmVhdGVfZmls
ZXModGlsZS0+c3lzZnMsIGFkZHJfcmFuZ2VfYXR0cnMpKSB7DQo+ID4gKwkJZHJtX2VycigmdGls
ZV90b194ZSh0aWxlKS0+ZHJtLA0KPiA+ICsJCQkiU2V0dGluZyB1cCBzeXNmcyB0byByZWFkIHRv
dGFsIHBoeXNpY2FsIG1lbW9yeSBwZXINCj4gdGlsZSBmYWlsZWRcbiIpOw0KPiA+ICsJCWdvdG8g
ZXJyX29iamVjdDsNCj4gPiArCX0NCj4gPiArDQo+ID4gIAllcnIgPSBkcm1tX2FkZF9hY3Rpb25f
b3JfcmVzZXQoJnRpbGVfdG9feGUodGlsZSktPmRybSwNCj4gdGlsZV9zeXNmc19maW5pLCB0aWxl
KTsNCj4gPiAgCWlmIChlcnIpDQo+ID4gIAkJcmV0dXJuIGVycjsNCj4gPg0KPiA+ICsJaWYgKDAp
IHsNCj4gPiArZXJyX29iamVjdDoNCj4gPiArCQlrb2JqZWN0X3B1dCgma2ctPmJhc2UpOw0KPiA+
ICsJfQ0KPiA+ICAJcmV0dXJuIDA7DQo+ID4gIH0NCg==
