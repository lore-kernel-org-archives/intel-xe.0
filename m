Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45282EB64DA
	for <intel-xe@archiver.kernel.org>; Wed, 12 Jul 2023 04:28:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1ABE10E48C;
	Wed, 12 Jul 2023 04:28:21 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E70A10E48C
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Jul 2023 04:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689136099; x=1720672099;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=xbkQREhVpz5EIBNZyocOMRmaoPjYkjoi0IbW3FUZdXo=;
 b=Yp8Gnphb4mSi/5L8046wAvQ49Z1BbiFIZ2/lns5zTiYoPLuFBdVSB750
 drCZNZ8wpqmwAOasN9OB9BkoIhpOvdliNOnTOxCjsGejyaZuY+cOAWAb3
 MDGbTWThgJhKEOdNcwazVLhY8YtHcBXr0pmR7cFoOfWaHlzNlHWG/lW9i
 XW55gJ0c1qv5wvGhshisqzUPKV3OMV/iZ+b9JmJ8ZyF4LRC1vXYDA31H7
 wXEvkNcLn42WIxl59tiMioVlRddPVW2SWfIBgqzHJeKhKI+ycM8YBoMZx
 XYi5WhXnHLKnjDOX5d05D2H2ILKVjx/fFfYs3C8JFyXN3nU8ikUTOJHeG w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="362263534"
X-IronPort-AV: E=Sophos;i="6.01,198,1684825200"; d="scan'208";a="362263534"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2023 21:28:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="724725438"
X-IronPort-AV: E=Sophos;i="6.01,198,1684825200"; d="scan'208";a="724725438"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga007.fm.intel.com with ESMTP; 11 Jul 2023 21:28:17 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 11 Jul 2023 21:28:17 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 11 Jul 2023 21:28:17 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.42) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 11 Jul 2023 21:28:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bl1+q/L8eguNhcatBN1m1HbEveYJJy5e68y+8RksIN0UNOQN4CnpWDyVHIvDui2B83MtAM3jwTuNnmcyVEfIrpzhruLszFEGizYVVwy2RvFvKI/Y1eyKLVg9FYBEewRPvoIhEB9JHMfyEph4Hx9jCcm6Tp92bMRM/p0ubcOLCVTPPhTX5O368MjnYx17z1YjuM/mp+ESckkHoZU1njg0Zeh8/uvoIFrDVxFsVplE2dgqJQQ8enpdJnyLHhGPE0m9A/2yjQmx5oTSFOdW/6SyBRcBGYcnyGGE/GectFIcdhIurTeKjE3+bbmejL7WIFbRBjx1oqSPuzvhzIPkyqIptA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HO599ZRzTUWe73ZqBsMFMHd7ExzVs3zBxfxwp95+ujo=;
 b=KsWeEre+K9MgLjxhwmtDsTimosQYPZ+JGwRg+771qDiYsYeCyk6SgnhJxVm6vNqL0RsCSaxk4Lb7ku5HbeAsQFF3AdgpYbSz/4NlxOjN/eQeHN5IE4GdXzJDu560mxYSkxEKGIMjTcTiWwYft6gwCOslk3okQHCxJXGVLpAxOvYEF6ipcb437NQHck5q0ln8OJSBAnEDP6W0ZA+WDAkKz58Bmkgt3C/v/FveoS536CrhkKvy8058DBFXR+YGu5EAe+rI7jqVhabtV83ENVLuFapM46rXj7zZk/sZYSCtdO5iqmSjt8ZfFGp7MJR0gP65ltSjNm6HhZ7Vv3N8mxF6zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN6PR11MB8217.namprd11.prod.outlook.com (2603:10b6:208:47d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.26; Wed, 12 Jul
 2023 04:28:14 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::c65d:c846:f197:3ca5]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::c65d:c846:f197:3ca5%4]) with mapi id 15.20.6565.028; Wed, 12 Jul 2023
 04:28:14 +0000
