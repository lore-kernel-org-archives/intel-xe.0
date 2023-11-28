Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4488CC4167B
	for <intel-xe@archiver.kernel.org>; Tue, 28 Nov 2023 18:35:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0969A10E176;
	Tue, 28 Nov 2023 18:35:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CEC010E231
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Nov 2023 18:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701196555; x=1732732555;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=vqGL9oXIwEATeotUC82n5WELIb8SZdyRFqqrwUbBmVM=;
 b=E9eUa+1O8rzh4B1tj3ANpb/NSQKhS3FHwxqX/LXHYgU+PhRdtx9Uphe6
 7XwOl7L4t5Oct7NTzT/jFJn0eGLlLMVb8AAF0/52y2Ght+nrjFxp5zUDM
 A8LyOrZEBbUH7kHmQTBqZFVv7A3aUyDzg+X3uvB20FKSiEddpWTUFo5Te
 W9L78hCK9RlWQ+LtaLsGXuMSylHqmG8xSbu82hXKLb0yWUPwviBLvfuXA
 173jXLOpe51LmRrnwlaz9V4tUTAcnAWI+obTeOXnNV2For3x/asLwTnQm
 eoLLymRrpPPN7VZy7gzlSHp5wsKg8UC/dIJdvzPQtuYzINSyQnQzQzmy4 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="11696285"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="11696285"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 10:35:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="10172343"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Nov 2023 10:35:54 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 28 Nov 2023 10:35:53 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 28 Nov 2023 10:35:53 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 28 Nov 2023 10:35:53 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 28 Nov 2023 10:35:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mVyhFQsDTzDh42pHTO1OF5yJgrD0lwvZsi359xpmKnt4pOfGIgMHQtsxmZ61eV3iKcfjkedzIFmDP0jY3H4miixzqKlzCAtje40BzqPnl58k5H6FFjd+FqDg/0YCSRA6JjyQbzOc0CAA0+xh3iNZBmp5UBmNjHDAPYU9jgc9n9/5RdGC2YPY3MNUYNPFBOLQgkioFwAC0CEq9H3iV+Cdoru38swfsIy4zlxAXEI536rkdpAXhrTiSCckxLrdbW+5UyoQAO6TbZfX1pD54nnuAjyKjmh5YNIZIAZruu+GPfkahtih6VZqaL7UfPrhq6lqHcmVNip6gTxqmURsHFUSBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tM8Y3N3MnlWmoozRSX9j39SaZEv+qb2uJByjTfoWVJ8=;
 b=gsQWSZGs7Kt9jMsyET58N10ZArmKcnFHlElTcJ5c4Z6RCiqUv5GS0xxkC580/FrDFKN8om5vtqOYUBxJyJJKdne1jFnEuc/Uc7tefsONqD7ap+mpOhNatFqiz1KY9P5IpAVzcAUICjZElItr3oodt7U4/7ldid+DsG55S/os/sHVphNAbsS+2sDt0G7hf79sly7zMRbyl6wqj3Cq7BH10NW65hpko0BhSzqXsqIHSVpMPHNLstorvHwOLTlVfVMHLQQVHOZMOB2KI84K0aEYrvxx1jVqfqJz6jJwkQUkKgkPckl3/W3ApbPV9PaRYDdC3jaDjKOWVbhh9JfDeQ9Odw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CH3PR11MB7299.namprd11.prod.outlook.com (2603:10b6:610:14b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.28; Tue, 28 Nov
 2023 18:35:50 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0%7]) with mapi id 15.20.7025.022; Tue, 28 Nov 2023
 18:35:50 +0000
