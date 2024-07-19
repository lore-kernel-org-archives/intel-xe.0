Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCB2BC3DA5D
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jul 2024 19:00:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1D8010EC9C;
	Fri, 19 Jul 2024 19:00:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X+d88xj5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3258D10EC9C
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Jul 2024 19:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721415636; x=1752951636;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=2NYRBTUMSIGx5SCxypyuronmiEc/t9okdHUFFbg47+w=;
 b=X+d88xj5GyTOs3fwoRlBb7V3+lAum/UlToDd3PBWBi55kUqnap3AIUDK
 MLB7UREehTBhmiOgDDtQR4D/vHlp4i1FA9/cUiHov9P2uRdDwEGq/MVQH
 5YBG2B222/lU8OL0BwWZ4cvXCC4TRfcXlpNlab88bPFBYUco5Jq0rSWdk
 9P8j+2yOnlOTuEKBUzTOUDBbQsbMTVtSnFtqmV2UW4fLeXUKpsN1sHqTO
 4O9OPSvyh8xL+rm9E0F+/HYVEkdHVxSTigLlp8XZi1HrKrlHEMwgoGYDn
 ctjL3oNoP4gLBEijctz0TPRhwPTKpq5K6JghPib3f0bSCl3xzoab6XfL3 g==;
X-CSE-ConnectionGUID: QOigD7yFSu6g42rXrTFmuQ==
X-CSE-MsgGUID: Q8xq6IIgSQOUxnlz5XHw0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11138"; a="22913981"
X-IronPort-AV: E=Sophos;i="6.09,221,1716274800"; d="scan'208";a="22913981"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2024 12:00:35 -0700
X-CSE-ConnectionGUID: hf3rY35aQNCKC57YzGco+Q==
X-CSE-MsgGUID: SbNT5fGgSUKCvWvK68PI/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,221,1716274800"; d="scan'208";a="51238979"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Jul 2024 12:00:35 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 19 Jul 2024 12:00:34 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 19 Jul 2024 12:00:34 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 19 Jul 2024 12:00:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FG/8Woko91aVoIBu9ZFN5DthpOi+KVkBpIq5ncXtyM3hwSr6xeLmmxnEPtnLilZjW4BXwAkRnI9nBNPk8KFAq6WGVGHf6hqxkIRg7sOhEPR7cyw40nwB6/GT2094Rr8THRnHMQiTHosWLk2B1lRwI85Bp8WZoTh4ggTeJbaqqqIPst34irrH+Zhaj4CFD3R4SqZYstOcqbKsaeR3+HiuieMJcSbeOGdKhElwZbt93QnwinzrfYMTKacVmS1DaM1t4qLj6pkmCZLnmhLkcH5czl8RUG4qbWMZCc7OlpKSfYpMuPILpsJ0Dsb4YqAiqF9nzAkXbwJFujvpREAB3NQHTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2NYRBTUMSIGx5SCxypyuronmiEc/t9okdHUFFbg47+w=;
 b=GjbWSvrS/YTl7Db8MxFdUS+27Pailw0Uo4t0KcURB/KdilTGycLYsV/KCe3EfKoeisvzWGHYaIZBdZMr3e2Wd4hRfs5+uECHx/ptOHyJK+inc/9K2Z7lAeNxk3PE3xZxrgrrubeu2IuX+xuNfDnU0eqkL6HZ6TD1utG6s5L7R+9CfN5vNVQio5m4UNQpveIj/Kt+e2IWI8du+tZ5AKSaFd2UAH9c2mix8C1ieOUc1GOw9m50dGmV7ofsoYH40w877HWzEY//uDSsWpEhbsNAXZmuKDtzDg5dj4PDa9hZvhfl6Zv2xYqABgFvZxPNnIOiy445y8+xE4arEhxIFnBg/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 SA1PR11MB7086.namprd11.prod.outlook.com (2603:10b6:806:2b3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.14; Fri, 19 Jul
 2024 19:00:31 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%3]) with mapi id 15.20.7784.013; Fri, 19 Jul 2024
 19:00:31 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Harrison, John C" <john.c.harrison@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "Welty, Brian" <brian.welty@intel.com>
Subject: Re: [PATCH 3/3] drm/xe/guc: Bump the G2H queue size to account for
 page faults
