Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C1B5C77B7D
	for <intel-xe@archiver.kernel.org>; Wed, 17 May 2023 17:55:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CEA510E1FF;
	Wed, 17 May 2023 17:55:14 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0447010E1FF
 for <intel-xe@lists.freedesktop.org>; Wed, 17 May 2023 17:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684346112; x=1715882112;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=M/swN1WLJKsk6EHRcYBkdHO/1hcJCVm3qRa8o7PrQkM=;
 b=VSWPgqn9bBUjNR5Nf6QOsRqHIH8UxOSlrgCdFG1X3yx6us5wmCAr9Jhj
 hdNqjDr0yoPL5LfKdiY8ZwOFkYGnYpnMWFFr4iP/DZ6YXNBoRdx6IX1/8
 cCxsbPoyjX11DXTRwqyogqUBgsLc/468DtLJtuJOP56Jl0NlXQvSl1fRN
 ASqtPw97+9TTYSLYhNBoXPwQUYZp1hmVuQI8IzBkvj7ywFuSLWpoTDO8k
 OiE773vpL3J1uqFY2+fjcXoADa8I3W9HnXp3/fa9bijkM+mCF0kncQMj5
 lgJnts7FeB21SZV8D/iDjXziZMLqFSVncPbNybTFtE8ZAqm7QKqIr+LRg A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="336391453"
X-IronPort-AV: E=Sophos;i="5.99,282,1677571200"; d="scan'208";a="336391453"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2023 10:55:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="791602656"
X-IronPort-AV: E=Sophos;i="5.99,282,1677571200"; d="scan'208";a="791602656"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP; 17 May 2023 10:55:10 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 17 May 2023 10:55:10 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 17 May 2023 10:55:10 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.109)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 17 May 2023 10:55:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m4Ma/08j0mZjC4gvgPbDeWU++DjXY7Y9BZYiaOaqbaZN+VmRNjD36AIRyrCkEt3Py8eMIutO5za94IoMf4bLimMrCIREdPvnxDVGgRzNKoC/FvNGpCrvMqL80VWoEfAvN6rqoxVYbjHUUWiMqjYWDryaSDp4FCkv0FNe5noDVTnfsfL3uOYhxFt3aXAfgTwls2EjL4oAnAdGgztDRRsogHvTefkszhVxeu85i93pXvngoZzOys7TY13Q7E6Ip8M4RS9GvW9qusl0RtlusGa98Hgs0a1/3btZZThlr+1uPYD+KVBMyaw3mJF095KpMCqRkUg84bQE4gkZi2eUttK79w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RW2XdkV/+uC777pSk/kLDfJzIK+uoWvsu6ypvxjEClE=;
 b=DcYv3oZf253GpevVuJNdTzL90Lens+auZeHs4MTQbZ7mYr6LwRTdzqglWj/4QCaS7J2jhBDeQILfr5BhdtcOW2bJbbCDEaKStGrP9K5sl3IdDuI8ZPFr36fO1+aM1SRpOMHqeEUz5XuLs9w6WBHJc6DGJ0s9tGWg7aE8TR/tfXb7/YN/WTjgNzGDYKsgy0TePTVzYzmzoMVt6iYBFqa/YzSXzJrHRdW4lsd9+7BN2/U20TdaZiew9M4tsXTjnPJlZv+F/JKV43kjxldoMBhJaz+/6JIzklYOhAyoEPThDzDSNRIanvgy5o78x8jG9HuLbt9iJI1SPrCjZPGiuia1hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 CY8PR11MB7265.namprd11.prod.outlook.com (2603:10b6:930:98::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6387.30; Wed, 17 May 2023 17:55:08 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396%6]) with mapi id 15.20.6387.030; Wed, 17 May 2023
 17:55:08 +0000
Date: Wed, 17 May 2023 10:55:05 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230517175505.GS10045@mdroper-desk1.amr.corp.intel.com>
References: <20230516221950.3512818-1-lucas.demarchi@intel.com>
 <20230516221950.3512818-7-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230516221950.3512818-7-lucas.demarchi@intel.com>
X-ClientProxiedBy: BYAPR11CA0058.namprd11.prod.outlook.com
 (2603:10b6:a03:80::35) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|CY8PR11MB7265:EE_
