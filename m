Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37151CD11C2
	for <intel-xe@archiver.kernel.org>; Fri,  5 Apr 2024 04:47:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 474F389A1E;
	Fri,  5 Apr 2024 04:47:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hTfEwV4U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81BA91138B0;
 Fri,  5 Apr 2024 04:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712292438; x=1743828438;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qi+DSKetAty51qIlXpUeHY/gW8K7Lw2pB6w0rjaFe9Q=;
 b=hTfEwV4U0f2LIuwSaRkZtn1KCjrTLcLFyHWhII2aaOPFLS8cBpI9iROW
 MV1jc9P+kXH1y0HNgzVfxVzAzbEz9EGliyKpk/TwygwsA6vwcLXOJ9rxH
 nmEwM1Mv96dY8BvqtuPqxImvLH2KYo2dlqLoNUi3jBBKTdVLyqzWcQKFc
 hY4qZnYchALw7lmCQsTDIOA8m41+wx44iKFURtTEvgPshirhv4Kq1ezWM
 PIcbJ/kZXS025O+4KkR6tnt3nrEak6M+l+ZvS0EhmDoPXL0zJ4GWGMqaw
 A/THCrN5QsYxbnVJtO3hgt/lPaMB/MdALS+HQLdu5HCVhEeHGq9qTnTmm Q==;
X-CSE-ConnectionGUID: vybCNNs5Tze73SUCaA3rRQ==
X-CSE-MsgGUID: nrrcRf5JS3W9RPJlDBrvYQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="11404417"
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; d="scan'208";a="11404417"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 21:47:12 -0700
X-CSE-ConnectionGUID: qUXjGiw8TvKUf418/z5WMA==
X-CSE-MsgGUID: qtXrpvQkRMyUvNXeyBJDxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; d="scan'208";a="23514539"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Apr 2024 21:47:11 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 4 Apr 2024 21:47:10 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 4 Apr 2024 21:47:10 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 4 Apr 2024 21:47:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LXe5DAPOslBqfU/O+cH/fs4PxxsEEFGJYlSEw+xc8qcr9zM3EVr8wKqfdvTNxQ04GN8mw4OZt7XBpEWvsmQehJfaX+85YSJCTGpA6JteQtoY6vSeq3Al4WVjOhHmIZk8GfZvZmzBDzAIBK3vzvDhWBF0g1hX+Wc1rktowRjGywmE7HzmtvW0vGC8pwxNZOy2LOQmL02QLtpeuMwkUC93PCMBdsZV0xvpwkhBNjC0XAIO1ovVW9wqKgV38W7CKbMaZTtgbPhYpDBEtzYmLIECAfaiPu/1Le7ETWA+uOBQOAmuq8HesGAvQW7OVPXxdreBi70KEHaA6U8YGK7T2zCZvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qi+DSKetAty51qIlXpUeHY/gW8K7Lw2pB6w0rjaFe9Q=;
 b=mSJNtQY4vvYKKuSII6VOKJvwstEILe2nhRMCDZMBfmz4YQtm4txXYEfP5VfsaYwlZNMdHV9T9mHyRTqzEMR059xmB4xdho2L9SVa3tnfNnXZeXG7EJTcxciiGpWfkm+y21n+zNpifejHNeML4y5tvelUBZCXmZmjLfRaCJJN7noo22m0DlqVepIVO/HAxA6A8DwvsMV9g+BwrsJh7WfHrHUZSrD9FlGggGrABgcl0W9y/RHahD3J1RQ28SLklmUlOTAPIGq/ckRWVv3nWLKkT4YCeZSVN280bnig+Rcm7zN15gtuVecz3iZGZWg7k0KEgmRhlP0QLSv4Ye8R3z+jrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by DS0PR11MB7577.namprd11.prod.outlook.com (2603:10b6:8:142::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Fri, 5 Apr
 2024 04:47:08 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::1604:d970:ed05:4729]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::1604:d970:ed05:4729%7]) with mapi id 15.20.7452.019; Fri, 5 Apr 2024
 04:47:08 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Harrison, John C" <john.c.harrison@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, "Roper, Matthew D" <matthew.d.roper@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost,
 Matthew" <matthew.brost@intel.com>
Subject: RE: [PATCH V2 i-g-t] tests/xe_exec_threads: Make hang tests reset
 domain aware
Thread-Topic: [PATCH V2 i-g-t] tests/xe_exec_threads: Make hang tests reset
 domain aware
