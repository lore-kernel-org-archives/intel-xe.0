Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6C3BC5AC67
	for <intel-xe@archiver.kernel.org>; Tue, 11 Aug 2026 23:26:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DC7E10EDC8;
	Tue, 11 Aug 2026 23:26:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bgfXNK8a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 369E510E3A7
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Aug 2026 23:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786490771; x=1818026771;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=LCyYfRj9WKrNIYcnzbA9HqkPt/galnpxnTSXGvGFkNA=;
 b=bgfXNK8arNpVaVBV47yGnvxTJ0xO8ecUt9NEfH+EqsBfmZDM8kFfOQdM
 vOfrJgqzh8BMigGNe6uiP++aZ4dW1X6huM/r7i7cN0744YKk/LDQ9lXcW
 gJ+3/g19XOtSdnmsRRjyeRVKKzbCXa3jpP6qGW7UtF+AjlGhy4K8pBfq8
 NIkHDS5+0Iwm68IuYv3a50OGzAxdFAZMqG0auqrrD9/HwtnqoXuDQjaa8
 L6h5weS62pslVyPWApDn5GIVWdiXT0H94rX02XFvKBe9FR54gPkS2L45b
 ZV2r0e//86j1/3Paf5HEt/Nf6xXfymT55UFVknV+kV5Nn78ausNR+vnWf Q==;
