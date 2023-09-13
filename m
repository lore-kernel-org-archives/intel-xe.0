Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBA03EE0207
	for <intel-xe@archiver.kernel.org>; Wed, 13 Sep 2023 19:55:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C9C710E1CD;
	Wed, 13 Sep 2023 19:55:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA25610E1CD
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Sep 2023 19:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694634918; x=1726170918;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ScJLGcdtpfCmB3JhGhTp5/Tpxo/vuE4LS65WFisX4bE=;
 b=L0r4x4De67KiDg7jYNdArFMngXLx1L0IAPGIYiPx3xgAm/vNqElu3On7
 uyiycFEQ+hQpwI3x34NnS44H7mJ6uzNP2Bh7x1k8J8lBAOne5smCp8yyt
 QOSoLvaeM4DHpMT7DvFC6jPh/JA091GWIov5XmBoFH6l46VkR27QTcw4L
 cnNupZtR4RmE6VjrNpkJ4AqXOQtbdJHVZNZ8WnX8OIkg12bZDscgDBhqD
 dNrJkX3+MTya5C0KKHbqnjgVYhkCuBxydPNDIXpTG5UgoZw4+4xVyMmCh
 CX5+LC6EeivNVoHbPxLecEXTs7Ex6vtpx3KXEBQhhl1ez/hcGpRb8FUZc A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="377679991"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; d="scan'208";a="377679991"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2023 12:55:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="834442919"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; d="scan'208";a="834442919"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Sep 2023 12:55:17 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 13 Sep 2023 12:55:17 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 13 Sep 2023 12:55:17 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.42) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 13 Sep 2023 12:55:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I4m1r+f+fucx5R9RxcfCgUASeqiWjMbmZlIWUcbKolYP4qSXw/vzzsMToPh7K4ELnXJ614pOq0qwyBu83Z3ZNJ99KFvoE+Ec6ybC0jnZGJAxtcapAobNo2JymdrSXN6mwIcHHKJKQYrjh92Db3LnuOYYokh1Cne/Sc8+LtEL6PtZxN0TiwlPoCoaDI75nsW8/YNkEx9olGzWBBa1U5qZ6/zjyauGBr47sgCg/JlBnYltW4clae3IC8k5oyTFSpqG04cfh50s1/Bp48+cHnebnnCLdPH+dhkrdwh3HqwY5pLYDnbKr9+cKysZ+MbwbQHEof5qzTjMgH0QKChbYoYEPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eIBlY1k9bMbq0VvNQE/vNPq3JvJ2W9NJ8i4/yAQVKCY=;
 b=C4cllb5OBUD+IM8GGDWI5OPrY7aZOJQ/r0MjA4TnjIZpOxQmLLAZcoOdxCDGwXPO0vgr5ozBg1EeP7IhSkMEV536lgJsparirnTKly1xQ8J6YNsjv0P5YYym3ftd0GUZ/jyw6kMrdSWP7pJOg2m4QO9rzmMS+PSTKA1lPfhY9W0rus8fjnywVWgauCzydKDAqLkdfjCaSKoPeatIvF65YQLfTjH0/4wwQg6dBOBL3F/khHAmeMSsU7b12jBMtKVYZImaMCel5BIGYlpJOwTvkcpUqYT+egr+v4mk9trjreuNhy4fRMm/tG1pfcl/zTHP/qn9rrgjIOqJ8lAD8kGgig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 CO6PR11MB5668.namprd11.prod.outlook.com (2603:10b6:5:355::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6768.38; Wed, 13 Sep 2023 19:55:09 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66%4]) with mapi id 15.20.6768.029; Wed, 13 Sep 2023
 19:55:09 +0000
Date: Wed, 13 Sep 2023 12:55:06 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <20230913195506.GC233750@mdroper-desk1.amr.corp.intel.com>
References: <20230908203302.449041-1-rodrigo.vivi@intel.com>
 <20230908203302.449041-3-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230908203302.449041-3-rodrigo.vivi@intel.com>
X-ClientProxiedBy: BYAPR04CA0023.namprd04.prod.outlook.com
 (2603:10b6:a03:40::36) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|CO6PR11MB5668:EE_
