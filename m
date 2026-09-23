Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16560C982FA
	for <intel-xe@archiver.kernel.org>; Wed, 23 Sep 2026 08:52:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C195410E878;
	Wed, 23 Sep 2026 08:52:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EOv16xHK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A785910E878
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Sep 2026 08:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790153578; x=1821689578;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=+3qr3p/lnzA0zGUxzr5Q0Kh0zUELI+Z1o9RvdRTbrXU=;
 b=EOv16xHKFFJ0DEheVCJQFJqU6SVthk9wkSqNT7pwd8pCqEctx5NonlCc
 bXnX26KViJGm2MxOrwTmSRO0JMIKb/8YkCBVSonoLKdZbwx9Xk6/qZLYj
 T5vquVkYuCnhI4IP/lOaSiO6juMxHytcIncWwGX10VY1ycHOgsyaMoCrV
 /h1Fjirgp3HrWFHQQavDMsA627vwDoCwQa7TqeDpg8bqvkD/BiTJ3pcWw
 bsVjzPdZqOGSweMx1P+nZD2fzLTqGP9OW6Rir1VDMe2K5Hus9Tq8XZqtL
 auSQxqGTkR19hwyFnt62ZJLAWtgptD1WiYUSZ3IPhWGP8WeBQqPZlFJ9c w==;
X-CSE-ConnectionGUID: Ipdy/x8mTkWQYX0CZB5UBg==
X-CSE-MsgGUID: of8NLyidTIexCT3Js70YcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="94647443"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; d="scan'208";a="94647443"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 01:52:57 -0700
X-CSE-ConnectionGUID: zzYoEFKVRka9sKO5+dSPzQ==
X-CSE-MsgGUID: 0LoJ2KdiRXSyr8+QowV4Cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="4578903"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 01:52:57 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 23 Sep 2026 01:52:56 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 23 Sep 2026 01:52:56 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.30) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 23 Sep 2026 01:52:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t7A+/BNHRX1Yx4XMSHxRckHU/x6FghWFqZcxz9vJ27WxK0rgIEAv+SiTxm8q2iLtdEn8b3qaz+IEhsDlKgAgdtv74669rIClRs7gI/uvoRxBtB5GyJDz7VcLaNMQ60JuNUXpHynfsrI8nwp3VoehSSeeyZqtID61grbVX5EYc6t+hXTEcavwyle3kx8dsmVxpovsyV9+wbMMhWtw0l/XKpOp87yXoAOQKDXolOAHktg3UOrMFiCqLsdKLC6obL0KtudM8bQr9lmWw7UrgpWeSq8g/cr9FLD+wgUhB38Evs3yMXLjo+R+Ro8YlLgQNq7deXefvu5+PvLDOfKDmhNpKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DjIFCLgZqZAltdkqvz/VOHBZJdY9grfuINv2AsbK4V0=;
 b=W/j9aZGFFvL7DVbnBMCZNTYpP7h09qyO6tV1iL93HMcejMCTSqKGcWrC+X7UPJGcfxyNUGEgEKh0hkRTEmhyiSY/ty/nk4URVAYMPHOYGsAGyyOt73k4O02aO5lROdddd3cjjhp7iD6ZFYPv124BkAf7HMZcaD9L50Z4rD3x5MmdQKIhr43yP32XtvOU5DRZPEzu979SOKFnXOcFd+9G1aDIzsSoVHRZNismdpyZ7nBXk1kDmusb+QaPGpldWMC4q10YTa3rbGs/g3c5eWkhRmoSeMGUNDTciSqAwvbcpluwzCW89972roG+K+39s4bDPXMgQXM7Nt08ga0WCrCuRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.16; Wed, 23 Sep
 2026 08:52:49 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687%6]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 08:52:49 +0000
Message-ID: <b23acf73-26a8-48fc-b304-a611ba476580@intel.com>
Date: Wed, 23 Sep 2026 14:22:41 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 22/24] drm/xe: Enter ULLS for migration jobs upon page
 fault or SVM prefetch
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20260904211613.3934307-1-matthew.brost@intel.com>
 <20260904211613.3934307-23-matthew.brost@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20260904211613.3934307-23-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0081.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ad::10) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|DS4PPFE901A304F:EE_