X-MS-Office365-Filtering-Correlation-Id: 79912d65-8473-48a4-eeb5-08db56ffda13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZDkgniBKIRpFxk8y+pIA8lNxzTdAJVQIt5ywZ3tSpNw8FklY9PLw4tbfg6l6lgGG/kp3Bz1eu5qFqtMOVx+5OmYp/9tFvFtAYgae6NKRNl8XmEc2Ca7GPMquatJWWYEzrDyRhrSOlRT40NKhCQpqNQvSCZsd3U8cqg2TZpnWq+SBf1uZhc3rIA23ocny+XlvWuEAPsWSZqrevS9m9SZ+M5zgoK5ZTVWC3/xNEo55wk2v7RiqpLrv9dmD9dekwxeNMcnOLmCRrTpvNFcEZlheCBZpaMCPKVj1FPNZ5/eBgNBOWjHJWPGUXsQmep9y6H8dxmVM8NjYT+adhdKNQlqVd1DdOtwerdpvEsFCDvWaHDBxIHlaIVqtB7b1763u2gOcShNwPJ46DKexunN0q8CJf5dS5FlRomCw8k9LwAsbZVuvEphRM8r6sIdl6GICTcMF7OI7c0tEpJ7KGchLcwNBSzl+L6w8R8qdXryk8nswKsXWyrNVWvjHZrQryvo47kasr7blSFwrEptlq3pTY7vB3hmuKUbIgKtwzRfBblR6tatRojJsxFVCJx4YPqDC4ldY
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(136003)(376002)(346002)(39860400002)(396003)(451199021)(66556008)(66946007)(66476007)(82960400001)(41300700001)(4326008)(8676002)(6636002)(33656002)(6666004)(6486002)(1076003)(6506007)(26005)(316002)(38100700002)(6862004)(5660300002)(8936002)(2906002)(6512007)(478600001)(86362001)(186003)(107886003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?swgjRqsrAyHZ+DdY6XbDwkCgK4ItthBZ5M6p7DNbn0DVdLveXrf45SHAjzv1?=
 =?us-ascii?Q?6Nb3IE4oG0F3NSfuzPiXlosN2mYxGyyWAiq1qu5X7qR9nNdu5kTUOVisAMuR?=
 =?us-ascii?Q?IMGIlDjagI3U8PwT3vtk65JasQYfC1n0ezugnCJtrRRKziWM3D1bfWAypRTI?=
 =?us-ascii?Q?kTyVz6Tngzwu9ipWNtH/14sBJSMxDkTV0r2mDH+1+1y+4HQJK9nst78eCCC0?=
 =?us-ascii?Q?1o3e+4dVCPJdF9lDJ6ol0SapUBO3h4SfihqSK5q/ByRK2ngDb04JiUyyDdCd?=
 =?us-ascii?Q?9M3cZhd+0/KFo39tRnQVhU2k5wrugwMfj0GIjhmUDIv2D+XP0trk7VJihKh1?=
 =?us-ascii?Q?gnqlBbKv/2UZu74ZyDObQiX2/pKlG0y2MgBZDNpsV5O0SDvWNn8T1ogUWUoa?=
 =?us-ascii?Q?LG8rHcDvzpo3HsSXSi66kQjA4BX+MGRicRHLTzFENPXIN/ZHJinfwi1JxPPM?=
 =?us-ascii?Q?64LC7TzDGtxHnRWAN3K1bHK48V7WET94HWd+bRDMcQQSgo+s94MySFvX3kzi?=
 =?us-ascii?Q?5YQxIEL+wvEDqHARrcXlkR5nFcuIz5MVdAW4vs+0h99JYSl07mtYmnY9rAsY?=
 =?us-ascii?Q?5BYu7QPvkpL+JXWTr24aTpaA9/OXiOuKPESTUfaWkxT0EstWJTEf+HZiG+U2?=
 =?us-ascii?Q?qyYL3X9YEMCvs+CHvmDIGIYWQLhVst6mOHt20sW60I8xx7zvnOx0gPn+Qqe0?=
 =?us-ascii?Q?8JWb/+PTL5VkGMzCepblhQbADEYmLpusKaORzKOvPZBQ5RzGC2AB5EyULsTv?=
 =?us-ascii?Q?O2WrYZeTRzgIVw6LvBVWgLVGZPztjSoFLNNfowIYDIx2SjJGeJ7lb8Puh+i6?=
 =?us-ascii?Q?KVsnYHUxAIPj8aBDF7LUFdq+9TD2Y1sLRNevhsNTmM4855nUMjjJk2DdQy3J?=
 =?us-ascii?Q?/Km2fC4n0J6TDDS55/5C55ameYAW3Fg/SYfIuba7l6Zo/1jKfBVlfWvF3PpH?=
 =?us-ascii?Q?trllxUeQXRrpW2jZilNJ1DJoh09iNZw0vz10Ls2bYdBL1DDxWzmz85hmLfRN?=
 =?us-ascii?Q?3IMeeOd8A7NSDPVSYVGcXEvLu0wzztlgPCLgs3arWzSIVgTg+TsQqs7+vtJW?=
 =?us-ascii?Q?TWJtBDGzkDRczkQlYsy8sB5e+nW+YUByGp6PILTEufrBUGdwuvHXazceOtQG?=
 =?us-ascii?Q?BTtDb4MmmjmY1TRUMUmI7O0dCWZrOBjyVESK5NOeNDy90GB02U2vGRVLluKe?=
 =?us-ascii?Q?/U4IdwKZ3Ab28JyquOTs8t4yh4xiLjwIOl1pWAxfwbfWGARtv5mxBhG4h4h0?=
 =?us-ascii?Q?tcfADphgTIQZEAmCarIWxphNwIq6uzAM1YooXRnwbIo2cOzsYXHIOQzcqsU6?=
 =?us-ascii?Q?8h/XKVdAoOqKsopyjjR8aA5xFNs30GxPxa+fs+kIcak3LmIX6e9dCCDeQ4/W?=
 =?us-ascii?Q?5JJzGX5StBa8SdT0xW4bq1au1FQqr7V2pCWvEONaJlELcJhqE2mBEdDCLV4O?=
 =?us-ascii?Q?seMfdwp2nPHRHXHOVR/LoABOAUOJbmz5LtZnorHIwgaqzs0VYuU4iJCqLvyj?=
 =?us-ascii?Q?lDbMgElSdcgrh2sny9wDlh0mYepg0B2hpegh4wnmJmyNf6Ydx+8Y4FkuG+bn?=
 =?us-ascii?Q?k7BTh5kmujZpgcb2mbFQfc4V8ufTrYpt72qSFEWn0LIUAbsZhGOYdYabJ7WC?=
 =?us-ascii?Q?7g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 79912d65-8473-48a4-eeb5-08db56ffda13
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2023 17:55:08.0436 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cjlDfSMk84XshPokNaPt61M9+kBW+aXT9VyaHvuEg3zdeM9fRylGx7jv2JP/wDB1qIXjTzZva/c4UL+shj6GdczUOh+FLkalFcJRQr9CLYY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7265
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 6/9] drm/xe/debugfs: Dump active
 workarounds
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, May 16, 2023 at 03:19:47PM -0700, Lucas De Marchi wrote:
> Add a "workarounds" node in debugfs that can dump all the active
> workarounds using the information recorded by rtp infra when those
> workarounds were processed.

