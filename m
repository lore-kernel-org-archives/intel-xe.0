Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3975C47258
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jan 2024 00:49:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BA2410E008;
	Thu, 18 Jan 2024 00:49:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C508510E008
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Jan 2024 00:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705538974; x=1737074974;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=oDtDqMMiE6zkAjAFwlPiocTvHmVK9Ryud/6/WiwtnEQ=;
 b=VaCkwE6ka/Al4O+X5K/h07AHPtckf04HV5M6sJwCaXyYV30SQYlbg1nI
 hKbjv0Lx3Q3SaGq/XgHLBg1sxvqD+sFRI3ppfFOaciNbZR0FogsRiuNtV
 pDmaqU4WrTXn1FGp6wb4018ICGRZsw1D/FhFNGWcf5/NzhqANfuq0aBrk
 Of8aaxWivhLny5MGx+LfpFJdO3mgWz7bQq3zfniKPxHJEYDU+aumJOxLf
 kQPfUjePYspNvzQG8lTZL8ON9eqf4L6kvFq3+f+buceIy+fXSg7RCdqoj
 yeZ2Xpen552l9WcmH7S6RJs2C7lJSWGshylpy6tShCFoheOu8aDGrGyNP w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="397466921"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; d="scan'208";a="397466921"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2024 16:49:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="777586506"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; d="scan'208";a="777586506"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jan 2024 16:49:30 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 17 Jan 2024 16:49:29 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 17 Jan 2024 16:49:29 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 17 Jan 2024 16:49:29 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 17 Jan 2024 16:49:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NwXlkmNMUj63i8aZorTOBveWsc0gra79ppwwRobdk5wRUtUtYg8f5Q9GEi8I6vsC3fanMQAG3jEOEsXb/W/O/exDgpeq4/q65UkHwgjVVOFzPwlHRDpfwrr4Si10kG0DdsJin72St3h1b624BGyaZ/iWWbRMiZSohb4cZT5C8YJ9lz3UZuaSEElgBpvmSuLlrTeOfdkpubltghyVUodgkx4ZkOkIKWrGGSqqZJcFjDYsOb/9g9grqSm4kZvy/xFgdlWZ9BjDs+phc35xQLeBHAXPcj3aVvZZwH6pysKeodlOB4IZdECHC/f2UMaT7yw01DN0n+8KQUQAyK4saC3a7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4I8N6sh+qdo2DvBuT+HOaK21S0YVZDjw+4Ryaw4JeW8=;
 b=JJJdu63sF8s97JHzgmXZYhOTrrhR2l5MiuJukK7oMDOB7xWOr+t9/akjMti0PziUUdl0YQc+WHdXwDnBosBP16Srvbn6Q7kKnh0Ogwezcez8nQoxYCjJORfaP92yO52xYqX1S4mEgcodnZsIC+g6UzwPKgcPFwzsaGm995S8Lw7dLY4Da2OY8kFqpwhodGjHUw2jDcE4n7XEMaYtLDuipMD+R0ao2KwHofzRa02KdsG3+5DNPD606y7Z4UUpk0b8MFSZ2JmGUeTZaioZCSkYJLoaMEO+SQHOL29D4xN77ktHkCTW3E6sAKxIZ4gcceRXzP8i28s1QAoEtz4/VcdRqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SN7PR11MB6900.namprd11.prod.outlook.com (2603:10b6:806:2a8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.23; Thu, 18 Jan
 2024 00:49:27 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::2157:7433:d32c:a8e3]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::2157:7433:d32c:a8e3%4]) with mapi id 15.20.7202.024; Thu, 18 Jan 2024
 00:49:27 +0000
