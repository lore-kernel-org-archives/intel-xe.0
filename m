Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67293109318E
	for <intel-xe@archiver.kernel.org>; Fri, 20 Mar 2026 08:35:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A92310EAB2;
	Fri, 20 Mar 2026 08:35:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IDe6pYec";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 465AC10EAB1
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Mar 2026 08:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773995742; x=1805531742;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1tXRRarPbyCqbxoHVOvEKJ8zCwUPIXBTSroAg7IrSxw=;
 b=IDe6pYecOqETZb7gjE9pW26xaHoyjjb+rRCikEHUwpNf5aRal4EBKifO
 cnHyGp9KvJf0CgLDQ8OnpFc6az9YGsGpIIu6VqAfXjIOrmOJhjaArI03g
 s2srGr7lWKFqvUy3SmrqWq/6SP98Z4/wp7xWJcCZEmVF2ug35M1zgRgWi
 CMRGCd8N4vKDfGLr5xcaSRGGBDNyxfzd37w3+enjDZXJfHu35JDxEWVYq
 0dIn6ZCiWDYr9Ux89WVknz6KUhsNzFBoJ9LguIs2acvhjk25/W3nv9bLp
 EwTCvFY+Z5X/Y4cmK0wmWWebr9FzkosxoAWhWQTubY1dbQ26q7TU5BNRi g==;
X-CSE-ConnectionGUID: O+H4yzQkSYych+sdkP3DZw==
X-CSE-MsgGUID: B+CVPhOtRcy7NN+w1T9/Nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="77685467"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="77685467"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 01:35:42 -0700
X-CSE-ConnectionGUID: q3zaBxs8TuS9xuCXzUjMdg==
X-CSE-MsgGUID: 2gdT49awTv2bslLua4jKXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="246248011"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 01:35:41 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 20 Mar 2026 01:35:40 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 20 Mar 2026 01:35:40 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.55) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 20 Mar 2026 01:35:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BOckYZ92cQM1bMh6VOmVPQ+yHZCBVGIXv511Flffxq51fenGJiHFHkMZfyGIQjrZzRA5NUtpKEWVGTYnJJZsXe8JFQp7q4N8gtxXsLzvsYatuS1OtE8a/Q3jnv9Qmg4UzTtAHfV59erM3qH4eAGRslnNpmG+Y1w3oBseFw4FCO/okjqnODbz/zVorp9e69ume+6f3T9Dv8EOlWf4YQwhutgyOkgmI+xx29PtrrCksRkaP1tiXvALTOlNzPZU3/9BSp6Klw3uiLFGhQAgHrLgz8Sqqfg/9yZXKRpmePdoTL0LyAHfeAHVqRA4+Q4QJLXUqxv5MXErgfEUzrtweWd41A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hj4gFTQa2/3CvDgWLLTgUmUrFgupavnWS/Nb8s/5W6s=;
 b=dwWQjiwPFVNYlIpsYKDPeGV3oFmwS6AWLau/YK5WIxzB0nfGxt8aiXYiQ4gmFedOZn0vCIv1QJdyllaLwKU01vTooplpQHB4Rc1G4eClVT6oQ0fPKDYqTjfkOMT4z5WXaPaxiOWv7ojvvS57+QpW7ESqF4gbDS6HLs8NYtlMWEoc8sW1vYN11lZcyawfFtL6N41BGtfBNys0RGQSD26ydnf61jrx1FjrzGHHxIHv4+rhSbX8mFLaAoFrQmJuLdxpcEYbTChzTkdolnfmftGl/2DQJSpgH9GRMpeM2FQkLojyTU8ETxid+vmNFtieZt0E7jxIw12Gja70NjnzxfHs/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by CY8PR11MB7947.namprd11.prod.outlook.com (2603:10b6:930:7a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.9; Fri, 20 Mar
 2026 08:35:32 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::1451:ad37:6612:37fb]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::1451:ad37:6612:37fb%4]) with mapi id 15.20.9745.007; Fri, 20 Mar 2026
 08:35:32 +0000
