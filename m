Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F7DEC2BB3F
	for <intel-xe@archiver.kernel.org>; Wed, 15 Nov 2023 18:54:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C8AB10E131;
	Wed, 15 Nov 2023 18:54:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85ABC10E131
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Nov 2023 18:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700074463; x=1731610463;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=YZbampFxgS5fhDL7nngtcsynSd+YAr3mGSLXzw8iPvo=;
 b=LhJDHbkJH6r2a8UZtoZBBkAquZWFV366bo7mY/mSebXNyWuYsgVyjXfb
 if30IMLkvvP7JGxnk1BBmQEM5WXxPvyJNvpFLJQp3lgs2saPYHwKeTCpo
 v7ZCpai5cppmcS3DTBhjLf+yZhytaQl8VJHFQppgg1DBE0bY22BJsPmIQ
 cHuHbivbFU7aiWzlKoD1IN9jQyvoGj/yNk2Ip56+39IjkCchykca7DC1/
 gptrAcqMmJwWoGhwxW6kWkyN1ofAv+PeEt94ww5SQ117odGV98zbQLmA+
 ow8QSNxr+kb1aswz2E8Kip3U9I6QRPvFPZS+KUP/S1MChcR5Od/VsayvB A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="388095951"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; d="scan'208";a="388095951"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2023 10:54:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="1096527009"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; d="scan'208";a="1096527009"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Nov 2023 10:54:19 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 15 Nov 2023 10:54:18 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 15 Nov 2023 10:54:18 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 15 Nov 2023 10:54:18 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 15 Nov 2023 10:54:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i/Z44cuqkBlKh4jT8UpL2mNLncOcMUyaKkktJEz5a2b2UNby87VSRfR7f7zWBL806218iB+8HT0YK6nM2RdW4Ogslidyz+DWE3s2t7JoM5tBVJCmvoPSMCpDccbDQgjNIOF080l1ebO40NtDpeuNAoSxprrXF+6Mgreb15RssLvc175ljByiQYRfjFyB7nphyy7aFxsJIZ8PwU4DRk9PgpwPKd/ZwiDmU9ZzxsCs/24YdExE4iCeMzRUMDdjYMJ2Usu+Hn097Z11CCPURzUfjuB3jo7m0ZQRLK7CwJaY8nMHC8wHF99G4W+2fnMxZhgjtzAZbrWF7ycYZocJjMyLBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8J/DlWjlxV4S9HI2BFfzu9/Qfa0IoXdfM422EeHxg8I=;
 b=LyQQxavUgsfpHWoTLE7gF+1nCG91oPwCWgXlQBFH2MApi/GaHJR9IkNUaSyJoLZozf686c/R3JxxHA7ul7H0eXq/JxJ3XjvIK1s41erCvvkRz67HWoI8uGt3sgxaGMoe2xJvp0eJLcVWIeryTmWi1Z0LBu3TuVX5rKovwmviY3znupSXSN+aShSnkwFpt/CmzLbL5k9xO4CxFWmP0TtaxE/hL8F1c0QgQL/rAZapkjzp4mppvw5bfX65n6tl9tLXczLtjPOlhXCWuNCl8mG32fKh0PS5PagQViQR5+XOEkY34xYj9CQvVyplZxKVx3eRINgPMphqZua/Veg+ibeFFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by MN0PR11MB6088.namprd11.prod.outlook.com (2603:10b6:208:3cc::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Wed, 15 Nov
 2023 18:54:15 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0%7]) with mapi id 15.20.7002.015; Wed, 15 Nov 2023
 18:54:15 +0000
Date: Wed, 15 Nov 2023 10:54:12 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Message-ID: <20231115185412.GH1327160@mdroper-desk1.amr.corp.intel.com>
References: <20231114133434.7-1-francois.dugast@intel.com>
 <20231114133434.7-6-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231114133434.7-6-francois.dugast@intel.com>
