Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24B65CD3427
	for <intel-xe@archiver.kernel.org>; Thu,  7 May 2026 10:07:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8E8110E25B;
	Thu,  7 May 2026 10:07:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SnAcmpVz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A60B10E25B
 for <intel-xe@lists.freedesktop.org>; Thu,  7 May 2026 10:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778148445; x=1809684445;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=I0X4A4DUp3sbJZa4LZGGH45+saMiCFLLKNbBPoA3BSw=;
 b=SnAcmpVz5hrYLWErzNPAfACk+r3mTqpiOdIv4RNrwxMIlgZBcopR32w7
 W40DRsVVU/k0OnhCnOG7NiaXwVE2UkNdMxlCfFGlueCCyj49JtNK4vD1c
 MOjbwFPOXyNVUe8dpSbKbP7jxS0qiRC9t0Vk3wkL41LRGm2LdQ7U6Nka8
 J9lYXGXiB3jeDSZYIVnZ4rB3ylPF8RTS0q2UJaF1lbdqIYmdW6LJVWIds
 9hGWjGXDEU1c9vGaa6N4rZ8FxsB+51UAhJFsumr24EAjl4eqXYVWEVKU7
 DVUIhRryUI0GJgDEkfpsfBdQYI4IEo+JEEGOBm2qiKrsQCdrDMjWsvXzv g==;
X-CSE-ConnectionGUID: NZ/edyf1QyupnF+PxrY0tg==
X-CSE-MsgGUID: /gZyWXyZTWuEEmqVcs2rNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="96662852"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; d="scan'208";a="96662852"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 03:07:24 -0700
X-CSE-ConnectionGUID: S5cSY/4JRo2AuPkXGR0InA==
X-CSE-MsgGUID: zYBmu4PHQi6PGLtphwBcyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; d="scan'208";a="274565627"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 03:07:24 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 7 May 2026 03:07:23 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 7 May 2026 03:07:23 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.32) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 7 May 2026 03:07:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wr1rc930TJv2aNY0ajalwIm69QiEwE0Ax6rboP31fe/AxTmKb+GKr1z62ieIqNDmQZpc+cUEwNcaQ3QgHkxAnFc/hRVbao/rH2LthUscIxVBWdsB8h78WWyDuvXTDKMONBcSmwoI20F0uirxsvcArKcTHtyE/+IKaMd1os5YdBLYTn464eUjsfs7XiItSunBx7eO9TEY8UficmnQil31NFXS36Xda3NNXAWQIXIOGBxogIV/xhR8dCaDpi5+lT8AMOc6rkTyyVck7mVFwQKBoGCGksZeIEcKKNFZYLrxXiQqooZW7ElrVxIgzXl5m79u7j8FTMD85SyoJmdHonr4eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zAGAdl0Wxhg3Mdi6crqG/Nx8Sv3WPPZLkSr8p6HWgz8=;
 b=Gvo7JrVqKa2eNoVqGyG9XbQ03Vl+TYaDlBGnSz/jvz0V+byqCMczCl0ElsbLR5YlLeihg0LORNYUzVmHcJVdkqy6ys/NRH6JnnDikfN+ttv5KiKMf/ue/rjqXpUw+YPko//KOQk2sCKxRTzQN7FZ+s3bKQXBjRyKfa5jIVSmCghrL0Ko3ryH2lGYPf00OBFG0W4qQv3b+wsZ5g536iNIkAUhgnUaS31IUA64YAyWUUsixSzHFs0NSG46JrPmqPXcg1ZdwpWDikpX3G2uqQmMlxYVOvmNYAexqwASlsmC0JWoxbvaIX24xaYG3Ch5NqWcTjQFob0//u3wY715ph0o2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB5900.namprd11.prod.outlook.com (2603:10b6:806:238::21)
 by CH3PR11MB8140.namprd11.prod.outlook.com (2603:10b6:610:15b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Thu, 7 May
 2026 10:07:18 +0000
Received: from SA1PR11MB5900.namprd11.prod.outlook.com
 ([fe80::d294:7b1f:a7a2:e803]) by SA1PR11MB5900.namprd11.prod.outlook.com
 ([fe80::d294:7b1f:a7a2:e803%7]) with mapi id 15.20.9891.008; Thu, 7 May 2026
 10:07:18 +0000
Message-ID: <5ff42e81-ff93-4435-8d88-6577110ec5a7@intel.com>
Date: Thu, 7 May 2026 12:07:14 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/12] drm/xe: Add debugfs pagefault_info
To: <intel-xe@lists.freedesktop.org>
References: <20260226042834.2963245-1-matthew.brost@intel.com>
 <20260226042834.2963245-11-matthew.brost@intel.com>