Thread-Index: AQHahPafLEfGR8IzR02LuXk/Od8ojLFVYUCAgAAVBACAAIxecIACwXUAgABZyLA=
Date: Fri, 5 Apr 2024 04:47:08 +0000
Message-ID: <SJ1PR11MB6204AA1AFB30BFEF7EBAA3D281032@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20240402122223.643413-1-tejas.upadhyay@intel.com>
 <20240402194017.GJ6574@mdroper-desk1.amr.corp.intel.com>
 <kss23fgx24bvhlarkvrivrvvh32pxugpvgavdo3tc4u55jmidf@rnr7terjza6w>
 <SJ1PR11MB62041F26676765342848070D813D2@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <7eac7b89-8c32-4261-b288-0cf2002b4e93@intel.com>
In-Reply-To: <7eac7b89-8c32-4261-b288-0cf2002b4e93@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|DS0PR11MB7577:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Kt4L7S/PmHI4d0WpED5msy1psTBvOp8rt71ha3gYHsraLI8JpDPdqpJL1Kj6JLrtar6u1heYbcWBaM/ytn0bY4Ba1EoHRSoR0M8wii++yO8Tz7vmjBrRepeZcNBSepyBDVZ/MYS8SM0FDuPoK/MhNngXyRm6xok3wsMtJMSQ/gdl4aXDHZgofyc/HjeRsRtGHaICdT9bYE2UFoa2m1paPWC+6SgiknvAX4RZ0so2H1dAafpD//1s2iy5twBvY2PW1GrjwJOfbfvXvOUna5zGDRlIeUYYjP3QT+2fz+W375J0YxUrgk1GNNK0tBhRXH28jYeIbixWc+Nqyvol8WMOg9VtsBkP6koVk7paFY9jvSAN4XnAcGFb2ZDMHCZ5bk39E7liEbIB7fPcGJNHNvqwLftPYWKa1fEg3MFr42YWmT9R3f3RbyDWyMapP4uRUJbuAYLaNkPG4YEmIB/iW3Qzadlx52tpE1tyfEaAPY8i8qpezVVnMv6bTYhPgQ22RH3xVJHE8hLIkhjakYzfyx3eMtki/jFBSlbH2pjMwGwihjRQqflWN4Y3QPbil2SMnNlIMYbr0sW/uOS9zX7qm6rvuK5xnKVcMSeWiQMbvgAMO5BLcGPxkkOLS9WVzJ7d9VbWW0Oi5XY4HLY3H8NsgBVCOKEfMdz7n9gHqLtb2ni8nO8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZTlTNkQvSnMwZXdHUlB5Zm9zSHJ4cWdxK2d6QWJaMHcvVWRpZjhSRUJ1cXpw?=
 =?utf-8?B?MFRZNHZIN2llSlhhSEpDZkxsMVp1U2NPQSt6K1BvWFcxN1ZONGljS2E0S0l1?=
 =?utf-8?B?UUN1TXVwMHpJQ2xvSXFvM1lLRjNJeSt0WTloRVl2Q08xL1ZCYmdyNVI1YkhS?=
 =?utf-8?B?YlhNR3M3V3RYNHAzSEVabWduVkJvejBWbTlCVnBSQ3NyNmw5M242L3RyVFhh?=
 =?utf-8?B?Z3VOaWx5dnIyRGc3WGp3b0d1eVNCa2RpZmU0aklFZXpRVFhnVjhsWnRkdFdw?=
 =?utf-8?B?YVJHWDNmWUtNT1J6WW01cklVak0za3pCQW1jK1BrNUlmd0VvTlFYbWN1VSsw?=
 =?utf-8?B?WFZndHY1Rit3R2czWWM1MzVVS29QZ2tIbkI4T2ZxOVd0WHpKOTlQeDlUK0dH?=
 =?utf-8?B?eEIwbms3dExlSE5KbEFyY3gzUDhzRUpnTkFJb0tJT283cjJtdzdIR1ZBQ0RB?=
 =?utf-8?B?MWc2Y2hBelk5TmpYV3pxdjRLdzJ6N1hjejkvZWNpeDVjalQ0eVEyTnByeHJM?=
 =?utf-8?B?bEE5cm1yQlYzem1LU1REeUtLTVhhbmgwbzVIUmRMU05KRWR6a285MGhJaHo0?=
 =?utf-8?B?NGJrWG1BZ2YxNCtBc3hLeG9LQnVzMlNZY1R5d3VVMlIrSnpnRnlmcHZpSjFs?=
 =?utf-8?B?bnRnUEJseC9SVkJ2VHZnV2ljRXRuTkpoMHR0b0kyT2M3VS9yZ3NFWTVBTXFS?=
 =?utf-8?B?Rm42Rll3ZlhVV21MUE43bXloemhzSlBHdnhCU29PNGNIYWwwU0F6YXZ6TEV0?=
 =?utf-8?B?d3czczBJZmFsdytOVjZjQ3pucW1GYlZVSlhORUZGZkJ1QWp1aW9SYnk4bGRy?=
 =?utf-8?B?Nkl0S2d0UzgyaHh1VktKbkQ2T0pFV29wRmZ1eEFlOEpUZHU0NGZhcGJoN0Zh?=
 =?utf-8?B?VmZiZnl3c0l6NjNWdURhdEJlVXBjSzNpZ21Gd2Q3REswVm9zYmNOWHgyaElL?=
 =?utf-8?B?RGxadENCZXJ5ZFlyQWdpNHluS3RzY3ZSYUFHVmtDMndHYmIvcCtmTytsVE1B?=
 =?utf-8?B?aXdVWk4vcU1sOUlKa3R4VEpDeDB6Vk9hZXJHQmtPblVSNHV3OHJGbHNHQTRV?=
 =?utf-8?B?Zit0Q0pwakxtczA0MnFTWktRc0xBLzhYTU44ZEtObExKVCtCMC9NS0NDcStZ?=
 =?utf-8?B?M1Mwc3R0K3JnTGE0R2RQY0ZxdDd2RWRhN1NadVV6THlIemNyS3B6NVRJb1ho?=
 =?utf-8?B?c0FWQWpaVU14Q01YQ1pXb0FpTkRveDcxWk9hUndmNTJSWmREclNVeCtpRGFC?=
 =?utf-8?B?OTBMVHZmT1M5NjdmYy9URU9WbW9mc0x4OEsraitTZHY0YldaYW0yVDV0ektR?=
 =?utf-8?B?ZjVtcmgrOVlMLytVQ2xyaHh4YnRiSGVxbDI4eGF3ZUhVTmtZSDBQZ1FXUnJP?=
 =?utf-8?B?QjVYZEhQTUF1L3hnT0RacWZBTGp3akIvMXlKdWxvZEVvbHlYWXdPeUxROU9S?=
 =?utf-8?B?bFNzdzlBOVlIMGhQekpCdGtlcnNOZ0t5MmdLZng4K29rN0kwQWxTNkQzVTgx?=
 =?utf-8?B?WkR5eTB1WXpPR3VMSDd6cC91UnhWeGVxOGtXSkt3M0lyZUxWVzdyU3N1QXBa?=
 =?utf-8?B?L2RUczhpK3VNRTVxNTU1ckQ0cEJnMzFZdm83WHVaZm8zdDgrQVY5blZaNy9k?=
 =?utf-8?B?Q3JEYSthRUVKVFl2K3Zxemk3OFAxWWFCdnFVTFlRbmxGbDQ5eXNFdUovSW9F?=
 =?utf-8?B?eFpkZ3BJTTZDSDNzdnNPRnBLc2xoQ2FXenYvWjI1SGg0ako4TjJpUHFwSXps?=
 =?utf-8?B?ZVVJZ0UzZVlGY3lHZEQ2VldmVUM3YnJXbGhyZW5Zc0JMMlJkS3Q2TGNlU1d0?=
 =?utf-8?B?WHFKRlV6dU9GS3BlQ2VSdkF3eDhWbzFyL1paUGpLeDExKzZ5VnFJbDFERHV3?=
 =?utf-8?B?UDUwMWdUOXR4V3hDdVBZQ0U4bU9tSHZMREZwVVp6T0l0T1NBSGlMaTgxenlN?=
 =?utf-8?B?ZGpHeHF2SGp5cm9hMTFaYjh2aFhXa2d5eklwek02RDBIcVJHbWJxbWpwRDAr?=
 =?utf-8?B?OVJZNThmT2VWVURTSUVJaGxEcTAvNGlaM2puZEs1WTF5SWZNcUNRWHo4Q0dr?=
 =?utf-8?B?RFFLNytwY1hRSU9ZellMVi9YRXViMkFFcFVvclpDTWpxQUhoUFpsVGpiQ2Vh?=
 =?utf-8?B?aWdMMTJtUUpZQ0pkSU1sZ1ZhM1BQTktXYTZtUUFlVE5ZMUViYyt2STM5WVdU?=
 =?utf-8?Q?5DXxDXvYWlTvpKnU2IIEnRY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c9f074b-5f61-4a34-4d23-08dc552b734c
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Apr 2024 04:47:08.5959 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E3QM3ML5Wyf3OkmUcyibVtixtrxA7PEURxm55PWWqVl1/ylAXKRiaHZ4Yr9ziwOH2Reoo4FMpwZUkURTU/0yPd6hV33LgXzBY7i63omaZmY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7577
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSGFycmlzb24sIEpvaG4g
QyA8am9obi5jLmhhcnJpc29uQGludGVsLmNvbT4NCj4gU2VudDogRnJpZGF5LCBBcHJpbCA1LCAy
MDI0IDQ6NTMgQU0NCj4gVG86IFVwYWRoeWF5LCBUZWphcyA8dGVqYXMudXBhZGh5YXlAaW50ZWwu
Y29tPjsgRGUgTWFyY2hpLCBMdWNhcw0KPiA8bHVjYXMuZGVtYXJjaGlAaW50ZWwuY29tPjsgUm9w
ZXIsIE1hdHRoZXcgRA0KPiA8bWF0dGhldy5kLnJvcGVyQGludGVsLmNvbT4NCj4gQ2M6IGlndC1k
ZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBpbnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmc7
IEJyb3N0LA0KPiBNYXR0aGV3IDxtYXR0aGV3LmJyb3N0QGludGVsLmNvbT4NCj4gU3ViamVjdDog
UmU6IFtQQVRDSCBWMiBpLWctdF0gdGVzdHMveGVfZXhlY190aHJlYWRzOiBNYWtlIGhhbmcgdGVz
dHMgcmVzZXQNCj4gZG9tYWluIGF3YXJlDQo+IA0KPiBPbiA0LzIvMjAyNCAyMjozNSwgVXBhZGh5
YXksIFRlamFzIHdyb3RlOg0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBG
cm9tOiBEZSBNYXJjaGksIEx1Y2FzIDxsdWNhcy5kZW1hcmNoaUBpbnRlbC5jb20+DQo+ID4+IFNl
bnQ6IFdlZG5lc2RheSwgQXByaWwgMywgMjAyNCAyOjI2IEFNDQo+ID4+IFRvOiBSb3BlciwgTWF0
dGhldyBEIDxtYXR0aGV3LmQucm9wZXJAaW50ZWwuY29tPg0KPiA+PiBDYzogVXBhZGh5YXksIFRl
amFzIDx0ZWphcy51cGFkaHlheUBpbnRlbC5jb20+OyBpZ3QtDQo+ID4+IGRldkBsaXN0cy5mcmVl
ZGVza3RvcC5vcmc7IGludGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgQnJvc3QsDQo+ID4+
IE1hdHRoZXcgPG1hdHRoZXcuYnJvc3RAaW50ZWwuY29tPg0KPiA+PiBTdWJqZWN0OiBSZTogW1BB
VENIIFYyIGktZy10XSB0ZXN0cy94ZV9leGVjX3RocmVhZHM6IE1ha2UgaGFuZyB0ZXN0cw0KPiA+
PiByZXNldCBkb21haW4gYXdhcmUNCj4gPj4NCj4gPj4gT24gVHVlLCBBcHIgMDIsIDIwMjQgYXQg
MTI6NDA6MTdQTSAtMDcwMCwgTWF0dCBSb3BlciB3cm90ZToNCj4gPj4+IE9uIFR1ZSwgQXByIDAy
LCAyMDI0IGF0IDA1OjUyOjIzUE0gKzA1MzAsIFRlamFzIFVwYWRoeWF5IHdyb3RlOg0KPiA+Pj4+
IFJDUy9DQ1MgYXJlIGRlcGVuZGVudCBlbmdpbmVzIGFzIHRoZXkgYXJlIHNoYXJpbmcgcmVzZXQg
ZG9tYWluLg0KPiA+Pj4+IFdoZW5ldmVyIHRoZXJlIGlzIHJlc2V0IGZyb20gQ0NTLCBhbGwgdGhl
IGV4ZWMgcXVldWVzIHJ1bm5pbmcgb24NCj4gPj4+PiBSQ1MgYXJlIHZpY3RpbWlzZWQgbWFpbmx5
IG9uIEx1bmFybGFrZS4NCj4gPj4+Pg0KPiA+Pj4+IExldHMgc2tpcCBwYXJhbGxlbCBleGVjdXRp
b24gb24gQ0NTIHdpdGggUkNTLg0KPiA+Pj4gSSBoYXZlbid0IHJlYWxseSBsb29rZWQgYXQgdGhp
cyBzcGVjaWZpYyB0ZXN0IGluIGRldGFpbCwgYnV0IGJhc2VkDQo+ID4+PiBvbiB5b3VyIGV4cGxh
bmF0aW9uIGhlcmUsIHlvdSdyZSBhbHNvIGdvaW5nIHRvIHJ1biBpbnRvIHByb2JsZW1zDQo+ID4+
PiB3aXRoIG11bHRpcGxlIENDUyBlbmdpbmVzIHNpbmNlIHRoZXkgYWxsIHNoYXJlIHRoZSBzYW1l
IHJlc2V0LiAgWW91DQo+ID4+PiB3b24ndCBzZWUgdGhhdCBvbiBwbGF0Zm9ybXMgbGlrZSBMTkwg
dGhhdCBvbmx5IGhhdmUgYSBzaW5nbGUgQ0NTLA0KPiA+Pj4gYnV0IHBsYXRmb3Jtcw0KPiA+PiBi
dXQgaXQgaXMgc2VlbiBvbiBMTkwgYmVjYXVzZSBvZiBoYXZpbmcgYm90aCBSQ1MgYW5kIENDUy4N
Cj4gPj4NCj4gPj4+IGxpa2UgUFZDLCBBVFMtTSwgREcyLCBldGMuIGNhbiBhbGwgaGF2ZSBtdWx0
aXBsZSBDQ1Mgd2hlcmUgYSByZXNldA0KPiA+Pj4gb24gb25lIGtpbGxzIGFueXRoaW5nIHJ1bm5p
bmcgb24gdGhlIG90aGVycy4NCj4gPj4+DQo+ID4+Pg0KPiA+Pj4gTWF0dA0KPiA+Pj4NCj4gPj4+
PiBJdCBoZWxwcyBpbiBmaXhpbmcgZm9sbG93aW5nIGVycm9yczoNCj4gPj4+PiAxLiBUZXN0IGFz
c2VydGlvbiBmYWlsdXJlIGZ1bmN0aW9uIHRlc3RfbGVnYWN5X21vZGUsIGZpbGUsIEZhaWxlZA0K
PiA+Pj4+IGFzc2VydGlvbjogZGF0YVtpXS5kYXRhID09IDB4YzBmZmVlDQo+ID4+Pj4NCj4gPj4+
PiAyLlRlc3QgYXNzZXJ0aW9uIGZhaWx1cmUgZnVuY3Rpb24geGVfZXhlYywgZmlsZQ0KPiA+Pj4+
IC4uL2xpYi94ZS94ZV9pb2N0bC5jLCBGYWlsZWQgYXNzZXJ0aW9uOiBfX3hlX2V4ZWMoZmQsIGV4
ZWMpID09IDAsDQo+ID4+Pj4gZXJyb3I6IC0xMjUgIT0gMA0KPiA+Pj4+DQo+ID4+Pj4gU2lnbmVk
LW9mZi1ieTogVGVqYXMgVXBhZGh5YXkgPHRlamFzLnVwYWRoeWF5QGludGVsLmNvbT4NCj4gPj4+
PiAtLS0NCj4gPj4+PiAgIHRlc3RzL2ludGVsL3hlX2V4ZWNfdGhyZWFkcy5jIHwgMjYgKysrKysr
KysrKysrKysrKysrKysrKysrKy0NCj4gPj4+PiAgIDEgZmlsZSBjaGFuZ2VkLCAyNSBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4+Pj4NCj4gPj4+PiBkaWZmIC0tZ2l0IGEvdGVzdHMv
aW50ZWwveGVfZXhlY190aHJlYWRzLmMNCj4gPj4+PiBiL3Rlc3RzL2ludGVsL3hlX2V4ZWNfdGhy
ZWFkcy5jIGluZGV4IDgwODM5ODBmOS4uMzFhZjYxZGM5IDEwMDY0NA0KPiA+Pj4+IC0tLSBhL3Rl
c3RzL2ludGVsL3hlX2V4ZWNfdGhyZWFkcy5jDQo+ID4+Pj4gKysrIGIvdGVzdHMvaW50ZWwveGVf
ZXhlY190aHJlYWRzLmMNCj4gPj4+PiBAQCAtNzEwLDYgKzcxMCwxNyBAQCBzdGF0aWMgdm9pZCAq
dGhyZWFkKHZvaWQgKmRhdGEpDQo+ID4+Pj4gICAJcmV0dXJuIE5VTEw7DQo+ID4+Pj4gICB9DQo+
ID4+Pj4NCj4gPj4+PiArc3RhdGljIGJvb2wgaXNfZW5naW5lX2NvbnRleHRzX3ZpY3RpbWl6ZWQo
aW50IGZkLCB1bnNpZ25lZCBpbnQNCj4gPj4+PiArZmxhZ3MpIHsNCj4gPj4+PiArCWlmICghSVNf
TFVOQVJMQUtFKGludGVsX2dldF9kcm1fZGV2aWQoZmQpKSkNCj4gPj4+PiArCQlyZXR1cm4gZmFs
c2U7DQo+ID4+IGFzIGFib3ZlLCBJIGRvbid0IHRoaW5rIHdlIHNob3VsZCBhZGQgYW55IHBsYXRm
b3JtIGNoZWNrIGhlcmUuIEl0J3MNCj4gPj4gaW1wb3NzaWJsZSB0byBrZWVwIGl0IHVwIHRvIGRh
dGUgYW5kIGl0J3MgYWxzbyB0ZXN0aW5nIHRoZSB3cm9uZyB0aGluZy4NCj4gPj4gQUZBSVUgeW91
IGRvbid0IHdhbnQgcGFyYWxsZWwgc3VibWlzc2lvbiBvbiBlbmdpbmVzIHRoYXQgc2hhcmUgdGhl
DQo+ID4+IHNhbWUgcmVzZXQgZG9tYWluLiBTbywgdGhpcyBpcyBhY3R1YWxseSB3aGF0IHNob3Vs
ZCBiZSB0ZXN0ZWQuDQo+ID4gUGxhdGZvcm1zIGxpa2UgIFBWQywgQVRTLU0sIERHMiwgZXRjLiBo
YXZlIHNvbWUga2luZCBvZiBXQS9ub1dBIHdoaWNoDQo+IGhlbHBzIHRvIHJ1biB0aGluZ3MgcGFy
YWxsZWxseSBvbiBlbmdpbmVzIGluIHNhbWUgcmVzZXQgZG9tYWluIGFuZCBhcHBhcmVudGx5DQo+
IEJNRy9MTkwgZG9lcyBub3QgaGF2ZSB0aGF0IGtpbmQgb2Ygc3VwcG9ydCBzbyBhcHBsaWNhYmxl
IGZvciBMTkwvQk1HIHdpdGgNCj4gcGFyYWxsZWwgc3VibWlzc2lvbiBvbiBSQ1MvQ0NTIG9ubHku
DQo+ID4NCj4gPiBASGFycmlzb24sIEpvaG4gQyBwbGVhc2UgcmVwbHkgaWYgeW91IGhhdmUgYW55
IG90aGVyIGlucHV0IGhlcmUuDQo+IEkgZG9uJ3QgZ2V0IHdoYXQgeW91IG1lYW4gYnkgJ2hhdmUg
c29tZSBraW5kIG9mIFdBL25vV0EnLiBBbGwgcGxhdGZvcm1zDQo+IHdpdGggY29tcHV0ZSBlbmdp
bmVzIGhhdmUgc2hhcmVkIHJlc2V0IGRvbWFpbnMuIFRoYXQgaXMgYWxsIHRoZXJlIGlzIHRvIGl0
LiBJLmUuDQo+IGV2ZXJ5dGhpbmcgZnJvbSBUR0wgb253YXJkcy4gVGhhdCBpbmNsdWRlcyBSQ1Mg
YW5kIGFsbCBDQ1MgZW5naW5lcy4gU28gUkNTICsNCj4gQ0NTLCBDQ1MwICsgQ0NTMSwgUkNTICsg
Q0MwICsgQ0NTMSwgZXRjLiBBbnkgcGxhdGZvcm0gd2l0aCBtdWx0aXBsZSBlbmdpbmVzDQo+IHRo
YXQgdGFsayB0byBFVXMgd2lsbCByZXNldCBhbGwgb2YgdGhvc2UgZW5naW5lcyBpbiBwYXJhbGxl
bC4NCj4gDQo+IFRoZXJlIGFyZSB3L2EncyB3aGljaCBtYWtlIHRoZSBzaXR1YXRpb24gZXZlbiB3
b3JzZS4gRS5nLiBvbiBERzIvTVRMIHlvdQ0KPiBhcmUgbm90IGFsbG93ZWQgdG8gY29udGV4dCBz
d2l0Y2ggb25lIG9mIHRob3NlIGVuZ2luZXMgd2hpbGUgYW5vdGhlciBpcyBidXN5Lg0KPiBXaGlj
aCBtZWFucyB0aGF0IGlmIG9uZSBoYW5ncywgdGhleSBhbGwgaGFuZyAtIHlvdSBjYW5ub3QganVz
dCB3YWl0IGZvciBvdGhlcg0KPiB3b3JrbG9hZHMgdG8gY29tcGxldGUgYW5kL29yIHByZS1lbXB0
IHRoZW0gb2ZmIHRoZSBlbmdpbmUgcHJpb3IgdG8gZG9pbmcNCj4gdGhlIHNoYXJlZCByZXNldC4g
QnV0IHRoZXJlIGlzIG5vdGhpbmcgdGhhdCBtYWtlcyBpdCBiZXR0ZXIuDQo+IA0KPiBJIGFzc3Vt
ZSB3ZSBhcmUgdGFsa2luZyBhYm91dCBHdUMgdHJpZ2dlcmVkIGVuZ2luZSByZXNldHMgaGVyZT8g
QXMgb3Bwb3NlZA0KPiB0byBkcml2ZXIgdHJpZ2dlcmVkIGZ1bGwgR1QgcmVzZXRzPw0KPiANCj4g
VGhlIEd1QyB3aWxsIGF0dGVtcHQgdG8gaWRsZSBhbGwgb3RoZXIgY29ubmVjdGVkIGVuZ2luZXMg
Zmlyc3QgYnkgcHJlLWVtcHRpbmcNCj4gb3V0IGFueSBleGVjdXRpbmcgY29udGV4dHMuIElmIHRo
b3NlIGNvbnRleHRzIGFyZSBwcmUtZW1wdGlibGUgdGhlbiB0aGV5IHdpbGwNCj4gc3Vydml2ZSAt
IEd1QyB3aWxsIGF1dG9tYXRpY2FsbHkgcmVzdGFydCB0aGVtIG9uY2UgdGhlIHJlc2V0IGlzIGNv
bXBsZXRlLiBJZg0KPiB0aGV5IGFyZSBub3QgKG9yIGF0IGxlYXN0IG5vdCBwcmUtZW1wdGlibGUg
d2l0aGluIHRoZSBwcmUtZW1wdGlvbiB0aW1lb3V0DQo+IGxpbWl0KSB0aGVuIHRoZXkgd2lsbCBi
ZSBraWxsZWQgYXMgY29sbGF0ZXJhbCBkYW1hZ2UuDQo+IA0KPiBXaGF0IGFyZSB0aGUgd29ya2xv
YWRzIGJlaW5nIHN1Ym1pdHRlZCBieSB0aGlzIHRlc3Q/IEFyZSB0aGUgcHJlLWVtcHRpYmxlDQo+
IHNwaW5uZXJzPyBJZiBzbywgdGhlbiB0aGV5IHNob3VsZCBzdXJ2aXZlIChhc3N1bWluZyB5b3Ug
ZG9uJ3QgaGF2ZSB0aGUNCj4gREcyL01UTCBSQ1MvQ0NTIHcvYSBpbiBlZmZlY3QpLiBJZiB0aGV5
IGFyZSBub24tcHJlZW1wdGlibGUgc3Bpbm5lcnMgdGhlbg0KPiB0aGV5IGFyZSB0b2FzdC4NCg0K
TWFpbiBxdWVzdGlvbiBoZXJlIHdhcywgaWYgdGhpcyBmaXggc2hvdWxkIGJlIGFwcGxpZWQgdG8g
YWxsIHBsYXRmb3JtcyB3aG8gaGFzIFJDUyBhbmQgQ0NTIGJvdGggb3IganVzdCBMTkwvQk1HLiBS
ZWFzb24gdG8gYXNrIGlzLCBvbmx5IExOTC9CTUcgYXJlIGhpdHRpbmcgdGhpcyBpc3N1ZSwgd2l0
aCBzYW1lIHRlc3RzIFBWQyBhbmQgb3RoZXIgcGxhdGZvcm1zIGFyZSBub3QgaGl0dGluZyBpc3N1
ZSB3aGljaCB3ZSBhcmUgYWRkcmVzc2luZyBoZXJlLg0KDQpUaGFua3MsDQpUZWphcw0KPiANCj4g
Sm9obi4NCj4gDQo+IA0KPiA+DQo+ID4gVGhhbmtzLA0KPiA+IFRlamFzDQo+ID4+IEx1Y2FzIERl
IE1hcmNoaQ0KPiA+Pg0KPiA+Pj4+ICsNCj4gPj4+PiArCWlmIChmbGFncyAmIEhBTkcpDQo+ID4+
Pj4gKwkJcmV0dXJuIHRydWU7DQo+ID4+Pj4gKw0KPiA+Pj4+ICsJcmV0dXJuIGZhbHNlOw0KPiA+
Pj4+ICt9DQo+ID4+Pj4gKw0KPiA+Pj4+ICAgLyoqDQo+ID4+Pj4gICAgKiBTVUJURVNUOiB0aHJl
YWRzLSVzDQo+ID4+Pj4gICAgKiBEZXNjcmlwdGlvbjogUnVuIHRocmVhZHMgJWFyZ1sxXSB0ZXN0
IHdpdGggbXVsdGkgdGhyZWFkcyBAQA0KPiA+Pj4+IC05NTUsOSArOTY2LDEzIEBAIHN0YXRpYyB2
b2lkIHRocmVhZHMoaW50IGZkLCBpbnQgZmxhZ3MpDQo+ID4+Pj4gICAJYm9vbCBnbyA9IGZhbHNl
Ow0KPiA+Pj4+ICAgCWludCBuX3RocmVhZHMgPSAwOw0KPiA+Pj4+ICAgCWludCBndDsNCj4gPj4+
PiArCWJvb2wgaGFzX3JjcyA9IGZhbHNlOw0KPiA+Pj4+DQo+ID4+Pj4gLQl4ZV9mb3JfZWFjaF9l
bmdpbmUoZmQsIGh3ZSkNCj4gPj4+PiArCXhlX2Zvcl9lYWNoX2VuZ2luZShmZCwgaHdlKSB7DQo+
ID4+Pj4gKwkJaWYgKGh3ZS0+ZW5naW5lX2NsYXNzID09IERSTV9YRV9FTkdJTkVfQ0xBU1NfUkVO
REVSKQ0KPiA+Pj4+ICsJCQloYXNfcmNzID0gdHJ1ZTsNCj4gPj4+PiAgIAkJKytuX2VuZ2luZXM7
DQo+ID4+Pj4gKwl9DQo+ID4+Pj4NCj4gPj4+PiAgIAlpZiAoZmxhZ3MgJiBCQUxBTkNFUikgew0K
PiA+Pj4+ICAgCQl4ZV9mb3JfZWFjaF9ndChmZCwgZ3QpDQo+ID4+Pj4gQEAgLTk5MCw2ICsxMDA1
LDE1IEBAIHN0YXRpYyB2b2lkIHRocmVhZHMoaW50IGZkLCBpbnQgZmxhZ3MpDQo+ID4+Pj4gICAJ
fQ0KPiA+Pj4+DQo+ID4+Pj4gICAJeGVfZm9yX2VhY2hfZW5naW5lKGZkLCBod2UpIHsNCj4gPj4+
PiArCQkvKiBSQ1MvQ0NTIHNoYXJpbmcgcmVzZXQgZG9tYWluIGhlbmNlIGRlcGVuZGVudCBlbmdp
bmVzLg0KPiA+Pj4+ICsJCSAqIFdoZW4gQ0NTIGlzIGRvaW5nIHJlc2V0LCBhbGwgdGhlIGNvbnRl
eHRzIG9mIFJDUyBhcmUNCj4gPj4+PiArCQkgKiB2aWN0aW1pemVkLCBzbyBza2lwIHRoZSBjb21w
dXRlIGVuZ2luZSBhdm9pZGluZw0KPiA+Pj4+ICsJCSAqIHBhcmFsbGVsIGV4ZWN1dGlvbiB3aXRo
IFJDUw0KPiA+Pj4+ICsJCSAqLw0KPiA+Pj4+ICsJCWlmIChoYXNfcmNzICYmIGh3ZS0+ZW5naW5l
X2NsYXNzID09DQo+ID4+IERSTV9YRV9FTkdJTkVfQ0xBU1NfQ09NUFVURSAmJg0KPiA+Pj4+ICsJ
CSAgICBpc19lbmdpbmVfY29udGV4dHNfdmljdGltaXplZChmZCwgZmxhZ3MpKQ0KPiA+Pj4+ICsJ
CQljb250aW51ZTsNCj4gPj4+PiArDQo+ID4+Pj4gICAJCXRocmVhZHNfZGF0YVtpXS5tdXRleCA9
ICZtdXRleDsNCj4gPj4+PiAgIAkJdGhyZWFkc19kYXRhW2ldLmNvbmQgPSAmY29uZDsNCj4gPj4+
PiAgICNkZWZpbmUgQUREUkVTU19TSElGVAkzOQ0KPiA+Pj4+IC0tDQo+ID4+Pj4gMi4yNS4xDQo+
ID4+Pj4NCj4gPj4+IC0tDQo+ID4+PiBNYXR0IFJvcGVyDQo+ID4+PiBHcmFwaGljcyBTb2Z0d2Fy
ZSBFbmdpbmVlcg0KPiA+Pj4gTGludXggR1BVIFBsYXRmb3JtIEVuYWJsZW1lbnQNCj4gPj4+IElu
dGVsIENvcnBvcmF0aW9uDQoNCg==