X-ClientProxiedBy: SJ0PR13CA0036.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::11) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|MN0PR11MB6088:EE_
X-MS-Office365-Filtering-Correlation-Id: ce532488-ee3d-4c4b-1652-08dbe60c43a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2ifIM0a55UVjcgvrFFHFL+P1KGo+uCSUVJB6TbFS9WUKDKddFgulGL5fzGEug8OeqhZaoxhOu5tQwoSgIhfpQHq3eJ1xb5N05v7s38GzWUsE8DFB27sg9Sk3U7L4FkpoSjUPynvBAYvZ0YKpDDoQ6oWGBN+kzAlUzsMern+BERZw0IV5l637vRKWDJGKB9Q/nX/KqTtPUHOpsq72nX6SkU8akwA8iG6OVpENriN1T7/B6RlLsGacVlx8qI2vffTKTsyR0QsUxwhsztPp0hnUVrzo3MRPZTv863CKs6zXpbFFOGtc1VrVpl+gBMRCv4x26WubzV0EiI7EnFFNHVmsyjVg/alNh2g8nTgmaF1euXXJDgFfAZYQQFBb8O/F9K9i0lXp7UjbeeffOUv4JcVWm4YCDHRpVzIqnPtyLN3Y8aFuCSXXvF6Whpv64jMKBrlVMqAn/e44rvBnvFipQquAwsaIEA/VI8eV1cieSMeMm21miaf9/nb5zaMA8KV9jJJRy9XWfuLcsZ3gV6NiRoR7bH+dzbg5Rjbgdvq7mKiRovAe2eH1ccllWemZRv9CFxG3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(366004)(39860400002)(346002)(136003)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(38100700002)(107886003)(1076003)(8936002)(6862004)(8676002)(4326008)(6512007)(6506007)(26005)(82960400001)(83380400001)(478600001)(6666004)(66476007)(66556008)(6636002)(316002)(66946007)(33656002)(41300700001)(6486002)(2906002)(5660300002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4YbEE3tRvGtNc94p+ZyZr9TcoF63iaHctBoKJ8Bc08mUPz+8PWiwy6B+SH+7?=
 =?us-ascii?Q?43O/8g7D/vNjy+Vyb7k9nZDMYmgjORVFJOgosp/FDxhE6a7BpKjxUDJT13PF?=
 =?us-ascii?Q?PNXeI3Ox+2HnLDz8xNmBQVZ7gKSnftjm8bIcbooqckjiqT+hNPFDgNSDpHKk?=
 =?us-ascii?Q?zbEDIJ3Whw4ZGZckCDbAB4ylqkZRsudjLf8WtCXZoeu43w6N0tdHznA8qy6r?=
 =?us-ascii?Q?FuoJoWUJNz0gJNqX9rhZuxszGD46GIz6ejeD9tpoy6sbF7KIF1JR9SeJDyk/?=
 =?us-ascii?Q?wA/yhbJEO3VFok2ksOXjzVK7XKlFRAS5NvjyclsINhwTYVbzuTlMP9wquZZ8?=
 =?us-ascii?Q?fOac4OO/S/s9wVRkyV3NnhOn/63i/GgPGLGMeKZZYVDmE64KhAnifxaz/8Qv?=
 =?us-ascii?Q?CrbMUOFqStgR7A/JHsIZnHTWnc7DmwHZboWkva2MBbUJRUVJ7hnxRhHl2tnl?=
 =?us-ascii?Q?XQ/v5MBGdF2apmIQ8mTOQ53Xoo2WkGSGjYNNdF1/2wmnAdTrf+7PUBCE+BG0?=
 =?us-ascii?Q?YWqYCa12EXQX8HGiLTEByPc6J+DGzSIGar8rfGS6mY33Z2kFApILd52FpS0i?=
 =?us-ascii?Q?TQB49XJ5P2ifNnz6/26q5wdm63ne1WLVQJ1OXocgzG4ZJTSBy23uBiaZ0mj/?=
 =?us-ascii?Q?XJ4TP/B9QD2dmTFQGqPS0QmwrBNBFPmyjPWimFK/u4UMRm4kiMbBGWJEZBWQ?=
 =?us-ascii?Q?qbjma8xjjkphNudKDZyYyziUhTNPvT/v1T7ZPuPEqcgWqg1ug+ZUCTSxFzuC?=
 =?us-ascii?Q?/zC9bKbTaXgJbD3J5mjFEHzge3JlWKWfN1ZF/cAKNcNkSIHFm7pCogQ560CQ?=
 =?us-ascii?Q?AMKYonH0+5vn5NmSBYL8O8FW7iDgZdWUz5PWh7thqo3agIwCnHQtXPIuQ7b0?=
 =?us-ascii?Q?X+C9MFPzKoiddsuiKiUw2AI9ZGe1ndE89g/Ak5uPF8rvPdjQk3EuPicsrzO2?=
 =?us-ascii?Q?xg6lUmelyl34RRhyDY7PybuTSTlK+3wPHW85pykkq2DY2Y6s0+vmoqdevdHQ?=
 =?us-ascii?Q?BIkRupBOmGeROc1feB9Ckxg1X3ffY4fSFiQa0ABLL8IGpMMdfAsyR/myOxcw?=
 =?us-ascii?Q?uHGMPK7lBGTjZhLoDmweq9rUOyoeuZ4ozw9XlF64r6kxCZVxI/bKq0sfyaSV?=
 =?us-ascii?Q?86rFQX8SG0TN//IlDAG10d7Or6tWk4PA4amUcnXvq06ucBmhlX4sRv8sEMGE?=
 =?us-ascii?Q?yCYXSTT3ZfIlAdxw0hZkrzDdQcatyRedshM5Quy1jFWwBIhxBLONHl0swv4T?=
 =?us-ascii?Q?VBIiGoHYLr9d6sQDAFF3oDFRiqfd1uv9aEW1nr/0oqcpuIXMFvOS86i8v50k?=
 =?us-ascii?Q?OWSEjPO4nvmgIupx59JPCPvssM0J9h+WM/XlWSk5iB36G9hkOnJFsA540Xo7?=
 =?us-ascii?Q?1/FSarIUaRWAgGyKmLq8VNsSBVymQlNsZlchp0z2pLCZYrFuS7MM8quEx3Rs?=
 =?us-ascii?Q?bgBhB1uPYEbEodBfi5LSaGDA1xCQ8pHmI0dV3nw3BDZ4oJTHqWU7RjDm2Vnt?=
 =?us-ascii?Q?t7OSXmIumksyVOMq1rfPvy6JURmYj8lLTXvpit0L+dh/wEpYEgPu7h3mYeqk?=
 =?us-ascii?Q?akwr5CH+9DgEeq6GklTL+rbocutnffR9H5c94XaVOlGCGrkYLVs5vgH/FrtT?=
 =?us-ascii?Q?WA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ce532488-ee3d-4c4b-1652-08dbe60c43a8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2023 18:54:15.3853 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bkI/NzKdtsqECFJZryKwvGGGucMvTR+pSs/zWngcIt8iYkDccjIuDNBoxuBYkzbwcOXPdE6zTjmE00Gz8WIJ40dmzWUj5lD5IUr5aQjqNrc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6088
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v1 5/8] drm/xe/uapi: Rename query's mem_usage
 to mem_regions
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

