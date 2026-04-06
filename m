Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A212FB5165
	for <intel-xe@archiver.kernel.org>; Mon,  6 Apr 2026 20:23:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 485A510E290;
	Mon,  6 Apr 2026 20:23:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hTEvAiCL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A069F10E290
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Apr 2026 20:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775507032; x=1807043032;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=CQaNcq0o9JDkqYaX1K2LAHViKEPk/YKJfrpdY0DkObs=;
 b=hTEvAiCLwkU7qffW/Sh/gmO2CvH2c2/yqiDwkcJ2J/R/kfq828G/ap49
 JLcE1qbWVsRvMCFuyj+40ruc+GE4+VwohQ8F2/khCgEmxaQ8RS4N7MElA
 hRrf7XwMOtTc2dx2XMv5JbkxF6hl0uqOkCkihTP8nJNM7TiWJmn7FYZpU
 nDn6PTqJEfmZxRi99qenWLhff6k7OGLuKXWMD1GkNv3fZkNd3/svjiW4o
 0iBgZMoRgepnZEAsbEnFfPJwQ1M8YyCBnOyU2Fpozt79V1f0ZStdObMXz
 kBytieuyxwWAAvWeun21k9JyUL2juKehxH2iA2toKQ96Oh6MhMYxVAYrD A==;
X-CSE-ConnectionGUID: Xi6vX05vQF6wZNOa8+OaGw==
X-CSE-MsgGUID: FBJaTR/9Q+mgw6VHf0V9+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="80321357"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; d="scan'208";a="80321357"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 13:23:52 -0700
X-CSE-ConnectionGUID: D83yLRVITjmvTtKYtwuSAw==
X-CSE-MsgGUID: FxE70FZ7T+2FBfqN0WsYjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; d="scan'208";a="226962932"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 13:23:52 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 6 Apr 2026 13:23:51 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 6 Apr 2026 13:23:51 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.38) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 6 Apr 2026 13:23:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GzrP77paaR3qcoAilVnX1ITsY2Xv+lQ2HQfC8jKIMIjjtxqPU2UQnW2Tgn+MoUtFCNwjbdiTshZddtXQEoCZR6v4bwFJcl5vGa2tH91Yh/9xZGqUm8pURwx9joILIC+JU0FWk9I4r0R4mKLJEsyx4Sub+f7l4RzT/OkhUmA69iDnttn2kvQIdVqJWKpP6b2VElexPaCYkz+co4JeVhqm4pkuZue5PJII5ghZa0ugSvREQNGUCdxWvyAlYJT44xTIlEcTIXWNNF2K726swZkNyxf1hGMwWoQE5dGJhMFi4tfebJlADlqBbZgNJztxXEREO3kUpLVQtms+9hEzAdXmbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FM9j5/pM2HH31FFQWD5zw9Gw08wt1H/ExiNqbNmTPuA=;
 b=U+j0VidLfKQ/YFKCeWKKWAuUyGHpXEfPyU+pjL96Ek+ZLPl2qz+Q6nVV9JTGAmB28UffV8Lgg59agmxaqaGUv1dPq17hyXCyDrdXbsjp8Ky3BXGm/iRJUUUBLj9Eo7ZSrfwA5dbJFSmjZ+8LV67b6uLHjZFaciNLff5X74vmZO6+DJmKp3rQTkf0JkhqktR2ctyKbh33xM4BnBTiu5+32Rc3pskj923HnG15kUuqs2AkismkamdPVxYLVdZLGuosijzW05b6KRO3p1isCWjHreDz81FKz+gkNVPm9Ja9OnW4wGj6eDPB75KLyCApdeD0Db0ZumIk/2N4jDo9ukWQyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by SJ2PR11MB8348.namprd11.prod.outlook.com (2603:10b6:a03:53a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Mon, 6 Apr
 2026 20:23:47 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%7]) with mapi id 15.20.9769.016; Mon, 6 Apr 2026
 20:23:47 +0000
Date: Mon, 6 Apr 2026 13:23:44 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.auld@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH] drm/xe/svm: Use xe_map_resource_to_region helper instead
 of direct access