As noted on the previous patch, I think it would be better to have this
in a per-GT debugfs so that we can catch cases where we implemented the
workaround properly for the graphics GT but forgot we needed to
implement it for the media GT too, or vice versa.


Matt

> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_debugfs.c | 12 ++++++++++++
>  drivers/gpu/drm/xe/xe_wa.c      | 18 ++++++++++++++++++
>  drivers/gpu/drm/xe/xe_wa.h      |  2 ++
>  3 files changed, 32 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index 7827a785b020..ad1b1ab49e1d 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -13,6 +13,7 @@
>  #include "xe_device.h"
>  #include "xe_gt_debugfs.h"
>  #include "xe_step.h"
> +#include "xe_wa.h"
>  
>  #ifdef CONFIG_DRM_XE_DEBUG
>  #include "xe_bo_evict.h"
> @@ -60,8 +61,19 @@ static int info(struct seq_file *m, void *data)
>  	return 0;
>  }
>  
> +static int workarounds(struct seq_file *m, void *data)
> +{
> +	struct xe_device *xe = node_to_xe(m->private);
> +	struct drm_printer p = drm_seq_file_printer(m);
> +
> +	xe_wa_dump(xe, &p);
> +
> +	return 0;
> +}
> +
>  static const struct drm_info_list debugfs_list[] = {
>  	{"info", info, 0},
> +	{"workarounds", workarounds, 0},
>  };
>  
>  static int forcewake_open(struct inode *inode, struct file *file)
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index fa37b1c0425a..bc2665737836 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -650,3 +650,21 @@ int xe_wa_init(struct xe_device *xe)
>  
>  	return 0;
>  }
> +
> +void xe_wa_dump(struct xe_device *xe, struct drm_printer *p)
> +{
> +	size_t idx;
> +
> +	drm_printf(p, "GT Workarounds\n");
> +	for_each_set_bit(idx, xe->wa_active.gt, ARRAY_SIZE(gt_was))
> +		drm_printf_indent(p, 1, "%s\n", gt_was[idx].name);
> +
> +	drm_printf(p, "\nEngine Workarounds\n");
> +	for_each_set_bit(idx, xe->wa_active.engine, ARRAY_SIZE(engine_was))
> +		drm_printf_indent(p, 1, "%s\n", engine_was[idx].name);
> +
> +	drm_printf(p, "\nLRC Workarounds\n");
> +	for_each_set_bit(idx, xe->wa_active.lrc, ARRAY_SIZE(lrc_was))
> +		drm_printf_indent(p, 1, "%s\n", lrc_was[idx].name);
> +}
> +
> diff --git a/drivers/gpu/drm/xe/xe_wa.h b/drivers/gpu/drm/xe/xe_wa.h
> index 8edad4f92800..32ab34d9237f 100644
> --- a/drivers/gpu/drm/xe/xe_wa.h
> +++ b/drivers/gpu/drm/xe/xe_wa.h
> @@ -6,6 +6,7 @@
>  #ifndef _XE_WA_
>  #define _XE_WA_
>  
> +struct drm_printer;
>  struct xe_device;
>  struct xe_gt;
>  struct xe_hw_engine;
> @@ -16,5 +17,6 @@ void xe_wa_process_engine(struct xe_hw_engine *hwe);
>  void xe_wa_process_lrc(struct xe_hw_engine *hwe);
>  
>  void xe_reg_whitelist_process_engine(struct xe_hw_engine *hwe);
> +void xe_wa_dump(struct xe_device *xe, struct drm_printer *p);
>  
>  #endif
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
