Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E675EC25B7C
	for <intel-xe@archiver.kernel.org>; Thu, 23 May 2024 21:28:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0159C10E1CD;
	Thu, 23 May 2024 21:28:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IuUxr8ZZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDC5610E1CD
 for <intel-xe@lists.freedesktop.org>; Thu, 23 May 2024 21:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716499693; x=1748035693;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=nB/QWKcH2Q9ns7NJi5ilJO/BBF2ddnm392JZrc1Xnss=;
 b=IuUxr8ZZ2+4p8YHhVOGDH38JesuVH6PJS9oBmuS+OIGxU5r43CPh4yiP
 EpdAkFwQlcUb5eOMHymR/I71c3FXbkDnKJW0mmfVOQ5WpCHIrNuXw8KBM
 xSZhMTsP+STLAYZ8BgzcCOCsFlNAUEqvbTjYqhG4fsvQlSeYUGrJFFXkb
 MDTqmXQ48cP2kgc3olI4g2opTAFd5rTpKj9SwtJpmEnHpgJ0i9ix0WmiT
 0MV3kvu1EKF6UfzGVlkZMoSn3pflYSdYZhcsLdmhmzJIl3Zc16b9nQMM5
 hTw9+yllm8qzG9lBSch3asrQHTpYVTI4r7fa5lMsVNKZKzDLp9274m+gN g==;
X-CSE-ConnectionGUID: kOtZ4oIFS92OXjnIE+LwgA==
X-CSE-MsgGUID: KasYY7HFRDC+gU07smcerA==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="15795075"
X-IronPort-AV: E=Sophos;i="6.08,183,1712646000"; d="scan'208";a="15795075"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 14:28:12 -0700
X-CSE-ConnectionGUID: usF+2JAfScmWHa5FMGRR6A==
X-CSE-MsgGUID: IV5ckEJHSYicLiWU3DL2rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,183,1712646000"; d="scan'208";a="33885793"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 May 2024 14:28:12 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 23 May 2024 14:28:11 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 23 May 2024 14:28:11 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 23 May 2024 14:28:11 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 23 May 2024 14:28:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tg8Gm/mXMDbWMX0JLX9Rr3osQugTb2odPJt70WMYwiKyE5QSq1+x+QtzAOegDtxTfMnvMr2EfNyo5VVq7ndPPbnZLKai6akIcJH10sBktn5LscJEF5k4GYab5gJhdvtma+xZvn51wOU9edaJykMpCt7XRao7benPqBti85xiGK7zvTVkPA3Hg3J4ib5AswjA/Ji9QEZyYnYdteTnFaU7gfaBkHePLu/hLO5dg74OyyL7gt9XM3xQEyZ/XwGajXhp0c4kqY+YK9gXOdAZeT4Uc+B6MKWE28mTsu8ZcAn51LY94onpLh+vjDDb3vztdE7t3YgdUTY/BrTT6rHd6NuSBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lvh5LtB9fgKz2bj579liCEzmWFPmFNZ0+lBdx4hVlls=;
 b=C/g6l8jM5NDFAYgrerxlU4QRcYjEhrtRnqMGfjg2YV1JueMDegNjvbVSZKV1gbZNndb9ahp27bMYn7IMcx57iSahf9I+r5TTVU2hBp7ycJg2sN9nSGNm6eFBS5mtlAFYvOHWsQr7dlRd7byCpR0PN98LTtc+hHqChSfM0441sRrM3oUy9wahmOeKbuTdsbMeuY35ANgxsGkYuQ4y+uBKOfCGirxD/uNuKh7VfXhgLIeQGDUFRphpEjVoiFwC8J5B+8ElZqmo+C67ORuMX0lZbLPsY/rXq083MLoMwukZc5DzEpwm1WU8/dW7C9V3d/cQEhoGESl4jK254jdjijXZeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CH3PR11MB8564.namprd11.prod.outlook.com (2603:10b6:610:1b1::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.22; Thu, 23 May
 2024 21:28:08 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.7587.028; Thu, 23 May 2024
 21:28:08 +0000
Date: Thu, 23 May 2024 14:28:05 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/6] drm/xe/vf: Use register values obtained from the PF
Message-ID: <20240523212805.GF5383@mdroper-desk1.amr.corp.intel.com>
References: <20240523192240.844-1-michal.wajdeczko@intel.com>
 <20240523192240.844-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240523192240.844-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BYAPR08CA0059.namprd08.prod.outlook.com
 (2603:10b6:a03:117::36) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CH3PR11MB8564:EE_
