Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4683FCA0FED
	for <intel-xe@archiver.kernel.org>; Tue,  9 Sep 2025 09:49:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0785010E678;
	Tue,  9 Sep 2025 09:49:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QhIDsR9n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FFF210E07A
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Sep 2025 09:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757411372; x=1788947372;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=3LggXuz0YE7Zn8a7Wq1pWzPAuTEnqmw+O8o5oGHCHnI=;
 b=QhIDsR9nuxOAONwKhYNqtxG1j2paDFy91ozreMgvrPU8cHFkDmwnH5NV
 Npdn6KWU8KTEd3uVxw5UjoLOmHz2j1Pg3/Gv1I2FNYQStGEGGS0UrgMV5
 Wf3OZMKc1JONQ+4YzSGPjE+jlLNva/d1fXw1o0p2mtzhzjhsoI5plFgrk
 2/nVhrsc3OphNZSYDx5aZxHsIm/4NXws+TYkqBbdlktx27cCgQtzMBJNA
 kSY+2RofQFF/LkUlrhO7hAK3sqVO4QoQEnzsy5nFvmHyupxh2WPxiz42r
 YbOG0pAR7cOdaqcjMI3EIxwoapymUHcVYPHMpOeBpW248CR7+sA70aIBz w==;
X-CSE-ConnectionGUID: Tuw+022AQqqN1ZAGJ/I0YA==
X-CSE-MsgGUID: WnCWoVBVSBauFiAjBvsqQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="63518559"
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="63518559"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 02:49:32 -0700
X-CSE-ConnectionGUID: OdJ7dM7aRl6v8OSDsbJrDA==
X-CSE-MsgGUID: q63dyhFtTA+0Q33l+Vp49A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="172911313"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 02:49:32 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 9 Sep 2025 02:49:31 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 9 Sep 2025 02:49:31 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (40.107.95.83) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 9 Sep 2025 02:49:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H21ztxIP0/rw5lht+aRYF2nR702GU7eUkegBsAS7AYDetZazgTa1DTL9LOsDXY2VlRDzrfDDxAh2aBmDDq7M2DV5qot5Fc99wZ3h453nr54Mw9DgnzzoBXCpJqBkdWEEtREAeFWbon6lcam/HV0CPnAiWFG+4Nu5NObWpwEetc11kgg7YHlvkODUEWvV1/N3QR9lkb1bG7DnM20r7KEVD2UxNMhDQY1WnCj/7jHtKgVqpXwdYJ8ZTvJzJnP8WIU8+4NkZnO/XuzYWpIjMu9/VBcRu2/bOzeBQjc1oC3h83ouAajk6o7hb12EIAInlsgbLASAKOom7Z6y/prs2rG2QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4IzIwplBVem70xnMUqyz0uxAYuJLfgMKlRzdKkcI08s=;
 b=GwkA+1YQojiVC0tYe25taZh4gX3pWDWUksZ9dG33/MIZnMDkLhgSI/Goc3Kggbra3MU1sFep0dMWIYSjVa+hVn0kUcdWgSCKApjiXNNKD6BWaQ44cLsjzHKHF4ndAQPpnWPnc5cYgsDcb4604Awbhg105RWu70lMgAoB5mVIT1JCPPZ7LeXLJRZoPIDYPLBEgayDA6RWmqPoCa6vS2rqagbD6dfIcg6VxhUUR0FNZLLAhXcuPQd8n1v89pRR+YMBI/6KSbfiqwuY5GaGxpjJiviuVHBog38mXkJRZmf3VxhpW2SCJHfesYkl2k5dZpSJDM47oev94MaRKAGiRDneIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DS7PR11MB6078.namprd11.prod.outlook.com (2603:10b6:8:86::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9094.22; Tue, 9 Sep 2025 09:49:23 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.9094.021; Tue, 9 Sep 2025
 09:49:23 +0000
Message-ID: <fd8bbeb6-7d1f-481d-ad91-10856f775f1f@intel.com>
Date: Tue, 9 Sep 2025 11:49:20 +0200
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe/debu?=
 =?UTF-8?Q?gfs=3A_Don=27t_expose_dgfx_residencies_attributes_on_VF?=
To: <intel-xe@lists.freedesktop.org>
References: <20250905173625.8398-1-michal.wajdeczko@intel.com>
 <175735219490.313432.1524070195776412850@1538d3639d33>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <175735219490.313432.1524070195776412850@1538d3639d33>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0022.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::29) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DS7PR11MB6078:EE_
