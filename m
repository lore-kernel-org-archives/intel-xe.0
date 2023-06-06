Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91110C77B7A
	for <intel-xe@archiver.kernel.org>; Tue,  6 Jun 2023 12:55:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6544510E346;
	Tue,  6 Jun 2023 12:55:25 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0EF310E33E
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Jun 2023 12:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686056123; x=1717592123;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=BQDHvvLORYxoJSvqSWdYXlZdQjwqeCrAUvIvYUnr4vw=;
 b=JPStahBQt2/9EIVQx5RoRlGhI+9nc/cxOPe0og6ggo0+eVxd5Bkhlx/0
 BkDQJMDD6SFUwKHxSZBZquPiZ2KMVeseP62KREP+LbegbJ4xaLc2oUaBd
 he4aKuWRfsTlKfg83Fl/IC1QAeCarMqVMZMOWu1FhMwbYMRxJPMaFWmCP
 DZauRWSJrA1I/OG+SzkyJX/75dqk64ooNEBdZXHM6+5RDSIMt7+b3OqiN
 QHdoWpJRoS25iPsgT8lj0T+Cx1QywLhoct/vi7NVYFS9ZN3gNeiGZRG7y
 Eo0Q651yZjbCjoU1DrSGNjB8nFmCPMODvQ+gGcLuDBvfXPyT4G1EIQ6gf g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="346258937"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; d="scan'208";a="346258937"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 05:55:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="833215758"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; d="scan'208";a="833215758"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga004.jf.intel.com with ESMTP; 06 Jun 2023 05:55:21 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 6 Jun 2023 05:55:21 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 6 Jun 2023 05:55:21 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 6 Jun 2023 05:55:21 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 6 Jun 2023 05:55:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IBmvyl7/L7W7SnGapJUxn3M5q9N+Po4V3t0XC2yN/0Jl43whjYsAlcUwFlyImUJZ3A8GsdB1kjdIgU41IkhZI6QSJ9v745xS5toOZPyoHeW/6God7ZdE43ua2765Yzf5a8O89b9Is9msdAh2vHksSb87LZ17elU9V5kKDt9P0YilDctp7MQC5N6HCl8Yyfly6g0Wve9P5w9GXZsvGjHxcdMDiAVY3HPJ/rM4EC6LPELDqz2ynJFOvZgAyv0QgB1jkza+X3ihP/7HKJnvfVxne5g4rFtNL6VWpG5nAbZqIx0lOR1Pkcs+wtYwq4Wr55mtPG7/7ZhHx0MHumnEmrHWGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BQDHvvLORYxoJSvqSWdYXlZdQjwqeCrAUvIvYUnr4vw=;
 b=epCLYgy9DQgfQkCQfzwu4O6AQIrDS6sbz0LKR8O3snORFzpBE+pnnSVPNwa118jMo7cZLRS4D8UjWMTQ6nJrHMsX9LjauHgOJtJZApcY0VucPf+y3DxfuDrxczKSC04/4pofSr6bzsjVWI7uwGhmBFkR5QtCoA2ZXU2OiR0FDsn1Vq5EOhrm2tx3NebUy8j5A+Im23xr7KFnTl1B/dF8E4eD3E3ovXR9ybTTIrr7tzOe1+eihQxXrH36KEu8zfifqsEyzExk4OvHkDjw7K9ZmlpR2UNi7t9eUwQZEJ/OK0zj7/beqOmR60y74OQUkrI17nSux/4MT0BbfV6Z6v4ZMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by SJ1PR11MB6130.namprd11.prod.outlook.com (2603:10b6:a03:45f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Tue, 6 Jun
 2023 12:55:17 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::3204:9161:6e53:13f8]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::3204:9161:6e53:13f8%6]) with mapi id 15.20.6455.030; Tue, 6 Jun 2023
 12:55:17 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [Intel-xe] [PATCH 1/3] drm/xe: Add sysfs entry per tile
