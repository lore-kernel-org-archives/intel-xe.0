Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E57AE7717F
	for <intel-xe@archiver.kernel.org>; Thu, 12 Dec 2024 23:00:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4180410EEB5;
	Thu, 12 Dec 2024 23:00:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LZQR+i+5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFB3D10EE9F
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Dec 2024 23:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734044405; x=1765580405;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=WAjff5TSDo7iBf9D6qGPTj5UUMcg9JhglaS/nRj1ZoU=;
 b=LZQR+i+51zCMwMHMjx6LnOYhbrbVrmdh5D3+NAeYgmYZHvLfC3GjsQwx
 10J9pAPwvHyQr1ycBWuhzWej1zYDkx5gQo3vVkOsSb4shjRRBoMtagG4I
 PjTxVfKluHpmfIH0SzJQehZnZQkZnSPi14FsXKMizDuv2K6AjiQosT6E5
 nXbCHLvTkbGOoowzBIkf1XxGYQyvQPpxzVb2jCNESvOplyyjs9pBjNh7s
 GAngsXMr/IICDHQlZj/HIrBVmU/WKVN1GsCJ1YxjMZOLZemag97CxhdsH
 FANAGVyBDqz0COsFwComPKF9Uybmxy3WMOGYcf6Tn9kbVHB/+dzUTz/Dx g==;
X-CSE-ConnectionGUID: rhRu08OCQ4W3lZJdaUIa/w==
X-CSE-MsgGUID: aUWoiDbERmGJ3S7/Sm8sjQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="22075917"
X-IronPort-AV: E=Sophos;i="6.12,229,1728975600"; d="scan'208";a="22075917"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 15:00:04 -0800
X-CSE-ConnectionGUID: r8+v/gETR0mFR8oY9ARlzQ==
X-CSE-MsgGUID: OG9xTIykT7idUPHq8gPAEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,229,1728975600"; d="scan'208";a="101216771"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Dec 2024 15:00:04 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 12 Dec 2024 15:00:04 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 12 Dec 2024 15:00:04 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.44) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 12 Dec 2024 15:00:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IBYNjZIjPK7FMN3ZaXCrbaGjMB5fHsbHW1p9vot/ycL6D32nbKjSnXvYk4z9+2szQVNTZdCohKi/QCfjCvYVdT3qt3uaxk7XByg7HjUZcoRxS/m2vm1cCODcDeReU+3HsVCEBj48siiZ1oIwK+VZNSSHOOaalERygH1OtmLfueqKiQOyFKXVd4RlDZCRk0O+VqUbbGvIBVj7yB/eh27dHGOJlHcEQYOey/QEKhD4yRdqrgBq3B4jRmD1p2D5ApHzYlMss5lvcOZyB/qCfRtIlVE+IZZcHPRzpaDkN1c0SE/dFAmzUe5ZAX2pOFvuky8iFcr1k27oh7Jo6mZYW/PLRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SA+Dfwx65BhXwpkag6f4La9BQAbGonVmqg114asQIf8=;
 b=hxrftTCp+Wc6Wv22YSdMJOylYTeJfdZ47bTsgIE+VM4dE4lfxaNBWPux9IYkL6i36Y1k/z1xcYOED05WF7uxW+6kqdGyaz15uNYv70TqZa1Y71P4V5hZNEqd8Zv94SXLWvsJDnjqufOlvn36UlGHzJdwkJQgx63H6hxfG7lWxrk6BHDzgrX8PK5rnrjnQ47joOVYA8P8CBYDXuPWs6xy/R8kwfz6Rn4yrYHuF4mF3JFJOiVWUaDmzXHrwaPh+P4/2VAlkkpWzduOLDRi2+mR5XirI1b9ZR3HaeTQ7kt8COpGDAzKdEBPelga/HgKpijPf9GJ/rJmTuGAunQvkTGd9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7SPRMB0046.namprd11.prod.outlook.com (2603:10b6:510:1f6::20)
 by PH0PR11MB5950.namprd11.prod.outlook.com (2603:10b6:510:14f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.23; Thu, 12 Dec
 2024 23:00:00 +0000
Received: from PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc]) by PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc%4]) with mapi id 15.20.8251.008; Thu, 12 Dec 2024
 23:00:00 +0000
