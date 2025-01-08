Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 108A3E77188
	for <intel-xe@archiver.kernel.org>; Wed,  8 Jan 2025 13:55:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D49210E8AE;
	Wed,  8 Jan 2025 13:55:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ClRUmDEk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E686610E8AE
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Jan 2025 13:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736344509; x=1767880509;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=My/R1vzcSULNSIMUBSdB7M1kOSCDTAY/yleJb2PMvss=;
 b=ClRUmDEkjHDESKmzDEz8V11zebviehfXyoArAdttDn4bM1yMV0qqcVEr
 y+013ZFa73RbtJyopM2xADtrVoGkJSiE/u2E8nm3R/Hk/vsTWA0hSMPnK
 2xwwbMgfbqgXlxGcgioOi3yES+0pSdy2j1LVgGNGdI44ZIQNLqrLNZTVm
 /z9dB/diOagFJi6kW2zEnuMaqF/3gAysEh6HPRlibLE2I/8XlK9HZj0Sz
 a+KatqaK3kqklEHtxPOPG48dJMd/YKmTNNt5gl+z+TuNV/NDPRE34WFQ7
 HIsDz4ozJUFt00TPF68cfmhSFKchhUHehn6k6Ea5UniHEvl9ARPBZq/lm w==;
X-CSE-ConnectionGUID: 6/Dm0JfIRLaizgxqaEFkIw==
X-CSE-MsgGUID: PfT7jlOjTcSQn4KGb5QYJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="40248408"
X-IronPort-AV: E=Sophos;i="6.12,298,1728975600"; d="scan'208";a="40248408"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2025 05:55:08 -0800
X-CSE-ConnectionGUID: SWiucraWTZSW2fScZVB3mA==
X-CSE-MsgGUID: 9dgAzDvFTZCGuOXIobtGXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="107720099"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Jan 2025 05:55:06 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 8 Jan 2025 05:55:06 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 8 Jan 2025 05:55:06 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 8 Jan 2025 05:55:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dc2FW0mmeutMoWCHQWRx0NSuUbSl3mv7eyFBHwsUDdonQlX4SB1PJBWAwfCT/BydTyFGitWZcFmGBFcw7nRIlYLgHj7YbEC9NHTiyBtl5RfCiyAzibka7M8bQMIZeeb/L57MO3IXu0X5F9iuQc4ZkAwSHxhDySsd0UBhhsYp25BbDumGlXGB08xGivb2gWFEVupJu9LNGJu/jdXWoPxD88v/gWjGx8XyZoeWdwZ3E98zfBi9hUDBeAu7ZUwj1tRqKR6OWEdbKv0wn6oiez191sAeO1tHw24Wp/LON+wrA0R379KQzkF25JNoHbd4FFaxH9+B+NPI5AhL8acGrT0Ogg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k3Llr4nbQJ122SWDh66U1Qp4TPUd3KwmZhDIAYriATc=;
 b=RZHQYZIGGruKQi6assuSXeEDLrr66hvgkTpqm2T8xD0GYuK2wX3yX4RxesIF6SGiUsm/3OPZl1IVLjCvqji8J+Z8AAuZeirmd4qN8MbpQn9iIdoRG8BlLW/SBksyTjUa/2u58HfENW7rA/xSS2V0/GCl7Yezixx09cv1tq01ixbwDE8ZwLM22rJmjdx1dXl95N287JtEaplw12+9L0kwQWeaVKGlr0rft0bXXRAnrySJEsBTNsmOTrSOfZu1Q8lTwpxnDMCxJ5F1sC217igXrjAmTcR7R462aruNsHGAO49uVQqsFPUTasJmTZRzOTs/RqmWLk1u0u7iAnKRB4658w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8314.18; Wed, 8 Jan 2025 13:55:00 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347%7]) with mapi id 15.20.8335.011; Wed, 8 Jan 2025
 13:54:59 +0000