Message-ID: <c76e7a3b-d208-47d8-ad6f-29f446470da7@intel.com>
Date: Fri, 20 Mar 2026 14:05:19 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 6/7] drm/xe/xe_sysctrl: Add System Controller power
 management support
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <umesh.nerlige.ramappa@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@intel.com>, <riana.tauro@intel.com>,
 <anshuman.gupta@intel.com>, <matthew.d.roper@intel.com>,
 <michael.j.ruhl@intel.com>, <paul.e.luse@intel.com>,
 <mohamed.mansoor.v@intel.com>, <kam.nasim@intel.com>
References: <20260319173031.1320708-9-anoop.c.vijay@intel.com>
 <20260319173031.1320708-15-anoop.c.vijay@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20260319173031.1320708-15-anoop.c.vijay@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1P287CA0011.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::15) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|CY8PR11MB7947:EE_
X-MS-Office365-Filtering-Correlation-Id: f7e8f5d9-c7e1-4b3a-79fb-08de865ba5ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: CtfcJ/7pMZO6I2NTdS0vFXQni4fMTh2ph0FljWmqeylyvrc+pVaFHk0H61mK9/16XKllBf78LBHb44xnR4DHLGM0zXxRR1M9pDjPERM0FFDngJbSdi7ox3Igy7yOr/Cwqy6yc7kuPFJxzL8pri2QHUSn6H492kG0LtWapOGp05rsDIkM+St7ip0J+aFQ+4GODCOIeWAXyBtJCdFTTgxmcNIDqa22KY0LWPTXzcMLlgaR1Xp6LAty5iLN0Ln9/wPmH04MQoLA6dquUHsbRSqhmWvDyhihQPEIJY2A1FqEiUEkpQjyqZiuCqBTBgPb14qb6/AOa5+lL0ZS9vwv6f7EXnX5jCLb86lhzIHJa3YijX58ui5GDtbk1uW1R4IfoBuUaiECqznUVnflSUFNVrcsKKkcLx9Vu0A0cEUgYnZAkO0e9DkK/FTBIF0vkK4vfxmupaQDyV2+BbBRhqg9i5y22ZMFwDJstEZQVH/3nKaUxayeCCNexMwp5shCEsWHf8F7ANVVuSnSG5pSxzIRtmPyMOAh83r71Nx29cNfr38KP8f2F3f6DF9cWg4K8m7QSTYr09g5kB8aoK2b0DJhmbXAR0nEH/o/ZspevCPxPRn7dNhG3soF1pE1BJ41SWeoSszj6uTRWQfqNCkbHbPQWZbAFBd1w6FU8xYOO8EXpo4vE/5rBeQJSNi9VfVzNOgCRFV/Ijt6VB92zKezbNbs5D6TKWqSW2mO4d9MoUXLsHYwdGI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bGowMVgzajdXaHNnYlBubGRHUWh6dXl1SkEyR2hDUHVKRUhrUkZYbWo1QW41?=
 =?utf-8?B?eFpRTDFwc3U1YWthNm5Za3Z4RjNvZDJmQzNFay9ZekRnT0FCUG5OM2JLV2I1?=
 =?utf-8?B?Y1pCZC8zZDNIL1paTmMwcDBOYklsTWUwZndqeDJiemk0YzlIQmlGU1RkVmZt?=
 =?utf-8?B?Y1VFWDZIS2JKcHRXV3lUeHJCb2dZRWMyUGRadWNUWjBLOUlsOE1oc25BWHRw?=
 =?utf-8?B?MjVKOUhxWGo3Ym1MMThYMXEwM0NIaHprTkdmR3NvTE1rc0YydDRxYWt5TmV2?=
 =?utf-8?B?bHh0ZFlKUFYxemNVcWxwc29JMk9uN1hXYUdHMzM0N0FKb0YzNEFIdDNIK0lu?=
 =?utf-8?B?bVgxS1Y4Tnp2bTZUaXZNT3pJRXlid2N3OUgyTDhBOVlLczUzR0R3MHdFK1BH?=
 =?utf-8?B?dDVERU9adEV4Ymo1RmlIVFdCaXNDSlV6STh1elppQzlnMlI1azBHZC95aS80?=
 =?utf-8?B?S09VejFvMFRUb2ZGRjZuRmNDa2xBWHpwMy9rc0F3VDRYRUpja2ZEN1U0NkRh?=
 =?utf-8?B?TEFIa0psc2pZblE0QkJybGNDY0l2Z2l1MWhMT1FDc0RqWVlOVlAvZng1RmI3?=
 =?utf-8?B?TXdPQUVOa1NhTUZlRU5ZZ3U0NGVKRFJ1djIyUlc2ZVhsbjRtTTBPbU0vUjYz?=
 =?utf-8?B?RTIwSm5TY2RCZEdQeDZwcDVWekd1aTRNaGRkbW5HWnFyQXJ6d3FOUHdaTzg4?=
 =?utf-8?B?K0xCMUlCeStLTDVyQWZnMUdSNkg0alBiTVNZODl4VnZKQThSSmhKdEFPcS9N?=
 =?utf-8?B?cWt6cGRISXVTQk83RjVpblFKaFY5V3VGR0FHTzBQaFVtVW82bmQvRlVxMEwx?=
 =?utf-8?B?SHU5Q0xOdGsvYlkrZk1yRm1WK3hhZWdrS3FjbWxUUXZ6ZHd0MGpwSC9xd3dX?=
 =?utf-8?B?bE1IeExqbGg1Ri83WmZMM1hJN2hFOGN5MGFkWnFpZytYbkpVQkY1WDBWUE1p?=
 =?utf-8?B?N3dBdFh4TGV3b2xuY0t5L3N3dTdEUFVZUzNMaDdkeUlrSm9zWXhGMEQvRGFw?=
 =?utf-8?B?T0NXYjlGZFpvUUVuRHc4cDlNSUZSUWhkUjVQaWpSK2tZcGZVTHljdFdGb0JE?=
 =?utf-8?B?RDZZeDFmTFlhTlZWempBTytPYldHdWdEMDZjb0huVkRsYnY3UFhGa1MxWFc2?=
 =?utf-8?B?eFBrMFZwTzY1QVlqZVJTbkl2TDN6UlBjWlBlK1M5dkFRYnhjTlZWUHFGZjdF?=
 =?utf-8?B?eHlFTGpaM1VybVVIWDdEbzZRd3A5Q2s3OC92aEhnZk1sTk5Gc2ZobnMvYTcy?=
 =?utf-8?B?THY0ZUM1Yll4WVl5eU5KRU5DTE5IaXZVNE9JazY1Ykt5R0JGbktvTVBpS1Ju?=
 =?utf-8?B?K29hNUVIYW5IaGJibXR5OElBSkdqZ3ZDVnUvU2sxMDU5d0dQY2tsbmw2S2Qx?=
 =?utf-8?B?enZia3VDNUIxK2lsUko2T2FNTkwvSVgrNDlEclJLZWI1NWRBbnJUTXJoMFZ4?=
 =?utf-8?B?bHJPeWJ6YS83NENwUzJvU056WkJpTThiQlhrakxFTlRhMzVmb0dvT1hUS0wy?=
 =?utf-8?B?R0djdlBZSlg4SjRUNVphTUg0N1Rnc2ZDSkFXd3BZN05ML1RkaHB4MG81Q2tn?=
 =?utf-8?B?RE13SjhMOWF4aGlySHllVk0xNEdmS2tybG50MTJLempjUG1rVjI1NTJzZ2lo?=
 =?utf-8?B?Z3huaFU4cHEra1FUb0RjZmVqMDdEZU93M1lIRzhoVGNDNzdxVTd1YnZNWXBB?=
 =?utf-8?B?V1RCSlZqWTFHenZoNXA2RnA5dU5OMUxQakl6UitOdHRrMVQvTXhES0JjeHZt?=
 =?utf-8?B?UTNWcjA4Y1VkM1YyWjdEM3NCK0Y3R1p4OVVUeHBnZFJGd1FjbndOb2FVV3lF?=
 =?utf-8?B?MFkxVWVBR3lBS0JTMkNmK3QwRDRKci9Hd0FreVJNQ04vQytmUVl6NTBkd2Q0?=
 =?utf-8?B?d0R0ZGRBWUhaS0wyMVZKSlRIeER3TGF3UnhyMjFIbnl1dEJPSkxjRGY4N2ZP?=
 =?utf-8?B?aG42eEIzOEFjWFRXSWR4N3Exc21LWkRRN2xPT0JZK05URWdhS3QyZHB2SkIy?=
 =?utf-8?B?dW5DdkNkMzVqblV3Y3hFclIwT2lvSXNnVldJZTdoWG5JQTJtUzgxMHo1NFVW?=
 =?utf-8?B?NGQ0bWZsWHN2NGZRM05BZ0x4MUhqL1NzREtFdHBSZzRiaGNaajNJU1B0SUtm?=
 =?utf-8?B?Q0JIZnZnN0taTUhoanltZnhtZndlaG5EN0xxQUs4Z3hMcWUraUJQMTRldWpM?=
 =?utf-8?B?cUZNcFNUMDNrbWlYSlZWWnZrZmt3UXVVSEY5VU9nV2htSGJwVmVyOUxjY1JL?=
 =?utf-8?B?NmZSUUhtblBiU1hudzJsb1Nyby9PMC8rL1VmanlUaDB5V0k3TmliMG02aWNl?=
 =?utf-8?B?R2czcW15QW9mRlRYL0YzWmNSVk1lVk4xeWZSTFN2YTFHZ1dDMmlPQT09?=
