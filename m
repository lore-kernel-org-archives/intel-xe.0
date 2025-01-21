Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98A1DC02182
	for <intel-xe@archiver.kernel.org>; Tue, 21 Jan 2025 17:42:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58B2410E615;
	Tue, 21 Jan 2025 17:42:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oDvHeu7w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 363E810E615
 for <Intel-Xe@lists.freedesktop.org>; Tue, 21 Jan 2025 17:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737481360; x=1769017360;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=Rtik55XCt66wOeMODQ5f5ZaDh1CnVOcqkgg6PxUL7g0=;
 b=oDvHeu7wuO9gJqXx9+aMyWmuWQkJKWRvrRuACt7zks4aaTmqnIdMLWcS
 LHBd0gE1NlWevYiE0bJFFk7FwSPXK3DtMYqI3+/qXJp5JBP0xmmFxkycH
 pzlYJcLWSaE+Pp8EqeF33WNNMuTv5lKe14mDSqJEgkLbjzExfCr+6lgRC
 e4RSCtuOf8cpiXCPZRstsDEcRRM45PRsc4aqNOUhaUO/JGypDZEwdJL4n
 be5arZcf9MV6kjLRqMPkuw+4J8DXXvyTJx2NnyrM/MOTwXvML2FWDLU75
 PSrLf+kRaoK6iH9+bUWI/ucY6S1Hwv16qmwLWmK24hchQkek7fSNHGeQT g==;
X-CSE-ConnectionGUID: LfhrcJsTRcCQiNOI6sGyDw==
X-CSE-MsgGUID: WjAzUb3BRVmfWmJrqE9kBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="41665447"
X-IronPort-AV: E=Sophos;i="6.13,222,1732608000"; d="scan'208";a="41665447"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2025 09:42:39 -0800
X-CSE-ConnectionGUID: 62lS1NsdSDGOgsrc4jThrA==
X-CSE-MsgGUID: wlmOvPukRECyes+BkLYBVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="111501658"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Jan 2025 09:42:38 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 21 Jan 2025 09:42:38 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 21 Jan 2025 09:42:38 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 21 Jan 2025 09:42:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BS+0L29s0/H6jEGANVaUKzgJmHLL1PHT2Pnz6hWwDjSS9w2Sq0c+v3AamT2pmQhYRlTxAkI+y0DydW+Q+TMDkXaKMUj+sSOXfIM17rkwrtrMtbw+BV7Lt9lt+jGLh7DhOZYBmlXvKCN6TIeSCK8Y9sWh+w28IH9JK8nrtJ5p5F3Vhs7fsoKo65KsFgcu3+obJBZHasCyYWX2Bjj1BvMBPui1timDRXJWQ+FHJreg/CgNlw+Im+WdNm4s1eIY0Eouv7VnXDNec2M5rTNENjgvEBIsmcM+aTRZeamSgazW0TrM5BjSTyBxlsDvTGp5gmUmDjwHGvEUmxqJowDvm0E5QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rtik55XCt66wOeMODQ5f5ZaDh1CnVOcqkgg6PxUL7g0=;
 b=kfK+bqx5UYPdvUE+YG/Eh31saMt2SDOMYj+6zkt0ylSCACZJI/N5UaxuDGhz9yIZ8+9rnYp2LA9qyIXgQQ7AA/0sGm0dWd1fp1JT3BlkJWrAAjfJJJPHDITRdCaKswHtC+SZ3fb8HZ1lCfqyrxQcNQmvA0Qk3HVEtk7j2s7SBXBYfuP0++A0cf1NZZfE1SWERcVeaaxozYn/ULR6zFoBq3FxVNc81GghljnS5BY+YeiGHtoVW3Gi7WnftCA14Ko7YsWRmpn2QCQ083o2StFGjY8BpPIwpZZxozNdHH3Wv+eU7klRP+royog96QUcmwZmeVV+L7uCtaBxMCq9btyVUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 MW3PR11MB4763.namprd11.prod.outlook.com (2603:10b6:303:2c::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8377.16; Tue, 21 Jan 2025 17:42:17 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%6]) with mapi id 15.20.8356.020; Tue, 21 Jan 2025
 17:42:17 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Intel-Xe@Lists.FreeDesktop.Org" <Intel-Xe@Lists.FreeDesktop.Org>,
 "Harrison, John C" <john.c.harrison@intel.com>