X-MS-Office365-Filtering-Correlation-Id: 02be0937-e0d1-47cf-8bff-08dc7b6f3d6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WqcOyK8j5gvocjbp5v7iPByHccxLavlYcu5Wighs6/aObKOZ7Uaq38IjTEvf?=
 =?us-ascii?Q?rsPY3uJzrjKT9lAnlmBdYJwGVL3HjoMh18AhcEJTpNr30e/avmWVJa4MpAa1?=
 =?us-ascii?Q?ngMx4Tphg4Y8jhHJuGdAk3amKjDLQAQMVnkLPyI3dYeqFm6+jOr9PuPaq4GG?=
 =?us-ascii?Q?VgBT7LswWtT42SHpVdFmX3C7BRMDBWawQTboriCY5mbwc9FnT+/es92JmDP9?=
 =?us-ascii?Q?Ny+wd262CPNdMreHZsU0ENeWF3IkVzVhYJ+Xn3ww2EO/mA8u69kQ8qBptzNn?=
 =?us-ascii?Q?7n7MP6Uq06CWkAN5obRl8TmPk55U9q/zYs98HexAu5joB+wloTgAQBbTxwcX?=
 =?us-ascii?Q?Q3LYl0xK80mqs3/+lcQpZfY0M03JkRG0RqeZB1ZsvoqGqx7p5IJDMTKCexzD?=
 =?us-ascii?Q?5hlBHI0yPqv4gjbD3pNqTTWURVbqtuXVHHGD2mOhgYtQNL9sNbXx8V2a8R8r?=
 =?us-ascii?Q?MZPNh4hgbyoBjuHstM1yoFcD050i8GXuNHQUwWHdF9Lwqx8NccCd0ieAnl4r?=
 =?us-ascii?Q?nvVoFo7+lzfWQlUs/NXSznyBytBMm3tAL0d4oYyn9AffWk5qE1uy5NS5CPeI?=
 =?us-ascii?Q?qKS/mdhYabd3KBaFEcFl1eU+RyxDtCZrR2yQCIL6Lj4f6kv/meDV1vohyL3X?=
 =?us-ascii?Q?th6hxXIjtBUbzZf2cfCR1IDfIITbmhgH07lkZMCejlWMmqruVoQt+Hq1JRBN?=
 =?us-ascii?Q?ep2u8ikxNubibkO7o0g2CGDbZ1P0/CmgJlBt5mftIchG3QOUh+nnGoZS9fEU?=
 =?us-ascii?Q?l8juL5UUwC2Q4br15FzLWFQ87IoifUNmKlwxYwbnr+hZ26YafH8WYstmVm45?=
 =?us-ascii?Q?pR6vVLQW16puZrY6GCLTTVa3sHZUKbiZF3hGA6AxQYQoDlfYLcQNr5blLpUC?=
 =?us-ascii?Q?FpzXVMVV2EjthWemwvklkUw1JtHCgAisVuvE4gKL4M52IINKsg93TRD6VXa3?=
 =?us-ascii?Q?hx2WmWU+icXLHMrq8XgMTDB8ZXtunUuXq+6n1VDE5PRDqHh/42E7QTtfyff6?=
 =?us-ascii?Q?DmAipLuGTMHsAXi5/L/Uy5I/4+NmQZQTeSDvVe6wBihcrTdalu25XD2hYuqi?=
 =?us-ascii?Q?VvpcokS57IF473egMi2NrhdkYpZ8XYGSd7swU2p9HLeK+Rbz6hle91KWlsNZ?=
 =?us-ascii?Q?jZVqQh7J1+s8ab8SWBLldgDkZQYwieXXLKwh2NsZIkMlJ8S4AQ+QYyHfgeBu?=
 =?us-ascii?Q?1TnVcNJVrZIpl46cn/Vmsl8H/1KcKHcaynL1glHHzHDDKwabGHJHUl/ErRRE?=
 =?us-ascii?Q?rGf3jugZqbtEXIEfVSG+pV+Bt7Kp3X0N3V5njyGWug=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?F7M4anPzFZCfVhgKdoYfJif3vY6sfO2bwZNtGWY8t6hAOxoAw9OTf7vwF4t1?=
 =?us-ascii?Q?/CGZRPGrdE9dJKZ7Lo6z3e0n3XR0ixfCDApwaoVrmQ/lqLCCgCF+56toEXff?=
 =?us-ascii?Q?Lh8xxoYk0YNJG6dnICRdWe9v+J89kHKUAGNBwaAWJrKUaP+xkaD6SMZqn8zB?=
 =?us-ascii?Q?LDWQezsjPIA6z3Y7NJcmI8eZHchHrQzV1u9a+JtIddUZa/U2AGXi1S4qJLZd?=
 =?us-ascii?Q?8n6Om7j3XmsmznoiYHwGVxoxWbo7dOGcZ6EK85bQBAP07YNk6bvI86MA9TCK?=
 =?us-ascii?Q?EUZomTvOPtrwy8QZ4Yc1ITllV8J2kNCe8q0ThS+4nqu6Tm6iQnOW20Ws82Wx?=
 =?us-ascii?Q?FRYFu+STrKPS+T/z6BlBErNeni+IMn0hXocZmZFnYQPln0E5jgzlemBKpe7Q?=
 =?us-ascii?Q?5YYfOlF+4A9lG1wxBK0SUiXyTFdQUBEBwVRCSIjbl0v2+RhOkIb8zqvrjtDq?=
 =?us-ascii?Q?QsodMgT+NWH0centqGYEYj0t8QarAu10v8VyWKfMaRPftG4vxKtQ3GoJrGUI?=
 =?us-ascii?Q?ubhGl/EU94SLK1lniUnNPhl88Ryr8JpTSGzYtsuFeXnAbnTVLqmgxkEB/UPO?=
 =?us-ascii?Q?xQtPfCKwl9gNxcQEz7HGS5cnNwYKvdq0CAb7dJmkS5g4qVY3CuDd4NrJ0INp?=
 =?us-ascii?Q?HKiYyjBmIOkasPCMYT7gxpG6t9cEqIcLnrOCV7dv9OUbHFvik+XLdcEIVZCX?=
 =?us-ascii?Q?tFVteQzxGs5b3u8bZP1751r4WEbrgWmXVLdkkPEjakhFjAqXptckjh/AfzF5?=
 =?us-ascii?Q?Rq8xUtDbav4vjFFRRuWcsGgWuNS+3LeH3tIQPw3m163vryDZt9LZET5NJCCR?=
 =?us-ascii?Q?iEYkdfdxBFeo4Ps6dkpS1TwY8J5IDrcdIhx4r3NBfR4DOEHSVgbQbaXviZy/?=
 =?us-ascii?Q?snjk+Am/AbFwrhkYX1ftgoMjebLzAgvICCetf7k4ZaxYTfsQltOdXQpnyxmj?=
 =?us-ascii?Q?CNEHtfRGEdELy3ShsKMIzDQQdgiYxXfW16yLlf1Vmo5RVGPPhxuK9HtmEKrG?=
 =?us-ascii?Q?Q6zZsNWos743VU1xCk1V9mVY3H8HdY2UtniSXBzkjURO2/ia2bqFP1g+EhLh?=
 =?us-ascii?Q?nxrC6jO6a2pHK8phdhgsP6k1PZjGKC8Yg3SMCF6q2Vxgv6izbcNLdmPf6rUC?=
 =?us-ascii?Q?oOL08DwHCltrOIAxMcOc+nL0SPyj7dgWDq/uQMAdFPibgW8Ggxi5BZC9cmJ3?=
 =?us-ascii?Q?jQlA/7j61hSjjHQ8m6LEngOhkM+plNl+5Hn1W220GKD7i8pZn9jsO7v60ezK?=
 =?us-ascii?Q?+zzsBb4V4q7e+Aw5oQsJZiEwLH4DoEcWv62G9rxlCdUqSa0+OZNk7pCOSmCp?=
 =?us-ascii?Q?CMFCgsDIPoO3yIVFdYluJYh+iPMVd0wI3RB1HU2uTxsK8lF+86sKaB2ktr+S?=
 =?us-ascii?Q?2tcD83vgscuMQ3zgM4O6A9k2lOp+PWTJHsPhLHuaMqHdZYmYRtjm5PauCk0d?=
 =?us-ascii?Q?Z8Vy1+Ya11HNDrQY4jDGg42fa9ISi1M1B6czO6o4F8+VkC4KvGkvm6HUZ1Rm?=
 =?us-ascii?Q?uHvhats4WaPhIZrGyU1TZKj9lOIVUnM07AUv/VjZZDjfcL3/CQz3J4W9I8kZ?=
 =?us-ascii?Q?4+08Ni+8WAXOK6gtr6fKO+YfQi4UbE41A6w8i4DG3pkia7Nn89ecT0m4Yoyr?=
 =?us-ascii?Q?gA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 02be0937-e0d1-47cf-8bff-08dc7b6f3d6a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2024 21:28:08.2849 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: axf3BZC1USOzq6CpVnpGGxtEch/igZjUOe885/EKwXZ9AcU3nX9jFxE0ZKU6+Yh+/72j4V2dVau7SjgBvzfcz3HNoX+yOgCnjMJFqO5dGmw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8564
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

