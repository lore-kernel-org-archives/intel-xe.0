Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9FA5C7618D
	for <intel-xe@archiver.kernel.org>; Wed,  5 Apr 2023 23:42:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B684410EA78;
	Wed,  5 Apr 2023 23:42:39 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74AFE10EA78
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Apr 2023 23:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680738158; x=1712274158;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=i+VxL/aQMTuVH+HHIzCSS4kU26nEBDEEDg1Mfxj7B5c=;
 b=ABmfUBLnH0PIFtvNrrIKH/6rYj45O6X4Njoo8xVU1GBPhF9dqlaVy/4d
 rJVmRNQ1ebzCcRVIwlTL9IXzfLP3QiuuW3eypTU9ZRKVXyOq72fphAOf8
 rF5ahVD8LXwkH7ZaGY5kqqodWL+Q1zaNaONfuVgklWIT93mdFL/dZoha9
 VaCKufl5khi4CqiNI8KqLWhMxqjHH1PdkWcf59oxOwtltyn0GmOyfpgT4
 W+yTbmh22sh4CwYGrjKOXuobUEgBFmFRaVIJ62k1Zxet+UAuYrfuX6d8r
 GMdiwh3a8GVT3JyVWiCAMU/CU++MAdh8CeW9gEr+EvLAHopCwR/fbjxDH Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="428886309"
X-IronPort-AV: E=Sophos;i="5.98,322,1673942400"; d="scan'208";a="428886309"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 16:42:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="861170957"
X-IronPort-AV: E=Sophos;i="5.98,322,1673942400"; d="scan'208";a="861170957"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga005.jf.intel.com with ESMTP; 05 Apr 2023 16:42:37 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 5 Apr 2023 16:42:36 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 5 Apr 2023 16:42:36 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 5 Apr 2023 16:42:36 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 5 Apr 2023 16:42:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V5jBs92NkjVEHRGvb8ykCg6KFoOk7PYbTbMKV4zSLGdaGvS8NuPbt8L9NBekmWmwn6F1EqwM0VIOPkw6ANHDrEHKqiSUr+uX8uLgu9cj15uiibKAyrOnS0WRKgz9WcEuQF30Z6S5GpwyUtKPGlzf4wfxxOHypR+yjN1ZPMcRxrs8n8wIKWjkGGrmTjyTvKj6XK5OFETrMKRyxfGREtImIF76UgSxFL5J25jVBzuOIPI5Is8tck5ZkOJIotpAkw53KZivghMnfiCYYcGGgmoWC1MVVbwrx01BehHm4Zj8I1CC6evHonzCqh1dZepAKjHyF9oqlkc//BIfMR484Xk/SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O3MIjmvnvH/U7p4d6YRCOfYGzzsf+QL9mx1GgPtHm6I=;
 b=Dx1KXdo3xJWDpwyVjRxg6hB/awYo7aIiPEnbIKe0QKGzbIog4x5yt9yCuyRAcIOMaTNPEYBJup7aqDiSDCh4IiUp5KLpJeF6BjbNV4gj4YLAmbbLJr5ON81x2guug20+oBaEam8TOodDfl2H/j6SX1xv52X7fVWFkig7htuIdpaWyuXoZ3QD5sjAs4hT71K1HemIaz5kqA5bsCloszl7fPteY1evEjwHozK3fXBzoI/LH0QhrkBIb9vpHb04zsEwu2AchO7Q8Jv2XfBY59nSfSvSmFd9axOybl1VhSH4jStEaUOt64acBw/c7HgqBYioHg593zA4qbxoyEFTvh8oAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 DS0PR11MB6421.namprd11.prod.outlook.com (2603:10b6:8:c7::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6156.22; Wed, 5 Apr 2023 23:42:34 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0%8]) with mapi id 15.20.6254.033; Wed, 5 Apr 2023
 23:42:34 +0000
Date: Wed, 5 Apr 2023 16:42:30 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <20230405234230.GK4085390@mdroper-desk1.amr.corp.intel.com>
References: <20230405233403.151088-1-matthew.brost@intel.com>
 <20230405233403.151088-2-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230405233403.151088-2-matthew.brost@intel.com>
X-ClientProxiedBy: BYAPR02CA0058.namprd02.prod.outlook.com
 (2603:10b6:a03:54::35) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|DS0PR11MB6421:EE_