Message-ID: <e3e0ddbb-beef-4995-b9b1-ee93a4a326a1@intel.com>
Date: Wed, 8 Jan 2025 14:54:53 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/ptl: Apply Wa_14023061436
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Gustavo Sousa <gustavo.sousa@intel.com>
References: <20241210150621.781462-1-nirmoy.das@intel.com>
 <20241210215549.GT3224633@mdroper-desk1.amr.corp.intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <20241210215549.GT3224633@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TL0P290CA0010.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:5::14) To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|CO1PR11MB5154:EE_
X-MS-Office365-Filtering-Correlation-Id: 49bd32bd-93c3-46a1-2e8c-08dd2fec0a7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SHRubmdkSWpCNy94cGdsNDR3elNzMWdqcVJxZjZWMGxTZTVqUTZ1TjhjNGdQ?=
 =?utf-8?B?Ymovbkd3b2tVT3ZxQW0zdkxSSGxtZzAyeEN5WjNVR1pLajc3MEdTR2FhcnNW?=
 =?utf-8?B?b01TRjdTbldZVVo3N0dhODZxRndQRTh1dy82aHBzeHJ4SUtBSUFDTzVlY3Ft?=
 =?utf-8?B?NnF6cGt5djd5bW5zMEhIei9sQ1FxZnhCWWkySGpMYmUxRkc1blpuL01jcnVt?=
 =?utf-8?B?MlVLRmRaak9KbWJBZnBERnFhUWUxWWI2QmdZTTgraDdueVFncXVFdkgrc0I3?=
 =?utf-8?B?enowSGowMFJCZ3NidTJoNG05Zk5ZeE05RWJGK055TUtXT3g3SzMrcEhFeUtF?=
 =?utf-8?B?VGlsaU4vUi93TGVubVJkelRQR0hOazFpTXRRb0FmZWdnbFlydFVoV0VDVmVN?=
 =?utf-8?B?NS9VVXpIYlAveUNsUFJ5bTdRczgvamdNVUlxcmkrN0NoNC9wQzRmUVd3YkZO?=
 =?utf-8?B?L256MVI4VHNXTXBGNi96dUREbmJZZldtd0VmQys0QzZQRStMYlQ1clluYkx3?=
 =?utf-8?B?c2RBZ3piTUVlUnpvMWYrd0EyeHI0YU96SEM3UHZFcFNxY3hmRWowVXZIMW01?=
 =?utf-8?B?S2g0bzd1Zm53by9UOUJSVGYyZWR0U2RsTmVhSHdGSVRDVHJuV2syN2JNKzdy?=
 =?utf-8?B?VmF6cDRCa0lDMTZlRlpZYTB0WHhEaDZRWnBXcCs0Q25ZZmVwYXdGMGVQRk1K?=
 =?utf-8?B?TUFYaC9yWTBoVE9ldThDV0VSeTlKbUxYT1kxL3huRks2aGxqdUhud0MwV3k2?=
 =?utf-8?B?dk03RWhCamlENzRhZm96RWladmVlZzQvNlRYNlo2ME45Z1ZCOUpjekI1Y2ZD?=
 =?utf-8?B?dEdNaFBNK1hUaFFxTW5lY3JLdWxxYzdkUTFuZWZBbUl3NDJ1b0xPN01lNlli?=
 =?utf-8?B?OUZNamdmTkdmTUNHam1NRGwyVC9MdURZNjlXR2xtRXk5OTlmZjVPK0daVXV1?=
 =?utf-8?B?a1hIdUlyT0dhVi80YU1zM1VTaUF0SWpSUDZsb3RXeFd0dXZRT1hLQkZUaUJG?=
 =?utf-8?B?dm5xS2NPK2hWUDhpSHVYVkIwRXJjVUlhR20yVC9NVjRnUXhGTmNiN0tTY3Nw?=
 =?utf-8?B?TVoxZ29uYmYvQVlOWDczdDZ1TTF0N1lnMis2VEs5VG45V0lma21vZ2NWUTF1?=
 =?utf-8?B?NmhFOU5IUlRtb2pNQjJ0TFNTZS80c3hWWTdqMEZ2aHNubDU3NmRQSGErNkVR?=
 =?utf-8?B?ZDNCekUvbGY5UFRwTGNnWUt6RmZIVEY5SmRZM1FaNmJXMDI2UlpBaTZ3TUxN?=
 =?utf-8?B?Z0xYeUROWW0zMXJzcnR0Wk1JUE1sdCthZmRvMk14OERhNUZWd0lkbnVDT2Yr?=
 =?utf-8?B?VzlHcmk4SVRrZVkxL0lqR1JBQ2Q2Wm01dkZtaFVoTE5TVTA5SnpseGJVNFdj?=
 =?utf-8?B?LzcwNEFXNHlBT05HQ0ViWVF2WlB6bkVmZDN2L0xaRjNxakc2anFoMDFYek5Y?=
 =?utf-8?B?T1J2UU1kVUFXRWo4ZUt5T2F4WjNGM1lSVVRZQWpkL3RIRFc2bStmSTZid04w?=
 =?utf-8?B?RVpnTHJGVEZxNDd4dFdKWFJLaGtzMWpYOThoL1FaNFVPdmtvNFlORjRuVFNH?=
 =?utf-8?B?K1o1QWNSeVh1TDRyQ2dLSTU3SUdRTHlUOUJvSldMVkpCdWI1RXpSa1c3dmhX?=
 =?utf-8?B?VFlYeVJNTDFaNEMwMTduSDlRWnNUeEJjUWRsdFRoZEVxeW9kbXZTSTlJZFhm?=
 =?utf-8?B?cGxkbjVCM1JjNHd5dGpWZnZpUDAxSFV3Z3YvSlJVMGswZDlkWlRrVEU5dXR5?=
 =?utf-8?B?alhiWGtRQU9CZndMSHp3b3E3ZzF1N0luTW9Nb0hrZ1RnS3Y5YmRiMkZDRTVQ?=
 =?utf-8?B?NTVQNTdacDF0TzJtbHZtZFJoYStkOU9vcXc2NlJXSzE4L1dMZ0EwR0RQT0lt?=
 =?utf-8?Q?1PlzjGHzS2FPV?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cnl1Z2hZK2lJRTFSY1d5VG52dVhIZUllL214SFdyYnMwV243dmdaeTNsNCt4?=
 =?utf-8?B?OXhDVUhibVZqdDNTS0JrYllienJUMEpCNG55ckt2dmRDamgwcnlzTHY3WEhn?=
 =?utf-8?B?R0VHY2NHcWRaTXhkQjhnQ0RvQVE2VmgwSXZyeVlGZWJkaHRZMG9LVDNTSUgw?=
 =?utf-8?B?cWt1dWR3Q3RHSSs5YitrVXMzcWdCMmZRbmlyR3RtN256UHVhbDJmYnhHZHlr?=
 =?utf-8?B?UjgyVWJaQ1h1RHZBQVZYUStFTmQ0bGQ2dWljZlgrVU91NGgrNDh5ZnRHVENO?=
 =?utf-8?B?bVExZlMwcmczRCtvNkI2YVJLNDF5QXJ0bDRLZTZDNDFpeVlkQy80dldlb0x2?=
 =?utf-8?B?WXV0OCtMNVl2Q2N5RGFhSDVTWnEwcS9xSW56UUEvbWZuQ1U3YTFXS3JmL0Rn?=
 =?utf-8?B?bmJHR0dkQnRSRXNjRzlIUU83cDYxNVdnYko1bFJtMzRRRnR4WS9tT2pNdkVs?=
 =?utf-8?B?TGxLUHoySWQ2UzF3V1hoeU9HVkl3dms5emRIRHQrZ1E3bktUWS92d2N4MGtw?=
 =?utf-8?B?QWtyRFFSbVkzVEVSdmdHMnBFbk1ONDkzWEtRbjFoOERoYVI1WFliTERIM0E3?=
 =?utf-8?B?M1ZnTkVEdE9NTFNSV3JtZmYydjJwTjBnTDNxZHZIL1N1REQ3UFBJZjlzYUtm?=
 =?utf-8?B?WHRHTmV6ZmtUZ3pHMWM4dVZ2UkRPZ2QyWGROYWplQjFyZkVGNEdsVkxBeThC?=
 =?utf-8?B?OUZBQVZDR2FFZHRCb0xidmtKT0x6VldlYnNZWTZiaGpXMWRHQ3ZCTFpBNEhz?=
 =?utf-8?B?R2pORU9GVW10TDVYMFJJcGtNWWQ5dnVhalpBUGlzTkRTZHJaZnpNSWNFalZn?=
 =?utf-8?B?LzI3TGdSaTlLaHl6Nzh2aVZSSE4zaE5HS0REdzk5eTNpT2JhVzNVaFE4Q0E2?=
 =?utf-8?B?eldzcUJtN2V3aHg3MDF0N0JTZEs5c3RkbUFxN01mcjhKM0ltcDBvQ3U3V3Bm?=
 =?utf-8?B?OGpjbmQ4cUFZdnA0TUl5UFBUdEE2UGNvTkN3aWg3cmJRbmdsMStaWnBiWE1r?=
 =?utf-8?B?ODFTNWY4UWJ4YXVjTGlFbVZPcjZ3MjdWT3hUUlNpNnZFMG1uTjd0S1dLZlIy?=
 =?utf-8?B?VUl6MUtraEFTYlZCemxJMkxYOTc0QlVFWHNmTSsvYVlYYXkvV0dBVmsxWkwx?=
 =?utf-8?B?eFlHQk90SGFPTnBuTGdJcm1FYUdRTTc3amVTMnFJNjlMZU1SZUl4MmVYc3hJ?=
 =?utf-8?B?L3U1SlpoRDBjaEV6Rks5VnIraTRBcTZkZGFOMUUwQ1Z4WEZOVU45TDM2Y3ow?=
 =?utf-8?B?MGFzY2gzc3g1MmFMTFFhS2d2dko2L1VKb2QxTkVCOHBpUE96NWh2WHVCNW5T?=
 =?utf-8?B?N3VlNzB1SUxpcW4wM3pZd0FpNjJkUUdNd0NCbDdRZ2ZHc0IzeFQ3T1F2VjRm?=
 =?utf-8?B?SzdvcEh0Yy9GSjlaek5sNGoyOHg3OWdRQUYxZGtsNmxRNFRnWWpsUmRaaFJT?=
 =?utf-8?B?ZVpwNGIrbUdOWGdKdmV5TTdvRzdFN1hFcEFGb2gyWlhIanVUd2xwQ1c2enFC?=
 =?utf-8?B?N09NY3prd0R2akl2c3FHVDMrSHd5M3pRQWNKcUtldFVHS29JaVBkd21MbU5C?=
 =?utf-8?B?YU1iWE1yYWNyL0dmaFAwcEo0TENENHBZQmZSaFNRa1B6YjJlVTVwV05ZVzBa?=
 =?utf-8?B?NG9Ka2tDZEtHNzRQNE50bTIrWFFrSmc0dVBjV0QrNWRGMXNUakFMRXIxSmRy?=
 =?utf-8?B?a2RYTis2VnVCVEdsdGJuMUdTMlVyOUJ5VUpsME45OHNlSFRjRzRadHhLRWlt?=
 =?utf-8?B?eDlvMGtuVU9oVG1UZDZZRjM0TVhSTmlkbmtQdmVvM0tGTm5vcWZ2RWFTakd2?=
 =?utf-8?B?Vk9rbDJuL0M2L3NreHpxemJqSXdCTUpheThud2RXNmU1bnFTdUlVeFRYRzRT?=
 =?utf-8?B?VU1CM05GcDliSDJGNEtoMVhQdmE5TlhXeVQ1ekJIWSt0Um1xYWFUb0xOQTdw?=
 =?utf-8?B?ZUV2SmZuQVY1eE9JR1Fkc21tMTR2dzlIck1KSDVZbDY0OStUby9uRzRic2Zo?=
 =?utf-8?B?dmQvaFhKcTVmNWpYdlpTS1NLZ2dOVjMvVzFyaGo4V1laSnJtYmpkcm1zZk03?=
 =?utf-8?B?cnpORXRsSGxLakg2U1AybzVBTlRjUDVZTzZRS1RVdUkxYjVNRklUdXRkV0g2?=
 =?utf-8?Q?LX5fLyeATtEDvP0WTJ0urHUB5?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 49bd32bd-93c3-46a1-2e8c-08dd2fec0a7d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2025 13:54:59.2491 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e85xqDb4G5h3QdPFrnbwYQuPbJUPnXJZPG6fyExadyXS8OX58CHxhhqI4mnOLpILGd7KKCxESlbpQ6QIfL1UaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5154
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