Thread-Topic: [PATCH 3/3] drm/xe/guc: Bump the G2H queue size to account for
 page faults
Thread-Index: AQHa2gVUUIaVhanCuUeW5re80KWxprH+WdKAgAAN+4A=
Date: Fri, 19 Jul 2024 19:00:31 +0000
Message-ID: <de055d36423cb3b1a3480c146db4238029bedd38.camel@intel.com>
References: <cover.1721411802.git.stuart.summers@intel.com>
 <6a9eaa520c06e49b6f4b259f0447d17635bf6bc1.1721411802.git.stuart.summers@intel.com>
 <ZpqsE6BEB52jnuqP@DUT025-TGLU.fm.intel.com>
In-Reply-To: <ZpqsE6BEB52jnuqP@DUT025-TGLU.fm.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|SA1PR11MB7086:EE_
x-ms-office365-filtering-correlation-id: 73ac488f-12c1-4eb2-d386-08dca825102a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?U0JFOTVaNmdaSm8zdWs3VTA1OWdpWStSeTZaL1NuR3J0Q2VJZWpBeE1MZXFi?=
 =?utf-8?B?QkZRNnJBczF5SWJOdW5maWoxVEMvUzRRVHVQeFpuQnkxMjJveTNhbVhUN3k1?=
 =?utf-8?B?OWp0SGxKOHA4K1JBUE9GQ0tOZGpPL29JRzhkQzEvU0N3SWNGeXQ1Z2FNWVlX?=
 =?utf-8?B?aHRvMWFqTktOcW5USjE3UThndzNBbWdaVFVkcjVoNkV6WTFISFZmQkoyamhk?=
 =?utf-8?B?amZvY2huTHkvVVlDMktjMC9yZ1d0dy90MWtTdzhsRWFXblltWUVnRitPSysw?=
 =?utf-8?B?ZU56T3ZDUmg0TkRPcnZIbStwNHV1bXRRU2VOVVBuTWJ3Vk0wbHJIbXV5MXdK?=
 =?utf-8?B?RWRjMHJ1aldIL2ZUM2p3Sk1BZXZNa29GN3dFOHlpNWhZK1hWUmg5cW9FeFBI?=
 =?utf-8?B?NG1CTlpjd1BqWURiZkpwazRlZWl4Wmt2ZnJYNVBNV2ZaMng3ZjZ5ODR4Uk9t?=
 =?utf-8?B?KytWRHJvcnAvWjNpVlJZRW9zVzVDN2VlN2M0alNhM3U5NkJ6ZXhWVmVpN1Fv?=
 =?utf-8?B?czhXS0lUVlZxcksweHg1YTUycUM0MjJqcmp3a25kRGVhUkNtd0o4bDlGdHlH?=
 =?utf-8?B?Q0pVQVNmWkFHMmRvWnhXUkFvaFdPVXl1ZitLRng1SUduM2VZcGtLNGtSVkxF?=
 =?utf-8?B?a253Wk45VnJwL2UyemFEeGhxZ2d0Q1pIM3MwNDNvQkRxazNPNTZvWlF1RCt3?=
 =?utf-8?B?bHJHa3oxUUQ2RUhJUlFTa29KVkZMbVd6SXlyYU03SS9aQUJFZ0U3QkNJL2t6?=
 =?utf-8?B?eXE3T1pDWUtqZTgwQ1BMVWNRT3M3cWUxd2pSTGNnV1JPS2VJRWpMbTRURFJ1?=
 =?utf-8?B?OUlmTUZaUWdjaUFJUHd5RHZFYjllVEp1Y3hxQk1EM0s2TUZFTzhMM1RlOU42?=
 =?utf-8?B?dys4V040Zlo1ZDZ5UFBaYk5CUlgxYzBXamhoY0JUNmtFMWZYYmcvRTVVaU9S?=
 =?utf-8?B?M1NZenBJK3FlNWlQWFgxVzNHOXp3ZXlmS3NvMXdFcnBrN0w1c1ZFMmw2Y3l4?=
 =?utf-8?B?eEVpT0x0U1hsYWRWM3hTZlN5aDNOKzMzSWM3M1BPU0d1S0xoQWYwUGpyaUxV?=
 =?utf-8?B?TFRsaStPQnR0aHhKMy9PTHpWTjBBaFNmcG42SHNSSzVmc0dGbGdyMmVxSWJ5?=
 =?utf-8?B?amxkQS90WXNiNm54MEpWSHEzbjI3cGl1citsUk5BelZaendwK0htTGJWTUZX?=
 =?utf-8?B?dFNBQ1ZKWURTUVFyaWcybkt5K1B2T21zdFBUaTkyYjJJSnovbCsxRTBHbnBR?=
 =?utf-8?B?Q3VhMVl5UjdUVFI2eGgxSnhqSjcyKzJTUTZNQWJwTnhxZXpoRWl5cmZKbGNU?=
 =?utf-8?B?NjI4Wkg3bjZQT2w2V2F0aFBRZ1pRaERGRFpKQkh4K2pxN1N0bUFRQTlkWThB?=
 =?utf-8?B?RVBlNStIZms4VEZiYlpJdlVjbDBrWUQ2MVRxQ25YaTNPSWJHQmpiSi9KV3Ur?=
 =?utf-8?B?dmJNdkFRVkJ6OWdKNzhqaEoxZW1pUWJUNnU0a1dOVG8xb1cyWGdjUm05MjBl?=
 =?utf-8?B?RUh4TTJRNnJPdUhlWlYrL0pkUWcrVHNtNWN6RHBneDJVVnkwZEtJNW9OZXJi?=
 =?utf-8?B?b1N6dEZMYmF2dXFGc1IrSm5HVmVwNnluQmxZcTRLdHI2aFNtQ1QzVFd4bXNw?=
 =?utf-8?B?SXhnL2NyMEJIeC9kbUZkSnNYbEFYU3FPQVcvZ1JzMXZZcmlldHU3WVI5SHVO?=
 =?utf-8?B?V2lrKzBtdmZBclAyckIwOUdLOFNPSmZpalUvZWtRL2twK3FYQ1ZzNmF3SUtv?=
 =?utf-8?B?RmVvMTBSMTVpL1V3b2p0MnF3MnhtYUdtaWw5VDZrczFSSjc0R0JaOWFCZS9Q?=
 =?utf-8?B?YmRra1lkbWVWcmYxbWZMWWtkOXZJZEdCYjE3T2VKVk1CSkQvbkg3Sk1PZER4?=
 =?utf-8?B?L1VIUW8rTGswUzg3SWV2aHYxNm1jSS9jd21KMFRRaFZCWFE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?elQvdjV4WEt1c1k5VmRIanl4OC9LeHNabG5KWjZSRzdLV21aSDBhcXpMYVl0?=
 =?utf-8?B?cHNLcDEvVEgwVStvcFdNd0Y5cm9leVMrZzBmY3JzRDdHUmVKaTYzTnRFVFJK?=
 =?utf-8?B?N0VvVC91UGxZU1FoakNVc1VmS3lVODZqUDFpN1M1aGFMc0dZMWJ5SEpWVERi?=
 =?utf-8?B?V1laejJHUzQzMjhDTUFCUXlRVzR1Sm9NU2kyL3BENUp6bGo1WllZNkhJMjRr?=
 =?utf-8?B?bkRhSHdRMXdkaFhKQlpEbnUrNXJRTk1kMmkvUEhFQzJUeEFGcjU2aGxrUlFl?=
 =?utf-8?B?TFdtdDczVGZaMlBxTGRGTjVBLzZqVTg0amZuWVBtUlB5dXhiaTEyY1phL2Zh?=
 =?utf-8?B?ZGFCa1cxR0xORjd2RHdRNUJ1R1ZVZ0taenI0MFBBM0FoRjVNR295SVBrQWRH?=
 =?utf-8?B?SGFGMXZvcmxUcHhpQTZITldZM0hjbkxHd09zcXpSOTB4WlQra1JOd09EY1lK?=
 =?utf-8?B?enpRS3o0RWszT29RZzJWK2gxZWlHY0EyOStzQXpONHVIYjdhL2dzUkgxeXpX?=
 =?utf-8?B?dndTRDVMelVTT0Z4cVB2SHRaZXBqRGtvd1JWcjB6R241QTFGREhydlRLYVkw?=
 =?utf-8?B?Z2VWbllyYSs5a1JFNE52czlzTHljeHBRYmxQSFYzeGhpbDZURzRrc2ZuRSt2?=
 =?utf-8?B?RUM2SXlLTVdBR2JodjRBM1V1YXVvOW8xYmJ4Z3Y5b21KajN4YTJWWU9HcFJn?=
 =?utf-8?B?M0JRVU1OYnpuQ2xEN2NEeTh2Z0RLbzdteHZLWGhKdnVNdW1pUEovUndvc01P?=
 =?utf-8?B?dnRjbnJKWWVCRkl2aHNrNnl2cXg0WW9rUmlxUDJYdnV2L0x5VGMrbDVrTTBZ?=
 =?utf-8?B?eVFxdUpuN0lkWXZWaHl1SkRsUkdpZTU3TUNMVlFZMDZVTjVaT3FqQ3dtOEN6?=
 =?utf-8?B?cklsd002SWNFQXdtWjhJNW1ZeTFuMllwNmN2OUkya21zVldLdVI2SHZTeURh?=
 =?utf-8?B?Wjc3dlA1OVlGU2syMDhFM1NMRU5qZmJoM0NuekNHUExPeHhlYWRweFFqd1JO?=
 =?utf-8?B?clJLelp4dU4zZkpNUy9hUnN2Tkh5M2JSSWI3dWMzNnNDd0U0dHdBK2tCa1BH?=
 =?utf-8?B?UmY3WjducnFseWUxMU9saStKMHFzS0owV0RtSi9LekJmcWtJKzQ2VFhLRVBn?=
 =?utf-8?B?TGp6c0w1cVI5WDQ2YnNOdmxrdno2L0twNzI5U21hbnpQOFYzeTZ2VnNHd2NP?=
 =?utf-8?B?cVhxeVVtOU5laHNSUnlxRHppTFgyQjg3Zy9JZHNJWGVlSTVoZnlXdCtnaVlq?=
 =?utf-8?B?NlBPWkF3cWpXTEIxYW1heVJoRlF1bktSbi9VbnRXV1E2dUpWL05OdmRpYmlq?=
 =?utf-8?B?MFBpOFU0TTB5a3o3VGtpall2emRHOHhaTHBjV1A5blZzUFk2RklrdkVIVjlo?=
 =?utf-8?B?SUY1M2VFV285THJGZ3lnamVUcnRzSUtJRUdsWi9CUFQxeHAvT1cxZCttWVpN?=
 =?utf-8?B?cUV3aUtRMEpQVytnRHVVN0VnQnc5cUErN0JPbEJ2K3RVTC9TdTJaaThnb085?=
 =?utf-8?B?ckdZZEszZm9XVnVjbFBhYWF0VkNWTEdvb1A0aldkS0JIL1JhMmRncjMvRjFO?=
 =?utf-8?B?QXRxaHZoZndKb0VrUmlZN2NldG5pU040cFNoVVZmYWxoWlM3YWVYcnVHODFr?=
 =?utf-8?B?WWxlbnV6NVpiSHMvNU1kb3JIV2QvdnczaFR2cDVzbEk1YjlQMkNZVmJTaXZx?=
 =?utf-8?B?Z3hsL0FyVXh5S2lMV0lnVEFmbmx4bDloYVVacVVGTVJPNnNOdGNmZng1UGp1?=
 =?utf-8?B?azczcFI5c1RveXBnUHdnalRjZjQxcVZqWkgxWHExelJpb0RXRHBTdVNsQUxQ?=
 =?utf-8?B?eGhxdGI1c1pwd2w3VnFvN3U1THl3bElXWmxwZnB3Mzc4eU83R3pIZFY1ditG?=
 =?utf-8?B?akVaSEpnZlJRSEN5S2pvQ2N1MWs3aEx4eDRiYThRSTUyaGVwaVRtUVRncjh1?=
 =?utf-8?B?a25qQVkrMTNLUnViVVA4ZmxKYXJ4d1pPQkpJWFRpYWF4WmtibHREWkUrSXZr?=
 =?utf-8?B?cndlZEw3TDFHajN3RVNqU1B3RGQySmczaEpIdVZVN0EzSGNTTGhtSXNKanlk?=
 =?utf-8?B?bXE3NGhvWnFKc3JIc0hDSW9uTElTbU5samh0bVg5WS9jK1E1QnpINXBMa0hJ?=
 =?utf-8?B?MC9zVTRwTW9Bc0xCeitCKytJOUJEai9EYkY2Rk5qdFNlL3dGUy9oWEFYQ291?=
 =?utf-8?B?WHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0A80C7FB90EA664DA3B708362FB30BE9@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73ac488f-12c1-4eb2-d386-08dca825102a
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2024 19:00:31.7849 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4t/LfZfCq+UKoP8jKH/S0xz69njVW47DnjIVFBzDKHfkw4gEakeLLT+9/D9zEy/aCG19bf5PjkqzTM7AkTc1WLireSXhhcEtiXEdrbuQEKQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7086
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

