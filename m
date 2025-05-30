Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F217C5B543
	for <intel-xe@archiver.kernel.org>; Fri, 30 May 2025 21:47:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA9DC10E899;
	Fri, 30 May 2025 21:47:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="abCkMJcY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A366E10E899
 for <intel-xe@lists.freedesktop.org>; Fri, 30 May 2025 21:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748641632; x=1780177632;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Wd1kkFwQgiRr6jEe+Vg6IaX0IWwlSAxflPnNy94mR20=;
 b=abCkMJcYgYmbNE7EfX//MVsXV6Yg3WLzLIdvVPOuz3M5SAlyzsujfL4K
 hAMNLWQA2kOF+pZ7TxSGISJxoM/H0HMGrwnXK/Dl46MwGrT5NkwtkmwGG
 +qYlMv5iUvkQCs+KSIIXTfq+m37xD1lSFWM6EhRxASxs7ibr60uS0+geW
 9alP6kM2hOewRKp3ALjNCTzzu7y/PtO54Cw1avZ3fkNFaDYlnIvSsyU2G
 zFcRx8GybIuyxqtYUPimWu/If49eZD/C9KNRF9G/IDuQGyzsD1Cn6bMYR
 GXniYhQgD5GGZPGLDgX3SykE1PVgVgGnvQIF2MQwMNjUZ9epspIis94mC A==;
X-CSE-ConnectionGUID: t1ESiiNWQamEG4+uG9kgxA==
X-CSE-MsgGUID: YLdvR4OaT+uMB+gn4tgwNA==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="50844129"
X-IronPort-AV: E=Sophos;i="6.16,197,1744095600"; d="scan'208";a="50844129"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2025 14:47:12 -0700
X-CSE-ConnectionGUID: jtxOcLEvSAOkIwDqe9yesg==
X-CSE-MsgGUID: hKxmiAesTiek07ic5/O8pQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,197,1744095600"; d="scan'208";a="149022870"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2025 14:47:13 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 30 May 2025 14:47:12 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 30 May 2025 14:47:12 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.40)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Fri, 30 May 2025 14:47:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y+dJYPwIwpOFUJqXulnu9c7YAcnNsYSH4R+bTmR0yYoaxs4H1OI9Smc4oGLWhVWDpsheqcb6ePwOa+HTb1x+53f9O0EvL63gxA+1jJ2igHC9AyhW3kbxPYYxWOLq+d5dQX1WDkTguyZno1KTUV5HKvfJlgI/7R3CLOKjOZl4WAtPEZbwgbFWK0l4TYhpAbW4IL0E5RpLTE+USxAz5jS1H4n7YTnaPUU9mi2zk1XL8Q3ApFvi7phoeb35P3kJRi/peiXPdBfsKPVtsq4G82BYWJcPrgfj+/m+UScXoMFWtMT1whZcs/Zl+oVB6rX81/BK114j9Rail9CbEddL6GRBkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HzRIDaUaT8f2z8tVAhYhlUV8/GosJeR+16o2wZtS7+Q=;
 b=l+zbPOdicI6fnUat1RcaNngLBqNj8Vg0bDb5ge1lgXeCb4S7hPSV+fT8YdwkXU2VGIWAzC9LRbsBCWGxzgxgDbZzwDlnm7rJfWxD/W1gpvn5SF2jAhYgk9HiWbdgIur/pW0ND8IV0xF3NXLy/DVFl1JberokFvOOKnvN2kX10LF2E19reBD4TbCYceuE7sChCoabn673UEX+e3RgPbiQN+L4YaFNHg2LRhX3OfLesyvL5dzHQCgQtNbnWXadwGocimphCAg9FTPyrgSPnnhheSRkwY4GVr8B89jkKr7jGGzPH89xj+YZM92R43ysJDTB0XPO2V+EcwEmd5C6ddbqaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DM4PR11MB7205.namprd11.prod.outlook.com (2603:10b6:8:113::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.29; Fri, 30 May
 2025 21:47:10 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%4]) with mapi id 15.20.8769.029; Fri, 30 May 2025
 21:47:10 +0000