Message-ID: <adQWUJSpnkGCfe+X@gsse-cloud1.jf.intel.com>
References: <20260406054249.2769479-2-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260406054249.2769479-2-tejas.upadhyay@intel.com>
X-ClientProxiedBy: BYAPR08CA0036.namprd08.prod.outlook.com
 (2603:10b6:a03:100::49) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|SJ2PR11MB8348:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f9cd2fb-b841-4b59-8a76-08de941a6868
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: UOq0USEJfZb2Ot7Ed/NUjJLbP7bZnyY/Io+rnfB9JASZCtFHg03lWWAQS1kUVrsIF4j50WZfdWLYTxoZZndtQ355dZd7gU5igaU+bTx4oYdBEYjs4s4/THrQJLwrpyp6o+zNgYrGJQbUjL2a24wI/RHznwC5CJ6qymTAUeGBDSVsL8PBqdBt7uQyG+infY0fDRuzdJJbovvmztu4vB4YAsgUVp4wpOEVSrGkQlJinrzYJca95+M84NCZUm1+AtzGAv1oGNaSW0iCen+sKZmonCFQjAHKD0TXkyjZrFjdRmWq6sJryrDkTRNumjq0D3UQNoDm+hCrghIFq/V5pK8ZiXabtAch7J1qUbmhbvZou4CFuFr5C7yrPC8P6WSCtS0O7k5U3R4ClAzfQ5K3ZXwP/u5jlZNrXgZ9mRCtI27En24iiI57GWIFKNdm08axYQjM8jFx02lMT7+PBu9oNsN8sFwkCWDsnsZ6tp/I9ut3VQouMWamcL2phpap7nyTJzru6wKbFLqDe31OPtXOQPrw5P3nlYfLPWh96nHXLAy1mQ//wxrSv9NImz5jw4HDg8yb98/zZnkm/30lvmLV+46sdeEppVB6m8TlCAJU0c0IuJW+w2K/4RZPYDCRO7RdMBPeI6yPMaQNSKpqQj/3o1+qsvWhl20wFzAz2NZ6nWN3NclMgkP7rBDm0Sclk1SpQf9ZBHfA5fziCFzNhDMFvkPaGSYPsElupdbNJvnEhXUQufs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?l8E3TZn3gu6fxW4BW3YIFbqt/igBNyN42bbfj8Ng6nzKBdlBi9oPfNrOiXX8?=
 =?us-ascii?Q?Rz4PbrNvvvqIyzTrvmpLo+xo7Q9V98qf6BPUJRJKjxPH3SYJ7xt77eNQQUxL?=
 =?us-ascii?Q?lp/pfKQINYv071PNMLEHgazO9IwPngaEwT3LQ1nYy2aewns/3LvkLIxTm2hl?=
 =?us-ascii?Q?ChuAEQNnmjwm6v0/+Kgy+MYUcscESX1nuV16ljjuz9oRJnqmvu84SpAyDEV0?=
 =?us-ascii?Q?qxy3pgXI3+6brC0sSKCMQyaU9ox73dluuz6FNNZXRtzeUX9RXDGSVVh8Fg3O?=
 =?us-ascii?Q?TUoOsOWcD/rP7bFwCRcsF0FbaQw10SyWq8F1wJkHMube0EqDWxcX5HeN4Lys?=
 =?us-ascii?Q?w9qy90w1Fo43HVfoFcV7hkNMszjTWcwdL/gozllUOjnsxE9oWZBBA5BY5FPK?=
 =?us-ascii?Q?OvRNSklGLdAjq8hPClZdgyrQoYx/Av9j4BI3zv72TshpO/DQg8W1j9NEMkbc?=
 =?us-ascii?Q?ZLu/1RBU6N+axww/S5UV9l/H3xJqtdsG7HHNesEh/+NkMdna/VYuxbKQZs+p?=
 =?us-ascii?Q?aygGC8xmO79Y6b2x2IpiibmHPI+nZ1bqUIf1WHoX0kbhF8ijPvOMfWAsD3B0?=
 =?us-ascii?Q?IbxOH7Y1JaLu1X+wj8Onl6M28nKJCtMlelVxWA487UKLXalDFNxzY8V750AK?=
 =?us-ascii?Q?QfKVw6Oad5Xj7gUrTyMoO0VgX1Fdc2YX98hAbYAJRAI5F8Bexvj0SDeK0bNi?=
 =?us-ascii?Q?Hih6HKzZk05W0P6/RNpKO9FoaaV39bwTX8RtmGTpFGl3yRL7XAiWBfOlCIEg?=
 =?us-ascii?Q?B/kXI1XjOiftMxVd3xf/c6CPwr1kfFP5fPWgX+1HVglHXGei+LuHLaXr5w3l?=
 =?us-ascii?Q?CvPZjprswiaHK3By32+dDZVXVOhu484jTBip+LV2eFcqVtbJLnHNhGp+fwOH?=
 =?us-ascii?Q?1WcOfpeGtFQRrZYRVn6tZA/zhTI/TwgnCW9WLsuimB1GaRF2XvRyCV5q38pm?=
 =?us-ascii?Q?8foco+Xa4vbi9La08SxcBiRYvn6xyR0Q2wkJ6xP3wg7KxpOfkHGdFW8zHDpN?=
 =?us-ascii?Q?IcBmTp+RxfFU+9sgcthxq5k3PSIAa0UQZM0srcr1w+faZxEEnxtoRCrFkTEv?=
 =?us-ascii?Q?2h5jKy7qENtyQpAHG5NeN8EQ8wZRnGzsNlYLs3wARn7I8UA6IMU5gDPZ4BVY?=
 =?us-ascii?Q?JaG/XPvPKSboEJWwmX75PReHSwOnHI7FQBE8UjKJWVSvAXami0d3xvRx29Av?=
 =?us-ascii?Q?Sc6VkidHbrG9LDe1KORET0pZAu2Vj1ntsUPY7pEw3Oxk1hd3gXn+IS/8f+rv?=
 =?us-ascii?Q?2RCs7M0Rl15TRu4c5T1VqSxIoA5YEt/HXWxX7EJPttg/lWQ7eA0yn2M7KnYq?=
 =?us-ascii?Q?BKbG4vQ/yuGFuXNJaFcsAilSsQlPMAWb/7RhZ65XR+SK07JXRM7LqLiUoZD7?=
 =?us-ascii?Q?KwXGg0JPbcGrBSABr2rE+jVa9/oScOHs0VvZ15UnADsR8jznYtjVORpYBihg?=
 =?us-ascii?Q?jp+21J9eLrdLG9hODUkjP0eyS/yQoBFeTPYe22fipsZNG6kEf8fCeIdOS1w9?=
 =?us-ascii?Q?0AyUG6JWq4q9RT6tbPR+nov2byUp9FriNArm+HX0lFfJI5U4q4SnblnkgInF?=
 =?us-ascii?Q?+0U/QobZ17V8xvPfmVDFGrox7oCJXlItLsRote4LVvtEdwp1ZuPMmcS7ETh/?=
 =?us-ascii?Q?WfGgOpn8SFUOFKH8r00RJTdsN5chfPp6BoMDx/UXWiWcextx5HSybhi1gF4C?=
 =?us-ascii?Q?92qB1OGiZoazERb0H7F5x3+GxzSrkfqsdGJaLbcuDRq/2/Lt3vQhU4pjbF2B?=
 =?us-ascii?Q?ja4mXun6AwjNT4kSNWA+OkCDjdqTgOQ=3D?=