On Thu, May 23, 2024 at 09:22:35PM +0200, Michal Wajdeczko wrote:
> As part of the its initialization, the VF driver has already
> obtained a list of the runtime (fuse) register values from the
> PF driver. When VF driver is attempting to read register that is
> inaccessible to the VF, use the values from this list instead.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 53 +++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.h |  2 ++
>  drivers/gpu/drm/xe/xe_mmio.c        |  4 +++
>  3 files changed, 59 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index bab3858b423e..237486a80fb5 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -4,6 +4,7 @@
>   */
>  
>  #include <linux/bitfield.h>
> +#include <linux/bsearch.h>
>  
>  #include <drm/drm_managed.h>
>  #include <drm/drm_print.h>
> @@ -21,6 +22,7 @@
>  #include "xe_guc.h"
>  #include "xe_guc_hxg_helpers.h"
>  #include "xe_guc_relay.h"
> +#include "xe_mmio.h"
>  #include "xe_sriov.h"
>  
>  #define make_u64_from_u32(hi, lo) ((u64)((u64)(u32)(hi) << 32 | (u32)(lo)))
> @@ -677,6 +679,57 @@ int xe_gt_sriov_vf_query_runtime(struct xe_gt *gt)
>  	return err;
>  }
>  
> +static int vf_runtime_reg_cmp(const void *a, const void *b)
> +{
> +	const struct vf_runtime_reg *ra = a;
> +	const struct vf_runtime_reg *rb = b;
> +
> +	return (int)ra->offset - (int)rb->offset;
> +}
> +
> +static struct vf_runtime_reg *vf_lookup_reg(struct xe_gt *gt, u32 addr)
> +{
> +	struct xe_gt_sriov_vf_runtime *runtime = &gt->sriov.vf.runtime;
> +	struct vf_runtime_reg key = { .offset = addr };
> +
> +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> +
> +	return bsearch(&key, runtime->regs, runtime->regs_size, sizeof(key),
> +		       vf_runtime_reg_cmp);
> +}
> +
> +/**
> + * xe_gt_sriov_vf_read32 - Get a register value from the runtime data.
> + * @gt: the &xe_gt
> + * @reg: the register to read
> + *
> + * This function is for VF use only.
> + * This function shall be called after VF has connected to PF.
> + * This function is dedicated for registers that VFs can't read directly.
> + *
> + * Return: register value obtained from the PF or 0 if not found.
> + */
> +u32 xe_gt_sriov_vf_read32(struct xe_gt *gt, struct xe_reg reg)
> +{
> +	u32 addr = xe_mmio_adjusted_addr(gt, reg.addr);
> +	struct vf_runtime_reg *rr;
> +
> +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> +	xe_gt_assert(gt, gt->sriov.vf.pf_version.major);
> +	xe_gt_assert(gt, !reg.vf);
> +
> +	rr = vf_lookup_reg(gt, addr);
> +	if (!rr) {
> +		xe_gt_WARN(gt, IS_ENABLED(CONFIG_DRM_XE_DEBUG),
> +			   "VF is trying to read an inaccessible register %#x+%#x\n",
> +			   reg.addr, addr - reg.addr);
> +		return 0;
> +	}
> +
> +	xe_gt_sriov_dbg_verbose(gt, "runtime[%#x] = %#x\n", addr, rr->value);
> +	return rr->value;
> +}
> +
>  /**
>   * xe_gt_sriov_vf_print_config - Print VF self config.
>   * @gt: the &xe_gt
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> index d6d37b193d17..be69c1025320 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> @@ -10,6 +10,7 @@
>  
>  struct drm_printer;
>  struct xe_gt;
> +struct xe_reg;
>  
>  int xe_gt_sriov_vf_bootstrap(struct xe_gt *gt);
>  int xe_gt_sriov_vf_query_config(struct xe_gt *gt);
> @@ -17,6 +18,7 @@ int xe_gt_sriov_vf_connect(struct xe_gt *gt);
>  int xe_gt_sriov_vf_query_runtime(struct xe_gt *gt);
>  
>  u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt);
> +u32 xe_gt_sriov_vf_read32(struct xe_gt *gt, struct xe_reg reg);
>  
>  void xe_gt_sriov_vf_print_config(struct xe_gt *gt, struct drm_printer *p);
>  void xe_gt_sriov_vf_print_runtime(struct xe_gt *gt, struct drm_printer *p);
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index 8a39d4c18554..16c94f118119 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -22,6 +22,7 @@
>  #include "xe_gt.h"
>  #include "xe_gt_mcr.h"
>  #include "xe_gt_printk.h"
> +#include "xe_gt_sriov_vf.h"
>  #include "xe_macros.h"
>  #include "xe_module.h"
>  #include "xe_sriov.h"
> @@ -479,6 +480,9 @@ u32 xe_mmio_read32(struct xe_gt *gt, struct xe_reg reg)
>  	struct xe_tile *tile = gt_to_tile(gt);
>  	u32 addr = xe_mmio_adjusted_addr(gt, reg.addr);
>  
> +	if (!reg.vf && IS_SRIOV_VF(gt_to_xe(gt)))
> +		return xe_gt_sriov_vf_read32(gt, reg);
> +
>  	return readl((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + addr);
>  }
>  
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