X-CSE-ConnectionGUID: gfnxoA1WRn6kbvmL3Ow7bQ==
X-CSE-MsgGUID: 77nnI+jySM+pfLXh+WCdWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="87158091"
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; d="scan'208";a="87158091"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 16:26:10 -0700
X-CSE-ConnectionGUID: koZp08TXShqAscDeFH+XHg==
X-CSE-MsgGUID: L5MbYPUDRqKiUMt0PwrtcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; d="scan'208";a="260145214"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 16:26:10 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 11 Aug 2026 16:26:09 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 11 Aug 2026 16:26:09 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.23) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 11 Aug 2026 16:26:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ngsnCU+FGRj5oQjua5qKzZ2HF3Dgohi56CCn8odjNnXIzf2tK2J+gGp5GUQP1VEwhTcp6BLMXLI4hOIuhgp4AexPY8sFaFrcrWNmgtTMcZ1oCNm+kIBCrnM9cQqstCofwEyXK1RLgcuJvc0kh8FwXb/Oa5MmjUMmCdWE43ldTq2jFTRXLj0VUgF5tKQIS83/lb58wvY2KO7MBNvH2prfphunu5gM0zGAei6vM/0JIJJSlEP4pPxcdXqGmThIXsyECUBUyYc8HclhfJSrxOysbXKuiTHgA01uXvTmpF0n4uYBjvImXVhamyDKuyw+ZNsfRx2TsIBkF8JB0D087kBjCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZfStOJ7DE+hvLHGQMo4Mo04REWipo/M8E0Y318SXFM4=;
 b=keiJjMKAU2svWNMKLu/9jcarwbqG20V+tkJ/adznU1fP9UjkK/gCCPCzZH9SfX/um26zg0Ek2RKM5MyEk9MyPJLF6/E4I+OLDaSJhTqGUy+MRY0kRht6pdtCcafTzLBh4WaMdohP16LMeXJ7gEUBQgtRgJVxqj9+V75e8VRuM1gd0aKIVfqLjTG/m8b/4QvB+x67gRemBMtwP2qZIgP6DMKyXTTzinaN9M5D1D8RA3ZPpgKYM2ZHoGzwl7LG2t91ZkkjFmqx0KYt0f6njpTehtS3DR7nSZZ/y/eZkfs5atKX1EsI3Ombn+pngMiDSjbWq9UwpV6XVNUZU1oNTJWykA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH8PR11MB6973.namprd11.prod.outlook.com (2603:10b6:510:226::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Tue, 11 Aug
 2026 23:26:06 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0315.011; Tue, 11 Aug 2026
 23:26:06 +0000
Date: Tue, 11 Aug 2026 16:26:04 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/xe: Use guard(spinlock_irqsave) in pagefault
 handler
Message-ID: <anuvjL1bJW1KJP2H@gsse-cloud1.jf.intel.com>
References: <20260811200906.10400-1-michal.wajdeczko@intel.com>
 <20260811200906.10400-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260811200906.10400-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BY3PR05CA0002.namprd05.prod.outlook.com
 (2603:10b6:a03:254::7) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH8PR11MB6973:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d8f1060-4254-4a70-8746-08def7ffead7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|18002099003|22082099003|56012099006|11063799006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info: djLmbrLwJ0D54mOgG5hq2hto4hxbr5j3O6mRS9XyvP9shXOrhYBu73RqEforuB47KQBjfBTmk+w14slOoKlF/8QXEvMDAW6kTOBgK5c2ZT37TxIZOydgc+bJuMFPZQXz+vr/voKDkQR11YFyGQ2yzw08l/9tJ8KOeuCemn9vsJlt1j5FNR0W/PTI7iZoT7RwnFJd5Z0u18dKSOpYJOdIeln7y8n2Tpg2OaqUDQ5uFu7Ry7uCOqkBXf+6C6ToZWF/AIll58gL2pyibIiY5k5HoZiT0hmldmbvZrm20cOwHwyofBFKxqSy6Inxa7HBXOiFoadvTIVmV6kK5j1ai+eQBrQdxi36xHsPMP8o4rfbGV2TwgY1P6d1EiSMUprrJTWWmmQYc72Fu5HiJzBoDhoNEvI5szV5uyPvbAiUufCHxo6wclZgsA6cc/1mK34W70M10mtPALyugHv15gKrqEnNdMVga6w9GG1ldG+SbGN0WBTGOukROT89XVFnL+gZihnJ6DdTcXzu7g6vqh23hRZqb+Ov/8sd0+ibwKwZajQGUHyCH14VfGJCkXDm9woieZAye963xCJnuuLVQ6PG7NRYOtGGAD1KDQ5Tzs6O+rRgHoeaSUnsVBpEiAmNQgIWnJoXuVdrQAJ2MaFRGQgQtEIh4+1WjkNteMsmDZN8QVQfDz8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IMJyhIBSIbmStmCM3iXabyB2+5WQWn1JIpOzRlzVZ4w2OnW/WHr9K4vtNGNK?=
 =?us-ascii?Q?6JJtvBwVQM2QW7T5+7Gpu5FiR7Cp0qXF5erywTALVXLzk+AdxVpwoEqdCYx2?=
 =?us-ascii?Q?2ESPCgRUT6b9GJVpm5Da6wE6nzohqt1zX+gSAVSq1GGJxI4SAu5zyzF1bTkA?=
 =?us-ascii?Q?zp8LJiYCkaFlaHWeZd+291mIm6ZOksBfbtT0N5ntGntcP6Y5gb6dHkQb4Yxm?=
 =?us-ascii?Q?w6U/BARUHmrjAAS6yMvnYv7F0/fQR4ubSTzu/wYzatqwrrREr12Z9jdxgvnu?=
 =?us-ascii?Q?ij6pkzYX4/8dfwXIHUj8OtIx8hXrNS1FMV/HVox6Qxjyh9QveTRdbKPDR43I?=
 =?us-ascii?Q?5ej1QKWMSEQIveXQjwTWfBGrCIPI6SUx9m0b0nhUhZTekP2CGmDB0t40F+2i?=
 =?us-ascii?Q?m0ScY19Im1NW5vwa0jbZKJSxEwXJ7VituXQIWVfiaMWdPd88RV1E+hFK6Oyx?=
 =?us-ascii?Q?tc0GXLhiKU2IkJQpw0r+qxSTi3t++WeKI5uoSbvXGAXp6nQn/otZdv/Ih+m9?=
 =?us-ascii?Q?0crmPx906SzIZngYJkDU92tGgO3OYh+c4Owz4aplBan3qkErM0GEvPUAOaJt?=
 =?us-ascii?Q?tihTuLPOqZssA2I9Rl9PkJACcGdr9lcLtvSy83pwdUduiuN0D0+kyPujfB/+?=
 =?us-ascii?Q?M/91pGCSR28kDqJGpjiF8waCwKFJRJkqkpLe2LlVS9LdAncoZ8m2FN4z92iA?=
 =?us-ascii?Q?oZQB0T5Gr0E/KYi21wHwTcWXEnmxm5minH/JZksnn/hJOAf7HRfzaeeByMLA?=
 =?us-ascii?Q?+sEfMe9nntGnO8wOlNyQ9BNu1ECaCvgUzCJxGJldVpPlj8vlxpA4ZQU+q3FL?=
 =?us-ascii?Q?463iVB1v+ebA2Uzg0vYyLzbt67qvADx/1+gRUsp/GZ+jpp5xSuTqHb7bGD/x?=
 =?us-ascii?Q?snGFGhFeKdxQhoVnChNnSZlBASlZ4luaWXZgCrR/lFk91lKH7xQ8MJ6bsbh+?=
 =?us-ascii?Q?9oO9Q3UFyDl6ZpKgeiLvTZqDXzi/jZ+/Gv8zc23hGomhRWb1dPczLj4BSB0C?=
 =?us-ascii?Q?7PAZAHwrRVNHBH+8iZEunaLpwhy5FUYtepO8Qz+JYMGe5BM8HubdQhmaXsI4?=
 =?us-ascii?Q?bJEJmwUHw6L6t4Y2s565DL1EYv0CLYcDsB9THmwpP45vTGYd8m5HKy7uzqSu?=
 =?us-ascii?Q?x1lmKjU5ctUZCe2UZ7gsE3wzkLVbENscbFzxFzAccN1uFHvIG3ess8i/nkHu?=
 =?us-ascii?Q?gLFqiTN13tG7EO2J29bEvX/0l5LAd1hty7bxh3/ywS+p6+N5Gawgkqy8N1Qn?=
 =?us-ascii?Q?SLLlShr7uX9yXwK5QtVCn/A+GNt8K5hCtOR3X5c07Bzv5oRKadIexvV5Xpd+?=
 =?us-ascii?Q?XBTGpUR4PVEIV2cE8DJgX3EDuzpLuxm5kAPc2HyBU1XnJMM6rCSs0OA5isNU?=
 =?us-ascii?Q?tqiUFWfL14X3XO6Cuz10An/ElPXlKE5IaioBHhHepmorKSOO5Kv5WeEK0vaA?=
 =?us-ascii?Q?hYMaMxB0mNT7ianAFl5xW6j/bdJWoH/HWkexJpN4J4oa27xyx+tv8DyIaHOf?=
 =?us-ascii?Q?ie8yderg7RzslIutquR9xCdL/+JeWU1eD6C+RbDX2cWw3/uciX/p+VdikoHC?=
 =?us-ascii?Q?KVT41qK4Co+AhPeiQcv5jjftvqsbAY/xpo845bKlzUPfgu+etnVWG6kH2nSo?=
 =?us-ascii?Q?iaG0kE4mulb5Df6ESWGzgAFd02d+QsBMJ/xzq0nHdq8QMfLJXFkZphMy/9kZ?=
 =?us-ascii?Q?wzX9hP23tl83x8IJART4vQrk2UA0gzp+GhVxFeWlrxcAm8SOBzYW7HwX9VEP?=
 =?us-ascii?Q?NvQcUuSxnw=3D=3D?=
X-Exchange-RoutingPolicyChecked: mQh8y3Jv+5hgiVYi6yP6yIKWezMybcHg5unrlR6uBat5g8AW4l6n8yxm8Qm8AgpSiRI9eQ2XWCjJQURRlOtZWOeqt5FfcQIHoZV1tZfBgmHubWnctG2thHWfwAU6vGAYDNVwUCFx5x9ktXZfQcBCtULL3LVszjzrHZPx00kO4u2W/IUZZ11WJ41aggEpGknzAcjUvWQpb700RDAAHzOj4tj3kz4WNmI84YesosIMxgnjWDfPVcu8JHIrrsgpKndgCLRZrP51TX+lLEmjciuIawZ0TANA5aqu2DODcZ1ePbhizpQ3ZnTW18thCR1QppTOVBFh44g8A9bHXFSFrym+uw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d8f1060-4254-4a70-8746-08def7ffead7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 23:26:06.3468 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: niSJA/YHCu4L4xGfoyrfpXOhoyTr99g4FyMa8jhzb7oqkioUYhIqTtTwJgcyp/BJwBkRNhdjFExIGkNU+VoZ6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6973
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

On Tue, Aug 11, 2026 at 10:09:04PM +0200, Michal Wajdeczko wrote:
> It is safer and easier to use guard() instead of explicit lock
> unlock calls.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_pagefault.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
> index b2d7bca9e407..cfb65621baec 100644
> --- a/drivers/gpu/drm/xe/xe_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> @@ -864,10 +864,9 @@ static int xe_pagefault_work_index(struct xe_device *xe)
>  int xe_pagefault_handler(struct xe_device *xe, struct xe_pagefault *pf)
>  {
>  	struct xe_pagefault_queue *pf_queue = &xe->usm.pf_queue;
> -	unsigned long flags;
>  	bool full;
>  
> -	spin_lock_irqsave(&pf_queue->lock, flags);
> +	guard(spinlock_irqsave)(&pf_queue->lock);
>  	full = xe_pagefault_queue_full(pf_queue);
>  	if (!full) {
>  		struct xe_pagefault *lpf;
> @@ -898,7 +897,6 @@ int xe_pagefault_handler(struct xe_device *xe, struct xe_pagefault *pf)
>  		drm_warn(&xe->drm,
>  			 "PageFault Queue full, shouldn't be possible\n");
>  	}
> -	spin_unlock_irqrestore(&pf_queue->lock, flags);
>  
>  	return full ? -ENOSPC : 0;
>  }
> -- 
> 2.47.1
> 