Date: Thu, 12 Dec 2024 17:59:56 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <matthew.d.roper@intel.com>, <aravind.iddamsetty@intel.com>
Subject: Re: [PATCH 2/2] RFC drm/xe: Enable Boot Survivability mode
Message-ID: <Z1tq7KDTMNLCilmb@intel.com>
References: <20241212054945.1091894-1-riana.tauro@intel.com>
 <20241212054945.1091894-3-riana.tauro@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241212054945.1091894-3-riana.tauro@intel.com>
X-ClientProxiedBy: MW4PR03CA0172.namprd03.prod.outlook.com
 (2603:10b6:303:8d::27) To PH7SPRMB0046.namprd11.prod.outlook.com
 (2603:10b6:510:1f6::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7SPRMB0046:EE_|PH0PR11MB5950:EE_
X-MS-Office365-Filtering-Correlation-Id: 04ecfd1b-2982-47d8-843a-08dd1b00b4a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JCmRUa6+tgNgmnsY7ZSEqNZ9KnzKqdaIpHA7LCj76SxftA0bckjeA+8cRxId?=
 =?us-ascii?Q?AhC121EOJ+Uouhptg0iRRIbJNZO3i1YPa7GccEgd53Kgn7nUTY0Ui3yqTRwa?=
 =?us-ascii?Q?i18V42AwWP8gjeoirX4dIvSG9Jzp4YjP+ZW4A2yVeAxpUDkn+zrEyj0T/DjD?=
 =?us-ascii?Q?Fx7vnb+nRO5oZI9Y2WmhdGxawJ0V0mrO5PeMx0NCJEZ/wLlohMvUYfovozEa?=
 =?us-ascii?Q?8s7o05H1WORf/nsXuHr0Bxie+zDWxyH3uOwIDJMWiPsmluU4hxlvdl2d0/SH?=
 =?us-ascii?Q?nbR9Fv49K5bH8UbQEYapb0EPfsyzrGKjj5IUVfd/x+b68tHKvs4jWk5TvSYn?=
 =?us-ascii?Q?M+hdVEGcBujP+b30AEZrN5BWl3HgzNz+OxTvXz4IDrWeAWYOxL5K28LCeCxI?=
 =?us-ascii?Q?LKufanOEaAfDXtb4pjuVXSOrJ5pnedaHf/OzEAJ52LaWhj1SeGXpgMMReNlq?=
 =?us-ascii?Q?yJ4WcTknHBhtNw0DX+HCQjwJZTsiRdCWIhtFC78/hMlyjiJt6q1xZ1cd6jX/?=
 =?us-ascii?Q?zkisKC6ewhYQASOpRxwrlEu2pwvYbUHE3kGsV7LL+MibAwIbIckaKJmm+8DC?=
 =?us-ascii?Q?cqgYeo0c4IcITNL9E6ariHj2UJqniST4UkA1/PpHUQ4v45pifhfZ2UZRdkJ1?=
 =?us-ascii?Q?MjD1mTwOQik4KPB+cDwRgdtfa9HgBC2PiuExmGByedOQ1fMfiZtaw4G09eZI?=
 =?us-ascii?Q?CX+18u69uHGpx6E390NjGeEs/srOqCjILAcL0FLBEzmIAyt9//2d8OQfNvOt?=
 =?us-ascii?Q?8w++oaRKDEVY0hsJBFsKCnD4Nf53+LSfjbf38lFmYQIg5qt1J23ie/IVqimT?=
 =?us-ascii?Q?Hy2EIvUb5GDBll3NVLCTZw73aakwnJcwiZazTad+GP3PJ0+iCDo+RkOZQOXy?=
 =?us-ascii?Q?B4XN246DVxLNqYJUZOJkJzp4HTPDNS8dDTwMnD7nkBzTT0M8CZQDzFATmtOz?=
 =?us-ascii?Q?6cM+dJqZwVnwPtfwWbnqxnd5/U6ekei8ESfEnl6iSnGS6LRvQFIIR9knPJA8?=
 =?us-ascii?Q?ZNxzJHWbXyQtcFGsFu0auOJh37UE5z5imaQqT/o9UcMkNM7FG8Eg6liEJ19K?=
 =?us-ascii?Q?I5SSZHNnofDFBSwWRHJFJNWMMCJah4qJQBfK/kHVuNWrEUMF/RmE9vMbCTFV?=
 =?us-ascii?Q?nsPi0K5M8z1PnWYbndmTjtUBEvrOVmx/dhwD33aOG72S7IoWOAaZxftATksi?=
 =?us-ascii?Q?4vFMkiFBVJ3GewoPvp++XksmK2VYL8QBbRnvcpub4BlNQ3kL2JyUWz847q8w?=
 =?us-ascii?Q?ZE93nWxr1wnRRl2wdJAk7KWVV+VyGeS0uRYL2y42dbEnqpQ8KnTHrIWApm7m?=
 =?us-ascii?Q?HJeimTU4/EAD2V2E8H6Ej2ZH4n2fJrB7GyWjSjWwnLIjiw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7SPRMB0046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?k43ZRJqfbIPMxRxsfwIVsJx2bLDnb59Y+KcTuMzW2XtGlwQsKOzSJZApdQ0x?=
 =?us-ascii?Q?JIAvlNHQgdPToxGTnNTHoYl0gpbSPOqJn0VIk1/hQGSZItWlYf+Xatz4OW+g?=
 =?us-ascii?Q?bFCjmgFx0J88NAwZxl7NdZ2PZTMregmAfxN4KudIKTR9XU4Vwe9D8YzFU0xb?=
 =?us-ascii?Q?YvdgFr1AFReXy+5x1DV2kuVNDEgmt5QOndtwDeKK7CtPx8UuLbcru+VLFCwk?=
 =?us-ascii?Q?AaGGTH5c0f0RxlLdMbKLzKoHLfrZVnEoRbKgAkf6cGQ3hdYmiK4VQ07tdTBq?=
 =?us-ascii?Q?0C/M0vLLoapk0dQ2hxiaDPwheEGKJtCHrVDDNHdNPaGXyfAD5yaFLTC83uYs?=
 =?us-ascii?Q?+6FWjG/4U4mijLawgKvK8yUi9iLA4sP+oEyEZjxuQ5vPi3H2DjbhWu6DHra2?=
 =?us-ascii?Q?+TKpSRZS+xAQYXCfVOIRMqbHicJrt7vrU8JUixfFa62OiibQ4n4FxAEZbOUu?=
 =?us-ascii?Q?XehD3sQI+i5B0YK9rCfa1r5xpB97nUeZ9K+TSQNcf3e328LLsXUTKoepSMaH?=
 =?us-ascii?Q?6IUYnUjBDUZwQ0EzP1Ci31Ho0UTowiMLiItDOSCzGrXWPCXVVACAaQlk3KS5?=
 =?us-ascii?Q?NnoHF5sTknO4jxFSH9mueYSjeUJT1zzMuQ6XtWUyf9pAcvFuIh8wHS8rzlvN?=
 =?us-ascii?Q?b7y6JAH4MpPrRAUkXoPDZJC5yKfe9FQtxbmL4oR9Gy4KYWnYsI6aBrebS6c9?=
 =?us-ascii?Q?5EGv5KtBAWHr5nrqysSUp5NxQJqdQyP8E9ZvT4G437y77+fvu6GO8RXjYR/g?=
 =?us-ascii?Q?KEA3tYDs5ES+SQmYgzy3hEKtSaZRy4pJ+7yr/3c4I/qirQiIgmJP8HyAG/29?=
 =?us-ascii?Q?kldLG/VjGr9TIAotEV679WdFXjkCOup2r1zBLo4tCDuICpzn+HvJDrsHa8Tv?=
 =?us-ascii?Q?gzNvJpXhGMahM6ruvem5GKexzm86itmbikHEpyalGQCIcHYuE/1mbh4u6bCp?=
 =?us-ascii?Q?49/6LPw/dgf0/v6+h72v3afb/3ub15uUrbQk5sFMfVPzQDyh/aEfE4exr0zI?=
 =?us-ascii?Q?ydL1BnPl3AhRnJNs124Jn91ufjPgtSJCi5bSbncbIN20hQcpDnaNunTSFaqM?=
 =?us-ascii?Q?a6NPMOqbpXvzWpx/SnQ471RyTAl/A8luF6mU60h5Z8uwgMCyTwmJSIZAgFRE?=
 =?us-ascii?Q?X/KerJkDC3y7QFG6ElUyJWxIWzif5QsNNia6vXYnSEnJq8rS663lQZSqCGXY?=
 =?us-ascii?Q?rjeDIcKKc87wHxIVsfc3x7ekQ9/0DkRjkzb9Cji3nVsi38mTwExRvB7SiWgI?=
 =?us-ascii?Q?AW7y4pmEBir2Z21SjKJV6lyw+RWrMLffwzOU2S+82BfNKeRglKv5VOWNXqi5?=
 =?us-ascii?Q?YMQ0Z/jRR4ed7leqq76VaSNXXrCse7Y70wpjbTxFeOmkoFO68O8eLYG+hpLP?=
 =?us-ascii?Q?74HcvkkHMXS1KQN2L29lZv1S58fz5zAv0F11ezRpum3w2I9U5qQ+LnCScxPd?=
 =?us-ascii?Q?R/OZxs3eI/pdPGgMzdvwaM/DYv+R39jSDdyeSDJUXywXLxrUTgF4FXk0xyAC?=
 =?us-ascii?Q?bgxklDGx/J67EAyFUg8xTUl8VjGnSa8TeFP0ypzpFZnTlXUCTfavEdE0b+U5?=
 =?us-ascii?Q?C/ZCZRBP5SzyqpyxYo6E/+Cy0jND93BrlT+APocGOR+x1vfGU06Zvso/2ddz?=
 =?us-ascii?Q?ww=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 04ecfd1b-2982-47d8-843a-08dd1b00b4a7
X-MS-Exchange-CrossTenant-AuthSource: PH7SPRMB0046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2024 23:00:00.6997 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lpxS1nUAr84F4I7V/4kk+iaZOLiGQXJ73vxVg6Ucu+Ek0pGlLdFN+QmNqo6DAltfOzAF3kWB85XIKMqbX+OkGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5950
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

On Thu, Dec 12, 2024 at 11:19:45AM +0530, Riana Tauro wrote:
> Enable boot survivability mode if pcode initialization fails and
> if boot status indicates a failure. In this mode, drm card is not
> exposed and driver probe returns success after loading the bare minimum
> to allow firmware to be flashed via mei.
> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_device.c             |  9 +++++++--
>  drivers/gpu/drm/xe/xe_pci.c                | 13 +++++++++++++
>  drivers/gpu/drm/xe/xe_survivability_mode.c |  3 +++
>  3 files changed, 23 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 56d4ffb650da..50ed980e1db9 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -51,6 +51,7 @@
>  #include "xe_pm.h"
>  #include "xe_query.h"
>  #include "xe_sriov.h"
> +#include "xe_survivability_mode.h"
>  #include "xe_tile.h"
>  #include "xe_ttm_stolen_mgr.h"
>  #include "xe_ttm_sys_mgr.h"
> @@ -585,8 +586,12 @@ int xe_device_probe_early(struct xe_device *xe)
>  	update_device_info(xe);
>  
>  	err = xe_pcode_probe_early(xe);
> -	if (err)
> -		return err;
> +	if (err) {
> +		if (xe->info.platform == XE_BATTLEMAGE && xe_survivability_mode_required(xe))
> +			xe_survivability_mode_init(xe);
> +
> +		return xe->survivability.mode ? 0 : err;
> +	}
>  
>  	err = wait_for_lmem_ready(xe);
>  	if (err)
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 7d146e3e8e21..b9dcd36de06d 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -30,6 +30,7 @@
>  #include "xe_pm.h"
>  #include "xe_sriov.h"
>  #include "xe_step.h"
> +#include "xe_survivability_mode.h"
>  #include "xe_tile.h"
>  
>  enum toggle_d3cold {
> @@ -768,6 +769,9 @@ static void xe_pci_remove(struct pci_dev *pdev)
>  	if (IS_SRIOV_PF(xe))
>  		xe_pci_sriov_configure(pdev, 0);
>  
> +	if (xe->survivability.mode)
> +		return xe_survivability_mode_remove(xe);
> +
>  	xe_device_remove(xe);
>  	xe_pm_runtime_fini(xe);
>  	pci_set_drvdata(pdev, NULL);
> @@ -840,6 +844,15 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  		return err;
>  
>  	err = xe_device_probe_early(xe);
> +
> +	/*
> +	 * In Boot Survivability mode, no drm card is exposed
> +	 * and driver is loaded with bare minimum to allow
> +	 * for firmware to be flashed through mei
> +	 */
> +	if (!err && xe->survivability.mode)
> +		return 0;
> +
>  	if (err)
>  		return err;
>  
> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
> index 7e36989efd68..6c1e79b5c15f 100644
> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
> @@ -176,7 +176,10 @@ bool xe_survivability_mode_required(struct xe_device *xe)
>   */
>  void xe_survivability_mode_remove(struct xe_device *xe)
>  {
> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> +
>  	sysfs_remove_files(&xe->drm.dev->kobj, survivability_attrs);
> +	pci_set_drvdata(pdev, NULL);
>  }
>  
>  /**
> -- 
> 2.47.1
> 