Date: Wed, 17 Jan 2024 16:49:24 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
Subject: Re: [PATCH] drm/xe: Set PTE_AE for xe2 dgfx platforms
Message-ID: <20240118004924.GD5549@mdroper-desk1.amr.corp.intel.com>
References: <20240117144851.22952-1-nirmoy.das@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240117144851.22952-1-nirmoy.das@intel.com>
X-ClientProxiedBy: BYAPR07CA0025.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::38) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SN7PR11MB6900:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e524b78-9b55-4906-a966-08dc17bf5277
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jnJU1JJiee8LiYOl/rgD0bKo+62jYb5iWCaUScQ+za7YKmijWWpgoISSjm076RHLcZdZn65S3P4J6rVOjcGJ4yekdyitgu/DkmjZBVSUqLLdo/1idetsBnKtvFOpiIDtGnYTGQbGHU+reNbJG2rxdVtPYIrDzGFxTD1VDYig4BgvbeTwF8pqgEqerds5NLwnjcanFRSAHnAdw6KjgOzh8l+zMC3OAPLF4vf0h3ZBhLTkvcAPxsYq7RWRjvYvuG6vHu76PcG0ig8R9X5zVVpeApSlGeDQZ1mWsJu0+TbrWLXCn2Rs9GK8ZWpNG4TPX0LLgISJMLi/LhGQUk0c4vCPxFfOUSVsIncFIcsqLOWL+YfuSf9LPWePKXQ6T2sYtiDr6ngR3oQc1QwU1GRokB01ikhIuUhM8b/fBuhPegvY18b33IVw1wXrCwAYaDGIpIJ4JYh1DN12Oyl50iKnO4EVtsHiMHoLxR09yGSyG3Dx0mzoT3qPP4J9OsIXVDCqsOylnI23I7GeRt9EG3bdGm3R3SFaDM7Y2yuRI/B0zB8lvc3bA4GFDZka86Se7ne08/Gn
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39860400002)(366004)(396003)(346002)(136003)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(83380400001)(6862004)(8936002)(478600001)(4326008)(5660300002)(66556008)(316002)(6506007)(6636002)(8676002)(54906003)(66476007)(6486002)(66946007)(6512007)(6666004)(107886003)(26005)(1076003)(2906002)(38100700002)(82960400001)(41300700001)(86362001)(33656002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VCPzH5ev8sWSz86FyFzOEwMlG8FV77Zr+WnBsUhAKjBWWy2KwdciiGhRiWde?=
 =?us-ascii?Q?Ht2FXHXJ2rSrmNdy3Xx9S9sl/EJ9FkyS/dn1LFocypQWtWJ/snfFtWf8uZzd?=
 =?us-ascii?Q?9IcMwj4aj7FW04uaPxu5+wQePwlYwFhWm3QSU4g85Ev7W7YmB0Dp5xcIuUo3?=
 =?us-ascii?Q?WJOX6IIRhSudHqSzV25x1ZVQvp6IW4zigvG8zOwqSz/IoWWv45mg7NGN+Eub?=
 =?us-ascii?Q?Ik5sk1EcVz8RpO47zoQVzkUa2PYwL9c3aqkC7hsH9B46Hebw+fxRRpHYunMV?=
 =?us-ascii?Q?IFpW4n36vrUMt6dg8Wi4nXcyH3t+gKPeQjnwPayZZUS9gERhpbhDaecLbeRp?=
 =?us-ascii?Q?lg/Y2+zDA64zB9+izvLQGb+JkOFu7lISZ+vQHjy482QDmnf1tNMQIf2DmZc/?=
 =?us-ascii?Q?NDsEcgQcZJfdqShwr7+9tG64dQwvwFpa5dKyGdouxIrw+CCNPXgDJehnRKR7?=
 =?us-ascii?Q?jTexRb+k6bNMUSUhWw5uR8jN5ERa8Fo+iKlHgiOPMvaZlsrxksFFL2lpo6Ew?=
 =?us-ascii?Q?fBkXeCTEklI51IUNpQL8gL+z36jEnlF2klZWSgIQMt6BNmVizmMPU+bF0Y8l?=
 =?us-ascii?Q?37fQ9y4OEZYHMdfj2tcrPEgm+FTGt33RyrWtaOjHL9azm0keUpRCFXN2x6v3?=
 =?us-ascii?Q?Mas7PXtivu+QWvc1CrCObmZNlH9pJ/zR2U84syZw5aFplxkCj7AqAmDSoNOG?=
 =?us-ascii?Q?pO+pwbg3/9ZN5q3Rf67iCxZql0pStYtsgRRlNljcVjDdfL5SLCWmA0GNAnuJ?=
 =?us-ascii?Q?rCz4NgAEXOU2jrGaAAr+IulYsSDQRmPJfLs8Y6j2/CfRtY6OPcJ3NigPAbeB?=
 =?us-ascii?Q?WIexObF5GaD9N+Pu/+i6Xt6xNf5MoCH4fc+bR7F4L9NRpY7C5//hcbVKT5hu?=
 =?us-ascii?Q?iw4dIQCwK+NsaqIT417Y8a9HA64kbg5j9r2NqunFpj7KDKBg8OKYvOzFGg3T?=
 =?us-ascii?Q?mcf/dl0QU03N1rUCP8JmCOfmJLHoSpxDofC3TlWLyJpB2hcOSUwlXDXTXW4S?=
 =?us-ascii?Q?H3GRpL0QdeCDcmMh6bmSJxJQOBWf04bDbK8AmgrJQtRX6IyWsOeUrE5jcqAa?=
 =?us-ascii?Q?y6gi3/QEnXavj0iqbZSsT6emB9d+VwqGxSdp1q/9gdtVmBsNmGWFqOh8V/G2?=
 =?us-ascii?Q?KXl4gJ3LLIkeDH2rZq2D5fPQBjcXqcIX/f3XBYQycd7r1Qy6BRe+2/BVtWhL?=
 =?us-ascii?Q?pX5EHJAiBT/xzO4FkKylCLiPjG2SndVzXqPpPbDnwlqY74tvYqFcD0y9nRNY?=
 =?us-ascii?Q?0WlKYK9XaPbrC8Z1iXyLkE19Nxr2MfM1z9FdmEN1qOB39awhN33U9C4U7zSU?=
 =?us-ascii?Q?WO+aIStaF3baoE9+10PTkM1kME5ytyPFh+zIb0n53+HZxkkLakMKd41T0BpO?=
 =?us-ascii?Q?hdEf6tKKnXLWLrziUprOp7+0AJwyxdPHhWE+dMI0ccge8iNTDxkS09ku1NGG?=
 =?us-ascii?Q?lWV886y8G07ixrMIF3yYIA0/TB4WcsyekEb9vsbiDYFUgV5SuKuoOWm7O/Gq?=
 =?us-ascii?Q?k0wFHj7GH/kkh2CqSOCcqKSfIp2gIr8nzjzisI2/01LW5SMOwZhktgcPkm6u?=
 =?us-ascii?Q?m+IChXHXRcY62D5y9vktZ0x+S4LtSznwV7kveBw3voWcrjvDbaJ98SJMxEyP?=
 =?us-ascii?Q?0Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e524b78-9b55-4906-a966-08dc17bf5277
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2024 00:49:27.0502 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6hjTzXtNfwa0QVyTxCXzOvEIXsmb/X1Mb3njF5JZiaKHiSaBMvtS5aBzlWQYHBdb+KEya5NwTqbkURvaa/kmFB21xFE+XFQeAUrTrFwAhiM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6900
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Jan 17, 2024 at 03:48:51PM +0100, Nirmoy Das wrote:
> Atomics on XE2 works for both type of memory so
> extend setting PTE_AE for dgfx platforms as well.

There are no Xe2 dgfx platforms yet, so it's kind of hard to review this
fully, but my understanding from bspec 71539 is that in theory a dGPU
atomic operation against system memory would probably only be atomic in
device scope, not global scope.  I.e., it's atomic with other GPU
operations, assuming the CPU isn't also accessing the buffer.  But if
the buffer is shared between the CPU and GPU, then you'd want to set
AE=0 to ensure that we get a page fault and can migrate the object into
lmem first.


Matt

> 
> Cc: Fei Yang <fei.yang@intel.com>
> Cc: Jose Souza <jose.souza@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Brian Welty <brian.welty@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pt.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index de1030a47588..3ace4b401369 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -602,8 +602,12 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
>  	struct xe_pt *pt = xe_vma_vm(vma)->pt_root[tile->id];
>  	int ret;
>  
> +	/**
> +	 * XE_USM_PPGTT_PTE_AE is available for igfx and dgfx from xe2 onwards
> +	 * and also for PVC but atomics only works for PVC on device memory.
> +	 */
>  	if (vma && (vma->gpuva.flags & XE_VMA_ATOMIC_PTE_BIT) &&
> -	    (is_devmem || !IS_DGFX(xe)))
> +	    (is_devmem || GRAPHICS_VER(xe) >= 20))
>  		xe_walk.default_pte |= XE_USM_PPGTT_PTE_AE;
>  
>  	if (is_devmem) {
> -- 
> 2.42.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