X-Exchange-RoutingPolicyChecked: nTOW/ggliV3Vd7+z3woKb1dlDbe9Xw8yQ74Dy8tfEbSTTmBI7kXRZXZcpRW0yPkjeDCA2y9yGxEpIjjyGRteV7TDrdwDPKqYO9JZfockDy3P74SXjFQiHPiTG4k9kSTQ0R3QmUNzDGPe53QkJ3JHwH+drR5unDmVdApJxUxUauYkiJP3a1gCUcN3WnnwQVD3SBgCHnb+kW1c2EnrssO7NZJzLSB/7pEnZC9sMDBtPMq0R/9NJJtKPCodTKhXqkWMxOJy3N+M+qaKnG/qTiTcFpDrSUVYj20hk4fl7IAynb0Q6BAcyeP9I1itfdiNYN4KZaEJUo4qW4a/9hQnDaqYiw==
X-MS-Exchange-CrossTenant-Network-Message-Id: f7e8f5d9-c7e1-4b3a-79fb-08de865ba5ea
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 08:35:31.9852 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VM1xJHMwrj+qDYjGwwuxrSChEOHi356IV+rlW28iq4qBlXywOa016kFOk0GGkruUDMZRk8DxXKy5WAy+NB2IZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7947
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


On 19-03-2026 23:00, Anoop, Vijay wrote:
> From: Anoop Vijay <anoop.c.vijay@intel.com>
>
> Add suspend and resume handlers for System Controller to handle system
> (S3/S4) and runtime power management transitions.
>
> The handlers disable SoC remapper region before entering low power
> states and restore remapper configuration and mailbox interface on
> resume, re-establishing communication with firmware.
>
> Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
> Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> ---
> v10: (Riana, Umesh)
> - Added sysctrl suspend/resume handling
>
> v11: (Badal)
> - Remove explicit SoC remapper disable on suspend
> ---
>   drivers/gpu/drm/xe/xe_pm.c      | 11 +++++++++
>   drivers/gpu/drm/xe/xe_sysctrl.c | 44 +++++++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_sysctrl.h |  2 ++
>   3 files changed, 57 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index 01185f10a883..abdddd44a575 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -26,6 +26,7 @@
>   #include "xe_pcode.h"
>   #include "xe_pxp.h"
>   #include "xe_sriov_vf_ccs.h"
> +#include "xe_sysctrl.h"
>   #include "xe_trace.h"
>   #include "xe_vm.h"
>   #include "xe_wa.h"
> @@ -206,6 +207,8 @@ int xe_pm_suspend(struct xe_device *xe)
>   
>   	xe_i2c_pm_suspend(xe);
>   
> +	xe_sysctrl_pm_suspend(xe);
> +
>   	drm_dbg(&xe->drm, "Device suspended\n");
>   	xe_pm_block_end_signalling();
>   
> @@ -259,6 +262,8 @@ int xe_pm_resume(struct xe_device *xe)
>   
>   	xe_i2c_pm_resume(xe, true);
>   
> +	xe_sysctrl_pm_resume(xe);
> +
>   	xe_irq_resume(xe);
>   
>   	for_each_gt(gt, xe, id) {
> @@ -618,6 +623,9 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
>   
>   	xe_i2c_pm_suspend(xe);
>   
> +	if (xe->d3cold.allowed)
> +		xe_sysctrl_pm_suspend(xe);
> +
>   	xe_rpm_lockmap_release(xe);
>   	xe_pm_write_callback_task(xe, NULL);
>   	return 0;
> @@ -670,6 +678,9 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>   
>   	xe_i2c_pm_resume(xe, xe->d3cold.allowed);
>   
> +	if (xe->d3cold.allowed)
> +		xe_sysctrl_pm_resume(xe);
> +
>   	xe_irq_resume(xe);
>   
>   	for_each_gt(gt, xe, id) {
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl.c b/drivers/gpu/drm/xe/xe_sysctrl.c
> index 84e3b70043a1..d8f1f8cc2244 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl.c
> +++ b/drivers/gpu/drm/xe/xe_sysctrl.c
> @@ -82,3 +82,47 @@ int xe_sysctrl_init(struct xe_device *xe)
>   
>   	return 0;
>   }
> +
> +/**
> + * xe_sysctrl_pm_suspend() - System Controller suspend handler
> + * @xe: xe device instance
> + *
> + * Invoked during system suspend (S3/S4) and runtime suspend to D3.
> + *
> + * The SoC remapper region is cleared automatically by hardware on D3
> + * cold entry. No action is required. This function is kept to preserve
> + * suspend/resume symmetry and provide a hook for future System Controller
> + * suspend handling.
> + */
> +void xe_sysctrl_pm_suspend(struct xe_device *xe)
> +{
> +	if (!xe->info.has_sysctrl)
> +		return;
> +
> +	if (IS_SRIOV_VF(xe))
> +		return;
> +
> +	/* SoC remapper region is disabled automatically on D3 cold entry; no action required. */

This is empty function and need to be removed.

Thanks,
Badal

> +}
> +
> +/**
> + * xe_sysctrl_pm_resume() - System Controller resume handler
> + * @xe: xe device instance
> + *
> + * Invoked during system resume (S3/S4 to S0) and runtime resume from D3cold.
> + * Restores SoC remapper configuration and reinitializes mailbox interface.
> + */
> +void xe_sysctrl_pm_resume(struct xe_device *xe)
> +{
> +	struct xe_sysctrl *sc = &xe->sc;
> +
> +	if (!xe->info.has_sysctrl)
> +		return;
> +
> +	if (IS_SRIOV_VF(xe))
> +		return;
> +
> +	xe->soc_remapper.set_sysctrl_region(xe, SYSCTRL_MAILBOX_INDEX);
> +
> +	xe_sysctrl_mailbox_init(sc);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl.h b/drivers/gpu/drm/xe/xe_sysctrl.h
> index d5d8735038ae..a816feed8da6 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl.h
> @@ -17,5 +17,7 @@ static inline struct xe_device *sc_to_xe(struct xe_sysctrl *sc)
>   }
>   
>   int xe_sysctrl_init(struct xe_device *xe);
> +void xe_sysctrl_pm_suspend(struct xe_device *xe);
> +void xe_sysctrl_pm_resume(struct xe_device *xe);
>   
>   #endif