Date: Fri, 30 May 2025 14:47:08 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Use GT-oriented printer to dump topology on init
Message-ID: <20250530214708.GD6239@mdroper-desk1.amr.corp.intel.com>
References: <20250530210524.505-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250530210524.505-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BYAPR02CA0005.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::18) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DM4PR11MB7205:EE_
X-MS-Office365-Filtering-Correlation-Id: e88eb39d-93c7-4c3e-c572-08dd9fc38802
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XW3002SU4DYtSne46h//hHixfrxw/V06KKu+DLIs729PCE7p5kBV6cm9b9e9?=
 =?us-ascii?Q?BeERMLR6xkKJnEoOw34o5Zy01mfLMVDLR7WYmcmF/J2XGSs4qzexwUH+ymaJ?=
 =?us-ascii?Q?Zmz4uirDUAa82/lApFSO7iyLSk3+2oDwEiLnOX+0YZeETOvkZRBo0UjP3gfr?=
 =?us-ascii?Q?kYKSpEOZ3j8jguscM1ysJYWqLo75AUDXZ3GZE57rMzOn3nfJWOhzPr3HbfI8?=
 =?us-ascii?Q?K+MqefR2AytyTSYiDwRehHrB6eMAziC653rxgc/GJcTLX+3bKe8CYynikSRV?=
 =?us-ascii?Q?laPK+LTH8E65xnI3m0CJrI/Y6S6YQ9Y1aAHUoMt7nDSqHSwAFzvFUyfC7tbo?=
 =?us-ascii?Q?lhDVuW/hfm5VNhOhj+mlqlMyV4Re4J09/eKxWXVut2tlL37QH94NwDet35/M?=
 =?us-ascii?Q?NZXU+Nf59XKq1NDmbFnJNzyfEhblBYimXwMJTnU1Ewx4B7WPkAAIVCexQo3a?=
 =?us-ascii?Q?kbWbNq/M+I4oZwe1rv4QzHL61slRb/Ewz445cJvEoRbTj9bjpG0ofDYO2sru?=
 =?us-ascii?Q?dfJHNUXRh+FJs1pbzbOfksCO9gctQ865vtpoxTZY5Q85YzzQlG4/J3GAq/Us?=
 =?us-ascii?Q?hRU8LqLc604BlP9RAMbUKGQkp9vGBRUJa+3WyoxIApyfkTj14R3AsyCzNhXF?=
 =?us-ascii?Q?C5p+q1lsVITMrSBlrUKwcEVmwjueV+lYSWM6IZprulGlq44/E3NuC4HoM9Mf?=
 =?us-ascii?Q?PpMUvoMyoRPmcVMR3MAxP8dcBR7Z2pAkAWun4SGs03NgTh8IwCx4tWrWnRJa?=
 =?us-ascii?Q?Wh0XyE33gmozkhDnL3nC8fusWFzsAjEtKsm2JCknE7QY/JBxGNtIgCtD8teh?=
 =?us-ascii?Q?mFDSaq1Pl44NCKiHkZNJiMrTNDbJ0n0xFJ9wWskThDR8YRbM/CwsKIyz+SKJ?=
 =?us-ascii?Q?G//STESjU9AO4o4LUvGnMX0Z9+qhHin5dkRCJo2j7c2zQc+hVjBv5/ssM/Ay?=
 =?us-ascii?Q?fbVq/6DhFEmVw+Vj45Vu5djMOfYCVoBJrl4BJsM8/44Qkd7UHa3G/bbvGgQB?=
 =?us-ascii?Q?hzXFrGKcT3na8if8jrxgDGWvK6vkjT+ohHrkgtQAV5YolOg9J8CmNlQLJhww?=
 =?us-ascii?Q?zrwbxzANNvE5JdbGccs+NtsNraSyCBpD1qyaUGiRfS7BfMpULmLL2e3Whrai?=
 =?us-ascii?Q?Ea/R3z8cYdfmZWmVFkQW8+5bg5ZT1xkcgZrgkr3s3IaQ4mcBleKMEKZOakfC?=
 =?us-ascii?Q?BBgnDLk9Sv9gR/YHQfn9gIWY0FuGqFRre3sXaox/N9pvny73UyZys+RPP+QT?=
 =?us-ascii?Q?D4D6yziaJka8IGRP4ZqhYNg8e4IJOXMpcNQ+MFKP5s1fsYiInKNiR4yBlnWF?=
 =?us-ascii?Q?SN2ozileZCHStWvf5JMSOXY3hPgoAhnozoqTQuMz9f4KnSweiNtQj6Yxre5t?=
 =?us-ascii?Q?lFb/yqhY3GH2+CVP8sCE8KGBTmTmLbhd0fDZsuzomKRNpYd09gcYDpGlzuzE?=
 =?us-ascii?Q?AdBjyPfSQRo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?grvmnTZ9E6SAE8Px137qLvu+pA1b6pMZmB37NQFksQ1wYoZXpvEfuntSjPGZ?=
 =?us-ascii?Q?a04nu5Q9Hv86YBR07mLHU4HuGwn9ZhfW+saTPr/Nn45+xTtweM6Uxy7avZad?=
 =?us-ascii?Q?1RCYkJeLwTY3kj74zxkcolFxKNK84nux2+C/eD1EMAPJPj/bKa74X8poTTIK?=
 =?us-ascii?Q?Ahmt9aZwjelSEliEVNneZAe0O14a/3OMiO4UYxmdlzBtmjGG3pWoK93h0Yqd?=
 =?us-ascii?Q?91rfWWE2vei/xgCoVx1JiaCSAPJdKoACdFvhO9ZMFqFOY2lSP/L3/Q6p9JVb?=
 =?us-ascii?Q?Ugz+85aUvkDKKy0U9b734nuPnBncjcZ5V3Sj1uq0O0h5TbRcjXmTzl7O88qE?=
 =?us-ascii?Q?YrOTYsu9etjvgwOeZGGulOz894eFnjszaknQ6vt/UoDPkxPfblnhi3/ftTDP?=
 =?us-ascii?Q?kaxad0sBNBCIBUrIPnI0Ij5Ywc6v18PvV4zUkimQFdtKhaSTD4TsRvpbhNtw?=
 =?us-ascii?Q?Pino3jTQ4ib+wnzerj288w/MIo5cMeOsT8kqh15qco/1f39a53gX+3lfVFXU?=
 =?us-ascii?Q?3lVEUf1fLxbJBC7XOB1KtWb9c0mWUvWfKepq/UQ5+k2/33HI6BWrFGtpaI+Q?=
 =?us-ascii?Q?hJenPv0U8/J4tQetCnSjLyL7LNBdQYAqqTxd26yu9v8DCPJJYy7+Ce64tGcC?=
 =?us-ascii?Q?PkLGtDZEbWrLwlYr2qmuSUClHlLmoOBIcYb9bNw1jrSoGKgUyl/LTgQFb0Dj?=
 =?us-ascii?Q?biwLuXZblL+z2o83EHeiG/iKFXf753iJzboKmjNCSdY8+NeeYanil5/I4d0y?=
 =?us-ascii?Q?nUW0EOvkjZ9xs+1Yafv0uRNfpnlaqiGzSAUAsZ6cMeSK573lwS9SkSrePfdZ?=
 =?us-ascii?Q?RavtV1rO3KjqvWE5Myg5w6+lOha4PiUaLAXac2OSUT1Z4Utsqa8Pr4RWLFCd?=
 =?us-ascii?Q?YfIWjeuRZ9WBxpj5INnjHcpzfnd2Lwpj0aR30+7AZrP4i/ovkR3WvMh2Ljfi?=
 =?us-ascii?Q?MN8uftQ8ByJdHEa0FbXvOPiLhrXHwFTfxAhOjQi7pYVtIVTLY+ZB+yKuvMzu?=
 =?us-ascii?Q?IRrry+KRYa4qttAQNTRSMFM3Itp4/wotlTGwgsu7dLDd9BER2lAxnhX+lZ6U?=
 =?us-ascii?Q?6xQbjwQsZfXQW/p+2E6NdqqhvjaUGpfgq+L9Mpo+6JcVV3XvYTUFDW9GcdLO?=
 =?us-ascii?Q?2DkOfTNwEPUWhfPWiiVZGz51V0n1V/IZTHtf9itOKp/Ycd++bDEMOpg6fSM1?=
 =?us-ascii?Q?1smglRBUo9tGegJNN2vVgs4G7ZZcTz+0IZX/1lLh2RdnJhQfrSuqaguup8eM?=
 =?us-ascii?Q?a+kpRBZrChZRnyCLEDXw5F2506J9xX5pG1LUwrlIS85IDBByqPl5tni0iScs?=
 =?us-ascii?Q?IW15FgreTG5eeaJGyFJYk+qPYlLa6h5vW9PH2I30SDdXdwg0gjqCx2QAR4L1?=
 =?us-ascii?Q?33NqTJNVUJ7sh8pYFrpOrcE4qLx8orB4ndnyznMkfXKNXUTawiFxjGAgKa8E?=
 =?us-ascii?Q?SgmSaEwQ0SwJ9FaFF+PtAe2iNr71Hs1dxNTzE+6OaMM9Gp6lOiqjheNszn6r?=
 =?us-ascii?Q?5s9ZJ1vQW8eOCv/uVxqELeAzZ4D/t9SC8Qsw2S/9zD35qCAZYZM6GeNZyeLg?=
 =?us-ascii?Q?ttWeIdyDO6BFIgxqYTzEblC8sfRHgNgX/WVxApMI4t636K7WZ5/ijaZNjmsR?=
 =?us-ascii?Q?jQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e88eb39d-93c7-4c3e-c572-08dd9fc38802
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 21:47:10.6897 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hbmxz2RXP8pRvaoAIxyeW4mCTUtuEOPQn12tJSIzlfiodj7XeVjQygAm2DDBhmR8w99wYadqohRUJhlECcdX0D1NrVyLz+CyxuNs7Ts0Ai8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7205
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