X-MS-Office365-Filtering-Correlation-Id: a209d896-61af-4f7e-0e81-08dbb4935567
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: btaHiuECxQ3Mk0+8JA3mOSGaSwsPzE7nz0I33eg+NVGMhNGvBnxZa1ttJWy5xDt6YRrxNYp+33YIzhrh0LNUZWLKZX9WenqEQRtLlci8Q93VG4QUU0Ckggo+IUqR9CTd//OHRKMyM7Dk6OJ+cNBKhJgbmVapZmKXcFpUJ/xFXZ2tAKmjJlyYb3CIuuGQ6Q55rxf6Ka9YCfxEdFH9OmlSPrwPEGGCvwQ0rvgFZqWBSOaYlBsT6Zl5d++3mURfy6OpBzH3xIC5nUoUMChkCn09GiOSbEoul2CPEWhkhIbzci1BcICGhkeT0GUq9LsHpKWbsPPrNCEeXzTi5/4/Aeiu1a/h3QYDXJKqWVVeOxJXpNxrSNNc0gtL8QaNDVXB4KH2f1spWt/TuJW6HxLB+LT/2F0y6eAEIlMUso/vI7XOLDLFhxrkxSRQt3w89yYv2HvEltm6WnrYyjLi7A6zN4Xn2nHvDvqeb7Akoz9cOW+KS/z5O2YH9gChcvy/7AlsPKJ6iRgh/7LPCvcBetjFgqe+IIIsWi4jwh/y1HIRnFiOd23wj6iXMq8F3CVMxX2hlWsH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(346002)(39860400002)(376002)(366004)(136003)(451199024)(1800799009)(186009)(82960400001)(38100700002)(33656002)(86362001)(66899024)(6486002)(66946007)(6506007)(5660300002)(478600001)(8676002)(66476007)(6666004)(8936002)(66556008)(6862004)(2906002)(4326008)(6512007)(83380400001)(6636002)(41300700001)(316002)(26005)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zoBMrzmgAXxMxEZp3dcQ2Q2Fr+uBWDxD26A9As4u4DB+4yUOWIzdRcbS+b3+?=
 =?us-ascii?Q?ACQCmz4gtAioFTEPx43bytIrWg8icmwnRR5N9LooVj1+pTgqCnHaEMTWLdaj?=
 =?us-ascii?Q?vpLQL0n+IgdZAhXU2f/JkB7CIfF4iyhxI617ebgcIgDKefFr4t6Ae1y07wsS?=
 =?us-ascii?Q?jK/j+Rk83/8j2sfRdWyyKkd84UETXMl/Ojli3mgcuHdjPPLzILy9priGmVfJ?=
 =?us-ascii?Q?SmSWCZ/5emZnoB6VZDrRWuI6UZ6g1COIqJl6LcAW8I0C4OHogWunruMUX81v?=
 =?us-ascii?Q?bzH8YqAHI5ovctCtmczl9jXhg2KG1aoD7RSQxS3Xurr2cZNbYKb0SXZAKlIl?=
 =?us-ascii?Q?C8vS1pO1R5eAakH08Ox9ObRXwJ+WbqzJ807arH6Q9+nxwsmUdT0l05WRG6r5?=
 =?us-ascii?Q?j0vQ8KWN98wkdRHMlCPbQab9x+pVucii4gV2H+/nYj3R4D6dS06/0DMiUPRu?=
 =?us-ascii?Q?LjkaYvdVh7EjrqtwYH+fMumtA0LhetXIAOhDPQjKwYabnDlqZi9OnNrg8gqE?=
 =?us-ascii?Q?a495tYw0hJIgLkguYfB6WsFwHNPgCTy78PMtocr2WL+cibpKSZd941RkzKlo?=
 =?us-ascii?Q?yvcW6u0GF8fyx1x4DYEg8Hf9EkwCP1zSaYKGFBBil0vj3tH1LfyoOWzzSek7?=
 =?us-ascii?Q?DDnUcwu70GIjVl1ZQVcj2Sv25zIrLWycfHvYGdzMaEQjPH4qXnawpm6rRNBj?=
 =?us-ascii?Q?tNXzFJ7BIlAvULU4LgNdoONe85n5/aQxZmTgV50+0t9vaT4ZS+l8xVxTjUyn?=
 =?us-ascii?Q?1HTJ5VUtGJa46cgBJU4/4NOFwyRFirS8zzmbkz/0r5TuzvVSZCuhnsOVkEDw?=
 =?us-ascii?Q?17qK6/8XpRao5FAXuNCfOPxdK84bdw/Yo6KcEJM7EKWK2XvKwiwNEIS/5JoF?=
 =?us-ascii?Q?0guDBzFltY2DnirgQCvwA6lqFWS6KNravL4OxOzOn/CKwPxM1YZWN+BRVMtF?=
 =?us-ascii?Q?xPjDMCvFeXWIphrs9COSPsZy6s8CAZNi0vFGC9IuwyhjesFDsAZ34n6KHl7C?=
 =?us-ascii?Q?teIuLnE5YPDH1tXTDt141RYwoHwFu4P0gmkWJzkHH/hNHGc+kucH9rm4GIMh?=
 =?us-ascii?Q?fBJiO0ASeSzIyEiNe3UXqChDRlBY82s5NIMkrqqHZrG0rNT6mQZMTSy2dbK+?=
 =?us-ascii?Q?wKYubfn/KVX7HWSEIwSI+NAuZ9H/eYUw8V12NmJXFChj2YOIDxHHYbX/NGKl?=
 =?us-ascii?Q?T1PneWslSbnpXmOhHgvd9YKc/IuRrGv8uR94VaNHTuAFqrYODbjk5FmWAlh4?=
 =?us-ascii?Q?MvzP1oS8A+7lKqq5Jb0jByLO/rb84rcWh/wLNx19rubEKA7UMfVLbVIij2mb?=
 =?us-ascii?Q?NZ5gIaYsSOZEa3rJ4/5QQs+a1iSkv5+sJ7lyV5BIPDH4njDMMnyR5ABl0QE5?=
 =?us-ascii?Q?R2f6I8zBCjN29NSdFRlXfmiGXHB8/Kx8kKz+ORSFyWg293lzfU/MwgalEpoh?=
 =?us-ascii?Q?BmcRRZ7lvHxMevq+zRJQ9p7yqLKbPZur4csf26aSX2NTZZuP0Kb8X+mgRDTb?=
 =?us-ascii?Q?HmfTrggsQZQF3O8DjnZTP+iCi1ePIgVG6/lGRq1XH7GIu2iUagAeidXx1Heg?=
 =?us-ascii?Q?ITmHzT0v4qGcgdNh+QYnqc1CjV0525WNI+5xs0v4T/dRmKW6rbg5sG+pBkpN?=
 =?us-ascii?Q?hg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a209d896-61af-4f7e-0e81-08dbb4935567
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2023 19:55:09.2148 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a/cpOYPVkHBOh/0y/St1UqI8X3BIqmlLmjKtzbqMAZ533CnSVteRLUdB0L/dy+R8jI6fwjTUxRen2nURxWepUb7quxwt3dBe5EMYSL6yiZQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5668
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC 2/5] drm/xe/uapi: Document drm_xe_query_gt.
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