Content-Language: en-US
From: Maciej Patelczyk <maciej.patelczyk@intel.com>
In-Reply-To: <20260226042834.2963245-11-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR08CA0214.eurprd08.prod.outlook.com
 (2603:10a6:802:15::23) To SA1PR11MB5900.namprd11.prod.outlook.com
 (2603:10b6:806:238::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB5900:EE_|CH3PR11MB8140:EE_
X-MS-Office365-Filtering-Correlation-Id: 885e7caf-aa75-4c2c-831f-08deac206bfb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|3023799003|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 0EluCVvX6cVp8GuiVpZtJWUKPBpGLjCv4Gk6rIO3XwlwVh5LP/p9HM3ahLzEii5X86wuxQtbEZdmD1cZpc7jAhVD+5fbVjKo3h05kiCG0VU4d+w4YYTGEahtrIjlkcFMSCbZroeF43jvbZo3G2Tx3KECvC3+SWtlwrHHxiHqim5Ta1u4/NCREnh7bfcbNzUeKBW5k7tA54AnmENhu74HEez7MMeCX7wO7Cow5KolQzF5iy+RyNupucrpO1dW9BxlFWBrygYxs1B9dOhfIr1GjdWFK2KuMbxwiKzsN5Lion92dztNYproB7Xd6GtQyGwk1NFTmlEH4cjZQ8OV1Tnq1bgh6HpdrMZuUEd9/jELtzgajK23Kr5ZALbOScvHpavucZLLapyDp10NvSZ/FDWnBQfw2CTUNXmSpoXTtaTD+OjByNnGJweveqB7AXb7lJ2UTt5zolXEtNT6eDiZlCdBY78a3BY6oMBR9vgjST4vhgLoxixKEYpbUR042/SCIzWq93jSG68Fk+IDbH7ex6sSfw/9985LWzR0+tbPQMgMf+hMKX4nZS2S5Zkom3u3wq9Gw2vmccZCbiVqBrgPcP0TvuCbMyPh0FFkpRrKBdY81fTtA3/T8l0QV67nu5ianoe7+TltQLU/S3AniyJFjK/byZmU0ls4wwCAGySz38469jmIpL9e4mCncMPcvOxbo9sG
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB5900.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(3023799003)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QlBYa2xpVVVnZkovbmJOZk1QY0NLaTZ6dmNwWnRzeGVhR25iWmwxK0E2YzZU?=
 =?utf-8?B?cGdGTFZjbFNhdkFTT1dNdExuQlNiNWdDNEZnblZFcG51MWt4YVhvRlIxKzF5?=
 =?utf-8?B?L2lNUGJ1NHh1djJhNWcxeTVxUFVWRVg3YnBxc280ZkRaVlVhNzB4ZW9BcmhN?=
 =?utf-8?B?c0NseEYvOWpUWENTRE9WSWlXNFFtc2kwaExDc1UxSElYZ0NseUNjZFkyckZX?=
 =?utf-8?B?aTFXK0s5ZDVHWmFmanNGd3lCUzRXSkY3QVpvbkg4b0cxTnI2M290T2QzVFRl?=
 =?utf-8?B?RWw4Ym9pRGtjZFdHMHp4MHJjVDZzTk0rTkpManZ2clFGWUUrR2NWc2tWamJE?=
 =?utf-8?B?T0p3WmxWenYrUlpKamFSQ2JITWowbFYyUXowQWJ6ZEJJNStydzR3UzF0ejdn?=
 =?utf-8?B?Yis4NTl5NWtDSVNPNDlUV0N5UVJaMTJBUVJ4UmtHYkpvRHVyazlVcjJXa2NX?=
 =?utf-8?B?V29FL0N5KzhnZXREbmRqMXZYVzU5anYvVEdVSC9mcGlXS005MTlWZzcyeUky?=
 =?utf-8?B?endaYVkvVnJwYnlRYmFZSzJBUVBqWGVSeTZYbzF4SkJEZktBclpZWkltdGlB?=
 =?utf-8?B?RlZEdTFMNGNJTzNFZERJK3dDSE1tRTU4K1dzZ3RpWDhBS3V2dTJJWk5wdzhM?=
 =?utf-8?B?T3hxb2hZT3NYRTQ5VmIvZjZ4M2dyV011SFNFUXRYNk45eS8rVzl1dGs5OVJB?=
 =?utf-8?B?WE1DMWE3YXJETjkwSng0SmoxYnRZU1QzamFoR3d6Vzd5bHpiMjNPUG1xakFa?=
 =?utf-8?B?bndvbGlwUGlzK3JOYklWVldLWkJhdDRTbnVQUndTZDFYQnBTbit1ZDltbmx0?=
 =?utf-8?B?NXNBM0V3bUZ2MDlIekJrbGVob0RURFljOGlKcHRxQzdFSElreUk4MmJ4VTR1?=
 =?utf-8?B?bHpDMzQwRFhqYndIOFlWbDhMck4ySzNaRHh0TVJhOFIrZ2RCZnNiTWt4NzYz?=
 =?utf-8?B?UU8zZmcwdmJhTWZsMnY0UVVzTUwwbytGWWd3UEZ6eExYZUp2ejNqTVV6Y1Bz?=
 =?utf-8?B?Qi9qMkJJeWNsVCttbU5HdS9QcmdwOUJMb0gvZ1JEMkNaWkJKN1hyQllBWFRk?=
 =?utf-8?B?L0FabDQwaktMNkQxNER2Z1U4LzA1amlERGtXQ3JsOWNUTHQ5THQ4RUMyMFZF?=
 =?utf-8?B?U3NudFhyMng0MDVUeEJ4VlZOK2JnL0lJbS9GTVhrOUc0Tk1wM3ZzbWg0SzZP?=
 =?utf-8?B?K05VS29ybVVMZ2VXRWJGajAydUZQMm9POHdCZ0U2MVRVWmZtdEZ0d2plY0FB?=
 =?utf-8?B?eTZ6cCtwVUVqT1pESVBxZXFWOVdUbE1yWFFIQ1I5Z2N4bUlNRi85TE1uNHph?=
 =?utf-8?B?RklkSlRWbHdYTlhQTHVyTzNBSUJLeVcycENCemhhYS95RC8xU1BtY05qRnVL?=
 =?utf-8?B?aFhTTkViMkU0dTFuUGpQZ0NRUWVmSlFkYkh3ZUtPMjJ4SmVZa1k4WDZsdStJ?=
 =?utf-8?B?OFc4L2xyYW1wSE9abkdndmxMTUFXdGFiWktZQjFiWUhTckY4U25WVVJrc0kv?=
 =?utf-8?B?VjZFRmtVeE14TWRWNkhERHZDUXBqQWJEUFFFYlJNZzFSUlNJZm1jcEFhKzAx?=
 =?utf-8?B?QzFwMDI0WUUyMnNqODE5YTYyT2RIMmloeXNkOTJ3VTQ3S01XeUsyazhrYkVM?=
 =?utf-8?B?aGxvNi9Vd0pGNmFYSndlV3JlWko1Q3dIb3hJemhUTENQME9IY1l6TmRDR3pz?=
 =?utf-8?B?bmdnbXQzR1FSdlBoS1lpZ0Z5WEprYkovTzlLUlhkRjZMb3hqaTVIazFISkZQ?=
 =?utf-8?B?cVpjVmNoQ1A3WEFiU1JzbFNuOWxxcTBWRkozVmJuRUlibTd1QnZ2UVBTa21s?=
 =?utf-8?B?WDVXWjcxckpJaktYQTNhcDB0Uk9UVnM1RXAvUW41cGMrbERZZ2NWVk5QSWpr?=
 =?utf-8?B?cE5pTnFwQUpoU1VvMFBwa0QrWXBPVHlMYnVHemlxNnppZFAwb00zMk1BQUJH?=
 =?utf-8?B?L1VpZmdPdWFBVFlOdkQ2dHhtWHA0eU1wdTlaaks2aU44WXBkWkU3dVBTQ216?=
 =?utf-8?B?OUg1a1Q5aGxUcTQwQjBZZER6K0thNUxNREh2dkNPWTdkQjY0V25LRmZmdkJ1?=
 =?utf-8?B?NzdZQ0VYc3oreEd4MG1oVDVPam9zbkphM0dYbVUvY1lSdFVYWnJhRU4vZ2h0?=
 =?utf-8?B?ejVtRFM4MlV6czc4QkZ5K0NuZ2YwMllQNHlCSDdJbkxYYTFCQ3ZrODg1bFpi?=
 =?utf-8?B?U2ZlaVVocXJNRzcwTDljMStvdktiQXRCd1dXNVI1WlFRRjdpT3hSSFFJMU5n?=
 =?utf-8?B?TGt0d2hqOWhLMFZncUNTbzRuVkViTVJoaUpyUFFnR0NXWlI4M1p0TDNyTTI5?=
 =?utf-8?B?TEJ1WG1UNXZsMW4xbVN0VVJhMm1iUklDRFZOSmkxWjBLZktKUGJvTVpTb204?=
 =?utf-8?Q?b/9TlaFN4A5gvAGI=3D?=
X-Exchange-RoutingPolicyChecked: RnRq+ZtvliP4itz5mjgd1S6F1R+g92q27+68xPLGskT5tLuyUNiPpLmBJTdDwk0y2zzTGosF3wjXvdLAUjXqToM6MwA1aJBc0JSpikij1UgnFqrPJWJLbzzyLEsZdvmjMGOydLVBYb8wQC85gdwEzgFEziEICjZpNw7oVqPIFiKCLHWs6L6rSOezr/FDYfxEQHDIxjJ8Z6rhiaJ0Zp/lK6ehbv0jQ3joOGe1Jvt/4u5isXRz4kgXSITOW8vAPkZZB0aULnn6yqt4yXoQdf+rGEVMzVH5HRCSPuwADdpZ0APrVwKYVqlRRyvbwmimG8QeajqAmvBn9q1pX42lmQA5pQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 885e7caf-aa75-4c2c-831f-08deac206bfb
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB5900.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 10:07:18.6253 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LK0Ng47pZPgttoUj3Nu3MUVvV786s4/xdOmgMbi4+SbimdV5TTxAobCQiexMvJVk3YC/DUOQZconkuarKu8eq5HYwW2D9MtIjLgk/PeLwoo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8140
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

> Add a debugfs entry to dump Xe page fault queue state. The output
> includes queue geometry (entry size, total size, head/tail), per-entry
> allocation state counts, and whether each page fault worker cache is
> currently valid.
>
> This is intended to help debug page fault storms, chaining, and retry
> behaviour without needing tracing.
>
> Assisted-by: Chat-GPT # Documentation
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_debugfs.c   | 11 ++++++
>   drivers/gpu/drm/xe/xe_pagefault.c | 62 +++++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_pagefault.h |  3 ++
>   3 files changed, 76 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index 844cfafe1ec7..f02481be2501 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -19,6 +19,7 @@
>   #include "xe_gt_printk.h"
>   #include "xe_guc_ads.h"
>   #include "xe_mmio.h"
> +#include "xe_pagefault.h"
>   #include "xe_pm.h"
>   #include "xe_psmi.h"
>   #include "xe_pxp_debugfs.h"
> @@ -109,6 +110,15 @@ static int sriov_info(struct seq_file *m, void *data)
>   	return 0;
>   }
>   
> +static int pagefault_info(struct seq_file *m, void *data)
> +{
> +	struct xe_device *xe = node_to_xe(m->private);
> +	struct drm_printer p = drm_seq_file_printer(m);
> +
> +	xe_pagefault_print_info(xe, &p);
> +	return 0;
> +}
> +
>   static int workarounds(struct xe_device *xe, struct drm_printer *p)
>   {
>   	guard(xe_pm_runtime)(xe);
> @@ -184,6 +194,7 @@ static const struct drm_info_list debugfs_list[] = {
>   	{"info", info, 0},
>   	{ .name = "sriov_info", .show = sriov_info, },
>   	{ .name = "workarounds", .show = workaround_info, },
> +	{ .name = "pagefault_info", .show = pagefault_info, },
>   };
>   
>   static const struct drm_info_list debugfs_residencies[] = {
> diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
> index c497dd8d9724..2cfda29321c9 100644
> --- a/drivers/gpu/drm/xe/xe_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> @@ -97,6 +97,7 @@ enum xe_pagefault_alloc_state {
>   	XE_PAGEFAULT_ALLOC_STATE_QUEUED		= 1,
>   	XE_PAGEFAULT_ALLOC_STATE_CHAINED	= 2,
>   	XE_PAGEFAULT_ALLOC_STATE_ACTIVE		= 3,
> +	XE_PAGEFAULT_ALLOC_STATE_COUNT		= 4,
>   };
>   
>   static int xe_pagefault_entry_size(void)
> @@ -846,3 +847,64 @@ int xe_pagefault_handler(struct xe_device *xe, struct xe_pagefault *pf)
>   
>   	return full ? -ENOSPC : 0;
>   }
> +
> +/**
> + * xe_pagefault_print_info() - dump page fault queue/cache debug information
> + * @xe: Xe device
> + * @p: DRM printer to emit output to
> + *
> + * Print a snapshot of the page fault queue state for debugging. The output
> + * includes queue parameters (entry size, total size, head/tail), a histogram
> + * of per-entry allocation state values, and the validity of each per-worker
> + * page fault cache.
> + *
> + * This function is intended for debugfs and similar diagnostics. It acquires
> + * the page fault queue spinlock internally to serialize against IRQ-side
> + * producers and the worker consumer path, so callers must not hold the queue
> + * lock.
> + */
> +void xe_pagefault_print_info(struct xe_device *xe, struct drm_printer *p)
> +{
> +	struct xe_pagefault_queue *pf_queue = &xe->usm.pf_queue;
> +	struct xe_pagefault_work *pf_work;
> +	static const char * const alloc_state_names[] = {
> +		[XE_PAGEFAULT_ALLOC_STATE_FREE] = "free",
> +		[XE_PAGEFAULT_ALLOC_STATE_QUEUED] = "queued",
> +		[XE_PAGEFAULT_ALLOC_STATE_CHAINED] = "chained",
> +		[XE_PAGEFAULT_ALLOC_STATE_ACTIVE] = "active",
> +	};
> +	u32 i, counts[XE_PAGEFAULT_ALLOC_STATE_COUNT] = {};
> +
> +	guard(spinlock_irq)(&pf_queue->lock);
> +
> +	drm_printf(p, "pagefault size: %u\n", xe_pagefault_entry_size());
> +	drm_printf(p, "pagefault queue size: %u\n", pf_queue->size);
> +	drm_printf(p, "pagefault queue head: %u\n", pf_queue->head);
> +	drm_printf(p, "pagefault queue tail: %u\n", pf_queue->tail);
> +
> +	for (i = 0; i < pf_queue->size; i += xe_pagefault_entry_size()) {
> +		struct xe_pagefault *pf = pf_queue->data + i;
> +
> +		if (pf->consumer.alloc_state >=
> +		    XE_PAGEFAULT_ALLOC_STATE_COUNT) {
> +			drm_printf(p, "pagefault[%u] corrupted alloc_state=%u\n",
> +				   i, pf->consumer.alloc_state);
> +			continue;
> +		}
> +
> +		counts[pf->consumer.alloc_state]++;
> +	}
> +
> +	for (i = 0; i < XE_PAGEFAULT_ALLOC_STATE_COUNT; ++i)
> +		drm_printf(p, "pagefault queue %s count: %u\n",
> +			   alloc_state_names[i], counts[i]);
> +
> +	for (i = 0, pf_work = xe->usm.pf_workers;
> +	     i < xe->info.num_pf_work; ++i, ++pf_work) {
> +		if (pf_work->cache.start == XE_PAGEFAULT_CACHE_START_INVALID)
> +			drm_printf(p, "pagefault work[%u] cache invalid\n", i);
> +		else
> +			drm_printf(p, "pagefault work[%u] cache valid\n", i);
> +
> +	}
> +}
> diff --git a/drivers/gpu/drm/xe/xe_pagefault.h b/drivers/gpu/drm/xe/xe_pagefault.h
> index feaf2a69674a..e9c5d1f03760 100644
> --- a/drivers/gpu/drm/xe/xe_pagefault.h
> +++ b/drivers/gpu/drm/xe/xe_pagefault.h
> @@ -8,6 +8,7 @@
>   
>   #include "xe_pagefault_types.h"
>   
> +struct drm_printer;
>   struct xe_device;
>   struct xe_gt;
>   struct xe_pagefault;
> @@ -18,6 +19,8 @@ void xe_pagefault_reset(struct xe_device *xe, struct xe_gt *gt);
>   
>   int xe_pagefault_handler(struct xe_device *xe, struct xe_pagefault *pf);
>   
> +void xe_pagefault_print_info(struct xe_device *xe, struct drm_printer *p);
> +
>   #define XE_PAGEFAULT_END_ADDR_MASK	(~0xfffull)
>   
>   /**

There could be only as many chains as there are many workers.

In a very specific case right after pf goes from ACTIVE to FREE this 
could get a snapshot from which one can deduce that there is less chains 
that really are.

Just thinking if there ever be 0 active and say 100 chained. Looks like 
possible.


Looks good,

Reviewed-by: Maciej Patelczyk <maciej.patelczyk@intel.com>