X-Exchange-RoutingPolicyChecked: ak+qPeFB/tDxvikSFo9FkC8bHxDs3sPTrH527e74/DLFu6rJgqZiz6jHrXTm+DyiEuKr3mDDecC3HUDhGpFRkTtqP74RVCLiSA2ZVO5ErVTidOP5ZFKTWE6sOb4HU9gLFqyv6TARKOzvtg0y7jA80LgsmzLkwlRK3qaHXTggSaOJ2qpqSRpKw3xyIfMsCxwfZrFrqMNxIzC1Tkus8lTZcA9hA6e8WuAnoPUPAtC3qRZIX6I7bOMjskMLK9K1bZPuJbPor2LfkAspgjEBJBYPzqzJJWPT1fmPjA3T+JgLJNtcfwy7fhtzCXtoSdLjLzGgQ91IwBBgeg6A0/C/LzQKbw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f9cd2fb-b841-4b59-8a76-08de941a6868
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2026 20:23:47.7208 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TxKRUdhtfXNBh+jSB+Sps6MUtXXN79GVdw91OL3daA5c3LCAG3RdwVk2Bvda1889RCGKwMl70Ik7MlfAEGFS2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8348
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

On Mon, Apr 06, 2026 at 11:12:50AM +0530, Tejas Upadhyay wrote:
> Renaming:
> The helper function res_to_mem_region is now xe_map_resource_to_region.
> 
> Abstraction:
> The patch removes instances where block->private was accessed directly
> to obtain VRAM region data.
> 

