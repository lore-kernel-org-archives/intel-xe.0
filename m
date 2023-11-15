Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85BB3C072A2
	for <intel-xe@archiver.kernel.org>; Wed, 15 Nov 2023 15:52:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BB6710E086;
	Wed, 15 Nov 2023 15:52:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E404310E086
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Nov 2023 15:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700063563; x=1731599563;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=bLE15x4/hLI8D2Bl5y1jGEa5TG865UOtOI8nQK4Y8Qc=;
 b=azBDr1WQ3Q+Bh8UN476+2C3balzgo4iZk4NevL5O4NZ/+cKYVc816IU7
 +ek8e53UeVKBuNeCwPZAqlnVqWtXueDD0Dg3V2N8e3H7o44uF2NwCFNW6
 U2bY0FqDgZxfsYNTvDjnC2/+A5SvWZRu4QRcFZx2o63hfUZ0kPfH6/uJg
 DaPla01oqePcMYnUcK/OHsbjqRIDaO8lZQVQ5uHpSQzvf5YsM+cxg0M1E
 i/zgpzCLG8pGmrMc3C3/36bQN9drnoiy6t7UdW5pslrCsvyG7R9c1nJ/w
 4qOHTv1QUAQe6xuarayEH21WChUETdDe+xhe73ZowD+0YDYrmQpQG9AU1 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="388058099"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; d="scan'208";a="388058099"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2023 07:52:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="1012304092"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; d="scan'208";a="1012304092"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Nov 2023 07:52:43 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 15 Nov 2023 07:52:42 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 15 Nov 2023 07:52:42 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 15 Nov 2023 07:52:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kQQcTisbxnG1KsykVAPrxvYPZUcebEkSrWvmCXeCNOmrJMWRuWiy+IStUmgdnoKic6PLVBfymudL/mxzzFywMNcAn88qDjdlntWI/FUdVMWsRpdrB0AYAztxSddihTPiEurYDIs0zT7pvePTbg4CHBPGHs37RY6yZYJx5+7sSRDXB7WQjh/s407iaku851F/YoI1X4QVZwfIZGBURhurQT0IxmZmxEBw7cfoCQFJBuXzZRF0lpF4/HqvG4MZ5PxWBbigc8hihy8/JbPq/uIRj9T/KcUNsG9sMkVQIxpchvBIzxldYS8jETmEVSVKJzR5j9/q3mJvDPjpFrh3soQoJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OCueO74KSOJ+e5hAsrwRwFCKzSqG/I9MWRKe88Zn/C4=;
 b=A6IBbwfgmziG+w/4CLkAZhzCul4Q50ZTePl/X1NtHLzWLcsZJvB6ZyYcJOYCbIRx9pJSKLjDYnOLBjfFtBeZxN32EsyHM854gL3FFDUeYDQKHO4R/e35aP//Y2TFEtkZyNQjUQLOROBU9RgTGvLTlBRTDgOEEk7+nnXSvu0G/djdo7lLZ6Q7TRp1gq0glOuYQl8kEXaaZ0vtpbwSh0T+E7D0kOVGyYUohoY3JgRu9WH/RWuDzK4dKzUzPQ/b1oMITuf70ThiOrSNOQDW3VNaM0KV0VVJ/AX1eLHXlOeUGrTEOzE9DMjVWimMdSyFxd05yDvck+jMfEMdTgvBplIC5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB7003.namprd11.prod.outlook.com (2603:10b6:510:20a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.28; Wed, 15 Nov
 2023 15:52:39 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::1c7b:3943:33a5:aa9]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::1c7b:3943:33a5:aa9%3]) with mapi id 15.20.6977.033; Wed, 15 Nov 2023
 15:52:39 +0000
Date: Wed, 15 Nov 2023 08:51:24 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <ZVSGjG7rAxIjKBgZ@DUT025-TGLU.fm.intel.com>
References: <20231115141523.2037-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231115141523.2037-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR03CA0158.namprd03.prod.outlook.com
 (2603:10b6:a03:338::13) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB7003:EE_
