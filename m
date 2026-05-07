Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1C1ECD343F
	for <intel-xe@archiver.kernel.org>; Thu,  7 May 2026 13:56:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92B3410E291;
	Thu,  7 May 2026 13:56:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xq0A4JPs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E07C10E291
 for <intel-xe@lists.freedesktop.org>; Thu,  7 May 2026 13:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778162207; x=1809698207;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GzCN9qE8Hcw9CRRRnUiEaW8YBFzw8HUUwiLtX0HnmIM=;
 b=Xq0A4JPs9V3Jk5NGg6mhKxM+sTNgWvIZ4s2hBbHNYn8MhFUMGQv7CPOP
 ydg5BWBXwrtuB5G52sY1N5PgMHrT8/5ce9iFEJ+aRKtytwbDFR1vRLXQU
 t2koU7Th/Ybqcr/IK7blQ2F7OqdGOI/YoKalGXcZv0lOKfEUOoevKJ8uw
 hfpFV1ZqOD6Ge3zwEm7/fJKn0Z7cCsEKzSPsffO46DqdOT3Bcp/009kUs
 ctnhGpMtk4CCHXM/kA8FuHkhgP19Q4VVmTWHDE0GEHyIe3w3snm7rhi6Z
 ivAKnnEvwtCnCSrloF5ffi+qs1vnYc9UrKIQxSno3qTEUUvZbdWI0hujX Q==;
X-CSE-ConnectionGUID: WJ8UdxPLS82CetRm/qdNGA==
X-CSE-MsgGUID: H6P4rV7kRHC4xgqiYM+fEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="96680517"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; d="scan'208";a="96680517"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 06:56:46 -0700
X-CSE-ConnectionGUID: 5I6KOn7lSp6ULHBgbXuYRg==
X-CSE-MsgGUID: oSwLxOKHRMmg4R+8SfbG1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; d="scan'208";a="231930990"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 06:56:47 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 7 May 2026 06:56:46 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 7 May 2026 06:56:46 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.35)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 7 May 2026 06:56:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UXjgfC0fJrjm4X9wxmw6doalTflBYZYQ2BkeMPs/aLE/qREUDxo7I+wC4N3RDFss1/moswTiFAqgV//LwGtG5hSSgp6L2Opx2ZVh4+vaLUGW29AgNuvN79L6rpdeMEit5YdgqqtUnBIlLKiBuMkb3mQb3lKX8k5fGAohIdsedlz8aKio4fUMUuz/Z7IkHctXNRQ6MShukgMiDVMR9YWYYwOpOKLdes6zhZQKOcB+4ZVf5q0xgOYhBnql+0EE7AuuYeHtYi8amR3UNRFT7bvG8KOkra/9EsO8TyU+rS1cAh26MFwIxdMuSRCw5fr/34UvS4JWwDxERb560+bNjVwC5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ekGVbfD/WOlnjZCiFNUGp/wyecdBpt4/7Q+mZFy9FM0=;
 b=ML9z9d2Xt9KT5nSUOxXiIq6qBj8U/XDDjV6n5oh9ciLYmrISm34w7HpFLbdBLpBZudCQga2jmmZZNGiluXG93/3l1erdLqk7gW+9uKFwLsmPPrsO06H70/VRUNPibT4QAkxlmZLQUx5XctyhrLLyM5pqXTn9z5F8STQpboRvnNug6h/rhkttiSSRH2cCS71zHq5cjOKBXkuWsBmPIds4PCM0jWw6VkWpbnsjGhGEh/xt+oDXnEi2ZtC2MC/UhbuRX1IzUrn89VmZHIcsCz9GBd81TnPHaIJ3SzTK+nE4+8qXkO7BrtL5629wKlh/J3Y1KdBVktr0m5BLobqKNqz1dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB5900.namprd11.prod.outlook.com (2603:10b6:806:238::21)
 by SA0PR11MB4543.namprd11.prod.outlook.com (2603:10b6:806:99::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.16; Thu, 7 May
 2026 13:56:44 +0000
Received: from SA1PR11MB5900.namprd11.prod.outlook.com
 ([fe80::d294:7b1f:a7a2:e803]) by SA1PR11MB5900.namprd11.prod.outlook.com
 ([fe80::d294:7b1f:a7a2:e803%7]) with mapi id 15.20.9891.008; Thu, 7 May 2026
 13:56:44 +0000
Message-ID: <400d55b6-652b-4918-a5a1-1180dc42b13b@intel.com>
Date: Thu, 7 May 2026 15:56:37 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/12] drm/xe: Track parallel page fault activity in GT
 stats
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <stuart.summers@intel.com>, <arvind.yadav@intel.com>,
 <himal.prasad.ghimiray@intel.com>, <thomas.hellstrom@linux.intel.com>,
 <francois.dugast@intel.com>
