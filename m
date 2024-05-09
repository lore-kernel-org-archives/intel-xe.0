Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A93AC10F1A
	for <intel-xe@archiver.kernel.org>; Thu,  9 May 2024 15:38:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0983A10E276;
	Thu,  9 May 2024 15:38:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q4cFzsR2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0076A10E276
 for <intel-xe@lists.freedesktop.org>; Thu,  9 May 2024 15:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715269107; x=1746805107;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=bPN8lMzfm6qLttgTOy0H+kI6lKZgbN9sAT+hcVP3KPQ=;
 b=Q4cFzsR2FA9EaHACw/jDfno/VM+Ilo0eUKv7e6hs9iFTpSIyNqATaUMV
 OvuMZ+mgQxgSm9bL80QT2e7JbjTGMiC769Zwxo5RNj20FcuIfpndwOzLQ
 S+4ZHQgRYCSt0QgglSUWVnOvhtjBDDoJxCDgMyaXholERZelIQIQ5rEEq
 DprpgRJ7taO3Ny5V0oRwiDaWpvqyL0PcIibF3NFWabT3n2PsY2vYXWHe7
 z4PDXeAUPB2BigD7pd03jDQxMj1Z8UGcZbYZUNMdh1xH6ljC3YFo7Zr/d
 9W+t1IyoDZ20LO0UNZXB16j3XcuRf5WZK+fYG3IQ+phBhyhsHzRHquCW1 A==;
X-CSE-ConnectionGUID: kmVPtd9gRbCfrOb8yXUN1A==
X-CSE-MsgGUID: aoRMtct2Rde3q+chGvsA0g==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="11326102"
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; d="scan'208";a="11326102"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 08:38:26 -0700
X-CSE-ConnectionGUID: oSTfw817RgiMFSh3pG1c/w==
X-CSE-MsgGUID: QKfp8d4MQ1GJc+eec44iCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; d="scan'208";a="60137531"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 May 2024 08:38:25 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 9 May 2024 08:38:24 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 9 May 2024 08:38:24 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 9 May 2024 08:38:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ns6dCoaoRwhxVKP/EbxR6R/PtvkmFbbpIy/GqoorC0zaozdvVXg2F3VzBhKvR4lp7tRNupJdhGPA2cP8aQ00L9IJKeztC/+f+aa2+Vfbap6Udry+rz0pFj5+BDOrYwq/eyfn5NoKYKfn0OGGvMCj1OdgmWXB2Arrs5uuW6rTmR1/U+daj+bnqYe41gk8uj/jDmRYhdubqYnU5ZIWIBamSNKKrheQbqoWKXq9YqnOtlNaVyNayFhnPw0ui5lGhPPJFGUBjJ0ZHBiRe7JU9JPQXpvNmExpobZW2/yskdkEyG6lA1sOey6Re74ehb2r/+/o684/IinRCgwDiyn7D0wt5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yHQrNKYYh8XFuk6qUU5fJUGIgatbmJJdfXBveVGiuds=;
 b=SLRgjzd5gfyyE14JzTVRDq0AdEERMIvd9BEtpOoZVnBUfq2dtacFP/fU56XapzBQCqfSdZN/ScFsIGjzwzpIW1rqX6sawSp1wdR4KkkmrSyyOpT2iFZiN+ekehP+SWcUgFwaCgRi/ShXTzjw0tJ3e9Fu4PO02JxoA9VFEX9ghJrDemacPaT6oS+R5USSY/jBVx4F50mFIGw2rT4srDfrbdlzRvRHnfYzxGWNNi717cbE0DFJGsQVt86Ulkxm57lzzcaxTNZNR0wYJa+yquLEuPgMiTQ05vUVnIyXPofyr1hl39EOz4ANx5S2b4OF+i+8Ez99Evy1IRLfz1vOsaae1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB8069.namprd11.prod.outlook.com (2603:10b6:8:12c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42; Thu, 9 May
 2024 15:38:21 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.7544.047; Thu, 9 May 2024
 15:38:21 +0000
Date: Thu, 9 May 2024 15:37:59 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 7/7] drm/xe: Enable D3Cold on 'low' VRAM utilization
Message-ID: <Zjzt1yuFSr+rhdAr@DUT025-TGLU.fm.intel.com>
References: <20240508200707.375414-1-rodrigo.vivi@intel.com>
 <20240508200707.375414-7-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240508200707.375414-7-rodrigo.vivi@intel.com>
X-ClientProxiedBy: SJ0PR05CA0119.namprd05.prod.outlook.com
 (2603:10b6:a03:334::34) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB8069:EE_
