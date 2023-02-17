Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B843C05027
	for <intel-xe@archiver.kernel.org>; Fri, 17 Feb 2023 23:06:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB9D510E070;
	Fri, 17 Feb 2023 23:06:07 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3557210E070
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Feb 2023 23:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676675166; x=1708211166;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=WxPraTEHreI3oAnpdLXz6qyfhE208GtVW6djlYkmWrM=;
 b=HuRk2rU+tRTn/m1dLCkXyZ8ROvVL6HeyS76jwYdkTISmdaRPu/QJDcIk
 FXgb/ZBDQupmQdi60oQvSIMtQ/obdz3P/JTB81bsbNKahmsQNJ4nz5Wjt
 SMJGLQ6bIaJwL8it0Fcj6asO8Sxvh4drZBCj6JcSQnEA6byUvVxCgSC7r
 rE39zS7xieUzC1ZvnHccxgY6gTIkSzWwuS9fKMv4XPJ3ByOsY1ZZxWtDf
 tZGPU2Je1n+rRa0VsQeU1VfOotbKaGAwCIVBV62b8qk4aM1GxmG7oY0NF
 0Sp1bmmUpGsMRCUDYvWHe5yiRBD825CScQciz4xWVeLNcj8JPoWtZuDlZ A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="330774618"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; d="scan'208";a="330774618"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2023 15:06:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="701078561"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; d="scan'208";a="701078561"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga008.jf.intel.com with ESMTP; 17 Feb 2023 15:06:05 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 17 Feb 2023 15:06:04 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 17 Feb 2023 15:06:04 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 17 Feb 2023 15:06:04 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.175)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 17 Feb 2023 15:05:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Leh/NQh/+/DuZVD78LoN3eHFksAMKqQLVHnRrIIlC9Wu77PfX4eoENyN2fmhNzjqbgUIufe4ubJ6ygAOPejwJ+Q5fhxd1Q+Z5xkiQtYZgTs8i+LOKipyoSfNLfuIshCOB3I668QKFtjTuNSXpr4lvYY6ZcXoOTu3HcFBisLqajNtXXF7KwFQRjx32kGt/nVxuDraGUzMXxXJDVUXmcTvzte99xWN0kiLcn3pRJsf4WDx+2jY74vNUtuLuMWvVBsd5ySTCRWbkFM/Awq8Td00KimcGYcxiQeprk5M6ycWWZKtQNqMlRp9eLFA/VpN7b+3gh3fc6GoUKxGUg3UrUIHeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lymT9yroTH/ep3oh6eNuG/9eCMZcNyQcbUPkmpZGDco=;
 b=D7Q42Ur/eUhEkdNxf+2gQbjuNZhEEiro/ES1GWWvJK12FyOddRoFhgID3IYAIe3W0hFv8Bhj7bWPWyb2VNTU9sqFC7hiU0lli7zg7XF3siFE5ISDnVDxSpyxozXRQxFMfgC12Bv1roQUZ/2dPFQXHP6+/ei8uhqT8zHpzmn32mwEBemvSZU4S+tLh+Rfty0i+DkmUq0M4JS6Q5PVZVxR5tWsMUssymxl6Vo5oDc9giBuxlgVBqL8OdgiPINKw/nsAKGxs6QObrERru6YwLQSJxM1S48AHuOn6f68rRzNXvJD6OdJjY+UWL3Y0aMwokO/NgBbayPVvqAlEDTSAZVhXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 BL3PR11MB6362.namprd11.prod.outlook.com (2603:10b6:208:3b5::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6111.13; Fri, 17 Feb 2023 23:05:55 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::7333:f4b:7dbb:36b]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::7333:f4b:7dbb:36b%6]) with mapi id 15.20.6111.013; Fri, 17 Feb 2023
 23:05:55 +0000
