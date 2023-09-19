Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C44ACD5BCE
	for <intel-xe@archiver.kernel.org>; Tue, 19 Sep 2023 14:50:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AD7710E2AD;
	Tue, 19 Sep 2023 14:50:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81EC910E2AD
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Sep 2023 14:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695135018; x=1726671018;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=uYlmt7y+pgrNca/DyHRhZiD111FfHRPCRG4wAm2q4JU=;
 b=JPP2Y/z/UnbeUi76h6CERuECPazhbnu9CBGKjN1iTI7xmeRxHxFEZaeq
 3iai5N6c+mh4NGOUdsyAsytVgeQ7FOtJt/Ev62E4P5vU7q9RTAp1GC6Tq
 7jckolH2t232Z+KHhBVCh4DF/j3Mml/ZbNAB+N468WvFjcQJUym7uc+va
 IC6MGTtH7AFNQksvmk6xmtb4u7EK7hrHrfABIQTRle8b04ixAzQg/SXT9
 GYDJpsLsIQhZ2JE2OkdDwQL7qAqnY7D1Y/zdCQINHW1Msvt3c0KTfjn9d
 OzjYwogJIFeZXrLQW/nAu/zRtHAxzzITqs2cmWSwjdHsqY0eHtlcKT2Fy A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="410889140"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="410889140"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 07:49:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="811745858"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="811745858"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Sep 2023 07:49:38 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 19 Sep 2023 07:49:37 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 19 Sep 2023 07:49:37 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.45) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 19 Sep 2023 07:49:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y00ON/lGb0fbZdV/YQBrqxlvjJZNd+iM/dlFiQekKCxyRc+LWOrs5eEcfu4JzvGCGXjQnTnGDVGlRe7rOmP1OcjUN5d3oDjX5NWaEL0YCfejHd33wZAPKP6pKlmrUZ04Wj8Tlw5Vik9JYQZ9K0Mti4NC2wWa2OPcaEpfWi1XwJkCmkM2BNDHrX6ChOr9u/NDbtI8QJdcwQbIURtgAnkdmx5f7b2ht5RIjU3sve6I6Ub8gjjAFAuR4jog1WXpO5WRTsUehY64x4c4e8XncDC+Bxhu3OTH6lQjTWhvgI/A3dsrA11K6TZSu9uyumJLhoMZyQrZWmuOgKy7VGPt/RgoJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=umuG+qGuIKG7b/v+CucrTJJwWgeajzveFX9nmh9Myro=;
 b=hVh5wCVgfpFaxW4vX5griK69qYgY61bAYn0XIDO6GfHclyKZbX3L7djwus8q/9Rz4SVEWNruWcq0i3PPjwbxEbF2fBHuqP+g2yGwHR94vQKSOwzx+L4dIUm8lzkwDmxv3KmmN/lQN3LQpN/8RyZPZCntus7VcIcdQ350m28k0NfRiPR/ZrpbHzaB4zCmfF2IDSr09rIsQTZLIEfDHUsrrXnsYQVx/Dm+PB2njCROjN7BzIYXNHEo7bWy14b7ZgOyt9fv9Q4+h2tn9cn28wp7ov1lVcbouzdkbzhvqYuUs3i3nc4DnHXg4eZKpbEYzzW9AcEWv5aDT39pRZERkhmryA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by LV3PR11MB8554.namprd11.prod.outlook.com (2603:10b6:408:1bb::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.26; Tue, 19 Sep
 2023 14:49:35 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b%3]) with mapi id 15.20.6792.026; Tue, 19 Sep 2023
 14:49:34 +0000
Date: Tue, 19 Sep 2023 14:48:28 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <ZQm0vPddC3O+Gcpa@DUT025-TGLU.fm.intel.com>
References: <20230919142504.91652-1-rodrigo.vivi@intel.com>
 <20230919142504.91652-14-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230919142504.91652-14-rodrigo.vivi@intel.com>