X-MS-Office365-Filtering-Correlation-Id: 585ea304-9d1d-413f-e83e-08dc703e0e7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PadYz020v1zkfDd0O1slbJv6yLtnq3Ao5MgzUrUwnTvTcKVM5sc+YRr3yKIq?=
 =?us-ascii?Q?VMUEcUzRAMeTsvzIIWCRZeCkhu1BtiH14dOPUlVoy4lrOgK/tH9b8zzGSx12?=
 =?us-ascii?Q?QrC1Pgq+IEBg7Rb93Zc9ZWdLVPbWoVo48KYblMOEHVeMD89gvbO30uprQRgW?=
 =?us-ascii?Q?CHzrlNx05wiLknP9E/f1SkVxKYKyP0hApydfilbbmYTruq29R5FoxNJwCZV5?=
 =?us-ascii?Q?3l5vCHvBgKQixScwrmZZYZJzSvtnKxNg+ZJV7vjw3/7p1nwQr+odXygjDsS/?=
 =?us-ascii?Q?aJEHfW6OZE3Zw6Y5zIL4utqwbHaZoSF2ZvxpZFmXZCb1omExUCAYG+nER8YR?=
 =?us-ascii?Q?BlLOGHFMcLp/MwULF9Na1/u3ehGfH5LYRQ2DoM9wdCFZSjUjnBKFAXYzqQlQ?=
 =?us-ascii?Q?hAqOqH+8bgZOSIh+oRPSWzSpy13Tvx73VvMf69/hKTHe9KAcTXqX9K4cba2w?=
 =?us-ascii?Q?rjswUEk/wC23RTKfhp+nW1PW22wnPoo6FUTCVx7TpbK5mJvb55xE7U0VZRTi?=
 =?us-ascii?Q?H5la1q+hjp7tecBs34FGNu6ALoDldFJIEsAf4thxznh4s1WxUNM9eMh6UB3g?=
 =?us-ascii?Q?AZJRwkMsTltXz112rkgasfskTcipqx6e1xoQrHYpTcQ3F2ZllgmeD/bJFR73?=
 =?us-ascii?Q?RtGcqS5aDMJ7NcxgP4w5wlch4OfQVJPvb2LrJvYPFFrySYUyb1D/n2yZwvd0?=
 =?us-ascii?Q?LfHzW56Dlh61JM7JgvbiHz3Zap4e39fbZqqdnqiJysg6YpAIiZtWC1g6XrHB?=
 =?us-ascii?Q?/7H0ggMPRE8/d2yYoIfYFHk6hvh11Pu/BOifKXLnoYwX6jPfTRZlhHXpXMqs?=
 =?us-ascii?Q?IFBcp+i4fMcwWkqojOPKVbGojCKyXJWGAUsCkty/71Y89CxW4StJ2AIj++jo?=
 =?us-ascii?Q?6WldJZFZVuFpJ1yrgh5k5XHLvePyBWczUmSlMp+ToDPXaa5jGr4r1yl5YsCk?=
 =?us-ascii?Q?xkhta/R/wIXWqa606+YNvVe0pjppHKKytqSXdd1xRmZylliYwedegiznvi6+?=
 =?us-ascii?Q?kN9gSi1znFcy0xEh31S4g6K9g4hC/ToMHS6uq/xHTNWmOcvTsrdi6GQ/Qw5n?=
 =?us-ascii?Q?VHi9dAnnN8lF2jrt+QeGfAO5KVthzTavt6n7jjD2jNhxyWXRPmzs/cZWO9sW?=
 =?us-ascii?Q?oaa9jPHhLUjc1NbKMWfsdnlLxDsGABhQPb6zzhE95NWFEo8YHp0NRvqYv7K1?=
 =?us-ascii?Q?bJvpC7foKn0HyKUKYcXe+Sw+MaESAz0QImISQjuVWPiauSCTGbdU1nfz25+z?=
 =?us-ascii?Q?pmtO8XqwbfsZUFww8pyhTrHcfeJygyMI+IieHJwUkw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VAS6Rf9YDi3j94u1eYwo3Ewj1FLdy3ih0cvX4D/c1IiBvma62JDs9zTrFhPS?=
 =?us-ascii?Q?P/+2LLN9rIdy6hwktpfXOsOtChK0NRqyFHznEe2IvZsBdPKYdIrLyDp1vDNs?=
 =?us-ascii?Q?6FjIGPHV5hiicDbOgeV8Xt2M9yNWWbc3eePD+ZfP22yBN8cXECgt7Fxu9D2q?=
 =?us-ascii?Q?ixuAUoje5IDNSMKRJpLBFtaJJKPPCL60/ct5I6PUns6WnsuWsdXn7ssHTL3A?=
 =?us-ascii?Q?C/oi6gsPFLf0KAu/NXGYnzgthc6yJaH6YBjjuWADY671imFxaacgU+2Gqh9w?=
 =?us-ascii?Q?nRH5prb+pZvqBrcF/ipAlF+WJySWa1+L6Z6IERMzsaAqv9hwnCtqUEM7VurT?=
 =?us-ascii?Q?e9YApFJJ+tREjbpBQ+cKAV/x31/m6lDJHZD7ZihQqNUSEwfeykqd3uxapqIu?=
 =?us-ascii?Q?7Qx5q9f3f/ALUa4jdu9b9CAv++RmmaXtEvuhE3LSWmtkYYEkMU16zrgy1Q7X?=
 =?us-ascii?Q?zgBE/D0MNCp7NePXeFWgEkXDQpWaAyPo3vgqYFHXzItZgg6naPWYqzl/9CVZ?=
 =?us-ascii?Q?VvAXF7h5kIRjXtE1Ndb9iladurMyMDCef6sgm+JqJvKg7xUFPPoIfypWu2bH?=
 =?us-ascii?Q?WQmTYDpH/u2IsbvqGGJGZp4P29D/TUcN15L9O1qENis69BXVqWWz3lf9PZup?=
 =?us-ascii?Q?2H1tbac2KtbBEMyfbLlkinbVSggw1hfpC5rtBPECeNlBNohVkkpM/uaehTmQ?=
 =?us-ascii?Q?rChwNF7gbonBQX5qsk2Pao3SJ3joEJyyIdaPnM5OhTGfMWACrdJKeVFh33xV?=
 =?us-ascii?Q?nYx7DH+MVOPx1/O5D6f5XpCUpGHJpl5k011Op1R1+aTMeAdWQxYxlpk1WOBX?=
 =?us-ascii?Q?lKbnsTQHwc37n0yTRFPJ7+RForVZW7KB+nYPvc21PrKTPCv6b9lOCZjEqJuA?=
 =?us-ascii?Q?63E8UZDwbivt1EStuRGWVZJ90Zxa4OoTx7y4JDWChWqVi8z279eiIDUwfgJW?=
 =?us-ascii?Q?2sPlpzxuasb2E0eHMghz6JxeP0tZ24rB26ENJmZvTkwisDYOnPQgl+KVWjhl?=
 =?us-ascii?Q?XU7WKnQAB9dBaFjisr5T3XUpOKgZDbc3w1OLkPvqM7iHx/yXtn2SEwrslopX?=
 =?us-ascii?Q?XvQx3AoRnVH/H3D2SQy8l9r2dDYUcs46RHZ+DhSeXbghkoV27LuqGRd/QcR7?=
 =?us-ascii?Q?zG3g6EqehsNAeK4XuXkspQr4+ONQVoNFWvLrrWdqQ4+7UOTdnD+GH75ZJnse?=
 =?us-ascii?Q?NzCoWzHVIWJ5eUfNuVgsNDAmaQevhROR8Nm41n7CFm3FoJbLrzmtRUS5L1qh?=
 =?us-ascii?Q?67wiQ0kPFsu3OPZKWUgh6J6mcvvZpigRmX8XT20AnyzK/wJbB5htpWAwzqLE?=
 =?us-ascii?Q?UXZS/iHvxUmLXfP3RIDXJpUlKcm+kWZcScr4K6vZ3cHZFQkoovsvysyfyrGK?=
 =?us-ascii?Q?Nead2evHepHiD3FRfTpcVqRpd0QCW3dutTAZ61iGHZ57UsKx0j0L4xzmXPmp?=
 =?us-ascii?Q?OvAjR9AeFRGw1YhGnd/m7VwgDbPmvCaGzX2eoHV/ZdjEKkiu0SrXAv3ReiBZ?=
 =?us-ascii?Q?RK3ivuFI/uaj9sy/4eGrmqbGWayJXWLjaeRnWAqVxIQAT+UM2jyPwQUCo986?=
 =?us-ascii?Q?6IwPKHQMjyHKnWl74/M2PvNGr3h+GGammWDSjQlk24XpcjtBmg172EA8CJHq?=
 =?us-ascii?Q?mw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 585ea304-9d1d-413f-e83e-08dc703e0e7f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2024 15:38:21.5603 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P2eBJmbl22o1TaQ3/7zBcug250T+Ewxx0H+WVxaWuMPdjDAHGt3yGSf1VHPzPjsIM184Oz2jcJg6OiPEs/nVIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8069
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