On Fri, May 30, 2025 at 11:05:24PM +0200, Michal Wajdeczko wrote:
> During the probe we dump the discovered GT topology, but instead
> of a generic printer we can use our own GT-oriented printer which
> contains information about the source GT.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt_topology.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
> index 516c81e3b8dd..acec6559e2f2 100644
> --- a/drivers/gpu/drm/xe/xe_gt_topology.c
> +++ b/drivers/gpu/drm/xe/xe_gt_topology.c
> @@ -12,6 +12,7 @@
>  #include "regs/xe_gt_regs.h"
>  #include "xe_assert.h"
>  #include "xe_gt.h"
> +#include "xe_gt_printk.h"
>  #include "xe_mmio.h"
>  #include "xe_wa.h"
>  
> @@ -243,8 +244,7 @@ xe_gt_topology_init(struct xe_gt *gt)
>  	load_eu_mask(gt, gt->fuse_topo.eu_mask_per_dss, &gt->fuse_topo.eu_type);
>  	load_l3_bank_mask(gt, gt->fuse_topo.l3_bank_mask);
>  
> -	p = drm_dbg_printer(&gt_to_xe(gt)->drm, DRM_UT_DRIVER, "GT topology");
> -
> +	p = xe_gt_dbg_printer(gt);
>  	xe_gt_topology_dump(gt, &p);
>  }
>  
> -- 
> 2.47.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