Subject: Re: [PATCH] drm/xe: Upgrade complaint about missing slice info
Thread-Topic: [PATCH] drm/xe: Upgrade complaint about missing slice info
Thread-Index: AQHbaUOAThFW33IpiUCUbCwuj2+QhrMhhRgA
Date: Tue, 21 Jan 2025 17:42:17 +0000
Message-ID: <02d1075214e3ba35645686c1cb479dd5c74b5571.camel@intel.com>
References: <20250118005403.2960807-1-John.C.Harrison@Intel.com>
In-Reply-To: <20250118005403.2960807-1-John.C.Harrison@Intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|MW3PR11MB4763:EE_
x-ms-office365-filtering-correlation-id: 9f9dbc06-9932-4b24-8062-08dd3a42f329
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?L2JGRmFFZ2NlOWNKS21kdWpmajBCaVFUd0Z0WkNCNktmVkRaTHJhT3RYQTNk?=
 =?utf-8?B?dHdJVlMyeWt3Z1ZTM3NCQkpDTTNiRkRqeVpJZ0pZRE5HQkNQM2JqUlBGWG1u?=
 =?utf-8?B?WTFHUEw1eS9CZWovK2R0ci92SFcyOTltcm5KSm94VWdJMFpMa0lSVzBpMVJK?=
 =?utf-8?B?azJ6aC9YWEtRalJiaklPR2ZJNWlTTXNRM1c1bU5WVXB2NVA0UDlrU2M1UXU0?=
 =?utf-8?B?b3pYVFZWK0xEdlpZaENGM0RMbXh3eHdQMUtmejI1M1NrNzl4bHF6QksvY0xn?=
 =?utf-8?B?Q0hZZ3pldUw4dUVxWkovWUVad080TmE4dkVIZXh5K0s3T1hYdHZsN3VqaDYv?=
 =?utf-8?B?ODNuNjZTVDNCR2twLzlSZ0VhNmgrbEtSU3dSaWxMUHFQYkFpWUxFWHRKT0Qy?=
 =?utf-8?B?VVJXTkpldXF1S0s0V1hqWE9NQzlmSGNXQzZ4Vk9EOWdwVGFveGVucVlLNUtE?=
 =?utf-8?B?ZHl4Sk5kK1ZrZnRvZHlWRGJDTEdSaFZicUdINFVHaG9Ib1Q4bHpuT3BvUlVB?=
 =?utf-8?B?cERmanp5M1RGTVhwQXlYekI3OEhuczlVcktRU2Y0TnlvMnpMQkIvS0dLc2o4?=
 =?utf-8?B?NDVtdmh6Z1BsT1J5QXYvUFU4dVArR0JIRUF0bjRLVnNsVmdMdmJWZUM4R1pV?=
 =?utf-8?B?SVB0aDE1R1hrVExiOXkydnRnMW9IeUJoNStEZndpcUVtQy9NTFA3Y2sxbFQr?=
 =?utf-8?B?NllrcDhHTXRMUmQ3RHFGQnRmaEozak5TWitPWW5tSzBud0dLWkZIT1BnUWlt?=
 =?utf-8?B?aFdGaThaS2N3K2RKTUtEZjJBZHFuY0tJM284Y0NsZHZmNWJjMlRiS2l5U3Ba?=
 =?utf-8?B?Vlh6alRvSVNaakl0dWcrM1Y5b2EyN01BVmtlbVcwdVlBQjJmNklXV21hQjlL?=
 =?utf-8?B?SFNMVWVsZDhuV1lBaDdsTFFmN1VIYnR0U2pZWDYwVkhvelhxVzJuRU1IUUdI?=
 =?utf-8?B?MnhPR0JOQWllaWI0M1hDQXFweU5YdGJTeWg5UUVWenJUSEtIOGt6elJtZWtH?=
 =?utf-8?B?N3ZZbS8ycmptbUpLVFZxT0JTcmQ0UUg0QnFUZFN4UzJBaUg2MHFkbEhiUFdG?=
 =?utf-8?B?NWp6TWJPRnhUSzU2ZmdOSDY1OWpWbUJZUXVvRFlSZTFiRWlUQ25WYXBscmY3?=
 =?utf-8?B?bzJpNHhPaUcxNnN0UWI0RDc0NjhuY0tROHpNTFhXcGpYZStoQkxBNDN6S3Bu?=
 =?utf-8?B?T0Jxa3lOTWswdFEvL05ZRVFQVG9TSmRRbVdvcUV0U0V0Y0wvNFlYV3U5TjFs?=
 =?utf-8?B?L2Y2OStycTA4WFhzN3lqbDIxbDBucE93aXIzMHNSa2VnVFg5U2FvVUsxaGxv?=
 =?utf-8?B?RnFLeEhqeVFPTXMzL1FxOVp2STRzNHlUNVpEQmpUUUJqdnorTHFWWTY0a1Z1?=
 =?utf-8?B?RTJrTitYWmhNU3dMMkE0dms4SWQ1bDNQZGpnMm03TXZCUjR6cnVrZG8zRmJ1?=
 =?utf-8?B?ZmlteGNpN2JoWnVLRk9vSXhaU2dyMkNJZkpBYkFGNDF0QTg4RGhkbDFBYkFR?=
 =?utf-8?B?cWpCVUZBWmNNb0FLUHVOSVhXZEYranNqelR5VjBGOXpIMnVDR2oyOFQ4dGQx?=
 =?utf-8?B?Y0hjNFlIUEkzbkxJN2lpWTZVenhUYVRyUUtFdjBZdzA2VDE1dUVBUjRUYlZl?=
 =?utf-8?B?WTZjTmZIczRIZFI2QlppNFdUQjVWZ2xXdGd4LzdxeXdqZ3BnekoyUkl6YjdG?=
 =?utf-8?B?VHVyanZlcWUrblMwbTgybk05VUhOZjZ0L3EvTWcvMXpWUEI0MEdBWUhyTnJx?=
 =?utf-8?B?c2Z6d3dxUWRnSWVBT3U3eVlGM3dtRW1tNUNGQUtFNzhxNCt3K2orKzlwZXk0?=
 =?utf-8?B?OHRDeHlkU3RibnhQNVBWV1YzNGw4YlppMFo1ZDA2UW82YzJzSGRXbWtPY2xo?=
 =?utf-8?B?a3NYc0xaU1c3RFNYbTVmQ0x1QTNlTi9wTzJZYm9INkY3TVR6OXprc0JkQVF2?=
 =?utf-8?Q?kaGNfmIHNUhEbTUmFgbR3yAeCGPayC07?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a3N0UDBoMGlvU3BqMERlRysyYjF5a2xsdDNua2pTK2V2MkdrTWFudlg1YVpn?=
 =?utf-8?B?d293L2wvZDlqcEdVQUFIaG0rdysvRU92cDlBbXlaT2dlNVhaaE9MSWRkTTJ3?=
 =?utf-8?B?VUp3ckVIQmZWdlRCUDZaUUpneTEwc09aTGhlRDFuRjI4TDdWam5vUlBuTmls?=
 =?utf-8?B?eWJMWnJFNTlQTHpvd0VwTStkU3o5eXJzTUpMR3kzVHhGU25GWWVDc1RiRjFX?=
 =?utf-8?B?eUx2b3d0TWx5VEtWUzF2ZXR6TmxhenlNdi92V0xSd0JzVktpWmNzaGZsWHFM?=
 =?utf-8?B?L000ZVN1Qm9keURCUFA1bDRFL0F6RkdzTi9tMHdJaGdvUWNpR3NSemFKR01D?=
 =?utf-8?B?WmpDL0lvVERSTyt6Tkp4elh5dmlzRmlpMTNEeXI5Zjd2aEZZYVg3WUZoTlZT?=
 =?utf-8?B?M0lscHlKbTZRTGxCUTFUOCtSemxiR1lxelpaQkdUZ2xLOG4wMXZKdHFZY05M?=
 =?utf-8?B?aERob2Q1R3dOMDNBMk5PamV2OFJ5MjU2WDNWZmp5UzlabU1VdE0wWmxqTGJC?=
 =?utf-8?B?dUpsb3BvTlViYTM5Vmd3aWhXb2xoUFZBK214MlpmV29DalZ1ZnZVRkp0ektT?=
 =?utf-8?B?WS82cFhEUDhPQmdtekoxdGVDSERQQ0VTVjFXZG93YkZFR1NJZVAyM3FrWk8y?=
 =?utf-8?B?R1krTm1jTkZDeHJpbCtRSDMvcURMVnpaRUJKWXRQUVNyUDk5d3VRRjFiUENv?=
 =?utf-8?B?Z1h2MzloZjdSUEFoUVBMb1pBZWF3aDFaOHRwelFpUFJwRVZTQXhoeXhZNWMy?=
 =?utf-8?B?dnkweWEyYWZMRW15QmVBN0NvVFEwQnBiTjBhMDhuUStKckNkWi95S2pxREhn?=
 =?utf-8?B?M21Yb0dsZGNiZUw5TDlqb2wrVmQrNDRqbkFmaVBtbFRJcDBNNFpqcXp5TVVM?=
 =?utf-8?B?dWdsRGFkWVJaZzJ0TFNGTUpEdVpKRERiaVJVREYyRXkyemsrRi95RURvU1J5?=
 =?utf-8?B?WTl6NEtsT2ZqRXk4T0VuTFlTUnpJVmRvRTMxaUljbzd5S3JSeUJ3eWl1Y3d2?=
 =?utf-8?B?ZEtMZzNYQUp5bXJlYlZ6enFDUkFtcUpkb2ZIU01LYjZxQVFZNlpncFhhNCth?=
 =?utf-8?B?OUFUTUh3UWd0L3QvRWlZdXdzTC9XcTFNaWRMR21zL1FJbkhqK2FZdWhzTXli?=
 =?utf-8?B?WUNTcG5zQS8rK0FTQ2NEQ0ZGNkdhOWFTcVUwQU1wSGxSSjg3aFdJbE9BMGdi?=
 =?utf-8?B?NlpHT3k4ODBPMDYwRVRrRHRza2N1OUZaeEJJdmlTY0pvdW9mVVIydmFVb2lM?=
 =?utf-8?B?d0lGRHdDMFJaVTNzbUFONzhvM1NEb3RjS1BXSVpHWWh2Mlo0QWlUQkV5ZXpo?=
 =?utf-8?B?ZzJDc0tYMDVtbmN6K09yRGRBT1NuU1dsTEJGUFhqYWhvRU5QcVpWQzZYSGhq?=
 =?utf-8?B?NWM5MVl6ODUrclFkK29iS1U0NXQ4STBVTHRmQnR6RlRXcG0wMVRiOHp6bjU0?=
 =?utf-8?B?c3drd3FITC9yRFJQMENacW9ySnFGb0pkVE15TjhzbHJGaDJ4VmZ0a0ptblFL?=
 =?utf-8?B?M2p1TC8zMTQrSVJGZkx2eU5mYkV4MG1ERy9rWDhNUldma3hyY2wvTm9Qd2tj?=
 =?utf-8?B?bDJidXNzekdIYnBoVzNXbDVGZkd0Z0EzeUhkM0gvTTBHTGxGdGVCZG1ZeEw5?=
 =?utf-8?B?ZFdON1ViR2FST2diUWliNDFqTGZXVWErTmY0VlhGdDRFSmorQWgrU1RJMml4?=
 =?utf-8?B?azZ1M3lBZ2o3OWNrOVE3YTdzYW0rOTAxOE42Tk51VGc1RmNhQ3RSOUVGb1Rk?=
 =?utf-8?B?SWV0My9XN1g1dzR4TkdTcE5qbWxidDdwRnRpb3Zna0RpUSt3Ymxmcm5tTWRk?=
 =?utf-8?B?RkFXb1QzOTdSVk43cEZLWGZodmwwM3gxL2V6WEFESGVaYm0rdS91NXlJTSti?=
 =?utf-8?B?V3hiemxOandmWVNDOXNmSnFrOXhENEpwTTA0bVNQR1Z6VFlPWFQvTmUyS2VT?=
 =?utf-8?B?SzJZUHFxTEh2V1dPcCtRWmpJK2FWd1d4Q3J3SWJmWUJuVEFKeVRSb0lsOUtx?=
 =?utf-8?B?YmtsdGYxeFNlUFhpU1hGaDdSNGozS3YvR1VVWkxiSzZlZlMzaE9UNWlDenVU?=
 =?utf-8?B?dnB3M2p4MTV1MHZoRHhpRU5SVEVVb1ZyUFlmTEZuZGYyVnZpUFNBVlUwd2xM?=
 =?utf-8?B?VFFlMkc5TTR2bGtrZHVNMExHTVR5SU1YNU80T0xKWTZlQ3NLOVBpdk9MUmY1?=
 =?utf-8?B?MWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F88D10D2BD87DF4E8988E66944FDA877@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f9dbc06-9932-4b24-8062-08dd3a42f329
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2025 17:42:17.7739 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Jk+iKUcsYvPI054U0tI75iCSXqDKXs1hX/Ajg9IA4suk8Uhoqq3pqyZ6+JMFs6/6YDnpGcqgidstiCWnbEOiPNVtS1I6nMKvduAK3YOEuCE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4763
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

