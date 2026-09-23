Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD77FC98304
	for <intel-xe@archiver.kernel.org>; Wed, 23 Sep 2026 16:39:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67EA210ED47;
	Wed, 23 Sep 2026 16:39:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HfpC1+PX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4044010E950
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Sep 2026 16:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790181583; x=1821717583;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=H3YMvGc/yx5F2wSve9vXGcnZ2xq4PcJ8q6jUDG6LmRM=;
 b=HfpC1+PXJKNd6xKFW9hBXF5v9rBjnhrKqZd+GtG5GSnbBEaeh8Gcedjp
 IVtL/up5tXxglpQeVz3cLlm4vqOaDNq9C1TJ3/UnUWDtufsi7jLPcIuH/
 PiPe9nE62nERS6xTeHm0Kc+YOnJ6LKOw+3Xqv/q3Bp0ZX27fqrt2x/z9O
 MMfeN6HvEohoYCnjhS52CYUO8bTQniLjUrjv+W8FoP5SB4oA+F3uhMvMs
 powElf17B1wo0yux1sKupO/h00rjwYGJuTFP7do9pVCTFVoNntgAPWXvo
 EMXCve1QT791HQzA9Wwnp2cWlWTQxTevDw9cmgmsQCPLfPVZxMgEcKwV6 A==;