X-MS-Office365-Filtering-Correlation-Id: c279ef7c-dffa-4da3-9284-08db362f6dbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7RejtP3YdJbMRqGxCqw8hVazQQCx1AD545FBD9WWwV2cQ89PA4FKjuG7f6zpmNdVzuEy05CmT0MVGAgmRnsn51JyI99fbOsLnQ22VzE0FXTh/G4AX16RG01a5Fq/9iuMmjamKi4EAsUDZ+4AxU0YBp5yKD+52sqPrBWstXxHYGP25lrZ/FvAl3spYBRu8j1yUc1OPaZtTmqX1xCT2TJob+b0kBAz8soRUEeCdIRYrfuBaBY+uhq0SiAy1cm49Wt8gyFGwwptzYCmxSlm93gScfuXCEw4tyZ0hNq2+FyS36FJ9PdHUfAeQV3nPH/roxo8Wuj4FvwNw33ZnxZ0iC7ngFyuDv25sfr0z+/7oWNwY4uVk0FaYO8DStmxbGv+Nj44EIQbQPbtMx2OlC0SyESlDdTrXRG33UHk42etJtZYL8HibGa0hqRXRPCyz9gHENeFQrzh2TRjlD22xvnx9z2vYWws8o6h7E69UWlBk6/E/QdF7hkoWAGM07kbVr1k55fWHaX96sL8+3t0D0xHTmhZWfFlGXNwlnKZiTfnYCseuMRf+ZIEu0gXiiNVyhumkHoz
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(366004)(39860400002)(136003)(376002)(346002)(451199021)(86362001)(6862004)(186003)(66476007)(6666004)(66946007)(2906002)(6506007)(6486002)(83380400001)(478600001)(33656002)(38100700002)(1076003)(6512007)(8676002)(4326008)(66556008)(316002)(26005)(82960400001)(5660300002)(6636002)(8936002)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HD2R8cckgl6Mpi2h+tmeXi6p0Gh49OYwfDk1fZ5Om8HILO14NP48+0BaT5hZ?=
 =?us-ascii?Q?YFGFXRdoiqs5a3fbkEx/BUyMjexk2EMtJWtt4qtEsdM07vkToXGiO+RIwfAB?=
 =?us-ascii?Q?vLcfNKDqos3faLBBImtfGRnjmW5zgvXtt2UtAQUpSYWxD87a7WNCO2lgioBp?=
 =?us-ascii?Q?JBeORcL4aJvdRDq+Msrks4WfKVwG2Wr2YIej8CMGsHOEi+X4aCt+93bLyQXy?=
 =?us-ascii?Q?+jZsB/SJ2uDKccVPMBJVhP5WtPAwXYDUvh4h5xdQbzbhqNgT7bq5hXZ2izOE?=
 =?us-ascii?Q?aqypR06w0f6ceSNfveR8dNRlpBP8KHLESEBOtlEvEKLbyKqMZk3dy+TceSuW?=
 =?us-ascii?Q?hN7maj4uV1675VNIFV6JpYIm7rOE2PNIMFFNVOLoogIZm68EA92DDB+KswhQ?=
 =?us-ascii?Q?im42bpeVCogV7nthm03+jthu3CZ7Dhz+msjTFAUDk8iZgxG7kjsHKbzP7PEF?=
 =?us-ascii?Q?zNlS+7XJUHp/T6AjxyszmQgw0x0mVr1AYahoPPt/NXa6pXuMvyELiCRfZR5m?=
 =?us-ascii?Q?fnOtX5JQc+dcWSSQD4kjjYOj8P7N1oWHKjd9aLzXHe0DiPhYpLtCz4D/OnMr?=
 =?us-ascii?Q?ykBOhUWhaHkiD4N/5HDvsCWmFGMWl5FbpitdBjHsS2VDUoYMUPJ3wGcWh/Se?=
 =?us-ascii?Q?bKjDJA8UeV+gdVFndAZzkzaa/HDXi+K0wwKdB/xg68WHUKgTljQAR4V8iTzR?=
 =?us-ascii?Q?mIGqsT+fdI6J4mjU0qwKp/rtP24ezAMaRk/1Tz8Lu2OlinAgd4A05hs6om4L?=
 =?us-ascii?Q?rU1wNQUW17FsesdF40EuVfEIUaErPUC3RVrgJy8earNQrruwFu9v2+0hRBqM?=
 =?us-ascii?Q?cjR/Mdzm0Txmwjo/iRWRhPFwuNrWbq6shfixlVaByIBxi/SWcE2iS0t9U1ED?=
 =?us-ascii?Q?D2Ug0YBkX9QU5mPug87b0N4tVxcvOL1GeO+fb8oFuM195CgFISVzFDx4Ojv1?=
 =?us-ascii?Q?o5OERvUTbP0bHJQNrORA3hD5e5VHGySdDgEPffeXwMpBUlNu7frsozyYx5JY?=
 =?us-ascii?Q?eo7PrevkPbqsX+47mLCp9lQvjjSvsB9bV8JTEc3XYxUcXcbxXJEBGljTIJ7+?=
 =?us-ascii?Q?iUZZfLrFSbmjiwYICXxcP3RogoKUnrDeNNF3hHHPI823MDTDkIWiumbpov/w?=
 =?us-ascii?Q?7E6FvegHE5vHBrEilbaRQkVu3ta7thPCr6BUD8kAPa11l5nUKSpdYyFl3nGU?=
 =?us-ascii?Q?zP/JAuNjwxXHl037adbnO5pSxQtak2Dmcb2oaSYKDV6GnQirK5FaKtPdK+ex?=
 =?us-ascii?Q?1O0YHE3D7UjktywydPcyW6EUg6ESdpGRM+chOg1DKui0GlJVDa6vq7xH04lV?=
 =?us-ascii?Q?QVkIMsy+TL1vJC7PJnVoc0Fg7OGUxXvdggecL2n2a2bC2EG8/gfNlGxVGVO0?=
 =?us-ascii?Q?sEAtJKt2pA+DgwDXGwYqF9xL3D9DamO85g8FPXz6RmSuqMfgvg+K2XQ0ImYf?=
 =?us-ascii?Q?RZqmGybFqXNN4b1xIggROSvFYY6YoB61WlEz8dSu02VhKIe5Iq0LHTLbp407?=
 =?us-ascii?Q?VMe7vr7XtDbXFu7Ldc3O8mnjgYjLCq5nXOUfrVqp1qip5Vwp5PXtZxXTrNCR?=
 =?us-ascii?Q?u1AU2AekhErHhOoIudLZqgSmYmSZyfTjCgE+ZGgCYpxusplX37IZL+hUzzQ0?=
 =?us-ascii?Q?uA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c279ef7c-dffa-4da3-9284-08db362f6dbf
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2023 23:42:33.7416 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yrgoEymWDuVxvK7IpmPWI6l9tgDIRRUWfDJQPo0fdgpC+Grs7+2MFdgiyYQaORmKsHiL/vIPkWVAvvwQntDNQFrj3IsScrIUdzjQHMXFeo4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6421
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe: Always write
 GEN12_RCU_MODE.GEN12_RCU_MODE_CCS_ENABLE for CCS engines
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