I'd include the 'why'... e.g., 

The patch removes instances where block->private was accessed directly
to obtain VRAM region data allowing VRAM manager to own block->private
for future use cases. 

> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.c   | 21 ++++-----------------
>  drivers/gpu/drm/xe/xe_svm.c  |  8 +-------
>  drivers/gpu/drm/xe/xe_vram.c | 22 ++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_vram.h |  2 ++
>  4 files changed, 29 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index a7c2dc7f224c..daac53168dba 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -173,19 +173,6 @@ mem_type_to_migrate(struct xe_device *xe, u32 mem_type)
>  	return tile->migrate;
>  }
>  
> -static struct xe_vram_region *res_to_mem_region(struct ttm_resource *res)
> -{
> -	struct xe_device *xe = ttm_to_xe_device(res->bo->bdev);
> -	struct ttm_resource_manager *mgr;
> -	struct xe_ttm_vram_mgr *vram_mgr;
> -
> -	xe_assert(xe, resource_is_vram(res));
> -	mgr = ttm_manager_type(&xe->ttm, res->mem_type);
> -	vram_mgr = to_xe_ttm_vram_mgr(mgr);
> -
> -	return container_of(vram_mgr, struct xe_vram_region, ttm);
> -}
> -
>  static void try_add_system(struct xe_device *xe, struct xe_bo *bo,
>  			   u32 bo_flags, u32 *c)
>  {
> @@ -635,7 +622,7 @@ static int xe_ttm_io_mem_reserve(struct ttm_device *bdev,
>  		return 0;
>  	case XE_PL_VRAM0:
>  	case XE_PL_VRAM1: {
> -		struct xe_vram_region *vram = res_to_mem_region(mem);
> +		struct xe_vram_region *vram = xe_map_resource_to_region(mem);
>  
>  		if (!xe_ttm_resource_visible(mem))
>  			return -EINVAL;
> @@ -1642,7 +1629,7 @@ static unsigned long xe_ttm_io_mem_pfn(struct ttm_buffer_object *ttm_bo,
>  	if (ttm_bo->resource->mem_type == XE_PL_STOLEN)
>  		return xe_ttm_stolen_io_offset(bo, page_offset << PAGE_SHIFT) >> PAGE_SHIFT;
>  
> -	vram = res_to_mem_region(ttm_bo->resource);
> +	vram = xe_map_resource_to_region(ttm_bo->resource);
>  	xe_res_first(ttm_bo->resource, (u64)page_offset << PAGE_SHIFT, 0, &cursor);
>  	return (vram->io_start + cursor.start) >> PAGE_SHIFT;
>  }
> @@ -1782,7 +1769,7 @@ static int xe_ttm_access_memory(struct ttm_buffer_object *ttm_bo,
>  		goto out;
>  	}
>  
> -	vram = res_to_mem_region(ttm_bo->resource);
> +	vram = xe_map_resource_to_region(ttm_bo->resource);
>  	xe_res_first(ttm_bo->resource, offset & PAGE_MASK,
>  		     xe_bo_size(bo) - (offset & PAGE_MASK), &cursor);
>  
> @@ -2923,7 +2910,7 @@ uint64_t vram_region_gpu_offset(struct ttm_resource *res)
>  	case XE_PL_SYSTEM:
>  		return 0;
>  	default:
> -		return res_to_mem_region(res)->dpa_base;
> +		return xe_map_resource_to_region(res)->dpa_base;
>  	}
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 5933b2b6392b..71fbc75bd0da 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -790,7 +790,7 @@ static int xe_svm_populate_devmem_pfn(struct drm_pagemap_devmem *devmem_allocati
>  	int j = 0;
>  
>  	list_for_each_entry(block, blocks, link) {
> -		struct xe_vram_region *vr = block->private;
> +		struct xe_vram_region *vr = xe_map_resource_to_region(res);
>  		struct gpu_buddy *buddy = vram_to_buddy(vr);

You can move 'vr' and 'buddy' to function level variables.

With the nits fixed:

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

>  		u64 block_pfn = block_offset_to_pfn(devmem_allocation->dpagemap,
>  						    gpu_buddy_block_offset(block));
> @@ -1061,9 +1061,7 @@ static int xe_drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
>  	struct dma_fence *pre_migrate_fence = NULL;
>  	struct xe_device *xe = vr->xe;
>  	struct device *dev = xe->drm.dev;
> -	struct gpu_buddy_block *block;
>  	struct xe_validation_ctx vctx;
> -	struct list_head *blocks;
>  	struct drm_exec exec;
>  	struct xe_bo *bo;
>  	int err = 0, idx;
> @@ -1100,10 +1098,6 @@ static int xe_drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
>  					&dpagemap_devmem_ops, dpagemap, end - start,
>  					pre_migrate_fence);
>  
> -		blocks = &to_xe_ttm_vram_mgr_resource(bo->ttm.resource)->blocks;
> -		list_for_each_entry(block, blocks, link)
> -			block->private = vr;
> -
>  		xe_bo_get(bo);
>  
>  		/* Ensure the device has a pm ref while there are device pages active. */
> diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
> index 0538dcb8b18c..23eb7edbdd57 100644
> --- a/drivers/gpu/drm/xe/xe_vram.c
> +++ b/drivers/gpu/drm/xe/xe_vram.c
> @@ -13,6 +13,7 @@
>  #include "regs/xe_gt_regs.h"
>  #include "regs/xe_regs.h"
>  #include "xe_assert.h"
> +#include "xe_bo.h"
>  #include "xe_device.h"
>  #include "xe_force_wake.h"
>  #include "xe_gt_mcr.h"
> @@ -249,6 +250,27 @@ static int vram_region_init(struct xe_device *xe, struct xe_vram_region *vram,
>  	return 0;
>  }
>  
> +/**
> + * xe_map_resource_to_region - Map ttm resource to vram memory region
> + * @res: The ttm resource
> + *
> + * Get vram memory region using vram memory manager managing this resource
> + *
> + * Returns: pointer to xe_vram_region
> + */
> +struct xe_vram_region *xe_map_resource_to_region(struct ttm_resource *res)
> +{
> +	struct xe_device *xe = ttm_to_xe_device(res->bo->bdev);
> +	struct ttm_resource_manager *mgr;
> +	struct xe_ttm_vram_mgr *vram_mgr;
> +
> +	xe_assert(xe, mem_type_is_vram(res->mem_type));
> +	mgr = ttm_manager_type(&xe->ttm, res->mem_type);
> +	vram_mgr = to_xe_ttm_vram_mgr(mgr);
> +
> +	return container_of(vram_mgr, struct xe_vram_region, ttm);
> +}
> +
>  /**
>   * xe_vram_probe() - Probe VRAM configuration
>   * @xe: the &xe_device
> diff --git a/drivers/gpu/drm/xe/xe_vram.h b/drivers/gpu/drm/xe/xe_vram.h
> index 72860f714fc6..dd1c8bf17922 100644
> --- a/drivers/gpu/drm/xe/xe_vram.h
> +++ b/drivers/gpu/drm/xe/xe_vram.h
> @@ -10,7 +10,9 @@
>  
>  struct xe_device;
>  struct xe_vram_region;
> +struct ttm_resource;
>  
> +struct xe_vram_region *xe_map_resource_to_region(struct ttm_resource *res);
>  int xe_vram_probe(struct xe_device *xe);
>  
>  struct xe_vram_region *xe_vram_region_alloc(struct xe_device *xe, u8 id, u32 placement);
> -- 
> 2.52.0
> 
