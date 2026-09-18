Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F20EC982D8
	for <intel-xe@archiver.kernel.org>; Fri, 18 Sep 2026 21:04:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C85810E188;
	Fri, 18 Sep 2026 21:04:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DmAf/p7/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46A7410E188
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Sep 2026 21:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789765478; x=1821301478;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=bM8d8l2OjjkR0ODYPu4y7vtBiR2tGnaoqHkoc4enWoE=;
 b=DmAf/p7/6Web+sMJN8C1d50DuelEuDZDpoQtDPNayKGyPrb2j24U5Y5Q
 hBQr1WmYqyVpk+StGnOLd8Zlf8n7DX5uxbV7GnHNY1fx/+qVxXX1/FDxJ
 NDwYMOQCDTpXAc3FOM1fo713W2VheDIxr8CMasbxsh1Q/m0CsdwUsEL3D
 Hzj7U4TJDsegmaCcGaLN/TO+nqJ/qKYP0lgNpbToglyNyOrMgEe7Setn4
 Swdi1oMT01CAgUOPSbVwZmplPsJ6r40XdpawzOIJ0WTuuh6wzl9ADc1GH
 vGZfk28BOiatogMNz7C1NKVKElATnAYJjvEs1dz6q8wEaG4CQT8Xx5OsW A==;
X-CSE-ConnectionGUID: vd6DkRBCQ1m/jMV9RR9ONQ==
X-CSE-MsgGUID: wv4FrXh4RgSUnQ6e+Fmnvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="90163878"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; d="scan'208";a="90163878"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 14:04:37 -0700
X-CSE-ConnectionGUID: A5T5wKSnSTG0PeTqeZhxmQ==
X-CSE-MsgGUID: 2vFlTXC/RPmTK36bXoMerg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; d="scan'208";a="279800490"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 14:04:38 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 18 Sep 2026 14:04:37 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 18 Sep 2026 14:04:37 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.37) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 18 Sep 2026 14:04:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LMTi876HNEKX9XuQY1e32n6LePyeynxQ3MW0jA4/urf5E0sBbSLopMFw+kWhz1uPtoJtPdwbogNP/6Cw7eBbVf04xXriAZP5zjo1iz3baxFCjXzr+cwMddxBey1ArD2P2rhsAY19iQ1LDxzkH11ZxQB6xG0NE2u3+ArIRWGncoLdzfh4hR0/VPdzGy4HZXHRjvehiY912Ajh4tV7kwtrBSr5sFb4tIvCQyc4+3nTZ9l+b7pC6BDfbdes88IeNQ2pj6BkHbY7TzIPbaWuY7hnz5bCIcuYefUhCfXfOJKJk19JC3vHp2vBu1zxfJObxyzox8F/e5Q47ejGGGkNdrv0eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q9kxsGOUnpIoSjxf9Tdn1PHN4AFYGCcJH98oKrDEhnw=;
 b=isqX0xrRHZoiaBfeB+TviMTn/V3g78pnhqUSyVmySw88nfoQCuXLnxDoesPhgLdrqv4G0uETV9cOXBsN9GUVj13dbDdm2RHKGvzHUcZZl5WMCOus4GRY9drnmQCQ9MPcAcsh2HX4nM5yvG3yiev1O44tgMuqccnBjllsIAMtPLanLkxZ2KRQC6MYBZDmljzob/wgtewumgCb/jh4N63lfQdsNsXpBuMzVY2XwHFAQ8nKdpWrngRmZmgq0rt5gg5PdY3oNu1XG1S2KJL4V49D7P1HZDXT9RxhmMOyTAKHEsjGMqQG46xW5GRjMzojcUIAZc05biC4zXRb1qeX7AIWZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4787.namprd11.prod.outlook.com (2603:10b6:303:95::23)
 by LV2PR11MB206272.namprd11.prod.outlook.com (2603:10b6:408:417::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 21:04:35 +0000
Received: from CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd]) by CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd%4]) with mapi id 15.21.0428.011; Fri, 18 Sep 2026
 21:04:34 +0000