X-MS-Office365-Filtering-Correlation-Id: 35bf9bc4-ba2c-40ce-2a15-08ddef86280b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|376014|366016|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TTdkb0hWSml2clFOekltd1NtaDIxeGhwZXlWaEZrWklvaDhRZVdkWmtObzFa?=
 =?utf-8?B?UnVTa2VOTGlZV0dmRTY2ckNqVmRBemNvMzM3MStYWUNac2FOYVRranMvUXhE?=
 =?utf-8?B?THBKMnEvMUUyYUdhcnZDdUlNWTJUOW10dkZaNk96YmEwZ05OT0pxdEN1bitv?=
 =?utf-8?B?MVNkNVIyR3M1UTR4bkhxU1llMUI1d0ZaUmpwUytBTmdqMHBDMUo5emxFWjNt?=
 =?utf-8?B?cktMdnA2c3RFemNDeWdRZkVjTzhmd1NHd2d5b0RPdXpna3VpSk1EK2duRGVv?=
 =?utf-8?B?S1h6clorVldkMy9VdEMydHpUZCtzdXViVTFManNlc0VoanFwa2ZyQmxkRHpk?=
 =?utf-8?B?TnNaMllFbE52N0p3QXdoNlBCRis0OVFCK21SOXVIK1JRVnhQZ3pxQlhaNjJz?=
 =?utf-8?B?eXNUMi9xQ25qSmVvVkV6Si9Wb3NOU0dTcElmb1VrajhCVDZEWk9FeEV1V3M3?=
 =?utf-8?B?eFpEZXRxOWxVQVFLekhYR25SamNidi8wN1JwNFdiVjRTcXVEOEp1em1teUxl?=
 =?utf-8?B?dUxTc0dvbVZCMzlTSzRaamJ1cFhTVmV6WjAwQUx0NHV1dzBpWENqSkVsL1dB?=
 =?utf-8?B?Z05OYUI3YXgwenljRS9IdGJVMVRIMnlzdkhFYkZRaE1SU1hoem40REYzVS9K?=
 =?utf-8?B?amsxUElReTVUMUlpMnc0M0NuOW5BMDdlMmI0TnB3MkxOYXZvUHJONjNyNmMr?=
 =?utf-8?B?Z09od0RvakdkdEFTUmtrbXJUUE1kM21HeVF4c0xnbDN5QUd4MERFMk1GMllU?=
 =?utf-8?B?OVBib0dFRWFKRThGdmlOV2g5VTQybm5BTEw0amtMbnFMSk1vVEZ4UWpVSXZk?=
 =?utf-8?B?QXdiajJCbExMQlcyOUx2ZFR0NG1BTE02UE5IU09HeXFWaEVTVHlpRGxGQU9M?=
 =?utf-8?B?aEJqYWZqM25mRGUrSXpEeDFPQ1JnZUZPVGFsdjloSGFuVlFmWFNQTVBTYnI2?=
 =?utf-8?B?Umd4aW1GYnlFdTVaWStGZFo1MHg1dldWbHdPR1hyMUpVL2VEWG9JU0pxN3JP?=
 =?utf-8?B?OUliZDBPRGpTcXRKeDVvY1pNOVYzUEs3MmxTVDNLWnJtTFVXRWU4UDdhOE15?=
 =?utf-8?B?VWNDQXhlSFRtL3hDQTBRSWluY3hGb0poNXl3TE90L0JCNFBOL2QyZFgrdG9V?=
 =?utf-8?B?YkJtdHJlcFdIa1c0RFliREtGeks2NWdnb1JlTGhZQ3d5RkJQbUhHclY5TWxs?=
 =?utf-8?B?Z0xNVk1xcXlUUzVxS08wVm5SNWZWbTkzUE5uZzFHRGtYM0UvZTQyUDAxell4?=
 =?utf-8?B?UWgyRDRBVFRxbkF3UjhpTVY2TnhLd3o0cVE3OWE5WFRpMVRVWWtZZjNqRjBk?=
 =?utf-8?B?cTRkY2locHFLMEJhRDRQWHZJbVNFY0JzN2NGTlpkV2tjbW5ZbVU2dTJTa3Br?=
 =?utf-8?B?NWI4QXMvZW5sV2VXY2lRV2pJTHFycExHNWlidlFDZEh1MzA4dm9MVmx1SytM?=
 =?utf-8?B?Q0VvZWFoNzNEMnhnUi9Ca2xtYzh3b1NPMHhSZ2RYVlhvMmhxWEFIVE15NTBm?=
 =?utf-8?B?V20yUU1mMGxjaUtnNVlHRW81SUlVcklGSy8rbW9sRWNzbzN2OEdsM2tJTGRv?=
 =?utf-8?B?NEdlRU5VdktJbDhWMHpaT0lKeUFUYmh2d1RwWVVhQmhRNE4zcnNQZVdOM0Mz?=
 =?utf-8?B?d3YvSFRMTktVZXQyU2ZRWHFPQnhXdEpQcWhwbG8zOUdYQStMdy96Z1h1VkhO?=
 =?utf-8?B?YXVYVVdiS1E4RjJCTWk1OHNpWHJxU3QyYTRTM0hTVklkY2tMR3ZhWEJpTDFp?=
 =?utf-8?B?am10TlRSUjcyZ0dzRWdGMkhqcFgveE9Sb0xhaERiazljLzRQaVI3Ym0rT2o5?=
 =?utf-8?B?dmJkZi9oZHpiVlpxbHdxVTdHR21ScTVkeC9HYkU1cEc0S1BTNjA1aDBjTnlF?=
 =?utf-8?Q?sXeKwTh7d1ni5?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(13003099007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dkVZNGFCeDg2RkZvYkdUajMyMHBpMnlYSWJFM0o3ZmtzdyswS2lQK0ZvR2k0?=
 =?utf-8?B?Vy95MDBBVE9UZmtlMCtLNGNxUjd2SExDRWtTdzJ1T3FtTjliYWxlYTVSV2tQ?=
 =?utf-8?B?SXdBTXR1ZTZpMWw4VFlZZ0ZOVklwdW9hSWlNTHpxUjRVYS9Lb2E1SmE4M3hI?=
 =?utf-8?B?ZXJFZ21mVWFhRXZ4NFovdmMxNGRGbnc2a0wzcnFTUHA0NWY4N3Zzcm1ORDZl?=
 =?utf-8?B?QnZWODZ2K2I1dXFFeEZ6NExNbWdST1kwaGF4dXR2NSs5VjZSenBiV3N0Y1FX?=
 =?utf-8?B?d09IcnBQWGEvL1VYQmpRUFR2eFUrL1BwV3NiNzdRTW1Ec2pjenBaQ1h3OWVG?=
 =?utf-8?B?b2pTSmdrTkFHY0oyVHd0ZzZ4TTRyMS9FR3YxaWlhQTVyOERjbkxIVytrcEF1?=
 =?utf-8?B?OUw5Ym9YMCtPOU1naWErMjNiL1JacnJSVktsZ05JWmUvNEhIZUhhWVhDa0c3?=
 =?utf-8?B?QW9Xc1o5MTcwTzhta0p0TFZtc1BiUGpabkwrMnY3YTJIQkFIa1QzQm9NalU5?=
 =?utf-8?B?NmRYQ0dPUFVqWFo5RWpJTTJtc2RVRGNSaEMvVzBFOFlGdXgweUp4N1VpNWRh?=
 =?utf-8?B?ekpSdHQ0Y1kzRlNKTnYyTG5uaXNzMDQwUkNyNzJYVys0bFY2ckZtM1VEaHg0?=
 =?utf-8?B?YkxEVXBMdEhldEMwWE1GZnF6MXd1MVl4cVpzNmxxMnVoZkZITkJvSlo3SEFt?=
 =?utf-8?B?NExxdGYxd2tyczBNNmYzdmx5MWZpQnFzTzZYUFgwWTMzM3JaTkpsaGhwZEFn?=
 =?utf-8?B?WkQyczdFTi9pcnFEMGtpOC9EcWVEK1ltSnpzUVFjQXBudVhnSHlyMm5JNmVX?=
 =?utf-8?B?elU5bnUwTWFOZGk4QThWa21Gd1k0V2x1aTBZbGJXVHdXT2c3WGgrY3NoOStO?=
 =?utf-8?B?dEk5Yks0U1FVZlBFc2htVUt5Ykx1ZzFZV2dLVXNkYkZob2RIbmF4OUpSNnNm?=
 =?utf-8?B?UERrdit6SVQrS1FLVjVRYnV2YnhGK3BtSmRzUm91bi9QRDhxQ1pmSEdyanVt?=
 =?utf-8?B?VHdJZEZQSU9JNURLVEZlNW51YTk2L1AzeFV0QnViei9Xa3pPcVhRbmcxSlN6?=
 =?utf-8?B?VklJZEJVRThSV3YzYWI4KzZWaEtjNG9wRStuYzFxNElVRlBEZWw2UEYvT0Nx?=
 =?utf-8?B?enNRWEt2TU9VdlBTak8zR09pd1RkYjdqaDd5eUtTT01KcmhDeDBrZEZwdlM1?=
 =?utf-8?B?TnhiUnhGL2tWZk95Y2hpSEYrK0ZnYlloU2lrZDBUN0dlUGFWVUl0cHE2NHpB?=
 =?utf-8?B?bVhzZkVWcm1PMlNWVGFMaE1pTjBaUnlGb0FQSndKSk9aWFQ0UnkwcE5QZnhV?=
 =?utf-8?B?UG4vZVJEckgvQWJaVGVncHFPNDZ1a3l4c1Myc1lWSlhOSDVndUNQOEliSkZ0?=
 =?utf-8?B?VzNNQ2JkM1A4NS9KODFPNUJzdEJlTUpnK3VRTmpLcW51UGllSjVXQm5HLy92?=
 =?utf-8?B?RHhCSTRqQVo1UTJXMGlCbmw4aldDSkNWV0lKV1VudTY0TDRrdkZLRVZwNkov?=
 =?utf-8?B?UENVSzRWaEhXRjkzZUM2LzgxaGRraWtYTjYxcVdBcjBPT3dPNERYNnRHelAx?=
 =?utf-8?B?UGlyYXpsWlZ6RW1oMWFyK09JZXlSMExrMWhwMVJvcnUwY0dHR3R2MzRoakZH?=
 =?utf-8?B?bStEelp6YkxrTlR1cC9XdElxRjBVQWYxSkpONy91amlTK09NME5aaUdGNGVh?=
 =?utf-8?B?eWZjUWJndit4TlNCVmRWR3RvamxWMGxFY0p1dmlxUm5pdk1vcUxzVno1a0Uy?=
 =?utf-8?B?d0Vrb25lVmREOTc1RDMwRk1NT1ZzeW1VbE8xcW1hTnJBVTRicUFZMHNtNDV1?=
 =?utf-8?B?RmUxSDQrZDRDZTVmYmhURlhsSlJ2dWlQb3NRaTdsVmZoTlNXeFU3T0tVNllQ?=
 =?utf-8?B?cCttNjFkbWZMSWdGT3FSTzlTUGZqcHlSbFh3T2QvTVFYczI2ZEZ4ai9kTjdD?=
 =?utf-8?B?VzEzdFN1MktURXROS3dOK2g4SDM1VXpERTZEMVAwQVpkTldCNHhUa0E4a3Bu?=
 =?utf-8?B?Y01tVFY2S1VCY3RVc0dGcmhsVjRNLzdPcHQwazNQREJHK3gwOFFzQ1hheXBw?=
 =?utf-8?B?VDNLbm43V2Y5SGhZWFF1elhRWlptMUhKcFlCQmJLZ0tKSlJlaVNQWDAwMDNm?=
 =?utf-8?B?bXFMYmtuSndCVnlzT0hFamVndm9jK3hWQllDOHpNYld6WlQ4eFlQMVlGWUVs?=
 =?utf-8?B?UXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 35bf9bc4-ba2c-40ce-2a15-08ddef86280b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2025 09:49:23.5550 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uzjtw/SqrTnLNygY0YNlUjtU6Kukv5bFnMpYdrnrz1z8RSFF3GT/j7G7k53vBm51Q6hhoDNxEIjrgWid/BFVc7aAOsEqESbSiv81siTCWZo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6078
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



On 9/8/2025 7:23 PM, Patchwork wrote:
> *Patch Details*
> *Series:*	drm/xe/debugfs: Don't expose dgfx residencies attributes on VF
> *URL:*	https://patchwork.freedesktop.org/series/154110/ <https://patchwork.freedesktop.org/series/154110/>
> *State:*	failure
> *Details:*	https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154110v1/index.html <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154110v1/index.html>
> 
> 
>   CI Bug Log - changes from xe-3698-8ff22e1c035368015610c20c9cc612e7bdec5d61_FULL -> xe-pw-154110v1_FULL
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with xe-pw-154110v1_FULL absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-154110v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> 
>     Participating hosts (4 -> 4)
> 
> No changes in participating hosts
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in xe-pw-154110v1_FULL:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
>

all unrelated from KMS tests and from non-BMG platforms: 
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3698-8ff22e1c035368015610c20c9cc612e7bdec5d61/shard-lnl-8/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154110v1/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html> +2 other tests fail
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3698-8ff22e1c035368015610c20c9cc612e7bdec5d61/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154110v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html>
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3698-8ff22e1c035368015610c20c9cc612e7bdec5d61/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154110v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html>
> 
> 