T24gRnJpLCAyMDI1LTAxLTE3IGF0IDE2OjU0IC0wODAwLCBKb2huLkMuSGFycmlzb25ASW50ZWwu
Y29tIHdyb3RlOg0KPiBGcm9tOiBKb2huIEhhcnJpc29uIDxKb2huLkMuSGFycmlzb25ASW50ZWwu
Y29tPg0KPiANCj4gVGhlIHN0ZWVyaW5nIGNvZGUgbmVlZHMgdG8ga25vdyBzbGljZS9zdWJzbGlj
ZSBjb3VudHMgYW5kIHRoaXMNCj4gaW5mb3JtYXRpb24gc2hvdWxkIGJlIHJldHJpZXZlZCBmcm9t
IHRoZSBod2NvbmZpZyB0YWJsZS4gSG93ZXZlciwNCj4gZWFybGllciBwbGF0Zm9ybXMgZG9uJ3Qg
aGF2ZSBpdCwgaGVuY2UgdGhlIEtNRCBoYXMgYSBmYWxsYmFjayBwYXRoLg0KPiBOZXdlciBwbGF0
Zm9ybXMgcmVhbGx5IHNob3VsZCBoYXZlIHRoZSBlbnRyaWVzIGFuZCBpZiB0aGV5IGFyZQ0KPiBt
aXNzaW5nDQo+IHRoYXQgaXMgYSBidWcgdGhhdCBuZWVkcyB0byBiZSBmaXhlZCBpbiB0aGUgdGFi
bGUuDQo+IA0KPiBTbyB1cGRhdGUgdGhlIGNvbXBsYWludCB0byBiZSBhbiBlcnJvciBvbiBuZXdl
ciBwbGF0Zm9ybXMgYW5kIHJlbW92ZQ0KPiBpdCBjb21wbGV0ZWx5IGZvciBvbGRlciBvbmVzIHRo
YXQgd2Uga25vdyBhcmUgYmFkIChidXQgYXJlIG5vdCBQT1INCj4gZm9yDQo+IHRoZSBYZSBkcml2
ZXIgYW55d2F5KS4gQWxzbywgcmUtd29yZCB0aGUgbWVzc2FnZSBhIGxpdHRsZSB0byBtYWtlIGl0
DQo+IGNsZWFyZXIgd2hhdCB0aGUgaXNzdWUgaXMuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBKb2hu
IEhhcnJpc29uIDxKb2huLkMuSGFycmlzb25ASW50ZWwuY29tPg0KPiAtLS0NCj4gwqBkcml2ZXJz
L2dwdS9kcm0veGUveGVfZ3RfbWNyLmMgfCA4ICsrKysrKystDQo+IMKgMSBmaWxlIGNoYW5nZWQs
IDcgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV9ndF9tY3IuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF9t
Y3IuYw0KPiBpbmRleCBhMTY3NmI3ODdmZGMuLjYwNWFhZDM1NTRlNyAxMDA2NDQNCj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X21jci5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94
ZS94ZV9ndF9tY3IuYw0KPiBAQCAtMzQxLDcgKzM0MSwxMyBAQCBzdGF0aWMgdW5zaWduZWQgaW50
IGRzc19wZXJfZ3JvdXAoc3RydWN0IHhlX2d0DQo+ICpndCkNCj4gwqDCoMKgwqDCoMKgwqDCoHJl
dHVybiBESVZfUk9VTkRfVVAobWF4X3N1YnNsaWNlcywgbWF4X3NsaWNlcyk7DQo+IMKgDQo+IMKg
ZmFsbGJhY2s6DQo+IC3CoMKgwqDCoMKgwqDCoHhlX2d0X2RiZyhndCwgIkd1QyBod2NvbmZpZyBj
YW5ub3QgcHJvdmlkZSBkc3Mvc2xpY2U7IHVzaW5nDQo+IHR5cGljYWwgZmFsbGJhY2sgdmFsdWVz
XG4iKTsNCg0KQWdyZWUgd2l0aCBSb2RyaWdvIHRoYXQgdGhpcyBpcyBzdGlsbCBpbnRlcmVzdGlu
ZyBmb3Igb2xkZXIgcGxhdGZvcm1zDQp0byBzaG93IHRoZSBleHBlY3RhdGlvbi4NCg0KPiArwqDC
oMKgwqDCoMKgwqAvKg0KPiArwqDCoMKgwqDCoMKgwqAgKiBTb21lIG9sZGVyIHBsYXRmb3JtcyBk
b24ndCBoYXZlIHRhYmxlcyBvciBkb24ndCBoYXZlDQo+IGNvbXBsZXRlIHRhYmxlcy4NCj4gK8Kg
wqDCoMKgwqDCoMKgICogTmV3ZXIgcGxhdGZvcm1zIHNob3VsZCBhbHdheXMgaGF2ZSB0aGUgcmVx
dWlyZWQgaW5mby4NCj4gK8KgwqDCoMKgwqDCoMKgICovDQo+ICvCoMKgwqDCoMKgwqDCoGlmIChH
UkFQSElDU19WRVJ4MTAwKGd0X3RvX3hlKGd0KSkgPj0gMjAwMCkNCj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoHhlX2d0X2VycihndCwgIlNsaWNlL1N1YnNsaWNlIGNvdW50cyBtaXNz
aW5nIGZyb20NCj4gaHdjb25maWcgdGFibGU7IHVzaW5nIHR5cGljYWwgZmFsbGJhY2sgdmFsdWVz
XG4iKTsNCg0KSSB1bmRlcnN0YW5kIHRoZSBpbnRlbnQgaGVyZSwgYnV0IElNTyBpdCB3b3VsZCBi
ZSBiZXR0ZXIgZm9yIHRoaXMgdG8gYmUNCmEgd2FybmluZy4NCg0KVGhhbmtzLA0KU3R1YXJ0DQoN
Cj4gKw0KPiDCoMKgwqDCoMKgwqDCoMKgaWYgKGd0X3RvX3hlKGd0KS0+aW5mby5wbGF0Zm9ybSA9
PSBYRV9QVkMpDQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIDg7DQo+
IMKgwqDCoMKgwqDCoMKgwqBlbHNlIGlmIChHUkFQSElDU19WRVJ4MTAwKGd0X3RvX3hlKGd0KSkg
Pj0gMTI1MCkNCg0K