Thread-Index: AQHZmGcTOwlVWeacokSDj67i8CGR+699ossAgAAYSsA=
Date: Tue, 6 Jun 2023 12:55:17 +0000
Message-ID: <SJ1PR11MB6204C5E5F00E2A6D431DD2B18152A@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20230606111255.2072426-1-tejas.upadhyay@intel.com>
 <20230606111255.2072426-2-tejas.upadhyay@intel.com>
 <95127d43-2eff-22f0-8678-1e8bb17438fe@intel.com>
In-Reply-To: <95127d43-2eff-22f0-8678-1e8bb17438fe@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|SJ1PR11MB6130:EE_
x-ms-office365-filtering-correlation-id: 7a97548c-2592-400c-8906-08db668d476d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SERdN+mFrjFSAHdiPkcVvl43jP3zHZUDtO3ne1a/YtdwIwiDoF7MWiKQl7YFsz2UOZQspOYxaID/C11ALPSi7gQ2IPZwv7QXdaXmINiHUOsxJQ1cRXmXTsy3qMkdiDiBJPUAOv40Dt9fHWarQ9mDqytKg9x8UV5+0qV2r3QZ6m7BBoJ2hkP8gOWsca+m7h1mls/+hp7kC3nd5wdkCFgv4QW6gA/+z1fpQ8jDZMWw8olxBYm22k5Swq/XP4SO1eGBHZQPNy5ajnjtZ/DJScHONYQM/VbsJIspUatJ94pORA/GGXAQ3vSW3rekmn33ElChSzolAO5kJKs5cUBwM/jQYyvfJ/TRfn5n5yGMRMSqYckl392deJKuzq5e9z0KdFSFTdrO4Y3F7e+CBKshMmxn2QhL0TJIVcwC9B/kJWKn5T7aZbYtddix+yt/2ayy3nWrYcJvvfMaOcmamMWOEPM7jSxIR/G58M3DmuTAd/9U4f2nsOsbGl9ulqCX8UzQKRQDpyqSd2fwLu3CvQnLx90B5HVbrpbAKixmoiS2VH2MXdj7jJKeVDR7qa0jhJUV53+t8/1qMTw+D2M0zvtq/J+lF90okeSxZVgPqk3oEFFf3YBZ8Ed/D18zZ+pIpf15JSwZ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(136003)(366004)(376002)(396003)(39860400002)(451199021)(110136005)(71200400001)(66899021)(478600001)(8936002)(52536014)(5660300002)(8676002)(33656002)(86362001)(38070700005)(2906002)(66476007)(122000001)(66446008)(64756008)(66556008)(66946007)(316002)(55016003)(76116006)(82960400001)(6506007)(38100700002)(41300700001)(53546011)(9686003)(186003)(26005)(83380400001)(7696005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NloyaTV4d3pWZFFOMUMxaWViV0ZZc1hFeDA1ZDlPR1VaQTZxZUNObjE2RHJB?=
 =?utf-8?B?a2hKcXhZSnhEU3VUQitXcm5Kbm9KZUdiendoQ2FEamwxZU5tTnlyQkxUZTVC?=
 =?utf-8?B?NkVNZHZab2kxOFJvRmhESTN0NU9ZZHNNNlJnSzNMRkJ3ZHd3L3o2SUY2R1F1?=
 =?utf-8?B?TGNGeEp0aGVJVldEODNNd0gwRnZKRVFHUkR4VHlQZUxCVEdaVlRxSGJJcE5F?=
 =?utf-8?B?dDlPcEZJSDFYeE1KU0Y5dEdUbFZKbFhFVFlNQ3BzMEJDYzFvUWp0a24ybUJ4?=
 =?utf-8?B?N2twYXdPYkxrbno4NmJ5TTNEYjhvSHFxSEhqNGJwNXF1TmphbnorV25pL2Fr?=
 =?utf-8?B?RTdnNE4yQiszODVsM1ZvR0tGTHVzMTcvTjk4a0h6WVRvTGNNL3d3UmgwK2hM?=
 =?utf-8?B?dVdZRCtabTdiTGhzOHZXZUN3WnBBbWxGb3NlVHlqcTdINHJzR3FuUHkvdFJT?=
 =?utf-8?B?MXVaWEt1ckFpRzVXS1RRa2JLWEpqN0NydURYTU03elRiWjY5QzRQdXJ2YkhN?=
 =?utf-8?B?bnE2YUVJM2srOXEwR1hNMTJ4VG5XMERLQy9KLzBaSnRoR3J1c0EwNEswNUhT?=
 =?utf-8?B?c2x3N0M0NGJZSlBOeWUrRHRRM2xHV2pqV0JyMkp4Z1BHb0hGUXVZS0IrMzNy?=
 =?utf-8?B?Wk03R0RhWDhOSmtwdWFjUTNhemUvTTkxdnJwbjF4YVU0SEtvUThsbU5rcjlK?=
 =?utf-8?B?VGpPR2hWZW05QVpIVjZYYXozamQrN2tqcE9TZEt2WFlBZ0xUQnFuaytpTUNu?=
 =?utf-8?B?UTdaVHBBNE93a0M2VlRnaFdaaGk0Y05jK3N1dHRITEdOQXF6SGVPVWdjc1Vs?=
 =?utf-8?B?aXBTYkxxd2NvMmdHY1hnNjA4RE1tQVg3U3ZiT2orVnlWRGJhZnlZV01ueUpX?=
 =?utf-8?B?b085S28wbm9Oall0UCs5S09PdmR5N1lZY3VWZjFidjBCSWRkbmdZQjdKZWtM?=
 =?utf-8?B?L3B6YTNiVUdjUGV4bDNsV0srMU9pdGp5bDQzM0VUaVliZVNvOGhwVmtncWJK?=
 =?utf-8?B?UFBIcDN4cjgyMUJvcWQ1T3pERExYREFIWXVGcDFEcWZFY2ZiUWFzdTFQcExR?=
 =?utf-8?B?M3E3dUkvZC85dVpBcGszQ2J2UWhXSXBpT2w5RnhKRHRqYWpGMzNna2JtTWE3?=
 =?utf-8?B?VTdNT2kvOU03TU9yWTBXNTJEK2dSYitCd05uTFBna0puZjg4VEN5WTNWTFNF?=
 =?utf-8?B?RFVGODhkVXY4NlVveFlSdXgvTUZFYll0Zy9IQndZL2JvMzk1eTJ4NnRNanYw?=
 =?utf-8?B?UnJqMHlWd2ZtdzE5TmxLYVNGRC9nVHRwa3lqbDhraDdUbkhDVDZRQXZ0UXFK?=
 =?utf-8?B?K0RvMWpVTGVCUWkvQmhPZHdhTktTOVBSbGhGaG9ENG8wSnV1N1JMQWhtYjB5?=
 =?utf-8?B?Qzk5bFlIRE4xWStKZUcvZGVyb3FaOERQbFVDY3dGZzEyTk0xS2pTS2QzY3Y4?=
 =?utf-8?B?OG5aTk9EV3Q5b1BGRWkxK3g3eFJaZTVLNTVVYmErV2xUekR2ejhZM3plWW91?=
 =?utf-8?B?Tm5WR2kvUXpSb0FaRk1xNlljQmkvc1RZMTVOanJJaHBOQjhTTk01U2IzOWhP?=
 =?utf-8?B?OG9Md1NoSmdyMTJRRFBBZ1JWc2VaTE5HK09JS1Bva2o2ZUZMQ2srVmVRTjI2?=
 =?utf-8?B?amR2VmtnUEpSSnNIZVhwdjJZeUx3eitSU0tjVmFLSUlTOVU4bmpLalB2QzJu?=
 =?utf-8?B?bHNuUitrdFZzVEVQRGdJUXdkZ2lXRm9RMmVZVE94aGRBQkhUSzcvcFhCWFNJ?=
 =?utf-8?B?NkIwa1czWTRDZEZKck1qS2RyRmFhZjRmY1lEREdCQTcvcjYzTmZaWU05UVgx?=
 =?utf-8?B?WkYyYUZGYlVHb0YxQ0pSNTUydnpZYTZnVUlMNWphM1BTeStyOXdReDhHMEJV?=
 =?utf-8?B?cjJ5andtS0RkNG1MbzUyMGxjWWxaMUkzS21tV0hJY09NSjEvOW9EUWg0M01W?=
 =?utf-8?B?Q2ZUWXphSEw2OEJlYmVSd29NQk5yUjF1K2pRbHkrR1oyeW52Q2lhZFBKVHk1?=
 =?utf-8?B?UnhPNXRieVhuNmJHeFFwTFJ1VTB3Z0xablc1d01pazU2Skc4QTZtSHQxR1Bs?=
 =?utf-8?B?b2tmTWw1Q1ZYK3luM005VStxVkF0MGs5dWVibzFXdHNIOUNXN09UOW5nTFcx?=
 =?utf-8?Q?2NiGoaBStFkNWs+KhZRkLD0pT?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a97548c-2592-400c-8906-08db668d476d
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2023 12:55:17.7762 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TLRSdzqYiNZwpuGr/t59yuVpH8czu4xITCbV5FJMgEhAGjw18NQ4I/Vwr1+E0+rnhkwtThze3ufgGmAPqIpsPkGYQ9Hxla4QHG8zOfODW2Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6130
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/3] drm/xe: Add sysfs entry per tile
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
ZSA2LCAyMDIzIDQ6NTcgUE0NCj4gVG86IFVwYWRoeWF5LCBUZWphcyA8dGVqYXMudXBhZGh5YXlA
aW50ZWwuY29tPjsgaW50ZWwtDQo+IHhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBTdWJqZWN0
OiBSZTogW0ludGVsLXhlXSBbUEFUQ0ggMS8zXSBkcm0veGU6IEFkZCBzeXNmcyBlbnRyeSBwZXIg
dGlsZQ0KPiANCj4gDQo+IA0KPiBPbiAwNi0wNi0yMDIzIDE2OjQyLCBUZWphcyBVcGFkaHlheSB3
cm90ZToNCj4gPiBXZSBoYXZlIHJlY2VudGx5IGludHJvZHVjZWQgdGlsZSBmb3IgZWFjaCBncHUs
IHNvIGxldHMgYWRkIHN5c2ZzIGVudHJ5DQo+ID4gcGVyIHRpbGUgZm9yIHVzZXJzcGFjZSB0byBw
cm92aWRlIHJlcXVpcmVkIGluZm9ybWF0aW9uIHNwZWNpZmljIHRvDQo+ID4gdGlsZS4NCj4gPg0K
PiA+IFNpZ25lZC1vZmYtYnk6IFRlamFzIFVwYWRoeWF5IDx0ZWphcy51cGFkaHlheUBpbnRlbC5j
b20+DQo+ID4gLS0tDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS94ZS9NYWtlZmlsZSAgICAgICAgICAg
ICAgfCAgMSArDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2VfdHlwZXMuaCAgICAg
fCAgMyArKw0KPiA+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfdGlsZS5jICAgICAgICAgICAgIHwg
IDMgKysNCj4gPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3RpbGUuaCAgICAgICAgICAgICB8ICAy
ICsNCj4gPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3RpbGVfc3lzZnMuYyAgICAgICB8IDU4ICsr
KysrKysrKysrKysrKysrKysrKysrKw0KPiA+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfdGlsZV9z
eXNmcy5oICAgICAgIHwgMTkgKysrKysrKysNCj4gPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3Rp
bGVfc3lzZnNfdHlwZXMuaCB8IDI3ICsrKysrKysrKysrDQo+ID4gIDcgZmlsZXMgY2hhbmdlZCwg
MTEzIGluc2VydGlvbnMoKykNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV90aWxlX3N5c2ZzLmMNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1
L2RybS94ZS94ZV90aWxlX3N5c2ZzLmgNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMv
Z3B1L2RybS94ZS94ZV90aWxlX3N5c2ZzX3R5cGVzLmgNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0veGUvTWFrZWZpbGUgYi9kcml2ZXJzL2dwdS9kcm0veGUvTWFrZWZpbGUN
Cj4gPiBpbmRleCBmMzRkNGJkZDUxMGIuLjQxYTZjMGQwZGVlNyAxMDA2NDQNCj4gPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0veGUvTWFrZWZpbGUNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUv
TWFrZWZpbGUNCj4gPiBAQCAtOTgsNiArOTgsNyBAQCB4ZS15ICs9IHhlX2JiLm8gXA0KPiA+ICAJ
eGVfc3RlcC5vIFwNCj4gPiAgCXhlX3N5bmMubyBcDQo+ID4gIAl4ZV90aWxlLm8gXA0KPiA+ICsJ
eGVfdGlsZV9zeXNmcy5vIFwNCj4gPiAgCXhlX3RyYWNlLm8gXA0KPiA+ICAJeGVfdHRtX3N5c19t
Z3IubyBcDQo+ID4gIAl4ZV90dG1fc3RvbGVuX21nci5vIFwNCj4gPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX2RldmljZV90eXBlcy5oDQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0v
eGUveGVfZGV2aWNlX3R5cGVzLmgNCj4gPiBpbmRleCAxN2I2YjFjYzVhZGIuLmRiNjFkYTRkNjIx
MiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlX3R5cGVzLmgN
Cj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlX3R5cGVzLmgNCj4gPiBAQCAt
MTUwLDYgKzE1MCw5IEBAIHN0cnVjdCB4ZV90aWxlIHsNCj4gPg0KPiA+ICAJLyoqIEBtaWdyYXRl
OiBNaWdyYXRpb24gaGVscGVyIGZvciB2cmFtIGJsaXRzIGFuZCBjbGVhcmluZyAqLw0KPiA+ICAJ
c3RydWN0IHhlX21pZ3JhdGUgKm1pZ3JhdGU7DQo+ID4gKw0KPiA+ICsJLyoqIEBzeXNmczogc3lz
ZnMnIGtvYmogdXNlZCBieSB4ZV90aWxlX3N5c2ZzICovDQo+ID4gKwlzdHJ1Y3Qga29iamVjdCAq
c3lzZnM7DQo+ID4gIH07DQo+ID4NCj4gPiAgLyoqDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV90aWxlLmMNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV90aWxlLmMg
aW5kZXggNjQxNGFhODEwMzU1Li5hYzcwNDg2ZDA5YzMNCj4gMTAwNjQ0DQo+ID4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX3RpbGUuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94
ZV90aWxlLmMNCj4gPiBAQCAtMTAsNiArMTAsNyBAQA0KPiA+ICAjaW5jbHVkZSAieGVfbWlncmF0
ZS5oIg0KPiA+ICAjaW5jbHVkZSAieGVfc2EuaCINCj4gPiAgI2luY2x1ZGUgInhlX3RpbGUuaCIN
Cj4gPiArI2luY2x1ZGUgInhlX3RpbGVfc3lzZnMuaCINCj4gPiAgI2luY2x1ZGUgInhlX3R0bV92
cmFtX21nci5oIg0KPiA+DQo+ID4gIC8qKg0KPiA+IEBAIC0xNDIsNiArMTQzLDggQEAgaW50IHhl
X3RpbGVfaW5pdF9ub2FsbG9jKHN0cnVjdCB4ZV90aWxlICp0aWxlKQ0KPiA+ICAJaWYgKElTX0VS
Uih0aWxlLT5tZW0ua2VybmVsX2JiX3Bvb2wpKQ0KPiA+ICAJCWVyciA9IFBUUl9FUlIodGlsZS0+
bWVtLmtlcm5lbF9iYl9wb29sKTsNCj4gPg0KPiA+ICsJeGVfdGlsZV9zeXNmc19pbml0KHRpbGUp
Ow0KPiA+ICsNCj4gPiAgZXJyX21lbV9hY2Nlc3M6DQo+ID4gIAl4ZV9kZXZpY2VfbWVtX2FjY2Vz
c19wdXQodGlsZV90b194ZSh0aWxlKSk7DQo+ID4gIAlyZXR1cm4gZXJyOw0KPiA+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfdGlsZS5oDQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0v
eGUveGVfdGlsZS5oIGluZGV4IDMzYmY0MTI5MjE5NS4uNzgyYzQ3ZjhiZDQ1DQo+IDEwMDY0NA0K
PiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV90aWxlLmgNCj4gPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0veGUveGVfdGlsZS5oDQo+ID4gQEAgLTYsNiArNiw4IEBADQo+ID4gICNpZm5kZWYg
X1hFX1RJTEVfSF8NCj4gPiAgI2RlZmluZSBfWEVfVElMRV9IXw0KPiA+DQo+ID4gKyNpbmNsdWRl
ICJ4ZV9kZXZpY2VfdHlwZXMuaCINCj4gPiArDQo+ID4gIHN0cnVjdCB4ZV90aWxlOw0KPiA+DQo+
ID4gIGludCB4ZV90aWxlX2FsbG9jKHN0cnVjdCB4ZV90aWxlICp0aWxlKTsgZGlmZiAtLWdpdA0K
PiA+IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3RpbGVfc3lzZnMuYw0KPiA+IGIvZHJpdmVycy9n
cHUvZHJtL3hlL3hlX3RpbGVfc3lzZnMuYw0KPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4g
aW5kZXggMDAwMDAwMDAwMDAwLi44MjFiZDQ5ZGUyNzcNCj4gPiAtLS0gL2Rldi9udWxsDQo+ID4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3RpbGVfc3lzZnMuYw0KPiA+IEBAIC0wLDAgKzEs
NTggQEANCj4gPiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IE1JVA0KPiA+ICsvKg0KPiA+
ICsgKiBDb3B5cmlnaHQgwqkgMjAyMyBJbnRlbCBDb3Jwb3JhdGlvbiAgKi8NCj4gPiArDQo+ID4g
KyNpbmNsdWRlICJ4ZV90aWxlX3N5c2ZzLmgiDQo+ID4gKw0KPiA+ICsjaW5jbHVkZSA8bGludXgv
a29iamVjdC5oPg0KPiA+ICsjaW5jbHVkZSA8bGludXgvc3lzZnMuaD4NCj4gPiArDQo+ID4gKyNp
bmNsdWRlIDxkcm0vZHJtX21hbmFnZWQuaD4NCj4gPiArDQo+ID4gKyNpbmNsdWRlICJ4ZV90aWxl
LmgiDQo+ID4gKw0KPiA+ICtzdGF0aWMgdm9pZCB4ZV90aWxlX3N5c2ZzX2tvYmpfcmVsZWFzZShz
dHJ1Y3Qga29iamVjdCAqa29iaikgew0KPiA+ICsJa2ZyZWUoa29iaik7DQo+ID4gK30NCj4gPiAr
DQo+ID4gK3N0YXRpYyBzdHJ1Y3Qga29ial90eXBlIHhlX3RpbGVfc3lzZnNfa29ial90eXBlID0g
ew0KPiA+ICsJLnJlbGVhc2UgPSB4ZV90aWxlX3N5c2ZzX2tvYmpfcmVsZWFzZSwNCj4gPiArCS5z
eXNmc19vcHMgPSAma29ial9zeXNmc19vcHMsDQo+ID4gK307DQo+ID4gKw0KPiA+ICtzdGF0aWMg
dm9pZCB0aWxlX3N5c2ZzX2Zpbmkoc3RydWN0IGRybV9kZXZpY2UgKmRybSwgdm9pZCAqYXJnKSB7
DQo+ID4gKwlzdHJ1Y3QgeGVfdGlsZSAqdGlsZSA9IGFyZzsNCj4gPiArDQo+ID4gKwlrb2JqZWN0
X3B1dCh0aWxlLT5zeXNmcyk7DQo+ID4gK30NCj4gPiArDQo+ID4gK2ludCB4ZV90aWxlX3N5c2Zz
X2luaXQoc3RydWN0IHhlX3RpbGUgKnRpbGUpIHsNCj4gPiArCXN0cnVjdCBkZXZpY2UgKmRldiA9
IHRpbGVfdG9feGUodGlsZSktPmRybS5kZXY7DQo+ID4gKwlzdHJ1Y3Qga29ial90aWxlICprZzsN
Cj4gPiArCWludCBlcnI7DQo+ID4gKw0KPiA+ICsJa2cgPSBremFsbG9jKHNpemVvZigqa2cpLCBH
RlBfS0VSTkVMKTsNCj4gPiArCWlmICgha2cpDQo+ID4gKwkJcmV0dXJuIC1FTk9NRU07DQo+ID4g
Kw0KPiA+ICsJa29iamVjdF9pbml0KCZrZy0+YmFzZSwgJnhlX3RpbGVfc3lzZnNfa29ial90eXBl
KTsNCj4gPiArCWtnLT50aWxlID0gdGlsZTsNCj4gPiArDQo+ID4gKwllcnIgPSBrb2JqZWN0X2Fk
ZCgma2ctPmJhc2UsICZkZXYtPmtvYmosICJ0aWxlJWQiLCB0aWxlLT5pZCk7DQo+ID4gKwlpZiAo
ZXJyKSB7DQo+ID4gKwkJa29iamVjdF9wdXQoJmtnLT5iYXNlKTsNCj4gPiArCQlyZXR1cm4gZXJy
Ow0KPiA+ICsJfQ0KPiA+ICsNCj4gPiArCXRpbGUtPnN5c2ZzID0gJmtnLT5iYXNlOw0KPiA+ICsN
Cj4gPiArCWVyciA9IGRybW1fYWRkX2FjdGlvbl9vcl9yZXNldCgmdGlsZV90b194ZSh0aWxlKS0+
ZHJtLA0KPiB0aWxlX3N5c2ZzX2ZpbmksIHRpbGUpOw0KPiA+ICsJaWYgKGVycikNCj4gPiArCQly
ZXR1cm4gZXJyOw0KPiA+ICsNCj4gPiArCXJldHVybiAwOw0KPiA+ICt9DQo+ID4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV90aWxlX3N5c2ZzLmgNCj4gPiBiL2RyaXZlcnMvZ3B1
L2RybS94ZS94ZV90aWxlX3N5c2ZzLmgNCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+IGlu
ZGV4IDAwMDAwMDAwMDAwMC4uNTRhMmJhOGJhNTMzDQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV90aWxlX3N5c2ZzLmgNCj4gPiBAQCAtMCwwICsxLDE5
IEBADQo+ID4gKy8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBNSVQgKi8NCj4gPiArLyoNCj4g
PiArICogQ29weXJpZ2h0IMKpIDIwMjMgSW50ZWwgQ29ycG9yYXRpb24gICovDQo+ID4gKw0KPiA+
ICsjaWZuZGVmIF9YRV9USUxFX1NZU0ZTX0hfDQo+ID4gKyNkZWZpbmUgX1hFX1RJTEVfU1lTRlNf
SF8NCj4gPiArDQo+ID4gKyNpbmNsdWRlICJ4ZV90aWxlX3N5c2ZzX3R5cGVzLmgiDQo+ID4gKw0K
PiA+ICtpbnQgeGVfdGlsZV9zeXNmc19pbml0KHN0cnVjdCB4ZV90aWxlICp0aWxlKTsNCj4gPiAr
DQo+ID4gK3N0YXRpYyBpbmxpbmUgc3RydWN0IHhlX3RpbGUgKg0KPiA+ICtrb2JqX3RvX3RpbGUo
c3RydWN0IGtvYmplY3QgKmtvYmopDQo+ID4gK3sNCj4gPiArCXJldHVybiBjb250YWluZXJfb2Yo
a29iaiwgc3RydWN0IGtvYmpfdGlsZSwgYmFzZSktPnRpbGU7IH0NCj4gPiArDQo+ID4gKyNlbmRp
ZiAvKiBfWEVfVElMRV9TWVNGU19IXyAqLw0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0veGUveGVfdGlsZV9zeXNmc190eXBlcy5oDQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVf
dGlsZV9zeXNmc190eXBlcy5oDQo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gPiBpbmRleCAw
MDAwMDAwMDAwMDAuLjc1OTA2YmExMWE5ZQ0KPiA+IC0tLSAvZGV2L251bGwNCj4gPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0veGUveGVfdGlsZV9zeXNmc190eXBlcy5oDQo+ID4gQEAgLTAsMCArMSwy
NyBAQA0KPiA+ICsvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogTUlUICovDQo+ID4gKy8qDQo+
ID4gKyAqIENvcHlyaWdodCDCqSAyMDIzIEludGVsIENvcnBvcmF0aW9uICAqLw0KPiA+ICsNCj4g
PiArI2lmbmRlZiBfWEVfVElMRV9TWVNGU19UWVBFU19IXw0KPiA+ICsjZGVmaW5lIF9YRV9USUxF
X1NZU0ZTX1RZUEVTX0hfDQo+ID4gKw0KPiA+ICsjaW5jbHVkZSA8bGludXgva29iamVjdC5oPg0K
PiA+ICsNCj4gPiArc3RydWN0IHhlX3RpbGU7DQo+ID4gKw0KPiA+ICsvKioNCj4gPiArICogc3Ry
dWN0IGtvYmpfdGlsZSAtIEEgdGlsZSdzIGtvYmplY3Qgc3RydWN0IHRoYXQgY29ubmVjdHMgdGhl
DQo+ID4gK2tvYmplY3QNCj4gPiArICogYW5kIHRoZSBUSUxFDQo+ID4gKyAqDQo+ID4gKyAqIFdo
ZW4gZGVhbGluZyB3aXRoIG11bHRpcGxlIFRJTEVzLCB0aGlzIHN0cnVjdCBoZWxwcyB0byB1bmRl
cnN0YW5kDQo+ID4gK3doaWNoDQo+ID4gKyAqIFRJTEUgbmVlZHMgdG8gYmUgYWRkcmVzc2VkIG9u
IGEgZ2l2ZW4gc3lzZnMgY2FsbC4NCj4gPiArICovDQo+ID4gK3N0cnVjdCBrb2JqX3RpbGUgew0K
PiA+ICsJLyoqIEBiYXNlOiBUaGUgYWN0dWFsIGtvYmplY3QgKi8NCj4gPiArCXN0cnVjdCBrb2Jq
ZWN0IGJhc2U7DQo+ID4gKwkvKiogQHRpbGU6IEEgcG9pbnRlciB0byB0aGUgdGlsZSBpdHNlbGYg
Ki8NCj4gPiArCXN0cnVjdCB4ZV90aWxlICp0aWxlOw0KPiANCj4gd2h5IGRvIHlvdSBuZWVkIHRv
IGRlZmluZSBhIHNlcGFyYXRlIHN0cnVjdCwgY2FuJ3Qga29iamVjdCBiZSBwYXJ0IG9mIHRpbGUN
Cj4gc3RydWN0IGl0c2VsZi4NCg0KSSB0aG91Z2ggaXQgaXMgZ29vZCB0byBrZWVwIGtvYmogcmVs
YXRlZCB0byBzeXNmcyBzdGF5cyBpbiBzYW1lIGZpbGUgYXMgbG9uZyBhcyBwb3NzaWJsZSByYXRo
ZXIgdGhhbiBnb2luZyBldmVyeXRoaW5nIHRvIGdsb2JhbCB0aWxlIHN0cnVjdC4NCg0KVGhhbmtz
LA0KVGVqYXMNCj4gDQo+IFRoYW5rcywNCj4gQXJhdmluZC4NCj4gPiArfTsNCj4gPiArDQo+ID4g
KyNlbmRpZgkvKiBfWEVfVElMRV9TWVNGU19UWVBFU19IXyAqLw0K