On Tue, Nov 14, 2023 at 01:34:31PM +0000, Francois Dugast wrote:
> From: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> 'Usage' gives an impression of telemetry information where someone
> would query to see how the memory is currently used and available
> size, etc. However this API is more than this. It is about a global
> view of all the memory regions available in the system and user
> space needs to have this information so they can then use the
> mem_region masks that are returned for the engine access.
> 
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_query.c | 16 ++++++++--------
>  include/uapi/drm/xe_drm.h     | 14 +++++++-------
>  2 files changed, 15 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index 8b5136460ea6..d495716b2c96 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -230,7 +230,7 @@ static int query_engines(struct xe_device *xe,
>  	return 0;
>  }
>  
> -static size_t calc_memory_usage_size(struct xe_device *xe)
> +static size_t calc_mem_regions_size(struct xe_device *xe)
>  {
>  	u32 num_managers = 1;
>  	int i;
> @@ -239,15 +239,15 @@ static size_t calc_memory_usage_size(struct xe_device *xe)
>  		if (ttm_manager_type(&xe->ttm, i))
>  			num_managers++;
>  
> -	return offsetof(struct drm_xe_query_mem_usage, regions[num_managers]);
> +	return offsetof(struct drm_xe_query_mem_regions, regions[num_managers]);
>  }
>  
> -static int query_memory_usage(struct xe_device *xe,
> -			      struct drm_xe_device_query *query)
> +static int query_mem_regions(struct xe_device *xe,
> +			     struct drm_xe_device_query *query)
>  {
> -	size_t size = calc_memory_usage_size(xe);
> -	struct drm_xe_query_mem_usage *usage;
> -	struct drm_xe_query_mem_usage __user *query_ptr =
> +	size_t size = calc_mem_regions_size(xe);
> +	struct drm_xe_query_mem_regions *usage;
> +	struct drm_xe_query_mem_regions __user *query_ptr =
>  		u64_to_user_ptr(query->data);
>  	struct ttm_resource_manager *man;
>  	int ret, i;
> @@ -499,7 +499,7 @@ static int query_gt_topology(struct xe_device *xe,
>  static int (* const xe_query_funcs[])(struct xe_device *xe,
>  				      struct drm_xe_device_query *query) = {
>  	query_engines,
> -	query_memory_usage,
> +	query_mem_regions,
>  	query_config,
>  	query_gt_list,
>  	query_hwconfig,
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index fd51d4444119..c627e35bddb8 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -291,13 +291,13 @@ struct drm_xe_query_engine_cycles {
>  };
>  
>  /**
> - * struct drm_xe_query_mem_usage - describe memory regions and usage
> + * struct drm_xe_query_mem_regions - describe memory regions
>   *
>   * If a query is made with a struct drm_xe_device_query where .query
> - * is equal to DRM_XE_DEVICE_QUERY_MEM_USAGE, then the reply uses
> - * struct drm_xe_query_mem_usage in .data.
> + * is equal to DRM_XE_DEVICE_QUERY_MEM_REGIONS, then the reply uses
> + * struct drm_xe_query_mem_regions in .data.
>   */
> -struct drm_xe_query_mem_usage {
> +struct drm_xe_query_mem_regions {
>  	/** @num_regions: number of memory regions returned in @regions */
>  	__u32 num_regions;
>  	/** @pad: MBZ */
> @@ -350,12 +350,12 @@ struct drm_xe_query_gt {
>  	__u32 clock_freq;
>  	/**
>  	 * @near_mem_regions: Bit mask of instances from
> -	 * drm_xe_query_mem_usage that is near the current engines of this GT.
> +	 * drm_xe_query_mem_regions that is near the current engines of this GT.
>  	 */
>  	__u64 near_mem_regions;
>  	/**
>  	 * @far_mem_regions: Bit mask of instances from
> -	 * drm_xe_query_mem_usage that is far from the engines of this GT.
> +	 * drm_xe_query_mem_regions that is far from the engines of this GT.
>  	 * In general, it has extra indirections when compared to the
>  	 * @near_mem_regions. For a discrete device this could mean system
>  	 * memory and memory living in a different Tile.
> @@ -469,7 +469,7 @@ struct drm_xe_device_query {
>  	__u64 extensions;
>  
>  #define DRM_XE_DEVICE_QUERY_ENGINES		0
> -#define DRM_XE_DEVICE_QUERY_MEM_USAGE		1
> +#define DRM_XE_DEVICE_QUERY_MEM_REGIONS		1
>  #define DRM_XE_DEVICE_QUERY_CONFIG		2
>  #define DRM_XE_DEVICE_QUERY_GT_LIST		3
>  #define DRM_XE_DEVICE_QUERY_HWCONFIG		4
> -- 
> 2.34.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