References: <20260226042834.2963245-1-matthew.brost@intel.com>
 <20260226042834.2963245-13-matthew.brost@intel.com>
Content-Language: en-US
From: Maciej Patelczyk <maciej.patelczyk@intel.com>
In-Reply-To: <20260226042834.2963245-13-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DB9PR01CA0007.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:1d8::12) To SA1PR11MB5900.namprd11.prod.outlook.com
 (2603:10b6:806:238::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB5900:EE_|SA0PR11MB4543:EE_
X-MS-Office365-Filtering-Correlation-Id: 56658b3f-7964-402c-4e7b-08deac4078dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: iMX08VmmrKADRPjnBxlIgilvShwanUlDuArUc+maXRHWCDRnYH6T3CGgaGknTKkwiDGPqvKOl1VP2tjw4J6Fkr7fzTcGtXmEiljESOHr4ORYT8gpenZjHJNzvk/JqrAvNj+qrgvJPP3mqPPKqW/MBJgVfMfGv4k2WuQcuqCu5t7CHsJc91CS4YTDp5LElnlvqwUuDjNr4Y9VH8YXTnwGwlJGULDZIiDsn4768ksUTwKC0ryXIa3Vs7MNlJz/Q6A5I4ASkFcEkXOkB7YtT9yFjV2CNbP4bgxhUGJEdZIXBqqQLI2phNLYwEheenrfOMRuXsy8yUmYfPC4s9KSBu9Fx7oB9jCE0ok7wV2alqMaowYwG5Gr3ZuD2gcfWBFvn2UiBhLx9EnzDcCmHlMw+FPsxFhu2GeK+FflC33t1QKC2frlSeffbqHJyOagfPEblD2h0sEP1hTL5CaMNTFrnoqpNwOtFKwNEN3gBrUiQEtdAvq/sq8G31yOcOMlm31Fbby3ishBCMi1P0loqTk/7zKdLmOTJ2KbCVTGlHjpwNEw8wQ/9D12jaJb4Dq5VmLP5pMKUl7BrJ1GZw9aRfgD8zM4aHrcwAbAWrQrd1pXDHPiDKaO9rbB4LIQq8C1q/2SM9fIpm0JvFYWmRGu2i5Wr0o4ll6KM7q3u3Sh2YjAVrDrOsvVJbruG4rTRGcS3joHVJPv
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB5900.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OEVqdTBQNTg2MEpkU09zUDk1VHlhOTRqR2cwT1E4RUdmdiszVnBWRnpERTZO?=
 =?utf-8?B?Smp2Qm9xRjkxUVdEQitDT2JRbEhFMW84UzRXdE1tY3FxT0JNV0k1WTQrNW4y?=
 =?utf-8?B?eEZzS2dOVmEvNjhJMVdPUSsvNVNzQk9kN0xkMUxDZmlCSmdiWWdPblFWbG1C?=
 =?utf-8?B?Z01vV1ZiK0ROdnJqMHc4cEk1R1QrdGZXVEtNNUNxaVRkS2M5ZUtLSE1SUDZo?=
 =?utf-8?B?K1ZtSkJDaVBINloxVEphNkk0SUFWbXlXcWFTcUpYcFg5RmlOVWs2UzM0UkNT?=
 =?utf-8?B?NE02QjNaTDMrWEVuQlB4SlpzbWpmV0cvNlVPdWJIOWlZbDFjRDluQlhEaTY3?=
 =?utf-8?B?TmpwNk5MSEU5WkpDSCs0SWYva2tyQkJsNUxwbE1ydzlYSm00SFdqc09FcWhE?=
 =?utf-8?B?cUxjQ1IyUHNRL3Y1RW5ibnNXN3E1UzU5ZjN6TENKOVVtRTAvd0R6eHgybERU?=
 =?utf-8?B?Qi9Vbm1Zc3k5WHcyQjBtc2FmSHRhQlJyNzBuZG05UDRyd1Z2OUZBRHlVZ2hK?=
 =?utf-8?B?My80c0dBOGt1dVcwY2tPVDNLblFBeGFBdmhsT1ZsVTNXWUJxNlFJbDNzdXV6?=
 =?utf-8?B?LzY3UEJpejlUb2VxbzJqMDhHVVU4T0JJM2tyeTlaZThXMm9rRkY1NXhqSi9O?=
 =?utf-8?B?T0hKQlJIQjd5OFhnUWsxRGoyTHhxMUdYdzNQNXozbXdaaW94QVNUOFJoV1B1?=
 =?utf-8?B?VlV5MnI0WXM0MExZd0Z5STRBQWllVUZXNlI2NXozWFo2WHg4QXpzYVlQaVVS?=
 =?utf-8?B?Q3ZhdkZ0TkE1dDc0OGdzbldHbE1MUk1ZQXVxVFdORTltM01nMy9vSzluZ0x0?=
 =?utf-8?B?TzRWY1ZhZFVoWUZQZHBMa3I1b2NzZE5RVnlFMTJFM2UwSTRqVm5mWURqNkJu?=
 =?utf-8?B?UkF6ZTJ6V3pmSWhYT0JrQ08zNDAwWDlVWFdOcFpxQ21QREhIWHNrV0NQVi9D?=
 =?utf-8?B?eVhLOHVTaDBsc09UNFd6Z3VZVTE3eHZER1pCZWxXbTF0K3ViM3pZVzV2MUZ4?=
 =?utf-8?B?elZXTVBiQ1VWeXRMR2tDajc0UTIyWFJlQ0txcWwyK1hYRjVsVTZZQ1FUWlVE?=
 =?utf-8?B?SytBSmdRR2lBTmMrdGFqa0ViQVNCOFRyazZXYXdWa1BGcU9wQ21wNXA2UDhF?=
 =?utf-8?B?WGlzYVFyQThPb25hYzhrTDM4Wm5QK1NLR01ObWVrMGppNFlMNSttQ3dUODlm?=
 =?utf-8?B?cFNDYXByN3MrOU5OS1puR3JIUTVqZ1dtT1MvVkZwUEFDSHk5RTN1S2RQMm5Q?=
 =?utf-8?B?aDQxQmE1MWw0NFZvMjhMcXVNaVI1S3dETGtMYWE2U2ptRTZvaGw4NFpUNHdi?=
 =?utf-8?B?VHU2YzQyMWU0MTYydGRxMVFrOW4yVTVhNWtudkQ2TlhoSXFGUjNzZytaLzZL?=
 =?utf-8?B?b0ErSG01RVZ6dmpqRVdKQ3JkQUZka2VRNHpFeXl2VUFTcWtjdlpBQVhLQjdF?=
 =?utf-8?B?a0YycEs0L24vQkRwZ0N1L2dadittbXgwYTBPKzdLUmhqQnozTUFIMDlGczh5?=
 =?utf-8?B?ZHB3TzN6LzBHOEwxMElhWDZQc1ZWbFpBd29GQ1RZbmo3cnBBZWhVWjliSDJV?=
 =?utf-8?B?aHJ5WUN5UjFCdW8zZlEvckcxUEd6TGZhTTg2TXdneGk3VHlGOEZkVEc3bTJT?=
 =?utf-8?B?U2JhWXIxek5SMHpHeEVodmpWakdrWDh6OVQ3VWNOYStmWDQySEFkK3FkNVZ2?=
 =?utf-8?B?R0d6LzlpcXVsY2NIODU3bU9yZ0Y3MGhTeDMrSFBLNnRqbnVTcWY1VkNFSGs2?=
 =?utf-8?B?LzhRSGx1UlZ5YXduTFEvSGZnVGRqUXcrSFo3S2ErQkVIdVRzaVFQUU01L3ow?=
 =?utf-8?B?U2dBd1FTdXJjNlVNNHlmUGFiUjFOdENUTGFUY0ZmNUVSZW56VXVkdkFJN3lv?=
 =?utf-8?B?N0FzWVNYRGVveTRPSnE1ODNxc1dSNGxIM2h0a04rRTRlV0lQOHJId1h6TWhM?=
 =?utf-8?B?NTBEWkQ2Kys4TGlwVlBLZisvbm9zam50cUMrUTNmNk12YW1vV0N5NkV6NDZ1?=
 =?utf-8?B?SVNJUU1vVE80MnRkT3NBZEJLcjRCM0p3NDVsZ3FTeWIxLzF6NC9kdkNuVmJP?=
 =?utf-8?B?c0lyNlRqVmlvQVZpN0JKTWxQUHJlbzNLenNXK3FyQ3NNbEdLWTRNTk52bE5C?=
 =?utf-8?B?UkNvQVgrbitYemVzZ2ZHYmhrWGs0SFdhZEpZc0RiMTV6NzVHLzZ3Zkp6cFZ1?=
 =?utf-8?B?cFkxRW1CdERvaUgreDZUN2o5dnI2ZzBjWlpqTktIQ2padVNYVEc0NzVRdXEx?=
 =?utf-8?B?R0dtdVgxd3VpY2xtQmdBY2VEakZ0YUxWRndYa2xxSCtXKzJrNlJtS2RDbmhq?=
 =?utf-8?B?dC9JVmZWOXJ1Zy9SVHRaY3FGYXk0RlB3ZUxZU0xUQTdPc1NwV2ZPTEdaemdI?=
 =?utf-8?Q?N2tTJww6ulm6sT6s=3D?=
X-Exchange-RoutingPolicyChecked: olgW/uaYSF3/UHWlnBocd1k3/a4PxLhqrzW11xgKpxG8s+BH+rBltdhthDfS/dJCKR6hRtCv/qKs/2Q+uFUDCZpXnkjdyYuui8MApEVma2gT+MA5/7gKJlINZTKcA27xxVEMrWr6NRVVKpTn4DR8+1f6UI3o3OTuM2/jZZCe6kncDConRNTi6pahM6u6hOxfLi+nFnMdIc+a6duPQgcvvb1Q7VaDGd3gMW0tMf5Mug9mORlZt1zOSmV/pcS3pnxO74ZSyj1ISjETb2QWzsGb5exRvHiy+ANx3h/h0TArrdLqgJLZbUwc/JYgHGK7vfMyx/v11F7dqgaRiFPeLCV1aA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 56658b3f-7964-402c-4e7b-08deac4078dd
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB5900.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 13:56:44.1238 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0NPGa+xSsr+ZA/jJoP0PWwENYXJFV3C05NgeJwWSBNzCBqOs31ZyMv52VdRTZatNGhuiAq+XQpa+kkpqr1yw6gbSTP9WKikIz8pj5tig1T0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4543
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

On 26/02/2026 05:28, Matthew Brost wrote:

> Add a new GT statistic, PARALLEL_PAGEFAULT_COUNT, to record when
> multiple page fault workers are active concurrently.
>
> When a worker dequeues a fault, scan peer workers for an active
> cache entry and increment the counter if another fault is already
> in flight. This provides basic visibility into parallel fault
> handling behavior for performance analysis and tuning.
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt_stats.c       |  1 +
>   drivers/gpu/drm/xe/xe_gt_stats_types.h |  1 +
>   drivers/gpu/drm/xe/xe_pagefault.c      | 18 +++++++++++++++++-
>   3 files changed, 19 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt_stats.c b/drivers/gpu/drm/xe/xe_gt_stats.c
> index cdd467dfb46d..621d1a2df067 100644
> --- a/drivers/gpu/drm/xe/xe_gt_stats.c
> +++ b/drivers/gpu/drm/xe/xe_gt_stats.c
> @@ -58,6 +58,7 @@ static const char *const stat_description[__XE_GT_STATS_NUM_IDS] = {
>   	DEF_STAT_STR(CHAIN_IRQ_PAGEFAULT_COUNT, "chain_irq_pagefault_count"),
>   	DEF_STAT_STR(CHAIN_DRAIN_IRQ_PAGEFAULT_COUNT, "chain_drain_irq_pagefault_count"),
>   	DEF_STAT_STR(CHAIN_MISMATCH_PAGEFAULT_COUNT, "chain_mismatch_pagefault_count"),
> +	DEF_STAT_STR(PARALLEL_PAGEFAULT_COUNT, "parallel_pagefault_count"),
>   	DEF_STAT_STR(LAST_PAGEFAULT_COUNT, "last_pagefault_count"),
>   	DEF_STAT_STR(SVM_PAGEFAULT_COUNT, "svm_pagefault_count"),
>   	DEF_STAT_STR(TLB_INVAL, "tlb_inval_count"),
> diff --git a/drivers/gpu/drm/xe/xe_gt_stats_types.h b/drivers/gpu/drm/xe/xe_gt_stats_types.h
> index 591e614e1cfc..075a12152ae2 100644
> --- a/drivers/gpu/drm/xe/xe_gt_stats_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_stats_types.h
> @@ -13,6 +13,7 @@ enum xe_gt_stats_id {
>   	XE_GT_STATS_ID_CHAIN_IRQ_PAGEFAULT_COUNT,
>   	XE_GT_STATS_ID_CHAIN_DRAIN_IRQ_PAGEFAULT_COUNT,
>   	XE_GT_STATS_ID_CHAIN_MISMATCH_PAGEFAULT_COUNT,
> +	XE_GT_STATS_ID_PARALLEL_PAGEFAULT_COUNT,
>   	XE_GT_STATS_ID_LAST_PAGEFAULT_COUNT,
>   	XE_GT_STATS_ID_SVM_PAGEFAULT_COUNT,
>   	XE_GT_STATS_ID_TLB_INVAL,
> diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
> index d252a8c9d88c..2a37a4c97aad 100644
> --- a/drivers/gpu/drm/xe/xe_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> @@ -458,9 +458,10 @@ static bool xe_pagefault_queue_pop(struct xe_pagefault_queue *pf_queue,
>   {
>   	struct xe_device *xe = container_of(pf_queue, typeof(*xe),
>   					    usm.pf_queue);
> -	struct xe_pagefault_work *pf_work;
> +	struct xe_pagefault_work *pf_work, *__pf_work;
>   	struct xe_pagefault *lpf;
>   	size_t align = SZ_2M;
> +	int i;
>   
>   	guard(spinlock_irq)(&pf_queue->lock);
>   
> @@ -497,6 +498,21 @@ static bool xe_pagefault_queue_pop(struct xe_pagefault_queue *pf_queue,
>   	pf_work->cache.pf = lpf;
>   	lpf->consumer.alloc_state = XE_PAGEFAULT_ALLOC_STATE_ACTIVE;
>   
> +	for (i = 0, __pf_work = xe->usm.pf_workers;
> +	     i < xe->info.num_pf_work; ++i, ++__pf_work) {
> +		u64 cache_start = __pf_work->cache.start;
> +
> +		if (__pf_work == pf_work)
> +			continue;
> +
> +		if (cache_start != XE_PAGEFAULT_CACHE_START_INVALID) {
> +			xe_gt_stats_incr(xe_root_mmio_gt(xe),
> +					 XE_GT_STATS_ID_PARALLEL_PAGEFAULT_COUNT,
> +					 1);

In the xe_pagefault_queue_work() right after first ACTIVE pagefault is 
ACK'ed the worke's cache is invalidated.

Worker may still run releasing chained entries but this stat won't catch it.

Maybe it doesn't matter. Maybe the work is done (the 
xe_pagefault_service() being the core work) at that time.

Just noticing.

If it doesn't matter then

Reviewed-by: Maciej Patelczyk <maciej.patelczyk@intel.com>

> +			break;
> +		}
> +	}
> +
>   	/* Drain queue until empty or new fault found */
>   	while (1) {
>   		if (pf_queue->tail == pf_queue->head)