Date: Wed, 12 Jul 2023 04:27:32 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Message-ID: <ZK4rtGVK9+HOyFfl@DUT025-TGLU.fm.intel.com>
References: <20230710214459.14708-1-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230710214459.14708-1-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: BYAPR03CA0001.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::14) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN6PR11MB8217:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d74882f-edaf-4950-52d9-08db829067e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gAk/fUhJ2z4mbXdgKWW5z/U/vLIRvB21UXa3w0n++51sWaMd5i4Bm+7LESvhNJmKeyuh1JkRuoCPMxXUeOMwZE5AXskpx99ORwHQCfsal7Ug66505+J1L4h1KqhZARCaDRm5u2LK5dLcBgIN2fev0NIg/8H1t6ei8qZ6X1VJ/TcznW5UQP3cV/WhyA/zCyQ+sRvlpvUsHZwzG/S+/NFDPAZIEyawB3kfWKhQ3rAQjy0nII27j6HIDxbAVEeEw1M2ZuW062qc5Bw4ZT1l9thGnaE0Whx4Blz8/MMZNdmKKKT1XoW13YF0R+kJfGrCej7R7cgghFe0pA9Qk8VZP/xPEq4t6p8QYggq5/pETv5iqZmD+40XH0ACcsHwXaAiyZK7Fr9iq8HpwBKwk248tHv6BSZfMUoViw0N6+nqlZk+2BJKHOT7/74Ug2vVYgJkYluxnTM4o8xp+1SzULy0QF2enBNOzj8oQuK0aGR0CCkvLO3Q4ce0FW8dYDhl1EMW/iynTxQs2nZ1xUJckCQj62lCBzmmollgjbF6pfvtU+xCYm36gGzsN/LJ+S7UHYQt8pH8dQMw6UILUvtYeowvMNTpv/qgaGlIPn3mfWMITUTchJQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(396003)(39860400002)(366004)(346002)(376002)(451199021)(86362001)(38100700002)(478600001)(66946007)(6666004)(82960400001)(6486002)(26005)(186003)(6512007)(316002)(2906002)(8936002)(6636002)(66556008)(5660300002)(66476007)(8676002)(44832011)(6862004)(6506007)(41300700001)(83380400001)(4326008)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6RcnmUeOJJZzqtaCGGsqcGtQQzSOQB3k1k/sSfZ6eZZg8aqO6YrKXtVnkXs8?=
 =?us-ascii?Q?644t/LW6gTILVlNPxOwx5scgV4Sva/1F8kV5PXueKUehJ1Lj9V6uP5OH9xLL?=
 =?us-ascii?Q?kyUB8Hh7PrnApdjENWAOgPYWPSN6bG7VcaCoBPZcRFFVRIzJlTVVZ7aM8WMa?=
 =?us-ascii?Q?1+g45yIp3wjLxkXWc/Nw9c4UNsM3wiFMgSaZQPZp14/mvDX1YhY9yiHThrd9?=
 =?us-ascii?Q?xal6zEJnmnJjHwbLwR7gYr/BRV3NuOgsLkH86YsR10cY3Fd2EMYEedUK8RoN?=
 =?us-ascii?Q?fFfxF3+Jg9a7tY9SD4I0mVMn919ZsDlUjWuuDkYEbtld7v49TMVjqqVcc4Eo?=
 =?us-ascii?Q?d0A4FiTwdZNk17h2LmvZSo9DTexipwbMbTQX78g+ziGNZCfSTnqwb5pvZv/Z?=
 =?us-ascii?Q?Ua7jNh4fGIKRaeGioWzM6hdHI/T6s3l5MtNPzFaDye7/EsTj3xr5aUhpB4aK?=
 =?us-ascii?Q?DtCgzauGReOAMEaDwfR8SkDDMdXAI0Z8AIeOV4kF/OPB1kWZQIeD3wLrSZC2?=
 =?us-ascii?Q?esmxu+QO3Iuoz97XJn53r7gv4dEuZDhwtpgFuowjpGEwuWOD8NLPBSzpUwnO?=
 =?us-ascii?Q?ph1XzP2aplogbhQrotcqTOlaD7yf+y/kmqnaIdxWdhcMBHQ9zzKqSWnHqqUA?=
 =?us-ascii?Q?KJncdqkMg/cSQGwCycs/kadi5jImUkl7ga33hNJt4SHmxtGk5DYWBXFzVS9T?=
 =?us-ascii?Q?M++iq3RG3goB3ZuZDYFzz0GScjI2pjvqwAHLCinZpYb+f7l3B1Uyn3+Dp/0r?=
 =?us-ascii?Q?utf0I7wQlpg4vJD1/xhSogAz3a76DmkociUdfMgTK0ghopIGLJWIFJSQIfdY?=
 =?us-ascii?Q?IxNp5TSBzp1yZB7AQD7U9wFsbMoHiu2f/dEjH6UCHICGJhPCp8/a+6RxBwA5?=
 =?us-ascii?Q?kQbKrIn8jseZVFmRvUb9fZoLCEBHwiyMNgeQ4evzKEXacH+ZdpUFYUE198ee?=
 =?us-ascii?Q?Qhtc/QueomsPHXZ5fHlNT9WNLsUCcCf0Z2mKfRABVTbKoEUYnBHSef1t8yGE?=
 =?us-ascii?Q?0lNvPurE55F5EmCfCFNOID+8dhj4PsUCsSJ6A+CNxSzUyqrKeSmtRaIKGxPp?=
 =?us-ascii?Q?BqyNCzJkr/i9q8hTXHIiq+RCOa3cwxBRqih/v1cdWCO3r5S7zGLxo0htZYYR?=
 =?us-ascii?Q?eTw5Qk/D3DQytQlJKFh848RmOdyv7HbnSNwRppdbWvqES83dE8rTbXMOpSxl?=
 =?us-ascii?Q?w8PhXhbGCvg3kAi+nHbBod8fJdr4bNuzRjC67Z7KrYyrGZP+vtBv6KGwEA4F?=
 =?us-ascii?Q?rBfZfaB00SeIfpSJVeKhqyn6wWAu/KJOaZ3/4Xp/AZE0CRAz/gvCX47PEf8v?=
 =?us-ascii?Q?wElFFYEKVpVn23tU1kJuk8r/qLkfEtClkP8/d1Etkn2ui8QaNmp1RUtCZsJc?=
 =?us-ascii?Q?ejFVyMuV60GYV6TNQp4HAvllmG2yiJE5rllNY08BeIBsktFrGQq66wL37EdS?=
 =?us-ascii?Q?X2tFRCbcPOgMF+4p4LxoY5hiOmF+71L+WTrrVmZNP8QYLqVvzFwPM4ZZvsKu?=
 =?us-ascii?Q?EpP+RyYz7wksWPzyNBiSZhQD/96cv9w4s7reQbw4pAIgLsdBUPJba6ZXwBHi?=
 =?us-ascii?Q?f4rRZjWK/NtMaqSs15tuxbwfAaO96SRWVaW0HFQmuWF3eJIKt4H8NJcCcunA?=
 =?us-ascii?Q?mw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d74882f-edaf-4950-52d9-08db829067e5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2023 04:28:13.4938 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fvSQ3vWzLH0rqvX5gKsMLpMeNSKpSkk39bG3SdkMG573Ca4ibHzhrvDr/krW8uVl+PIaiSWoz+J98F6ezhEPiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8217
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/pvc: Disable FPU Residue
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