X-ClientProxiedBy: BYAPR06CA0068.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::45) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|LV3PR11MB8554:EE_
X-MS-Office365-Filtering-Correlation-Id: 99356c0c-ed63-4111-e53e-08dbb91fa3d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PpdW8iMwyXNWcXM5xXM3pYmzAwUO/Yfb5FXFl+gZ2BJAF9/2U4X80US+pp1N2L/GCsSzDuwYYMneKjw0K6fL4Q9jJCs/Tzk5IhmDtPnkkjjZAh26XW26cKGJ+A5pUTDA4ZdxRlagQ40iQKWwOWN0q0aD0egFG5qyk2QSf5+4qmTew1vKxQaDrpXOXu8p4GwT/kgHQZVHzOK6MJUNb/pPLy5Hnu/X0SDPzbHOHg/4pSc6SgefXBHVVHwG32FC6fRK34orhp7giX2xEaRUMIJWcck0OA/RANP2MJyzN/3CwMK+v8L53ztam1FNYkrW68sbu8tUPJdhwr7obb5xS59O/Z4ox3Ea8WHtbir2URv6/D74FF97iQtsRK2vA1byBAWYea4Y8gL0HTct6AP7JDWQHrFl77X+dYPy28SGvIhPmDFPDG6NWfqQSI9pfmVrGn4Rzaou2cx9rkAaAVJWGOSZn51byoN2WafZZbsLh67sm6Qxg88WOEIw/uZWSaFmIzQFle7LV1MfOpQAXbrP4nUdrgQb32Bda76K+8T/RUGNM3eZKgZC6NTvPILHbZIWP5KApHRQ9Q6GmsqCBJu1R3JcVGVKlXzZme3qIk99BsWmzjI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(396003)(346002)(376002)(136003)(451199024)(1800799009)(186009)(83380400001)(316002)(41300700001)(6862004)(4326008)(8676002)(8936002)(107886003)(6486002)(6512007)(478600001)(6506007)(82960400001)(38100700002)(86362001)(26005)(6666004)(66946007)(54906003)(66556008)(66476007)(2906002)(44832011)(6636002)(5660300002)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?O8sAs92isMVH63PQIOALU3f3aLVoq3WL0EVKqPJOdHEXDhZxlr51wt8J91Sa?=
 =?us-ascii?Q?6zv+EkVHF4CNDhvn5FkE8Z0TEbyjJavbOhkLi7NChCdRU0Be+f/9B+N+7AfF?=
 =?us-ascii?Q?8+GBsTOtvLQikSnxJ/x3y4cyA+xv9crw65V8/1lh93NKLmZSVn+eRqwE3nnj?=
 =?us-ascii?Q?dPptS9p99MC13olexwaIxC9l2qwDdcIzYbmJ6iIQkdhP8ZuN5qKJCFi+mnNY?=
 =?us-ascii?Q?9izOeT9pYEZIOrbw/hX/iUMQiLLcrW3Exje1UmnRuYuF20xuHN7N6hUe7oLJ?=
 =?us-ascii?Q?Ny5xSRnN1V8J4VmYlbu9m+9OLsa1KMaXBPiECFM+1ElDOWqbjWYvnkn9bAji?=
 =?us-ascii?Q?mBxi1lTeDUmbCbxmtw7iQu9QRSUA7fIG5XzVaKrvCWC7IsOpyIpyjjWDByeS?=
 =?us-ascii?Q?FSxlcBjykaPs65yad9qpLNVwv0vFptKoLnPdYdtS3Bz+fhyxH959xlVZ7lel?=
 =?us-ascii?Q?8HyA8vhOHRCWqVamFyHaw3Bnzw8kWI2KfBS40tOJnPd/PI1EcTloyILP0KAE?=
 =?us-ascii?Q?X1+dsHvDXmT/S4sKPJ8e4RGxJD6mulycamarcH6pUWDCnfDl5U7yagUIquBf?=
 =?us-ascii?Q?afs62kpNntS9Id68r8BYLBS3jWTK8KR9fi20ClUlt1e3FETRcvP1+eGIO+Ff?=
 =?us-ascii?Q?f/lDSQF9MiY+nN1dLc56m9355FwXVxkfYFmoGXvX5mHbfA0ShpzlAt9OmE27?=
 =?us-ascii?Q?buqHUpiWZlGb62U8lnDhLmPnSnex3Y+9KV5HhcV+cF6YDmlWCQtBmHaN0NWC?=
 =?us-ascii?Q?GHwZmSJT1XxVjybCVc/xglGAV9xbKMCPccvJwcVGgXz9jyBi2Vr+AzFgfi2m?=
 =?us-ascii?Q?uqFjOWu70XQ+HNkR8KkifagCqEJrz+6O5jHzrwzhBhA+9SUeEnrxFuCNMetW?=
 =?us-ascii?Q?FernJv2cywQCfSAMYB8jXQalU2YKrKdCmtvoH9C7fsomNpMBbIW/BgpdMFuJ?=
 =?us-ascii?Q?2te3d1ZloOn26m7TKjjC0SALFgkm2xRzd9d3Ewgn68j95qKYCo4wmBmJbm+z?=
 =?us-ascii?Q?NPsRTsQKlrmx7OBBJLRZYt4ml1q2DHCps+iNshTbIg2tFDKviWO5zA/zAZ8c?=
 =?us-ascii?Q?RRAxuSUnjCHBE54C9NzN4IRhlIkyDbCQGSQ27Mr6kA+2IM6F7vKEj9jLgDNy?=
 =?us-ascii?Q?RnmK6wl+h6QlpEvstkvTWMK2ffnXsYp6MWkwHFcwb/rF1vBSIVRzAk1u/Dr7?=
 =?us-ascii?Q?cL4N/7L8Nl5u1vl5VCwPZoUnHHTWkTGd8Wh4II21+bI6sHm20JgWRaPgeH45?=
 =?us-ascii?Q?YlGCZObBqbsr9y4GMZrhtgrqo0pYKB6sXef5eCJaRps9QA9QpoPNEPsETVks?=
 =?us-ascii?Q?XVWYDNSiE7OuMtakDeS161gLKwPT4/S2objn3Bsy8seCBiqO9pS8nA28JWIj?=
 =?us-ascii?Q?pwk2Be9pDCectg1H5yCIOzWw4uYpf3mg0jKhhdjhOnQ9EyuZ1RnR0CRt19V/?=
 =?us-ascii?Q?wkVihDQavLaERzR/K0HKI/SaE6WX59YVQLEVVnZ1eGWqiWcezp5neOdRd14K?=
 =?us-ascii?Q?Tt3Ld9gs8HnWkPPGiGdRPn6AMoQ0vZ0yphtCIrB1C+8TxFdKR92bJICbYLbR?=
 =?us-ascii?Q?yaG3oKGZce8W7h4FaF/qS+ZiFkvPqJPLs3GBgHwJQXPhgeTLhXfFTsifCm8b?=
 =?us-ascii?Q?HQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 99356c0c-ed63-4111-e53e-08dbb91fa3d2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 14:49:34.8005 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Tsmv7PCx04WGzHnF1h12fGi/6tNARWNHieCo7U27cmj/bPBlGaIPUt7kXtqHDvrW3cpEpVo4lXdHZhgPfsuCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8554
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 13/17] drm/xe/uapi: Document drm_xe_query_gt
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
Cc: kamil.kopryk@intel.com, filip.hazubski@intel.com,
 Francois Dugast <francois.dugast@intel.com>, jakub.chaberek@intel.com,
 effie.yu@intel.com, bartosz.dunajski@intel.com, carl.zhang@intel.com,
 Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Sep 19, 2023 at 10:25:00AM -0400, Rodrigo Vivi wrote:
> Split drm_xe_query_gt out of the gt list one in order to better
> document it.
> 
> No functional change at this point. Any actual change to the
> uapi should come in follow-up additions.
> 
> v2: s/maks/mask
> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  include/uapi/drm/xe_drm.h | 65 ++++++++++++++++++++++++++-------------
>  1 file changed, 43 insertions(+), 22 deletions(-)
> 
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 817fdb762758..ad344b3324c6 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -336,6 +336,47 @@ struct drm_xe_query_config {
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
> +#define XE_QUERY_GT_TYPE_MEDIA		2
> +	/** @type: GT type: Main, Remote, or Media */
> +	__u16 type;
> +	/** @instance: Instance of this GT in the GT list */
> +	__u16 instance;
> +	/** @clock_freq: A clock frequency for timestamp */
> +	__u32 clock_freq;
> +	/** @features: Reserved for future information about GT features */
> +	__u64 features;
> +	/**
> +	 * @native_mem_regions: Bit mask of instances from
> +	 * drm_xe_query_mem_usage that lives on the same GPU/Tile and have
> +	 * direct access.
> +	 */
> +	__u64 native_mem_regions;
> +	/**
> +	 * @slow_mem_regions: Bit mask of instances from
> +	 * drm_xe_query_mem_usage that this GT can indirectly access, although
> +	 * they live on a different GPU/Tile.
> +	 */
> +	__u64 slow_mem_regions;
> +	/**
> +	 * @inaccessible_mem_regions: Bit mask of instances from
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
> @@ -346,30 +387,10 @@ struct drm_xe_query_config {
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