X-MS-Office365-Filtering-Correlation-Id: 68c0285f-d3a5-494d-34d6-08df19500b4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|11063799006|10067099003|56012099006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: vJJs7n+NQ9GZJ8hlikjFJWXVUqemdF9KE8bPaNDdgTYzM26W+ryl6oN2Thb0dlXtPf9R3slxQlQHZgpKN6wyDaVXnIdPO9gKH0eXE0VN2fhVyfdvw3K3RMuyv3xDSX19FKH1YnjulOKxSBGqx2qjnDxLCo2hZHo5gQI+aGwaKULRhNmJqJknQDhmsjoJQaGzr+NmoCamLlrucWj+xehHmCVJGdLro2IIj80ndE1qtkYQ719vI/R+tVW83HYPXtvndjhmRru1KzHYldmld1CUK3avnadB6KPM0iGuv95jndAlQ9MET9JhetzKl2EdP/E6D5ZF3ZaYZpNwvmci7qLxRQx5JESDaHBTVpgi2EVaU0NRt38xaM2iMVoG8ceHeFXLsKXmViAO/zYv6Wa+cwyidEIC7340SRNdkBHqLAjkM0gshrRy3tOFJ375pejJjgeLKY7WARmRPN1dFsnU9PDyOFQl3XcM/ffTjXTrlfK8EdBlOKf/K5qTZ/7Npw/ejV3ugFxs9kii80c1+0xWSsbqWGuUJUa0CusdB6nQ/+b4h95EcMWgT1DwTihtoELOHd9Ct8pO2QoMbQra2YY4EXSF8fYfH4vIGFWbJ3QgQFRzQm4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(11063799006)(10067099003)(56012099006)(4143699003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S0JXQkh0SXozaEdjVHBrNXJqNDlUQ0RRYlNQU3FUa25jV0drcVhycEt5cmlv?=
 =?utf-8?B?b3RXYVhKbzg2UEIyR2lXTkx0djVZckYxU2dJU01KTHA4VTJIU1IwN3A4K1Ar?=
 =?utf-8?B?NkNkZHR5U0NxYlF0dFFCVnVkUWhySk9aZlNiSndIaXA2ZzBVVHJydzB6YlNV?=
 =?utf-8?B?VDg1L0pJc1ova0U0VkRreGkxMFhQalRjc3psNi9qaHl3aDVjTWVVREgrZUlJ?=
 =?utf-8?B?ejdjZkRSQytaUFZ3dEZ3VGxkbHpOVGtXeU9kL3VqUzc5WUZmem90VlBrL3Zp?=
 =?utf-8?B?VnRmMnRTb3luTkx4TENaZWJnVndFUmVZQlY4N2VrcVpIWVNLaUxZQlZGMS9V?=
 =?utf-8?B?a0dxRVYya3pic2NWU0QwRXg1OUhPZlVWSVlNM3lRU2lBYnR2VW9IMkNMWHI2?=
 =?utf-8?B?NTFyTDVZdzliTytRUDlBRjNTTEQ4RGNoUXdDeWlXUVlYajRTMHdRanZQTjVK?=
 =?utf-8?B?L0pCNUJXUEZjNGFNUXpMUjFRTzV6SnRycUMyeElJRmpjQWFyL2hsK3BTcHNH?=
 =?utf-8?B?NmZRMGVGdTZrVkhuOWdqdzcwcWNXUVlvRHdvQ2paZmlFdUZ2dEFuZEIyU0VR?=
 =?utf-8?B?NTZKZUlZNkR2VGZQQkk1L1o0NFpnS1hPeE9vSjAwRm01cU1xaHgySEpTNXdk?=
 =?utf-8?B?V0pUQzhlTlFBZjZVVEl3c09lakgvZ3pIOUwrVzB5eFFZSUVSODI3MHREQUJJ?=
 =?utf-8?B?WjJuWklnUndZcFkyWm96MTJhMFQ2c2IvWlBxR0k5Z2YySS8zSG9YeTl2SU5F?=
 =?utf-8?B?REtCVEVNV0Z6YkRkMTRZeWFZc3krbDFrT0tTZXVraUh3YTZ5aXNVQnNRZ2hK?=
 =?utf-8?B?RTRHbWFWb21oVEJJdlNsbm1LRTFicGR5OWdxd1NzVU1wcU9Pamw2YkhPTktt?=
 =?utf-8?B?RElzL3hCc0xoanJoWXA0cEpUejlpcUF2T3hZVmMwWWFPb1RRaStpbWp2RENX?=
 =?utf-8?B?RUw0eU1nSU5BS0ZxdEhaMXA2VFAzandDcThJZGZXa1Jpb2hjbXZHLzVWd3Np?=
 =?utf-8?B?bmk0UXB6TVh2UVdnRkZDS0ppd1VxT2QrRXQ3OXErUGN0YmNsajVGYVJ4MzhP?=
 =?utf-8?B?S1Z0K0VWeGY2d3FKcUdiNHgzRlRYZ0YyY0pGclJuUVdGTVkrUURHWUVwVS9q?=
 =?utf-8?B?UmdNQmU0elE3RFA1SnM2dzF6Vzg1SG90R29mUnB5Tk5kTzJCNU1GM2g1OElW?=
 =?utf-8?B?ciszbzA2L3dBMjFYUVBFZVBTN0xicjlKN0NYemtEdHE4cXBVb1k4L1ZUcXB0?=
 =?utf-8?B?bDM0dlBDakZZUkZxR3lmSFp0MHJGS0ZscUFpWjdpMitNMmtCQnVkdWVUdUVv?=
 =?utf-8?B?ZTBtMVAwQlhBeis5NURPcFpFeEFDaWNSK1BaTUdqSml2SkZyZjRsUkpBcnBU?=
 =?utf-8?B?aGVtVks2czFMT0QxbWs3S3YreTIxYUErVDIwbTE3b3A3ZTJWbkZ5S0d0S09W?=
 =?utf-8?B?ZXZSVTBaVDZTZGk4RnhxQXFqVHVqRFFZOCsyZEs0S0J4bHFxOHNHVzdnc3B3?=
 =?utf-8?B?QnUwc2M1L2sxYm0rWnNFRno3cjN0OGF1anF3WTAwMHhDN3ZaOE11TlkzS2Nr?=
 =?utf-8?B?Y1FYb1FlNkt3clZmQndiOVBSbjZTYmozY1JENkxWcGZJOFB6ZFlDdDNzazNl?=
 =?utf-8?B?WGVJQTBVb1llamR2QVVBM1hBN3c1Z1BWLzVZSUZLWi9CL2h2YzU4bWRjK1hH?=
 =?utf-8?B?U0k5QmliZGVCNEFyR0Q5cldJSXM5Nm14Qjg2U0p2YzE0emFLK01JaWhWSzFL?=
 =?utf-8?B?aFpVTXVIcmFKWXhiZlE4dHVOamY1TTduMVVzeDFpMCt2Q2NEZHAzY2dUT3ls?=
 =?utf-8?B?SjBlQTJ2NVVQK2wwSUgrTmFjWDNnNHJRYWRBYUE3Q3l0cWlKTUFyRzFFSlVX?=
 =?utf-8?B?Y1A5eHVHbmpKSkNxeEpkREtDeXptTXh4eTZndHJVMzFyYnliQkE4QTZIQ1ZZ?=
 =?utf-8?B?S2NZSkQ5L2pLUFlzRkNXWmdyeGhoNENyTWV6KzIvL2EwTFhmQmVIaElkZG0z?=
 =?utf-8?B?d2JiblAycC9LM1Fxa1djankxaUVxSG9QN0gyeVdEVUdwaFpMVmh2Y0ZiZ0dx?=
 =?utf-8?B?aVMyMU4wVndxZlZTekhJMnNiNzZVTVpNQWloK1prd0U4dG1XcWR0dGF0L0R1?=
 =?utf-8?B?NHpwQ1FBK2tnZHhib29ySVZGOWpDRnZuRS91UC9leEFpYWx4SXE4SnhyRVVV?=
 =?utf-8?B?RXVFdTVLZjdrdEtZYlBoVDhpMm5IMUxJMVVoak5lbkZpeGNLRkhRcVJPVmp4?=
 =?utf-8?B?cUJrUDlhUU9YZ2RLOFNFSDN1WnVEN1pQM3U5SkxNQ29tUmhjTzdlQTF1YTln?=
 =?utf-8?B?U3FDWXpXVW01T1lkMzEvVTl1NjlCU2FZOEozOTdoWFJYSXZXUFhNdXdnWmxL?=
 =?utf-8?Q?2NoVBD2zoq84SLF4=3D?=
X-Exchange-RoutingPolicyChecked: mIvrVjmsCP8ghiyyhCgzCk+JEZk1u7PGIXoaSBC6nEIECurXf3sl+yK11xCBXx7ybR3Xi8WhdQ/xjk38SzWIQ/eDjA6W1FtqLDrRq5HP2JiJ2/rglHf+6NN4FCuHru5KBFIt8Dcc9S9ly9vFDY2jd2iidhd/1sovZ1xWsYmQVSjaAZSgdHDfuKYZMg9OZDWz+pdPFUakAnSD7QvKCZCkiJgJmL+Br8cJ44JyZwknYncBB5koQrMxwlxHfIxA9KwCXQ1mCe5miv5bNSorOZ6LurGvfDq4swCkt/OUmzK/3JpXCtxHkDDbRl4S3GFIJrzEO6PT1RyRQrBNd8SE6nmZKg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 68c0285f-d3a5-494d-34d6-08df19500b4e
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 08:52:49.1133 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wgpFPRx2pstSPni8WMWlXPpPbiSD8cxZjd7pjwLNsGkFFVn6HPOBY2liDhzWVBkz8pLAUk6Hriju6OiUC38LKkfeg1LFHWRzcsQt0l1kuxM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFE901A304F
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



On 05-09-2026 02:46, Matthew Brost wrote:
> Call xe_migration_ulls_enter upon page fault or SVM prefetch in an

commit fix: xe_migrate_ulls_enter

> effort speed up these critical paths.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Link: https://patch.msgid.link/20260228013501.106680-25-matthew.brost@intel.com
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> ---
>   drivers/gpu/drm/xe/xe_pagefault.c | 3 +++
>   drivers/gpu/drm/xe/xe_vm.c        | 4 +++-
>   2 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
> index e81ca24df37f..ecf2530f0284 100644
> --- a/drivers/gpu/drm/xe/xe_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> @@ -15,6 +15,7 @@
>   #include "xe_gt_stats.h"
>   #include "xe_hw_engine.h"
>   #include "xe_log.h"
> +#include "xe_migrate.h"
>   #include "xe_pagefault.h"
>   #include "xe_pagefault_types.h"
>   #include "xe_svm.h"
> @@ -262,6 +263,8 @@ static int xe_pagefault_service(struct xe_pagefault *pf)
>   	if (IS_ERR(vm))
>   		return PTR_ERR(vm);
>   
> +	xe_migrate_ulls_enter(gt_to_tile(gt)->migrate);
> +
>   	down_read(&vm->lock);
>   
>   	if (xe_vm_is_closed(vm)) {
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index ee4d149b7453..c68d3baf1988 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2526,8 +2526,10 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
>   			ctx.devmem_possible = IS_DGFX(vm->xe) &&
>   					      IS_ENABLED(CONFIG_DRM_XE_PAGEMAP);
>   
> -			for_each_tile(tile, vm->xe, id)
> +			for_each_tile(tile, vm->xe, id) {
> +				xe_migrate_ulls_enter(tile->migrate);
>   				tile_mask |= 0x1 << id;
> +			}

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

>   
>   			if (prefetch_region == DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC) {
>   				dpagemap = xe_vma_resolve_pagemap(vma,