X-CSE-ConnectionGUID: ewEkY8B9QAKoSN/YZ/rbJA==
X-CSE-MsgGUID: Kv1NGzB/RB+3o9gDdjLVkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="90922219"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; d="scan'208";a="90922219"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 09:39:42 -0700
X-CSE-ConnectionGUID: zex7AJtgROW0zOMy1bqyCw==
X-CSE-MsgGUID: 8zfgluUnRPGt64jZDaOetQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="4774256"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 09:39:43 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 23 Sep 2026 09:39:42 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 23 Sep 2026 09:39:42 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.35) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 23 Sep 2026 09:39:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ylNHHrNiIgMooaiHn6vNMWwNa6KJ6y/0U76yyzn/pEtS+hWfEVfgUgqote8ODr+xoNIDZYBY+x4QdoqIdd3FKx5gFb9HLLFsgBtlWUmRLI0bITS6/vyDsMlOaKkDaCz3D0+QPn1J5qpKv8LMdwSHisC5CbEi2fKk1iikK3CgXA+7FBWL1DBhC1fxtKILqhAEjA7i5pieqDGBGA9/pd3ToKf7Jxn3X0m8ClDYdZ+64NO0aDWP92w89SB0yTd6HOysndD0BWVv1XeAKn02/nxSZ0sbXEH7lMk6FoggxCoTvIAbEh4RARp9dOPHP4lQZ/H2v4bsPJL3EMncxLHPFvHH4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2t1MPSRilqqzWkj9lhgL7Bn+VJLVzrbs5Sz9/2373WY=;
 b=J4UszGECLnoBcI1bi21Yia1cHkH8Ox/fiX9yr1foZpC0nyl0rXPT7Gravwaf3Sa3p+FmG/b/85P9NLH3oIqS9hAmyl4Ua3aj4UAihNOcFC4taq1bNvrbRcKChcYJCONffJ0XUXuIuz+PerOraskPrn2OVFPx18VYu/s/a4cMuBePv5VsFLeYdUbkiYy7Q1NlbPc/Wt8XMw087XhyNnOEiyevUbAYoUIFxVV9E07YPsnmUE2g2DFtC5RfOrHeD0FgTVEY165z9mDkhi0kwyiYyS/ES2ZkVRvT7gh2VzeoGKSi/xQLJquiTiMDNwiIEhDMlnYWcXdSQ+I8yhLsMAbkmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7530.namprd11.prod.outlook.com (2603:10b6:8:146::15)
 by DS7PR11MB6223.namprd11.prod.outlook.com (2603:10b6:8:98::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 16:39:39 +0000
Received: from DS0PR11MB7530.namprd11.prod.outlook.com
 ([fe80::4957:93c1:7385:6c52]) by DS0PR11MB7530.namprd11.prod.outlook.com
 ([fe80::4957:93c1:7385:6c52%6]) with mapi id 15.21.0451.012; Wed, 23 Sep 2026
 16:39:38 +0000
Message-ID: <8afcd21a-4ac2-46a5-a698-524b5ff8519d@intel.com>
Date: Wed, 23 Sep 2026 18:39:33 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Add and use TLBINVAL component
To: "Summers, Stuart" <stuart.summers@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "talesam@gmail.com" <talesam@gmail.com>
References: <20260922171911.500-1-michal.wajdeczko@intel.com>
 <ca660eb96bacc75620c6c58a521cc28c445ea9e7.camel@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <ca660eb96bacc75620c6c58a521cc28c445ea9e7.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VIUP296CA0009.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:34f::16) To DS0PR11MB7530.namprd11.prod.outlook.com
 (2603:10b6:8:146::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7530:EE_|DS7PR11MB6223:EE_
X-MS-Office365-Filtering-Correlation-Id: c46c8831-1a48-4238-cbfe-08df19914239
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|11063799006|10067099003|56012099006|6133799003|22082099003|18002099003|4143699003;
X-Microsoft-Antispam-Message-Info: Tnp2s76Ay/sZ+o1LtFOsiUYeY1TRIql40jzCf33OeXxrP19cWzJnidMYhX8qFXVqowgIeh3QGyhBtJUn6fEPulcixtbdQ4Pi9ahVcQ7A0DZQeoSIb9JqQmVBnUO2w9giuT/8qYxYmzlBmTeND9CpFhsIHQuRM4OD3NGh8aWzLmrBBIpIUSKCjdCNRl1anVmgrsZXtdxXhQj+DaEvSdxlBhmrw2GRfWd6kVnyEvu5COcDD1dxBvJTVcaaAXv60I4LRJxS2g7jHK9luBdNEcwm4o9khpVuDx4MRfgL1uAsMCEptVGBNEbYj7vy9mjnqM8kCracLU76TVdZHj6Pj2eTClM5KpSIp/SF9L4UDv+qBt6eEfR2ZOx5i63iPIivrNXItB/kkZSo0XbDQGrKjTxpRnjzlgu30+f2ej670OhbHs/nRp+2T7ma0RNTI0EYiQcWMSJluxFhDAvPiyDzhfzZvLh7eefSYIbKiJhCcVfJtQST5t6JPxMKvjKrRLQQ8sslp0np4ROujp++Qprsbhqmyb3Q3/CAXMb8HgV/iNtBs0F2YSUSQ0H0w0cfQdgrU4OlbRgGzak0niK6wPIWhpk4OQM0AqdqyuOBZrDHXudHr+9r0xLxaJrvyK8fanUMKvM9NjYw11BRB0oHwTBO/3llSUxgqZOSPaIcfrIZWF1AquE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(11063799006)(10067099003)(56012099006)(6133799003)(22082099003)(18002099003)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SFAyd2c0TjJLN1NOQWIyTDJpTXBwQ3EwL2ZtZXRxeVdCY1U3aFp3RWIycmlz?=
 =?utf-8?B?MUxqbmcwZzB3cGMzQzZzRmhhY3plclB2WUxJVG1PS3Q2WnhRTXY2UUt4Yk5n?=
 =?utf-8?B?clNFVVFsaXJKNVJERndTQ3MzTmIxdERwNnptUkRqQWNDVTB1MmJ4bnhDelZC?=
 =?utf-8?B?eU9FbVpEbWlpaHY1aSt3TElHZzlEY0JRQ0c3NFZQSmZ0b0NaRVJNbFRzTzE1?=
 =?utf-8?B?T3hTb2NNaFRKTnZlb2NxSnNzUUxWOUtWQWk5aVlVcCtTL2tRVWRDNk5rL0Jn?=
 =?utf-8?B?U1c5cXJXREJ5TzVOaGF6SlF2SWo0SmY3OVo5SmVDMlpYbjVVNGNlL3pzNzRP?=
 =?utf-8?B?TmlOUHlEZTQ1aFJrZ1dsZ3RCZUpvQXhYTCsvTGdCZDJjT3g1dHl0OFRKU0tD?=
 =?utf-8?B?UDhoU1RZYUlsTlpEWFY1NExXcjgwNkNJc1hnK2tyNmFVaE9SOVNzVEh4SVRy?=
 =?utf-8?B?MDhDbDArTm9sc1FnZDlncVNQeXFKRndvSFc3c3VheU5jQnZMVGZxQXVsOEM5?=
 =?utf-8?B?TC81Q0t3VkR5eUVxVDY0aHR2UERubjA3Nm9Wbm5adUpSV2FpSWpvVVhyWjUv?=
 =?utf-8?B?TTFZaVR5Y2VNbUw0Nnc4M0ZsVTgyMUR5YXhjL2ZLYVQ3TTFXZ3NhTk9GaGl4?=
 =?utf-8?B?MDNxY1dUQWZLNmQrcmpmWGFIbi8vMVAvNk8rOHo1SWdINDBvbGJJVW81UHpC?=
 =?utf-8?B?RWZzUFFWT3R2ZDEyUGw1ZzVUc0grcEd3WlBBZVJWS1d3UnVORHJaRFcrbjhl?=
 =?utf-8?B?NlNkS1ZpTXYxRnc3SW42TU91c3JOY1BmaEdGb1hDVk1TZWM3VTRMWnl3MW5x?=
 =?utf-8?B?cDZPNXFLZkRaK3p4cllMU25iUWVIbXM3dHlVU1JhMFViUjVpUzlIQ1RCeENB?=
 =?utf-8?B?SHQ3TDNqUkZjL0NweFJOQWtZbzdta0o0Z1V4N2NPclB3TzNNZ0k3OXp3allt?=
 =?utf-8?B?TkNqZEI3VmkyV1F0TUJKY1doaUJ5K0NnN0dWSXhBcS9LSGE2RlBFUWVFZkMw?=
 =?utf-8?B?TGFhZFhtU2FXeWlSTHZNek1yV0RIbzYzQXM1V2d0QXJPeUc5cTBXKzlORGZz?=
 =?utf-8?B?SGtCUHVPcmhlOFJ0MnoyZ1U4RFBmUjlZR2U4eU1XQ0JLandXYStTREl0TkZp?=
 =?utf-8?B?TFE0WG1MSVBZTFNvWWxOT2puUWNJL2Z4TzVLek1vNFBnMm12YVpwdGFaVDBv?=
 =?utf-8?B?dW9wN2Rpb3lYZ0VqN3ExU2Zjaks2R3dVWTNkNFVjcHZlTHUyZEdHQ2hpdzRw?=
 =?utf-8?B?ZFY5bkhtemY0MVJYYnNFNERoc0hHdnBOM2EyM3NKcjRET2dGRHNXMFI1Y0wv?=
 =?utf-8?B?SThiMDVCUHN2K3ZNRm1jeTE5dHd0MDA0dWkrc0NWMEx5VEZZb0cyN3V1OFpW?=
 =?utf-8?B?ZVkxM3pqTjg1ckhhMlNldHVNa2xXeGNEYVJ2eGE4Z29Wbld6TzBNSXpuckJl?=
 =?utf-8?B?dk4zbC9oODRiN25oRCtnVnBzODEzVUF0cWRldEhOck9qWjNCbUJ6UUV4a1Nm?=
 =?utf-8?B?ZExMODRCR3A2RjFiaXh4aEFHa3dRZ3didmk5MSt3Smo3Y2JrZEhlUW8ybzd6?=
 =?utf-8?B?ajc4YkxBVi9VbmpFQlBZT2FweHQ4OUlWTHRLdkFFaDRESkpSZE8zZjhhVDRi?=
 =?utf-8?B?UmJzS0JBUWxSNG04NGR4WjhFU1J0am9NalhMU1J0dTk1aHZkMk1SY0gwWjlB?=
 =?utf-8?B?Snp5b3p2T1BrM05PVUVrMlVjRVNManhsVmJtVTlwZ3Y0MHJyRmhvNFkzTWta?=
 =?utf-8?B?TUREc3BoVDhwalluVE9ja1Z4TEM5eHd3b0VNODY3cmRhVmVLQ3psOG90TUYy?=
 =?utf-8?B?RnQ5NnNuNjNyUE9HRFdjVDZORDZuVkZhSWpFVG43VDB1THN5UnRVVGxjTEty?=
 =?utf-8?B?V05mWE8zSkQ0NlFCUE1ib0pKVUNOWXJJNmpWbGQ5RytFUVZXdnl6eUZBcFpt?=
 =?utf-8?B?d0ZOcDFyZUtYS2lNalJmT1FnbnNXR1c4NG1JM202aEh1aGZ1UDBqMGFzalpK?=
 =?utf-8?B?Y3k0RE9YOXZTMjU0WnJjZ3FUMmp6L3BtR1FpeGNzUlZFQ2xGMGR2OEc2MDNT?=
 =?utf-8?B?UDdWT0IwSXhGd3JFaW14bWJERmRhb1FlSVV4bEwySTBZUUFFUzVFb01tOUtj?=
 =?utf-8?B?OUc3dTAyZldLQTQzYlJlMlE1NjEvaWJ4SkJHVFhWRHdtSzEwbFJ0bnVVNHVa?=
 =?utf-8?B?SU1yRHA1RzlXQStDRUtRR0cwdnVEWU5mNEpHVUdGbE80VHdqTnRPVkgzN3F1?=
 =?utf-8?B?NWRJWTBBVENtYnRZOTRKK3BqWnNVWGlZNDhpU3crcmpFK3R3UVl5a3pUVkNI?=
 =?utf-8?B?THk1bEdIQjdPaVlJOXVzbG1FdWRTKzdqYXhvR09GaUh4RnZFck5vellzVEh5?=
 =?utf-8?Q?f3xC2kLWJBSaD6F0=3D?=
X-Exchange-RoutingPolicyChecked: Xybn5imt9kRpphqu9y+t4AXzV+5ux0uRaHy3B/EjyqlIKxPm4t/tsbiRXd8/muHxlHur2cNfad49GBdX8JWyZ7Fdr2smHW5YlztJHerGjioPrQjcbDIv6MfiqHvE1MyK2vMSb2OsD1AO37q1deKM/MoQbkO3S/6WVQltxqTzNLfd9wOcXyq9g9rZtThkpiVOfMdgB7XixnqimBUh4NLLlpxdbXqjNQw3hMsdpibzAEXBmkhttWrGEa1eEzpJoeNZX5aPii8P/VFlKsO7zA6wgw1dUnAb15+lgJAWrAHUan2PAzEwPzr7VLuVUCd3bU82dhQfc+wQH6V9zUL/5yig7g==
X-MS-Exchange-CrossTenant-Network-Message-Id: c46c8831-1a48-4238-cbfe-08df19914239
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 16:39:38.5272 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fBEsRqbH4K4EigLMsjHwXK81Yt5e/bN2Lxkdwwn9MYY9ZEeWTvy3kOgP6sEXh+PKN/x+DTyXjut3huhbQl0yhyGHR77AOBzcMN/++8o5B8M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6223
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



On 9/22/2026 9:22 PM, Summers, Stuart wrote:
> On Tue, 2026-09-22 at 19:19 +0200, Michal Wajdeczko wrote:
>> Replace the existing TLB invalidation error message with a new one
>> based on the xe_log_err() macro and use the dedicated TLBINVAL log
>> component.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> ---
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Tales A. Mendonça <talesam@gmail.com>
>> ---
>>  drivers/gpu/drm/xe/abi/xe_log_abi.h | 1 +
>>  drivers/gpu/drm/xe/xe_tlb_inval.c   | 6 +++---
>>  2 files changed, 4 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/abi/xe_log_abi.h
>> b/drivers/gpu/drm/xe/abi/xe_log_abi.h
>> index 526aadf85fe9..adb3c2128251 100644
>> --- a/drivers/gpu/drm/xe/abi/xe_log_abi.h
>> +++ b/drivers/gpu/drm/xe/abi/xe_log_abi.h
>> @@ -145,6 +145,7 @@ enum xe_log_location_bits {
>>         define(DRIVER, 5, WA, SW,
>> "Workarounds")                                \
>>         define(DRIVER, 6, PAGEFAULT, MEM_FAULT, "Page
>> Fault")                   \
>>         define(DRIVER, 7, GUCSUBMIT, GT_TDR, "GuC
>> Submission")                  \
>> +       define(DRIVER, 8, TLBINVAL, GT_TDR, "TLB
>> Invalidation")                 \
>>         /*
>> */                                                                   
>> \
>>         define(DRIVER_HARDWARE, 1, REGS, IO_BUS,
>> "Registers")                   \
>>         define(DRIVER_HARDWARE, 2, GGTT, IO_BUS, "Global
>> GTT")                  \
>> diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.c
>> b/drivers/gpu/drm/xe/xe_tlb_inval.c
>> index dd1030de9ab6..da629d410829 100644
>> --- a/drivers/gpu/drm/xe/xe_tlb_inval.c
>> +++ b/drivers/gpu/drm/xe/xe_tlb_inval.c
>> @@ -11,6 +11,7 @@
>>  #include "xe_gt_types.h"
>>  #include "xe_guc_ct.h"
>>  #include "xe_guc_tlb_inval.h"
>> +#include "xe_log.h"
>>  #include "xe_mmio.h"
>>  #include "xe_pm.h"
>>  #include "xe_tlb_inval.h"
>> @@ -86,9 +87,8 @@ static void xe_tlb_inval_fence_timeout(struct
>> work_struct *work)
>>                         break;
>>  
>>                 trace_xe_tlb_inval_fence_timeout(xe, fence);
>> -               drm_err(&xe->drm,
>> -                       "TLB invalidation fence timeout, seqno=%d
>> recv=%d",
>> -                       fence->seqno, tlb_inval->seqno_recv);
>> +               xe_log_err(xe, TLBINVAL, -ETIME, "fence timeout,
>> seqno=%d recv=%d",
> 
> Can we keep the "TLB invalidation" piece here since that's a little
> easier for grepping when manually debugging?

this would be little redundant, as xe_log_err will emit dmesg like this:

  [drm] *ERROR* SIGID=106 (-ETIME) TLBINVAL: fence timeout...

vs

  [drm] *ERROR* SIGID=106 (-ETIME) TLBINVAL: TLB invalidation fence timeout...

> 
> And slight nitpick.. Can we use a variable for -ETIME here since we're
> now using it in two places in case we want to change in the future?
> 
> Otherwise the patch looks good:
> Reviewed-by: Stuart Summers <stuart.summers@intel.com>
> 
> Thanks,
> Stuart
> 
>> +                          fence->seqno, tlb_inval->seqno_recv);
>>  
>>                 fence->base.error = -ETIME;
>>                 xe_tlb_inval_fence_signal(fence);
> 