Date: Fri, 17 Feb 2023 15:05:51 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <Y/AIT28XitHnbNzW@mdroper-desk1.amr.corp.intel.com>
References: <20230217171535.65749-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230217171535.65749-1-rodrigo.vivi@intel.com>
X-ClientProxiedBy: BYAPR05CA0009.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::22) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|BL3PR11MB6362:EE_
X-MS-Office365-Filtering-Correlation-Id: d789f062-46a2-485e-09c9-08db113b8588
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hflTfRdpYQDOyLhfQC0wBagBX+AxtkkYY5eyzs+a6x6I5tskIYfim1mZU2T7mKLBIJlDjbACWQG5s6NheBPXsswHZFl5nC7eLrKxNUVw+KfQcSF33aQVsFYAGMheRwBG+q46peDz9ausO8WMOAXABK3oQQdN6JC6TlkAwaxGOscLT3QYX75NjRUIsdSOk9+5S4r3sfM4eT0luN42oNfV+1M+LcF+pcOlGnyEnlp22D6Kh8+1CLKNn25lr5LazK1QLQozBVL/I/pqYlhB3pzvwwEeCT9/RFV3eO7jcU67NswmvJMRcAIi/SG52fhu/OepadM//4XKELd+xJqDnscm/3X5zLkzyGwAlBn3ywLt5T1HeEx9u76y5c4JzF4BlZ6SI87ob2Xu/Ul/Wr7IJ6f3kYbBX5r4rwLegZRjC2/IW35nKBLdlEBuRHRLFpudijMpJR+rZa9XwTuM4xIQIzVptEuAeCej7BGeVnbTbKOgqOqvCwadsBqg7OzCvUyJkAMjBVBeuyz6wC2s71v4jcObzXmg+BtjAVI47kHQDcDuztfPeImyjtr973zuIFSrKf0E/mkICPspNQZ4oXHh3E+8Qd8kvUHQsWZ1Ay820Iy9nohMRh55bV/Kxkzquys+re5zbaZxCsSqWYjh74xnXgDWMw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(366004)(39850400004)(136003)(346002)(376002)(451199018)(86362001)(2906002)(41300700001)(8676002)(4326008)(38100700002)(6862004)(8936002)(5660300002)(82960400001)(66476007)(66556008)(66946007)(316002)(6636002)(83380400001)(6666004)(6486002)(186003)(478600001)(6506007)(6512007)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?u7zDt3jSpwhHyRnAPhfY1HsiGzl7D0k14HEk50VlJPErlNWo4vuQVPwFndne?=
 =?us-ascii?Q?4QxX2loS3OZvamNjegcm04n9n925LPmqQCNJJMERj23hd0yEkNUkqUe8wVBV?=
 =?us-ascii?Q?nLJMPhOMLR0c6xBWsSgrIxzcsSHgE2gGwNQG1CTTQkIzzBfIm/Xwj8yx68G+?=
 =?us-ascii?Q?JuJ2L+rfbUg/i3gUxTI4H3XVBxeuJuL12jN/Mn8Rdyt0M2KdERg4/2VIVkJQ?=
 =?us-ascii?Q?9nLBessQnMoOD+eLzem5z2TFicsOYR+NRh+ZRqniBHv0YBF81S7Dhi9+TTX2?=
 =?us-ascii?Q?bU0fwlxVW61v+JzZy3bRw6gZB2KBzPh89L6yD72QXAVjxT0TkvORGReUcjXi?=
 =?us-ascii?Q?aLr8on4KzFBP4grPNeDywKGhUMciwRNHfCKPrw0HQbATrRcgb+BiYbcrEgKi?=
 =?us-ascii?Q?9pyxbipgV/WA+tKpeqj1Y9FMMUnQwXFRHNM9gFnbxNLUBYK4aLnaEGiXFo6T?=
 =?us-ascii?Q?qEtOXDMkbwEqUHDZlF6Ourw5VbjiyGTpiwOigQK+zQV+mipkfbDWMGuQorcM?=
 =?us-ascii?Q?x+LriniyRq9cOn26JNba+nXyXAW2rGevWlmSjjR2p7w44KF7pC32bcxSUAgo?=
 =?us-ascii?Q?awMudDKy2FaCtVEab9C5qcNM7DAO1w5DEZNd6hYboIYxdKo3IAF5WjDH/UBS?=
 =?us-ascii?Q?d7yrofYaY5DKa2pJM6wvecwNx6dMahE21cgzXvpF1r8r2PTLdAri82Sm1ebE?=
 =?us-ascii?Q?ktOncenQLG2tKRgiPqIquIbKVqzEXPctNjB+T/xFPwwuKAEo66rGfkXQ5+6a?=
 =?us-ascii?Q?x47RzXaNSVPVZzk1Xq3T+SdYsZ9UYerbGutlr2UqLblzysL9Nr1mInK2TO8g?=
 =?us-ascii?Q?NvlTXyfBh/AMaccVVv9yLYcrWCrefSnTLECADdK4KGMoPpKM/q5auOHnZVmf?=
 =?us-ascii?Q?dZezAlW1CCDppF2FM+7CeTfcgJiGHQFPcN997m+ji2onrJpUpkr3q0UjHI+v?=
 =?us-ascii?Q?RL/CosDqxibOVGkVkaXgtvkzYrReHeAOoaoNGdbDAuOOj0qsbh8/LD1KiBRU?=
 =?us-ascii?Q?7B7noVIWqUKnrhQL3bYocZ93KFd0hentcwxb3DPuuZhn5oecknz4R5LoJF9Z?=
 =?us-ascii?Q?3bkJN6dDDanmvxP97ZKVj/bPlpvRT85Av7XM1xBVvLEw8NiriqsB0dSyxAQU?=
 =?us-ascii?Q?y2H1pMeb5+UjemouvJ9A5RdA8MaW6fMRYo6U2sSFJxLipz5MAtrYQ0drPfkP?=
 =?us-ascii?Q?q+tLWiiAJjzxD7S+D6s3RPeSwpXivZQRslCahCE5lj/dZSSUXHrQx1ZXAgu+?=
 =?us-ascii?Q?kOzUI5o/oMVDTuh5NKCVUqpdVVgKD+EZN2hh63+F1iQtdd0mc+AI7d+puC1A?=
 =?us-ascii?Q?PuAlk5+qx2saQpB1A/OtBK6mU2GhfmpCBtRzj170gg6XAx8W8R2HwTsHxCXl?=
 =?us-ascii?Q?VOoksldhNRv8A06RERenZ0TiFbvuZmLOduFchzu1/4xZzoW/aizKbQlLKhcr?=
 =?us-ascii?Q?9uEBQjC5gtkru8TwXqTgsXphmfP3svA99Cs/uKKjCWQdA1sJ0wtBUazl3FkQ?=
 =?us-ascii?Q?sX83YLYYqMLb4HhWXsRK/6Qf/i4mOVJ9JCvf1/M/yqJI2rZQ3/BO76kenXFt?=
 =?us-ascii?Q?c/ZttHdbUay9dTeOiWkmeQfFhcsDfpCZKKinUcVQ+Uw8I18u66ppAr72+nX5?=
 =?us-ascii?Q?dQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d789f062-46a2-485e-09c9-08db113b8588
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2023 23:05:54.5803 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9xqxRb8StPgt4W1uZOR46288R3lUHFD2IlAJwZSsoLTsH/OAhgxuyFXQzumK717EdR7taxQw5+ttzm4Nl9hO5TvOy4pM61X0ByebvhoSy/U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6362
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Remove unseless xe_force_wake_prune.
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