On Wed, Apr 05, 2023 at 04:34:02PM -0700, Matthew Brost wrote:
> If CCS0 was fused we did not write this register thus CCS engine were
> not enabled resulting in driver load failures.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

I'm not sure why only BIT(0) was being checked specifically.  It looks
like that was added in b9d18a2338c2d1 ("drm/xe: fix compute on
XEHP_SDV"), but there's no explanation there of what it was actually
trying to fix.  XEHPSDV isn't something we care about anymore, but it
might be worth doing a quick test on a DG2_G10 that has CCS0 just to
make sure there isn't some other problem lurking (DG2-G11 will always
have CCS0 fused off).


Matt

> ---
>  drivers/gpu/drm/xe/xe_hw_engine.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index 63a4efd5edcc..4b56c35b988d 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -253,7 +253,7 @@ void xe_hw_engine_enable_ring(struct xe_hw_engine *hwe)
>  	u32 ccs_mask =
>  		xe_hw_engine_mask_per_class(hwe->gt, XE_ENGINE_CLASS_COMPUTE);
>  
> -	if (hwe->class == XE_ENGINE_CLASS_COMPUTE && ccs_mask & BIT(0))
> +	if (hwe->class == XE_ENGINE_CLASS_COMPUTE && ccs_mask)
>  		xe_mmio_write32(hwe->gt, GEN12_RCU_MODE.reg,
>  				_MASKED_BIT_ENABLE(GEN12_RCU_MODE_CCS_ENABLE));
>  
> -- 
> 2.34.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