On Fri, Sep 08, 2023 at 04:32:59PM -0400, Rodrigo Vivi wrote:
> Split drm_xe_query_gt out of the gt list one in order to better
> document it. No functional change at this point.
> 
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  include/uapi/drm/xe_drm.h | 65 ++++++++++++++++++++++++++-------------
>  1 file changed, 43 insertions(+), 22 deletions(-)
> 
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 51c4ef5dee6d..4bcee709bef9 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -262,6 +262,47 @@ struct drm_xe_query_config {
>  	__u64 info[];
>  };
>  
> +/**
> + * struct drm_xe_query_gt - describe an individual GT.
> + *
> + * To be used with drm_xe_query_gts, which will return a list with all the
> + * existing GT individual descriptions.
> + * Graphics Technology (GT) is a subset of a GPU/tile that is responsible for
> + * implementing graphics and/or media operations.
> + */
> +struct drm_xe_query_gt {
> +#define XE_QUERY_GT_TYPE_MAIN		0
> +#define XE_QUERY_GT_TYPE_REMOTE		1

I know the goal of this patch is just to add kerneldoc, but while we're
looking at this, one other thing we'll need to decide before finalizing
the uapi is whether there's any value in keeping these two separate.
I.e., does any userspace actually care about the difference between
"render GT on first tile" vs "render GT on other tiles?"  Given that GT
at the uapi level is pretty much only concerned with power management, I
can't really think of anywhere that the distinction would matter (but we
should still check with the userspace teams).