On Wed, May 08, 2024 at 04:07:07PM -0400, Rodrigo Vivi wrote:
> Now that we eliminated all the mem_access get/put with its
> locking issues from the inner calls of migration, we can
> allow D3Cold.
> 
> Enable it when VRAM utilization is lower then 300Mb. On
> higher utilization we only allow D3hot so we don't increase
> so much the latency on runtime resume due to the memory
> restoration.
> 
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

It looks like you are missing an RB from Anshuman Gupta on saturday.

If you need another one:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_pm.h | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
> index f694005db278..104a21ae6dfd 100644
> --- a/drivers/gpu/drm/xe/xe_pm.h
> +++ b/drivers/gpu/drm/xe/xe_pm.h
> @@ -8,12 +8,7 @@
>  
>  #include <linux/pm_runtime.h>
>  
> -/*
> - * TODO: Threshold = 0 will block D3Cold.
> - *       Before we can move this to a higher value (like 300), we need to:
> - *           1. rewrite the VRAM save / restore to avoid buffer object locks
> - */
> -#define DEFAULT_VRAM_THRESHOLD 0 /* in MB */
> +#define DEFAULT_VRAM_THRESHOLD 300 /* in MB */
>  
>  struct xe_device;
>  
> -- 
> 2.44.0
> 