X-MS-Office365-Filtering-Correlation-Id: 1118da1f-48a0-4fa0-e28f-08dbe5f2e52a
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: thQh3vdQJctrRQFSgttPVE1hEDZfe2VnCnxm43V5mph+bafw5iuWbo0iPvlwDHLCqPmBW1f8ZHMDjQdjESrgrfm5p3ET+tmIiNdSCaZBTx+XaDrFbCxH8ssSXHsCxMxPy2yERsGlZMyQINLAn7vr7x5zvIE+jj7fJC8STmWh5LMoNNY+lz1L1tqBSAbe65dqiE+k4kpbtdLGAxnmc11WrGzZnS6x9TetWsfCptB33eNUO7TxQ6w5lU8u4qZ0H1HI0nz3Av6TD6i+zbioGGoXN8WaasvHo6Qlr0Tsg0C5Y+0UXTQwPON8PTI67I6H1qx2ngTrhgHx6c2b2vythT2g14DuPgJmj2rZMRIiBYytwqyvXLURen2SrqKNjkwJm2Ozq7cZhqCgiC10eZcL7IqrYL2jHZRhLL18goA7ZWHVc2TmVsD16amHftyMvV68so0o8lwMKTeG/i9zU2+D7W2M2zuvQ7nLKgjZg3J95qMD9MW7oLSUmZG6KOeXREUTepI2xQAk/LQYK3lhCRwUsXMYulTDT5mSH2IQ9o1HAvCiEF5/UDVD94TwM5uaRHXmSvadyKB+Mv2v9fheDslE8Wnp/bECfWsBdJr7wEKncCqtPxFwCs2cfejxFHjDw3cgFqAn
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(376002)(366004)(396003)(136003)(230922051799003)(1800799009)(451199024)(186009)(64100799003)(6666004)(26005)(6506007)(6486002)(6512007)(107886003)(83380400001)(6862004)(8676002)(8936002)(44832011)(4326008)(41300700001)(5660300002)(2906002)(478600001)(66556008)(54906003)(38100700002)(86362001)(82960400001)(66476007)(66946007)(6636002)(316002)(142923001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cD8SMvpJQzFang6sxGEgJx2uO1bHvIAZdjTaw0SJZLRrjqBkECew0JulvSF5?=
 =?us-ascii?Q?m+IexymdmPDYnvypGWFN4+BVO7Q1GIpGQ7RwL/W1UyKrXJlOkyz2r1le9PYH?=
 =?us-ascii?Q?oW+OnSXJzBDLZlrRnS+TUlq9tAz29M4gyLH0AqI0p+AyJvAFl/9jGcY/6U87?=
 =?us-ascii?Q?yLgyp6ZHDRxcWQlZP2NX7hHNuzQcsOjaFzm+ybMq3Bs6EH3snRBXZQ+uS243?=
 =?us-ascii?Q?FO83+GE9mZTtEehmX8/S039KDx5mcEGx/3AjwgY+hQmFI6SyTidhhgMNSi7m?=
 =?us-ascii?Q?e1rPh3/lqPVUPsuTR6nlikykks2O4qbTF9nr/02BMPbzYDhZMXw8cwjzp9xN?=
 =?us-ascii?Q?N8dkf0OWI4qUoZgSduntM/zB+/MGXiQ8/zB0i6oyGBeDtE2TeMAtu3oGSatA?=
 =?us-ascii?Q?Pr1+1mJIc+NGp4GonJbABPApWbrrQqEQ7SHU4rhL85hn+n2b12OgcO2mTVCM?=
 =?us-ascii?Q?ZzD4BVKbrzG3XO1aveK7Kg7dElw1i9e6MyBeh3mxp5GzD+5dBOvzrw53spTB?=
 =?us-ascii?Q?WBPQrZJKshX6A3e+i+rqrMmkk1XOq/4t5/aI2kFcAwyO9Z7ireH0SY3Q016r?=
 =?us-ascii?Q?CO57LmF56EuAouun+frov9Oeu7IoBDulAznwUORyChhnYOaRQfiWgEPvyRPw?=
 =?us-ascii?Q?MqS1b7ZDnoAkJ67ZPszOheecQmVL+poSELmsO9UxOJGq6aH/kqAUbgVinUjH?=
 =?us-ascii?Q?aaWW7K1sAkTf8fpXyGSmC9H+/Gkt7uoWRYPiRL0Rc6c9WYQlMdbcTuj/mEF/?=
 =?us-ascii?Q?0Cm9BKGBtg8FeEcwsJh1dRiCObyNBUqFdrqs4ecgRePd8V9qMIdy8xKivL4S?=
 =?us-ascii?Q?1kZvpolSCd8PL8rXSrPjQunIgaie/YkN10ALXCL4y+tSdoQgwO/IZv1y+XCL?=
 =?us-ascii?Q?W7jLr4HjyPfd3l1VPBWEAGXVSsf1ht/WXdptoRXq1q4QTzqmdiOUyeQV3uS4?=
 =?us-ascii?Q?GQPGqRjXZoSkJ8m82E26w3Ko6C2xAiUOABy1u/hEyo8Iw+DsruCJ4OR0+0gF?=
 =?us-ascii?Q?5j5mRzor5M6YVZjcUPRAPZF6oDMqknE3EAAHv/ik+N8pM1HOdrUvw0FOuOE4?=
 =?us-ascii?Q?gzXlrvsX7fuD9tc49KEwSpCqPvKv2ikwSDrKxBs7XEcU9lyxZ/sQ7dSlV9RF?=
 =?us-ascii?Q?7cjGF9eETQoyFyO7t7Afijdc1CPHpKXbHrS9Ba3gtPBky4nzibY4SAQaWCmg?=
 =?us-ascii?Q?sLKz5dp8k+sNEHzctTksj16TvN/W0+nn9PER8oozolRYaBiAu/pS0ajkZ9ei?=
 =?us-ascii?Q?0UN8zf4vp8V+WMKX5tP1eV0U5s1NfVp/ZhXiwEsJzOiaOa/4JADVWEJ1mbZN?=
 =?us-ascii?Q?U8tJLGqz/qxHHRdbmKV0PsnJc9uf04QmpcuxCwr0qxjQLYRnMICCihwKLUSl?=
 =?us-ascii?Q?KHEFnSx5g+wii6Iu3pj/J3OJGiT83YJpPQijTqI5Al7zKB7p/VgB8e1fMRKE?=
 =?us-ascii?Q?Gitqi/Fe+irjEpCEWMBnHTnetnPzYink+ktz95cwddjrw/daLvJ5786my3LR?=
 =?us-ascii?Q?HjJlTtsUAk00UODOUM5HvWEyyEa2A+Jii/zeQF9frhvShsm7fgCDt+89LO7p?=
 =?us-ascii?Q?kyUDmdy8pRULnlRtQICPwUQ+ZASs1/8gWBn9Z9Vu2L6mKUxo2nGFFNgblnOX?=
 =?us-ascii?Q?HQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1118da1f-48a0-4fa0-e28f-08dbe5f2e52a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2023 15:52:39.4346 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vHDgm8IRC5SQYHeDF3WkM6orDfhQpvCotGc0yToJGVMzhbht0XTQsQ2glLctcdjgaAikPOXFI5gg99lNjkO6PA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7003
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/guc: Promote guc_to_gt/xe helpers to
 .h
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
Cc: Jani Nikula <jani.nikula@intel.com>, intel-xe@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Nov 15, 2023 at 03:15:23PM +0100, Michal Wajdeczko wrote:
> Duplicating these helpers in almost every .c file is a bad idea.
> Define them as inlines in .h file to allow proper reuse.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
> Q: How many object files would get rebuilt if this header file
>    was modified?
> 
> $ touch drivers/gpu/drm/xe/xe_guc.h && make | grep -c CC
> 12
> 
> and it is the same number as without this patch
> ---
>  drivers/gpu/drm/xe/xe_gt_pagefault.c        |  6 ------
>  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |  6 ------
>  drivers/gpu/drm/xe/xe_guc.c                 | 12 ------------
>  drivers/gpu/drm/xe/xe_guc.h                 | 11 +++++++++++
>  drivers/gpu/drm/xe/xe_guc_debugfs.c         | 12 ------------
>  drivers/gpu/drm/xe/xe_guc_hwconfig.c        | 12 ------------
>  drivers/gpu/drm/xe/xe_guc_submit.c          | 12 ------------
>  7 files changed, 11 insertions(+), 60 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> index 5b3585e2c125..03c1ab0ab0ca 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> @@ -59,12 +59,6 @@ struct acc {
>  	u8 engine_instance;
>  };
>  
> -static struct xe_gt *
> -guc_to_gt(struct xe_guc *guc)
> -{
> -	return container_of(guc, struct xe_gt, uc.guc);
> -}
> -
>  static bool access_is_atomic(enum access_type access_type)
>  {
>  	return access_type == ACCESS_TYPE_ATOMIC;
> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> index b5c39c55e1fa..a28f31c05b1b 100644
> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> @@ -13,12 +13,6 @@
>  
>  #define TLB_TIMEOUT	(HZ / 4)
>  
> -static struct xe_gt *
> -guc_to_gt(struct xe_guc *guc)
> -{
> -	return container_of(guc, struct xe_gt, uc.guc);
> -}
> -
>  static void xe_gt_tlb_fence_timeout(struct work_struct *work)
>  {
>  	struct xe_gt *gt = container_of(work, struct xe_gt,
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 84f0b5488783..311c5d539423 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -27,18 +27,6 @@
>  #include "xe_wa.h"
>  #include "xe_wopcm.h"
>  
> -static struct xe_gt *
> -guc_to_gt(struct xe_guc *guc)
> -{
> -	return container_of(guc, struct xe_gt, uc.guc);
> -}
> -
> -static struct xe_device *
> -guc_to_xe(struct xe_guc *guc)
> -{
> -	return gt_to_xe(guc_to_gt(guc));
> -}
> -
>  /* GuC addresses above GUC_GGTT_TOP also don't map through the GTT */
>  #define GUC_GGTT_TOP    0xFEE00000
>  static u32 guc_bo_ggtt_addr(struct xe_guc *guc,
> diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
> index 3addd8fc674a..d3e49e7fd7c3 100644
> --- a/drivers/gpu/drm/xe/xe_guc.h
> +++ b/drivers/gpu/drm/xe/xe_guc.h
> @@ -6,6 +6,7 @@
>  #ifndef _XE_GUC_H_
>  #define _XE_GUC_H_
>  
> +#include "xe_gt.h"
>  #include "xe_guc_types.h"
>  #include "xe_hw_engine_types.h"
>  #include "xe_macros.h"
> @@ -58,4 +59,14 @@ static inline u16 xe_engine_class_to_guc_class(enum xe_engine_class class)
>  	}
>  }
>  
> +static inline struct xe_gt *guc_to_gt(struct xe_guc *guc)
> +{
> +	return container_of(guc, struct xe_gt, uc.guc);
> +}
> +
> +static inline struct xe_device *guc_to_xe(struct xe_guc *guc)
> +{
> +	return gt_to_xe(guc_to_gt(guc));
> +}
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_guc_debugfs.c b/drivers/gpu/drm/xe/xe_guc_debugfs.c
> index 167eb5593e03..ffd7d53bcc42 100644
> --- a/drivers/gpu/drm/xe/xe_guc_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_guc_debugfs.c
> @@ -15,18 +15,6 @@
>  #include "xe_guc_log.h"
>  #include "xe_macros.h"
>  
> -static struct xe_gt *
> -guc_to_gt(struct xe_guc *guc)
> -{
> -	return container_of(guc, struct xe_gt, uc.guc);
> -}
> -
> -static struct xe_device *
> -guc_to_xe(struct xe_guc *guc)
> -{
> -	return gt_to_xe(guc_to_gt(guc));
> -}
> -
>  static struct xe_guc *node_to_guc(struct drm_info_node *node)
>  {
>  	return node->info_ent->data;
> diff --git a/drivers/gpu/drm/xe/xe_guc_hwconfig.c b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
> index 76aed9c348ab..57d325ec8ce3 100644
> --- a/drivers/gpu/drm/xe/xe_guc_hwconfig.c
> +++ b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
> @@ -13,18 +13,6 @@
>  #include "xe_guc.h"
>  #include "xe_map.h"
>  
> -static struct xe_gt *
> -guc_to_gt(struct xe_guc *guc)
> -{
> -	return container_of(guc, struct xe_gt, uc.guc);
> -}
> -
> -static struct xe_device *
> -guc_to_xe(struct xe_guc *guc)
> -{
> -	return gt_to_xe(guc_to_gt(guc));
> -}
> -
>  static int send_get_hwconfig(struct xe_guc *guc, u32 ggtt_addr, u32 size)
>  {
>  	u32 action[] = {
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index fbd0fd11da6a..9e9e925c7353 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -36,18 +36,6 @@
>  #include "xe_trace.h"
>  #include "xe_vm.h"
>  
> -static struct xe_gt *
> -guc_to_gt(struct xe_guc *guc)
> -{
> -	return container_of(guc, struct xe_gt, uc.guc);
> -}
> -
> -static struct xe_device *
> -guc_to_xe(struct xe_guc *guc)
> -{
> -	return gt_to_xe(guc_to_gt(guc));
> -}
> -
>  static struct xe_guc *
>  exec_queue_to_guc(struct xe_exec_queue *q)
>  {
> -- 
> 2.25.1
> 