Date: Tue, 28 Nov 2023 10:35:48 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Brian Welty <brian.welty@intel.com>
Message-ID: <20231128183548.GM5757@mdroper-desk1.amr.corp.intel.com>
References: <20231128175559.21326-1-brian.welty@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231128175559.21326-1-brian.welty@intel.com>
X-ClientProxiedBy: SJ0PR03CA0131.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::16) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CH3PR11MB7299:EE_
X-MS-Office365-Filtering-Correlation-Id: a058f685-62fb-4770-739b-08dbf040d84e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: M4VoWpfNIBTrNaXEeJJ9qkGGfwaOCVhhtfK/6sHKGk+pUt53q83jrqhLtyGePBqPU/bLFbOIWcWItsaZbzStuh0RovfVbsxJV0LKUvWzjlNMFOziS7jfe/BoxdB2wQvnru2hzll8LgQRt3HFVsVyOnfquj3S8wonFcG6f88M43XAfmBwylq5+/JOsY7cNg/6KRivbRWEzIwlCX7HtYhHT4eNU74Xwfl1KVJBCoGqDnqd4ohgKAcX9WIbSNvrZgZdsCw05u2RQa6fDmR9zqhzOCnLcfPNsbh/hzgzT93D+iWdGEYSva3Tzm7v7Uicv0DJEKX0vNWjBlR37d6aBujZ7BuCxaJMySFKhpPsYWsWIPti0on3BxULArE8EGD4qMd2+99BSIDg4RBuVAXlNrWxiV/h071Mfi2qgKtRSZUZ/i7XGLrC0wx5iZ7TFZfaVk5VOKOziSv7yBpr6PkV5Pn2WLIwotBdqQaNUDYisJaRZvBQXO2lNMuW8SxNi+hQ7ZGWQKyg5yZ3aLM5mz83GlGshEOoYpDhXCor1YmjwuP8vfr8MxJ88orrCfbwtO5jxLKV
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(136003)(39860400002)(396003)(346002)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(83380400001)(38100700002)(82960400001)(8936002)(6512007)(8676002)(6506007)(6862004)(316002)(66476007)(66556008)(66946007)(6636002)(4326008)(86362001)(478600001)(6486002)(5660300002)(2906002)(33656002)(41300700001)(1076003)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lOpasP5NOzNGjyqgPfueAbn3Q5dg/mQQjHQOtZlM3jWpFagGIL208s6lp6VK?=
 =?us-ascii?Q?FqsZGMpwZcQr1X+YKzkLANoiVBfA1Y1BZEB+Y3H/6vJYELPEdS9KrzC79bIj?=
 =?us-ascii?Q?TlkPfaKPeDl+2QGcIIWhJ7t+WyZuMn4rZ//v+mSEgqPXsU5k1ewIeaTtRf7C?=
 =?us-ascii?Q?pvvBAQoOpAQBOnn2x0OdIZMPCCs5L1xn3Icc872hbnkVlvREJlJRJ2c6uIHe?=
 =?us-ascii?Q?Bkuo1nndizy/KESMB5F8rsKUhDRhaEXOT/CHQ1PfNIlANtot+FaCehjg6nNn?=
 =?us-ascii?Q?Ir7aOPkvjqUXgjTodhLVghrt1UnFn1DcxwStyo5btc77Kp50nwRMu0OYK7Pr?=
 =?us-ascii?Q?nF+Mh1nO11KVWAibvs/1KIKBu7JIBPDHod71rZ3iqf/6STngKbV0NNivyR4j?=
 =?us-ascii?Q?BKsxQ9lh8pB1cdqdhQOtCiLpk4T5aaMLDQYU7Edp857TfKWpBom0bmbwJi/B?=
 =?us-ascii?Q?tgZS+yXgnWbDmIi46ZZNonEaX5P4g8Rs6nqGPC3jf5lRqt5rDBf1Nu5z/HcL?=
 =?us-ascii?Q?nTBWyud6TGSqYBH0Hro7e/NIAryD/We8NlMONJL6LSZQBUkNrLquEsnZ0XJZ?=
 =?us-ascii?Q?yWFtGuiXrr6pdWrDBU8Z0ZVMq1fdhpQYc/sojC8puyiV8CXDnkOLd7SqOS26?=
 =?us-ascii?Q?LVt56ofuczVjrZuYY7v32Qf5aTXesaZxAaPqGMrahsTeFLlXkI13/30raO+3?=
 =?us-ascii?Q?dB8S991qIBAMQdTDbQMpVepChGJZemjUdKnvXE2pbzZVZ6F/iMlv1K2FXrb0?=
 =?us-ascii?Q?DHSBQfG2XFlUp0gOAZgqmHpC5b9RytX7qk3pI7Xz6b/1CwIg2OhblNC7JhId?=
 =?us-ascii?Q?NJdskACDqUce0cj5ZCVCH0oaPnZbve+u1Zkb3DyDcmiYmUk3U/tdbmwdIL8E?=
 =?us-ascii?Q?ODTlXThqoLYvNz6MpAVG3BYVAda4apg54FlVuETa1Pu4IiCFuBxq+axPx6p2?=
 =?us-ascii?Q?43KSJHHdg/n9ADYYvP76dQg60Q7xJaVCiNh71dEq8Hk7J0V0EHfQLl1yUYWD?=
 =?us-ascii?Q?0XdH9o7uXAza1Gdurp7ifva3NgkVBXjNugQATRn/gFgzUk3mdwinNVrfNZwK?=
 =?us-ascii?Q?Y2lvNvDOlMTKNDvUTytmylV8xzbXpBXmDf83RpI/S0Ed7IFyEeZu9RrO+DWe?=
 =?us-ascii?Q?QfS8TtTrZMT7Qm2Q5iTYG7WshTIzE3ed5PKz0NRjHmlpld4uCyHNUqe11paA?=
 =?us-ascii?Q?gR1kO38m6MhfvuaDHccC4G5AOAk2UjrQDqQRt6SEyQTsF56DFVZBvKSXppeU?=
 =?us-ascii?Q?N2MscjYdZAR/PUqfRjpO9ilFWGVNXWU1HUVmCFRHsJRTT0JOIWmFPZGfEBsN?=
 =?us-ascii?Q?P6+pYV+Tm0HCTdTN2KqzL7MbA07vaVOJtyN4am2BhiO/rwAFrREf/399OGD5?=
 =?us-ascii?Q?pPU9LkReL5mLc/cvXVTo4Kl4qRlCfhG5UkwzKSIaq/CXILDoyKCuOP/37Xo9?=
 =?us-ascii?Q?Vq3wfrcZN4lgDw/XB8L2mDQggZkezD69XAuTqDITdp3RMh+HkKFgov1SLOYn?=
 =?us-ascii?Q?Oz5SmEz4GnAWSfdDV5n4YgBfcaOkLkxn5TpHmuqx6cIl2nIE2kWW3jsphjTU?=
 =?us-ascii?Q?BFIlUUakJuLHCGUY4XxMYE4V56DU950eYgT1B+EGeq5rb7E/GvawfUdGDsbg?=
 =?us-ascii?Q?rA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a058f685-62fb-4770-739b-08dbf040d84e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2023 18:35:50.1898 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1a490X8xFMODbWQYncBrTXvA/b8W7Voh3Q/K115Q2mACNLHQryU95hXVeue3uOHe4tSapP/nuAqec4HjqT8//D4nFK93sQKh9kotNlCLwNE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7299
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] fixup! drm/xe: Memory allocations are
 tile-based, not GT-based
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Nov 28, 2023 at 09:55:59AM -0800, Brian Welty wrote:
> Fix a missed conversion of GT to tile in vma_is_valid().
> Best is to update the function to take a tile argument.
> 
> This bug causes page faults to not complete successfully from media
> engines and when the PTE had been invalidated prior.
> (Caught by igt@xe_exec_fault_mode and INVALIDATE tests.)
> 
> Signed-off-by: Brian Welty <brian.welty@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt_pagefault.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> index 03c1ab0ab0ca..1e083dda0679 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> @@ -64,10 +64,10 @@ static bool access_is_atomic(enum access_type access_type)
>  	return access_type == ACCESS_TYPE_ATOMIC;
>  }
>  
> -static bool vma_is_valid(struct xe_gt *gt, struct xe_vma *vma)
> +static bool vma_is_valid(struct xe_tile *tile, struct xe_vma *vma)
>  {
> -	return BIT(gt_to_tile(gt)->id) & vma->tile_present &&
> -		!(BIT(gt->info.id) & vma->usm.tile_invalidated);
> +	return BIT(tile->id) & vma->tile_present &&
> +		!(BIT(tile->id) & vma->usm.tile_invalidated);
>  }
>  
>  static bool vma_matches(struct xe_vma *vma, u64 page_addr)
> @@ -169,7 +169,7 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
>  	atomic = access_is_atomic(pf->access_type);
>  
>  	/* Check if VMA is valid */
> -	if (vma_is_valid(gt, vma) && !atomic)
> +	if (vma_is_valid(tile, vma) && !atomic)
>  		goto unlock_vm;
>  
>  	/* TODO: Validate fault */
> @@ -215,7 +215,7 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
>  
>  	if (xe_vma_is_userptr(vma))
>  		ret = xe_vma_userptr_check_repin(vma);
> -	vma->usm.tile_invalidated &= ~BIT(gt_to_tile(gt)->id);
> +	vma->usm.tile_invalidated &= ~BIT(tile->id);
>  
>  unlock_dma_resv:
>  	drm_exec_fini(&exec);
> -- 
> 2.38.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