On Mon, Jul 10, 2023 at 02:44:59PM -0700, Niranjana Vishwanathapura wrote:
> To reduce the power consumption disable FPU residue on some specific
> devices if total EUs are 1024.
> 
> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h |  1 +
>  drivers/gpu/drm/xe/xe_gt_topology.c  |  3 ---
>  drivers/gpu/drm/xe/xe_gt_types.h     |  3 +++
>  drivers/gpu/drm/xe/xe_wa.c           | 34 ++++++++++++++++++++++++++++
>  4 files changed, 38 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index d654f3311351..16405b16fddf 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -316,6 +316,7 @@
>  #define   DIS_FIX_EOT1_FLUSH			REG_BIT(9)
>  
>  #define ROW_CHICKEN				XE_REG_MCR(0xe4f0, XE_REG_OPTION_MASKED)
> +#define   FPU_RESIDUE_DISABLE			REG_BIT(14)
>  #define   UGM_BACKUP_MODE			REG_BIT(13)
>  #define   MDQ_ARBITRATION_MODE			REG_BIT(12)
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
> index d4bbd0a835c2..a2da443160ab 100644
> --- a/drivers/gpu/drm/xe/xe_gt_topology.c
> +++ b/drivers/gpu/drm/xe/xe_gt_topology.c
> @@ -11,9 +11,6 @@
>  #include "xe_gt.h"
>  #include "xe_mmio.h"
>  
> -#define XE_MAX_DSS_FUSE_BITS (32 * XE_MAX_DSS_FUSE_REGS)
> -#define XE_MAX_EU_FUSE_BITS (32 * XE_MAX_EU_FUSE_REGS)
> -
>  static void
>  load_dss_mask(struct xe_gt *gt, xe_dss_mask_t mask, int numregs, ...)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index 7d4de019f9a5..e4b894bd28bc 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -25,7 +25,10 @@ enum xe_gt_type {
>  };
>  
>  #define XE_MAX_DSS_FUSE_REGS	2
> +#define XE_MAX_DSS_FUSE_BITS (32 * XE_MAX_DSS_FUSE_REGS)
> +
>  #define XE_MAX_EU_FUSE_REGS	1
> +#define XE_MAX_EU_FUSE_BITS (32 * XE_MAX_EU_FUSE_REGS)
>  
>  typedef unsigned long xe_dss_mask_t[BITS_TO_LONGS(32 * XE_MAX_DSS_FUSE_REGS)];
>  typedef unsigned long xe_eu_mask_t[BITS_TO_LONGS(32 * XE_MAX_EU_FUSE_REGS)];
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 5eaa9bed9d12..2852eaef6043 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -13,6 +13,7 @@
>  #include "regs/xe_engine_regs.h"
>  #include "regs/xe_gt_regs.h"
>  #include "regs/xe_regs.h"
> +#include "xe_device.h"
>  #include "xe_device_types.h"
>  #include "xe_force_wake.h"
>  #include "xe_gt.h"
> @@ -256,6 +257,29 @@ static const struct xe_rtp_entry_sr gt_was[] = {
>  	{}
>  };
>  
> +static bool xe_wa_match_fpu_disable(const struct xe_gt *gt,
> +				    const struct xe_hw_engine *hwe)
> +{
> +	struct xe_device *xe = gt_to_xe(hwe->gt);

s/hwe->gt/gt

> +	struct xe_gt *gti;

Not needed, just use gt. 

> +	u16 eu_count = 0;
> +	u8 gt_id;
> +
> +	if (xe->info.devid != 0x0bd6)

Is there a define for 0x0bd6 or another way to test for this?

Matt

> +		return false;
> +
> +	for_each_gt(gti, xe, gt_id) {
> +		u16 n_dss = bitmap_weight(gti->fuse_topo.c_dss_mask,
> +					  XE_MAX_DSS_FUSE_BITS);
> +		u16 n_eu = bitmap_weight(gti->fuse_topo.eu_mask_per_dss,
> +					 XE_MAX_EU_FUSE_BITS);
> +
> +		eu_count += n_dss * n_eu;
> +	}
> +
> +	return eu_count == 1024;
> +}
> +
>  static const struct xe_rtp_entry_sr engine_was[] = {
>  	{ XE_RTP_NAME("22010931296, 18011464164, 14010919138"),
>  	  XE_RTP_RULES(GRAPHICS_VERSION(1200), ENGINE_CLASS(RENDER)),
> @@ -518,6 +542,16 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>  		       GRAPHICS_STEP(B0, C0)),
>  	  XE_RTP_ACTIONS(SET(CACHE_MODE_SS, DISABLE_ECC))
>  	},
> +	/*
> +	 * Not a workaournd, but for tuning power.
> +	 * FPU residue disable will lower the power consumption.
> +	 */
> +	{ XE_RTP_NAME("WaFPUResidueDisable"),
> +	  XE_RTP_RULES(PLATFORM(PVC),
> +		       FUNC(xe_rtp_match_first_render_or_compute),
> +		       FUNC(xe_wa_match_fpu_disable)),
> +	  XE_RTP_ACTIONS(SET(ROW_CHICKEN, FPU_RESIDUE_DISABLE)),
> +	},
>  
>  	/* Xe_LPG */
>  	{ XE_RTP_NAME("14017856879"),
> -- 
> 2.21.0.rc0.32.g243a4c7e27
> 