T24gRnJpLCAyMDI0LTA3LTE5IGF0IDE4OjEwICswMDAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOg0K
PiBPbiBGcmksIEp1bCAxOSwgMjAyNCBhdCAwNTo1ODoyOFBNICswMDAwLCBTdHVhcnQgU3VtbWVy
cyB3cm90ZToNCj4gPiBXaXRoIHRoZSBpbmNyZWFzZSBpbiB0aGUgc2l6ZSBvZiB0aGUgcmVjb3Zl
cmFibGUgcGFnZSBmYXVsdA0KPiA+IHF1ZXVlLCB3ZSB3YW50IHRvIGVuc3VyZSB0aGUgaW5pdGlh
bCBtZXNzYWdlcyBmcm9tIEd1QyBpbg0KPiA+IHRoZSBHMkggYnVmZmVyIGhhdmUgc3BhY2Ugd2hp
bGUgd2UgdHJhbnNmZXIgdGhvc2Ugb3V0IHRvIHRoZQ0KPiA+IGFjdHVhbCBwZl9xdWV1ZS4gQnVt
cCB0aGUgRzJIIHF1ZXVlIHNpemUgdG8gYWNjb3VudCBmb3IgdGhpcw0KPiA+IGluY3JlYXNlIGlu
IHRoZSBwZl9xdWV1ZSBzaXplLg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IFN0dWFydCBTdW1t
ZXJzIDxzdHVhcnQuc3VtbWVyc0BpbnRlbC5jb20+DQo+ID4gLS0tDQo+ID4gwqBkcml2ZXJzL2dw
dS9kcm0veGUveGVfZ3VjX2N0LmMgfCAxMCArKysrKysrKystDQo+ID4gwqAxIGZpbGUgY2hhbmdl
ZCwgOSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfY3QuYw0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX2d1Y19jdC5jDQo+ID4gaW5kZXggN2QyZTkzN2RhMWQ4Li4zMTM1ZjU4MTI4MjcgMTAwNjQ0
DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19jdC5jDQo+ID4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX2d1Y19jdC5jDQo+ID4gQEAgLTEwNSwxMSArMTA1LDE5IEBAIGN0
X3RvX3hlKHN0cnVjdCB4ZV9ndWNfY3QgKmN0KQ0KPiA+IMKgICogZW5vdWdoIHNwYWNlIHRvIGF2
b2lkIGJhY2twcmVzc3VyZSBvbiB0aGUgZHJpdmVyLiBXZSBpbmNyZWFzZQ0KPiA+IHRoZSBzaXpl
DQo+ID4gwqAgKiBvZiB0aGUgcmVjZWl2ZSBidWZmZXIgKHJlbGF0aXZlIHRvIHRoZSBzZW5kKSB0
byBlbnN1cmUgYSBHMkgNCj4gPiByZXNwb25zZQ0KPiA+IMKgICogQ1RCIGhhcyBhIGxhbmRpbmcg
c3BvdC4NCj4gPiArICoNCj4gPiArICogSW4gYWRkaXRpb24gdG8gc3VibWlzc2lvbnMsIHRoZSBH
MkggYnVmZmVyIG5lZWRzIHRvIGJlIGFibGUgdG8NCj4gPiBob2xkDQo+ID4gKyAqIGVub3VnaCBz
cGFjZSBmb3IgcmVjb3ZlcmFibGUgcGFnZSBmYXVsdCBub3RpZmljYXRpb25zLiBUaGUNCj4gPiBu
dW1iZXIgb2YNCj4gPiArICogcGFnZSBmYXVsdHMgaXMgaW50ZXJydXB0IGRyaXZlbiBhbmQgY2Fu
IGJlIGFzIG11Y2ggYXMgdGhlDQo+ID4gbnVtYmVyIG9mDQo+ID4gKyAqIGNvbXB1dGUgcmVzb3Vy
Y2VzIGF2YWlsYWJsZS4gSG93ZXZlciwgbW9zdCBvZiB0aGUgYWN0dWFsIHdvcmsNCj4gPiBmb3Ig
dGhlc2UNCj4gPiArICogaXMgaW4gYSBzZXBhcmF0ZSBwYWdlIGZhdWx0IHdvcmtlciB0aHJlYWQu
IFRoZXJlZm9yZSB3ZSBvbmx5DQo+ID4gbmVlZCB0bw0KPiA+ICsgKiBtYWtlIHN1cmUgdGhlIHF1
ZXVlIGhhcyBlbm91Z2ggc3BhY2UgdG8gaGFuZGxlIGFsbCBvZiB0aGUNCj4gPiBzdWJtaXNzaW9u
cw0KPiA+ICsgKiBhbmQgcmVzcG9uc2VzIGFuZCBhbiBleHRyYSBidWZmZXIgZm9yIGluY29taW5n
IHBhZ2UgZmF1bHRzLg0KPiA+IMKgICovDQo+ID4gwqANCj4gPiDCoCNkZWZpbmUgQ1RCX0RFU0Nf
U0laRcKgwqDCoMKgwqDCoMKgwqDCoMKgQUxJR04oc2l6ZW9mKHN0cnVjdA0KPiA+IGd1Y19jdF9i
dWZmZXJfZGVzYyksIFNaXzJLKQ0KPiA+IMKgI2RlZmluZSBDVEJfSDJHX0JVRkZFUl9TSVpFwqDC
oMKgwqAoU1pfNEspDQo+ID4gLSNkZWZpbmUgQ1RCX0cySF9CVUZGRVJfU0laRcKgwqDCoMKgKDQg
KiBDVEJfSDJHX0JVRkZFUl9TSVpFKQ0KPiA+ICsjZGVmaW5lIENUQl9HMkhfQlVGRkVSX1NJWkXC
oMKgwqDCoCgxNiAqIENUQl9IMkdfQlVGRkVSX1NJWkUpDQo+ID4gwqAjZGVmaW5lIEcySF9ST09N
X0JVRkZFUl9TSVpFwqDCoMKgKENUQl9HMkhfQlVGRkVSX1NJWkUgLyA0KQ0KPiANCj4gU28gSSB0
aGluayBHMkhfUk9PTV9CVUZGRVJfU0laRSBuZWVkcyB0byBiZSByb3VnaGx5IDY0ayBhcyB0aGlz
IGlzDQo+IHRoZQ0KPiBwYXJ0IG9mIHRoZSBDVEIgdG8gc2luayB1bnNvbGljYXRlZCBHMkguIFNv
IGhvdyBhYm91dC4uLg0KPiANCj4gI2RlZmluZSBDVEJfRzJIX0JVRkZFUl9TSVpFwqDCoMKgwqDC
oFNaXzEyOEsNCj4gI2RlZmluZSBHMkhfUk9PTV9CVUZGRVJfU0laRcKgwqDCoMKgKENUQl9HMkhf
QlVGRkVSX1NJWkUgLyAyKQ0KPiANCj4gVGhlIGNvc3Qgb2YgdGhlIGxhcmdlciBidWZmZXJzIGxp
a2UgdGhpcyBpcyBhIGxpdHRsZSBtb3JlIGNhY2hlDQo+IGZvb3RwcmludCBidXQgSSB0aGluayB3
ZSBoYXZlIGxpdmUgd2l0aCB0aGF0IHVudGlsIHRoaXMgcHJvcGVybHkNCj4gZml4ZWQNCj4gaW4g
dGhlIEd1Qy4NCg0KTWFrZXMgc2Vuc2UgdG8gbWUsIEknbGwgcHVzaCBhIG5ldyBzZXJpZXMgaGVy
ZSBzaG9ydGx5Lg0KDQpUaGFua3MsDQpTdHVhcnQNCg0KPiANCj4gTWF0dA0KPiANCj4gPiDCoA0K
PiA+IMKgLyoqDQo+ID4gLS0gDQo+ID4gMi4zNC4xDQo+ID4gDQoNCg==