On 12/10/2024 10:55 PM, Matt Roper wrote:
> On Tue, Dec 10, 2024 at 04:06:21PM +0100, Nirmoy Das wrote:
>> Enable WMTP for the BTD kernel to address Wa14023061436 by setting the
>> proper TDL Chicken Bit.
>>
>> Cc: Gustavo Sousa <gustavo.sousa@intel.com>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>>  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 3 +++
>>  drivers/gpu/drm/xe/xe_wa.c           | 4 ++++
>>  2 files changed, 7 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> index 162f18e975da..6829fbed1803 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> @@ -496,6 +496,9 @@
>>  #define EU_SYSTOLIC_LIC_THROTTLE_CTL_WITH_LOCK	XE_REG_MCR(0xe534)
>>  #define   EU_SYSTOLIC_LIC_THROTTLE_CTL_LOCK_BIT	REG_BIT(31)
>>  
>> +#define TDL_CHICKEN				XE_REG_MCR(0xe5f4, XE_REG_OPTION_MASKED)
>> +#define   QID_WAIT_FOR_THREAD_NOT_RUN_DISABLE	REG_BIT(12)
> e5f4 > e5f0 so I think this needs to be after the XEHP_HDC_CHICKEN0
> definition.
>
>
>> +
>>  #define XEHP_HDC_CHICKEN0					XE_REG_MCR(0xe5f0, XE_REG_OPTION_MASKED)
>>  #define   LSC_L1_FLUSH_CTL_3D_DATAPORT_FLUSH_EVENTS_MASK	REG_GENMASK(13, 11)
>>  #define   DIS_ATOMIC_CHAINING_TYPED_WRITES	REG_BIT(3)
>> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
>> index 570fe0376402..2889d6f65f51 100644
>> --- a/drivers/gpu/drm/xe/xe_wa.c
>> +++ b/drivers/gpu/drm/xe/xe_wa.c
>> @@ -637,6 +637,10 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
> I don't see this register in the RCS engine's LRC (bspec 65182), so I'm
> not sure this is the correct list.  We probably need this on
> engine_was[] so that this will be saved/restored properly around engine
> resets.
>
>>  	  XE_RTP_RULES(GRAPHICS_VERSION(1200)),
>>  	  XE_RTP_ACTIONS(SET(COMMON_SLICE_CHICKEN4, DISABLE_TDC_LOAD_BALANCING_CALC))
>>  	},
>> +	{ XE_RTP_NAME("14023061436"),
>> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3001), ENGINE_CLASS(RENDER)),
> Given the above (that this isn't tied to one specific engine's LRC) and
> given that the register doesn't fall within the dedicated RCS range
> (0x2xxx), we should probably also change the ENGINE_CLASS(RENDER) to
> FUNC(xe_rtp_match_first_render_or_compute) here.  For PTL (the only
> platform that uses these IPs at the moment) it doesn't really matter,
> but if we wind up extending this to some other platform in the future
> that lacks an RCS, then using the 'first render or compute' match will
> ensure that the workaround still gets applied properly in the absence of
> an RCS engine.


Thanks Matt for your detailed review. Sent out a v2 with above suggestions.


Regards,

Nirmoy

>
>
> Matt
>
>> +	  XE_RTP_ACTIONS(SET(TDL_CHICKEN, QID_WAIT_FOR_THREAD_NOT_RUN_DISABLE))
>> +	},
>>  
>>  	/* DG1 */
>>  
>> -- 
>> 2.46.0
>>