On Fri, Feb 17, 2023 at 12:15:35PM -0500, Rodrigo Vivi wrote:
> (!(gt->info.engine_mask & BIT(i))) cases are already
> handled in the init function. And these masks are not
> modified between the init and the prune.

Yep, on i915 we needed to prune the domains because the sequence was:
 - Setup all possible forcewake domains
 - Read hardware fusing
 - Prune the domains for fused-off units

Whereas Xe has:

 - Setup forcewake for GT domain only
 - Read hardware fusing
 - Setup forcewake for various engine domains (taking fusing into
   account).

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> 
> Suggested-by: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_force_wake.c | 15 ---------------
>  drivers/gpu/drm/xe/xe_force_wake.h |  2 --
>  drivers/gpu/drm/xe/xe_gt.c         |  2 --
>  3 files changed, 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
> index d2080e6fbe10..5bd87118ac73 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake.c
> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
> @@ -100,21 +100,6 @@ void xe_force_wake_init_engines(struct xe_gt *gt, struct xe_force_wake *fw)
>  	}
>  }
>  
> -void xe_force_wake_prune(struct xe_gt *gt, struct xe_force_wake *fw)
> -{
> -	int i, j;
> -
> -	/* Call after fuses have been read, prune domains that are fused off */
> -
> -	for (i = XE_HW_ENGINE_VCS0, j = 0; i <= XE_HW_ENGINE_VCS7; ++i, ++j)
> -		if (!(gt->info.engine_mask & BIT(i)))
> -			fw->domains[XE_FW_DOMAIN_ID_MEDIA_VDBOX0 + j].reg_ctl = 0;
> -
> -	for (i = XE_HW_ENGINE_VECS0, j =0; i <= XE_HW_ENGINE_VECS3; ++i, ++j)
> -		if (!(gt->info.engine_mask & BIT(i)))
> -			fw->domains[XE_FW_DOMAIN_ID_MEDIA_VEBOX0 + j].reg_ctl = 0;
> -}
> -
>  static void domain_wake(struct xe_gt *gt, struct xe_force_wake_domain *domain)
>  {
>  	xe_mmio_write32(gt, domain->reg_ctl, domain->mask | domain->val);
> diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
> index 5adb8daa3b71..7c534cdd5fe9 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake.h
> +++ b/drivers/gpu/drm/xe/xe_force_wake.h
> @@ -15,8 +15,6 @@ void xe_force_wake_init_gt(struct xe_gt *gt,
>  			   struct xe_force_wake *fw);
>  void xe_force_wake_init_engines(struct xe_gt *gt,
>  				struct xe_force_wake *fw);
> -void xe_force_wake_prune(struct  xe_gt *gt,
> -			 struct xe_force_wake *fw);
>  int xe_force_wake_get(struct xe_force_wake *fw,
>  		      enum xe_force_wake_domains domains);
>  int xe_force_wake_put(struct xe_force_wake *fw,
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 20dbc08d3685..c17279653561 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -602,8 +602,6 @@ int xe_gt_init(struct xe_gt *gt)
>  	if (err)
>  		return err;
>  
> -	xe_force_wake_prune(gt, gt_to_fw(gt));
> -
>  	err = drmm_add_action_or_reset(&gt_to_xe(gt)->drm, gt_fini, gt);
>  	if (err)
>  		return err;
> -- 
> 2.39.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