> +#define XE_QUERY_GT_TYPE_MEDIA		2
> +	/** @type: GT type: Main, Remote, or Media */
> +	__u16 type;
> +	/** @instance: Instance of this GT in the GT list */
> +	__u16 instance;
> +	/** @clock_freq: A clock frequency for timestamp */
> +	__u32 clock_freq;

We may want to be more clear about what frequency this is.  I.e., is it
the current frequency when the query is issued?  Is it the maximum
frequency the GT supports?  Does this always give a meaningful value or
does it report 0 when nothing is executing (and we're in RC6)?

BTW, is this redundant with what we're exposing through sysfs?  Does
userspace get any benefit from grabbing frequency here rather than
through the sysfs interface?

> +	/** @features: Reserved for future information about GT features */
> +	__u64 features;
> +	/**
> +	 * @native_mem_regions: Bit maks of instances from
> +	 * drm_xe_query_mem_usage that lives on the same GPU/Tile and have
> +	 * direct access.
> +	 */
> +	__u64 native_mem_regions;

Was the plan to eventually move these memory region masks to a
tile-based uapi?  Leaving them in a GT query seems awkward since the GT
isn't directly related to memory regions.  It seems like what userspace
cares about would either be tile<->mem_region location or
hwe<->mem_region distance.  How is userspace utilizing this information
today (and are they needing to jump through extra hoops due to the
current placement?)?

Also s/maks/mask/ in the kerneldoc you added here (and in the ones
below).


Matt

> +	/**
> +	 * @slow_mem_regions: Bit maks of instances from
> +	 * drm_xe_query_mem_usage that this GT can indirectly access, although
> +	 * they live on a different GPU/Tile.
> +	 */
> +	__u64 slow_mem_regions;
> +	/**
> +	 * @inaccessible_mem_regions: Bit maks of instances from
> +	 * drm_xe_query_mem_usage that is not accessible by this GT at all.
> +	 */
> +	__u64 inaccessible_mem_regions;
> +	/** @reserved: Reserved */
> +	__u64 reserved[8];
> +};
> +
>  /**
>   * struct drm_xe_query_gts - describe GTs
>   *
> @@ -272,30 +313,10 @@ struct drm_xe_query_config {
>  struct drm_xe_query_gts {
>  	/** @num_gt: number of GTs returned in gts */
>  	__u32 num_gt;
> -
>  	/** @pad: MBZ */
>  	__u32 pad;
> -
> -	/**
> -	 * @gts: The GTs returned for this device
> -	 *
> -	 * TODO: convert drm_xe_query_gt to proper kernel-doc.
> -	 * TODO: Perhaps info about every mem region relative to this GT? e.g.
> -	 * bandwidth between this GT and remote region?
> -	 */
> -	struct drm_xe_query_gt {
> -#define XE_QUERY_GT_TYPE_MAIN		0
> -#define XE_QUERY_GT_TYPE_REMOTE		1
> -#define XE_QUERY_GT_TYPE_MEDIA		2
> -		__u16 type;
> -		__u16 instance;
> -		__u32 clock_freq;
> -		__u64 features;
> -		__u64 native_mem_regions;	/* bit mask of instances from drm_xe_query_mem_usage */
> -		__u64 slow_mem_regions;		/* bit mask of instances from drm_xe_query_mem_usage */
> -		__u64 inaccessible_mem_regions;	/* bit mask of instances from drm_xe_query_mem_usage */
> -		__u64 reserved[8];
> -	} gts[];
> +	/** @gts: The GT list returned for this device */
> +	struct drm_xe_query_gt gts[];
>  };
>  
>  /**
> -- 
> 2.41.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