Date: Fri, 18 Sep 2026 14:04:32 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [RFC 1/4] drm/pagemap: Add helper to access backing devmem
 allocation
Message-ID: <aq2nYIz4FHC0GP+z@gsse-cloud1.jf.intel.com>
References: <20260916112828.2528881-6-himal.prasad.ghimiray@intel.com>
 <20260916112828.2528881-7-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260916112828.2528881-7-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: SJ0PR05CA0086.namprd05.prod.outlook.com
 (2603:10b6:a03:332::31) To CO1PR11MB4787.namprd11.prod.outlook.com
 (2603:10b6:303:95::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4787:EE_|LV2PR11MB206272:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e89b677-2c16-4bcc-150b-08df15c87108
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|10067099003|11063799006|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: DgD/kNWltCICf2EI9ulHgJLTo9yOt298vBrI/YFMmqM5FLwCYVfQfyX+zjo+B3Sao/PoAP9qeAJXnl4cGwk85Pjtnvwmc2kaorC0RoZYZlVaaReC42B/R6u56bigvh830NGTikVzLKZimQ58d+pAXnd97MAnnx8yQPA5Kt4szLY+6mdHiym/kI/XYucJcGRjHn/hcTchcL8eBXWgHYTEncopFyzutX/vYdoUxb5T8hm8YMmD0YaYPvFv/7ZBHWBJTYDnbxe2qYzVGxP+ph8U9n8gy6RIK9sE10El/ZYu8bbkQDqPxQhwXczlRdG3aXVU7T+QuRusDegKl7HdHIJ0JqiYTrY32fP/vKFrJImnxRxSFlf+1x2iEeEk6JzEmjZBXfxJq2VBBuGOjayYftGZliNTcTEVVVNMiOeu7mwiAgKuChwbbosLS/KwiymSaeBqJDnUvY4E9Do3B8E1x8ePxNpOD/TegJz0AlU1oCvMjtqihW7mWxe/YBmG+VOLv2rOdIHW8R49LELHI2hmUw06SRtljjtab0E1c7pv+aeWNpENtZLLq684RFl8lzpL9tdazqIIhMtFqPRxBH9oEue2Q/YufKn5Ka9Tng9UD8Egqckv9Z0wVxZBd0rB7XGOh7qGfcOj21/bD51i0O00sVxx/PwRQPjSELkUMN+NWWJ9Ze4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4787.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(10067099003)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?k1v2LFgSwOru6K2qLJP6ngYq8dU/jU5ESCOKEOmLmSFHIkWVl1otJqnw2cOQ?=
 =?us-ascii?Q?SK60JRlYHGL9lTgiU/A0pz5i8lI8JchaLtCJ6yV/KRczdMwQnlvrjNnsDs6B?=
 =?us-ascii?Q?QA1wI6u6kkV4wDjuewpb0Ccg5ZgGt+ng9mrevGz6dKVwtQEFr/GbgO7bXLB2?=
 =?us-ascii?Q?/vM85w2HvFEbCdRKo80wbj9/IgDOGlg2jAdMIEG+5meTSYOEuhDjU9d6RK0c?=
 =?us-ascii?Q?ywlYGRhj+TOQVL6tEyLXLrohs+bQ3p7n+F8WyR//5SUuYR7Y7CNyypRnauXn?=
 =?us-ascii?Q?qBHBoj9bG95fLZOB/7iTabwNXTIIU6V2zOgWUe38rmiHrMUKYKWIUTZEjWU2?=
 =?us-ascii?Q?Iegz3PhJ6vTHnQPnoY3jsQPo9uI9kaLyWBOwEnRmB0nSTRVvo1hpmpMzvEnD?=
 =?us-ascii?Q?OVaoDuXQn3CIfF2X2KbeY7SoHncnEdnSs6KncNy/HAO8n/FMBbQTUKWuk+xW?=
 =?us-ascii?Q?Sc4G4WSrpXopBue82skn1BgHMZdizOlOp30mR6Y9FNmGpynlgSney3Ab3lOO?=
 =?us-ascii?Q?2H4IJYQgWu8oUtIqGtKEIGp33ILkmIcZu8D7IfrrxUTvA0iDuTOtFBGh6f52?=
 =?us-ascii?Q?g6csVE+t6syxH+7XEK6n3aCM14oC41lEp1cPXx4qxs+AeHcX3a0HTCm3LBPR?=
 =?us-ascii?Q?eyCr7hCYYPeGFcsYTT+FMst+Nt6AurRHQHc+Levus2GZgbUAAzdKXCyf9i3x?=
 =?us-ascii?Q?/97FbY8kmdFdf6u1qcDbEOuQQ+uRJfvAoW69Sa3e1l8GvTV79STAWwbpecBX?=
 =?us-ascii?Q?CYtu5YvT/eewhwCYylxYsP0mturKdhCcRYAvdtv+u9PQtSJbucSMfC+bB3+7?=
 =?us-ascii?Q?6OEn3AoHF2ch3rocpdR/alyqdaX+SsKbHujxnP75KcNpq7cg1xyY0ZyFgbBV?=
 =?us-ascii?Q?NoC1izk1P6Okou4sv3rkkA3sJlPgIz8fiQKbVt+Ogsd63I/PQrd0Dt/K93dA?=
 =?us-ascii?Q?Gn/YMWBanHnrB0f1nttKabOIi1zrmlvJ3SdbgdfOUkWeK6rLOnrz+zIiQK9b?=
 =?us-ascii?Q?ecN79T2RmQG1TY7OMk3CjbfpTw7vveip7mKbnm6Mz2bAVjq/VVcu0W3Flj0j?=
 =?us-ascii?Q?Fqx8hSCASJS+wj/LoAow2QwCPSwqC7NRtN/+gseDzAdcV7cyiEG2L0p/W/5L?=
 =?us-ascii?Q?OrxPIaSmNsadSXWHk/ajJcN15t+qY8U6k5n+ys9EI8Rp6rZYhWW0Dlgc3vJT?=
 =?us-ascii?Q?xs5BnPa2M9kzuR2XpFZvmbAM8nDdYlMyhKKNTvT62iU0TTDZthu5B+6JIYmP?=
 =?us-ascii?Q?a92clP63FNb1tFwNrNRU8ADnDv+Kqj1DHQHcI4yZvT/h5YAkdo/OaDoadBOg?=
 =?us-ascii?Q?CnskxpiZtvpyfmoe1NZmg6uyg0OY7jZNc+G/iPyrt15BSe6spF/cvZTknAAh?=
 =?us-ascii?Q?2NQMabrivUCEkARRhUG8O6XXe/VgR/AWgmY1vIIgMXCX48HcwOZTGIBKYJq8?=
 =?us-ascii?Q?Ugfuv6P0eWd+mVxf5HJoxBFDrZdqeon+8ZvITpEfN5fWuLMDp1LmLqh5hr5+?=
 =?us-ascii?Q?fbrT8vkAOah408/5qZMiCoUNd3yZXws9WOVm0lKfw8Zlbgj38yNyp+mokfrt?=
 =?us-ascii?Q?28PvqFYiAIP4FVN/548nFusvBu9PFG+cYHv3A0hXyE5h1ieRBO7uhbCru4VS?=
 =?us-ascii?Q?lIo1av1IM9BInjt8Em68GyH8f8F1BhzajiufnkG1VtLEk+b/eAMmHFfaJJs5?=
 =?us-ascii?Q?QXBbxePekC/KdqePCwNY5A8CHItaRGKF9nsaTT9Gw/DCecFijoXe0+fJrixj?=
 =?us-ascii?Q?1loZ/cEtzQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: d0E3nWU2naptG1UHwlIW6AvV58sUaoGR4/uMv5uSygTbcWR5cxx8A0H9r95enVVta0s6MnLklDh5cXs6qJLC0x2nkBLZcAoDR23u19wpLiCdRIPCpFgXad+pNHjVVcJDB/rijj7IV8q57IoZsUv96SDhzu9fywRAlTKm7RN4njhxftBANj9LNRulMFo+rl2zhIWwNRvkXduH00604fKZSrpr8mmwsWvbcbfImaRhqtt157RmdSPAyYGD0jrgkSOwjRCM0bd+TaF8la1qVzFalOUA9eevKhngRSbRihRNdtQ/hH5tibwh5AiueCtq05+BsavouabWeQy6OlxS2c2ccQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e89b677-2c16-4bcc-150b-08df15c87108
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4787.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 21:04:34.5791 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2DRG7zARSgH+CT0fTa5gYIDiplLKh73sXSY+EBuu/Lu1iI4RdRVz8CmooxwE1rFcEtayBSDb+WbJ/z2NQmR0kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB206272
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

On Wed, Sep 16, 2026 at 04:58:30PM +0530, Himal Prasad Ghimiray wrote:
> drm_pagemap_zdd is private, so add drm_pagemap_page_to_devmem() to let
> callers get the drm_pagemap_devmem backing a device-private/coherent
> page. Add a NULL stub for !CONFIG_ZONE_DEVICE.
> 
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/drm_pagemap.c | 15 +++++++++++++++
>  include/drm/drm_pagemap.h     |  7 +++++++
>  2 files changed, 22 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
> index 892b325fa99b..fc1a2825c807 100644
> --- a/drivers/gpu/drm/drm_pagemap.c
> +++ b/drivers/gpu/drm/drm_pagemap.c
> @@ -1432,6 +1432,21 @@ struct drm_pagemap *drm_pagemap_page_to_dpagemap(struct page *page)
>  }
>  EXPORT_SYMBOL_GPL(drm_pagemap_page_to_dpagemap);
>  
> +/**
> + * drm_pagemap_page_to_devmem() - Return the devmem allocation backing a page
> + * @page: The struct page.
> + *
> + * Return: The &drm_pagemap_devmem backing @page. Undefined if @page was not
> + * populated from a &drm_pagemap.
> + */
> +struct drm_pagemap_devmem *drm_pagemap_page_to_devmem(struct page *page)
> +{
> +	struct drm_pagemap_zdd *zdd = drm_pagemap_page_zone_device_data(page);
> +
> +	return zdd->devmem_allocation;
> +}
> +EXPORT_SYMBOL_GPL(drm_pagemap_page_to_devmem);
> +
>  /**
>   * drm_pagemap_populate_mm() - Populate a virtual range with device memory pages
>   * @dpagemap: Pointer to the drm_pagemap managing the device memory
> diff --git a/include/drm/drm_pagemap.h b/include/drm/drm_pagemap.h
> index 95eb4b66b057..376d7d400c8e 100644
> --- a/include/drm/drm_pagemap.h
> +++ b/include/drm/drm_pagemap.h
> @@ -257,6 +257,8 @@ struct drm_pagemap *drm_pagemap_create(struct drm_device *drm,
>  
>  struct drm_pagemap *drm_pagemap_page_to_dpagemap(struct page *page);
>  
> +struct drm_pagemap_devmem *drm_pagemap_page_to_devmem(struct page *page);
> +
>  void drm_pagemap_put(struct drm_pagemap *dpagemap);
>  
>  #else
> @@ -266,6 +268,11 @@ static inline struct drm_pagemap *drm_pagemap_page_to_dpagemap(struct page *page
>  	return NULL;
>  }
>  
> +static inline struct drm_pagemap_devmem *drm_pagemap_page_to_devmem(struct page *page)
> +{
> +	return NULL;
> +}
> +
>  static inline void drm_pagemap_put(struct drm_pagemap *dpagemap)
>  {
>  }
> -- 
> 2.43.0
> 
