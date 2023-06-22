Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09FA1EB64D8
	for <intel-xe@archiver.kernel.org>; Thu, 22 Jun 2023 15:07:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D45FC10E57E;
	Thu, 22 Jun 2023 15:07:05 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36F0610E57E
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Jun 2023 15:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687446423; x=1718982423;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=hQsEMwWjVEcCHI9/vK2+x2NpSzSxvjhiP7clAos4Yi8=;
 b=OVXz1BQsGYbWPl8MR3wmembcAtaYOzAI6BWiYgv20MiGhmsoLNgZB0AJ
 +F6psLuUpaeLmyY7a1X6EEyIwka4VzHixJ806cuJlyyK4Uo3Aqspcgb4L
 l+wI5d7ZzrfQm7AKCvR0OiidXpa6+DLmcnFIDHYQQ1477GpSxJlZXiTP2
 pc10d6B5Wh0KMmNcDqJ/bgmDHbQD86u8OWmKw6yZUwrZETWOB+samqFT4
 vEGlVHZ6zQOdrSitvgd8N4uUuhOJSRySKpiSS5a/lU6YzOPQOCNnwCj06
 NNLeboUHv+PX/IlMpL2OZw7gYQdGg8t7tk6T5IFPRWXWbL2pGkh7NiR67 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="363954358"
X-IronPort-AV: E=Sophos;i="6.01,149,1684825200"; d="scan'208";a="363954358"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2023 08:06:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="744628226"
X-IronPort-AV: E=Sophos;i="6.01,149,1684825200"; d="scan'208";a="744628226"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga008.jf.intel.com with ESMTP; 22 Jun 2023 08:06:55 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 22 Jun 2023 08:06:54 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 22 Jun 2023 08:06:54 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 22 Jun 2023 08:06:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hdrOnzYzomt8wNmc5ZYRPb3A3LwgTDfFddKjkF18e7M32FxbtwiSKkvPU+qYnNHeYyXbl8+Z4+r7JAwW4Tg95Zs8nkKVR0zk0xPDib8HpPPbupjdo5Xit2FQU3wJx76Rmt0yzySA/jPI3jU1r6J2uULPxMKFA0v3HEaBdZINvoU85F7s8ZIs716pOwFSs9RXssDGH0EdZK1BAWwB1x/iiQa52MT9C6sEGq+R34lFHd8QtJyU9PIHcendMKmp6vppOp5tzuPMCJJWM/ixdUeXDJwlfimHSpKFUnesZ9o3q8i8MXeJ4vRIdfoxzchpSH3QXtIOnXeP+tsWWwQ399T+rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NmPjxLwkq1jVr493/UsdIARW7VlYy33FU76xNp5SQ9Y=;
 b=lu/Y5zpIGvGAWeL4lhUcFtoc/5VARhMseIpkR4v1spcFGwPPPG0e5LlQwiBywGrAqrRyfCWXcJO2IItm4wublD7TwhMJQqs2nt156h+Vx1r1bXhZjtWBF7VvoBZQi2mj+9V774lR0NYXBj6htxsDaccMJZG1BU0Y3a4H8usJJvm2il1zPLvijaqrqw5GjzNl5Tig9dvSie8PtYfp9qG1gg797M9kcdjpfC46mQzGSpSNztWlQVk1OtNwr1LMKy3pWnkVSmWN+RRQuduqNLc2Ma85osOBQ/3yWpShkWSl+HH5ougIWurXyCmYC88H9Z37wb11yhQutoLkaf6fSzzdGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH0PR11MB5313.namprd11.prod.outlook.com (2603:10b6:610:bc::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Thu, 22 Jun
 2023 15:06:50 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%7]) with mapi id 15.20.6521.023; Thu, 22 Jun 2023
 15:06:50 +0000
Date: Thu, 22 Jun 2023 08:06:48 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Message-ID: <yb73hntwdhzxvdfp53avjpckkj5ounqnmssa5xbe3itvvize5a@guodqz4cusr7>
References: <20230622123946.7-1-francois.dugast@intel.com>
 <20230622123946.7-2-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230622123946.7-2-francois.dugast@intel.com>
X-ClientProxiedBy: MW4PR04CA0153.namprd04.prod.outlook.com
 (2603:10b6:303:85::8) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH0PR11MB5313:EE_
X-MS-Office365-Filtering-Correlation-Id: 794075d0-8dd4-44e4-cc2b-08db73324e3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9UKASmGyIolqFqXu/mt9UgUY3K3MNAZcHwgzq9K1298ve5WO4GsmEW8wccK3oO6CEpS9/APKiZ//m6tvEmWaWHuVkHOPPIf2eV7mz1xMjQGAc2X+cwAHnvC4lJeZLsS57kBH5ClOB7vfeoYPMkU96a0JsD85BxfqHTwzzxGdBI4nFNadGpnYaMBusM+HNvIV7w5GwQDafnHPkeK+eOBG9LgGgKIdtxjvgtM3vaYCI45JIIAOF+HP6683D5ZWFyCcW8Y65Ez+AWJt64Gs5ho053vswOcOTBGouePoXCo8kNNPTp8gO9IYEZRLURLWZGIzOluG9xGLswRE9Aohef+uJZNmRbZ3qLGCOYW2PimO8iBieg0/jfNN+dWtkDKMQI+190UVV7fDKq8wm7tcSIUF0D/yQ1oSPPsqCF5C7fIOsGBPT/MGlg/Q6YwXzUN1IIh8iPtWxl5Dfuu3z7PVfZ6LJbCUs/VRUTDAA6BbzU/X8qNz/zF0xrf5hOam0VsyOW/f0uzzN8XdiAFo5WrIIaTOE6ZUGZIAzbTJHAWJ8hDdKzU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(366004)(136003)(376002)(346002)(396003)(39860400002)(451199021)(82960400001)(33716001)(38100700002)(86362001)(316002)(66556008)(66476007)(8676002)(41300700001)(8936002)(66946007)(4326008)(6636002)(6862004)(83380400001)(5660300002)(6506007)(6486002)(478600001)(966005)(9686003)(26005)(6512007)(186003)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Tm7hs9i9Szi3U44YlGhVU4n0aT/Fnmhv8If5SxxDM65YT5lle7wf4dcaz9V0?=
 =?us-ascii?Q?cp44rfqa9zbAjmwFZ/ZQZ9RPtRZa3NIDr5wEqE7KiKwc6Gb8x3Z+/oE4MZ0L?=
 =?us-ascii?Q?YUE4mI79xd5FvlX9nBPyD5udey6SWcjWrbcZMoreRHLD05hdimhhaimPggKh?=
 =?us-ascii?Q?GQo78HpSghSXAX2otrD3E0FlgIMlEzfyjiPrzKi44CWvr+om1bvpGO4bJ7DR?=
 =?us-ascii?Q?OZAVo4lrrIQSn2iBnIOL2iEQEgcdEZAyESIdqejZ8ehFqSR0uadSi2MQsTy8?=
 =?us-ascii?Q?v6IRS1eVTVdU4blSAL0ePf2gF5D93YdgB4C5dJx2LxHYT41tsB7N1+72VLVH?=
 =?us-ascii?Q?Hqqr/9lVU3QHjDQmQX1CCpuAe0WVswlW+cq+oLk2841mnNO+nLIhHFTj+oKr?=
 =?us-ascii?Q?bYUJuYy9XWqzpLJm0K3SqNNnFCNBvl1hWNBdFXmuQNcUTQ5xVoahKgPgCxSI?=
 =?us-ascii?Q?1lY7UjdOdZuJOZ5zp5DrD38JJD3Kr+Sxrv/Iw1qRy6GMZj07uZQ/g0yabB3Q?=
 =?us-ascii?Q?lEfUgoouJYexxs21DINCrQCpvbyzIP7L/UZHTkRwtU/wzJf45BG44Tt2hT1h?=
 =?us-ascii?Q?c7YvbtOrcnFF6bft7+b/cmU/d6DPALuvsxQvMdThaKA5w1l7GPFQelg8m213?=
 =?us-ascii?Q?pcphNMFEzzajMKFy+hBL9fWBGIcMucVT0/VGvFaDHL78RDhCgPr0J2i8CAo0?=
 =?us-ascii?Q?7yabIOw5DKSxElShcXy24FhhWGP73ScoicajqYUxiGGIlZuo8I6Lq2nE6l6m?=
 =?us-ascii?Q?U3r0s++WYVHrIeaogQBFZGJkyUu4avliK+/gik5BnAL1hLeTLRFS5R7c1EBm?=
 =?us-ascii?Q?jFKcsW19GYOZ05vmrm1qfa9uu+4MSM31LK+JDfyjFP7rfLygFroLCMentvuM?=
 =?us-ascii?Q?teS5hWFUj9CmR89uD7cfhviR7ZVoTSI0PFIKbYIv7yNFFdMz+uU/fROX1+Qs?=
 =?us-ascii?Q?rfR5YB8VJLBOsgomzA7ABPNEcHDURNfUV0KMZ/LJTe1n+gN0naszo4226k6D?=
 =?us-ascii?Q?/+Sj7JAjnQKSdgu4VaKIEM4WBeZoIAu64k2gEToS2CSm8dTHQJzJN/bslc+2?=
 =?us-ascii?Q?XFrGu9WLmoX+wDJaejPPSRecnKrNfZ5Ql2suyXyeGnK6/qF1KS6yWMlDiyyy?=
 =?us-ascii?Q?WRDjQFfn7FEU8/TOItHRixuGOEHlqib39sjhQawwK/sHKDEk+ci6aSnJ6RS3?=
 =?us-ascii?Q?Cz/zt6eFYEClgCq5qdJn8BQXSpV5wldShEFeJ1vKLwYyPrRMRTgCS281XvK3?=
 =?us-ascii?Q?9h2syqJPHKUaoN0SS2D4GmpNn5/tGRDB3i6q4JjeKM8pZPTFdLCLktXC3PYH?=
 =?us-ascii?Q?fbWho1PFuk31iQ2ErZtjQKy/r78iF1pkxLPNf5iJEpRF+Yb6CCttGAA3xLt9?=
 =?us-ascii?Q?sw249QHRO93yyCPuW8sathkVsioFAI8sRHWu0theToeDuZOXWm8UIephI2FQ?=
 =?us-ascii?Q?377K1ieiJwrnRPqY2RDKUwEsTalSTxux4HsjTEyq7Fo4J46ds2NzUx+XpFfk?=
 =?us-ascii?Q?jeCOeR4VZyO520/9NtI6oz1VDJgxWWGhmd87KUgock/IQ4mwjKtCdMahtwet?=
 =?us-ascii?Q?Nyhj01AqG6raAnQnsOmJaHHahhkuGPa9bUKGzdhf4IEDD4tBM38+jL9qDTrm?=
 =?us-ascii?Q?TQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 794075d0-8dd4-44e4-cc2b-08db73324e3e
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2023 15:06:50.3005 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OkpFLg1FSlZ/r0MwvUPTBB+1Y5YQVqQ0rFaVer1/nPXk5O7Bqq9P3km5A68Pa9w38NawcRus6fsvGpRJbhGomoy0dqKKvye4Lswyc0pFHDk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5313
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v5 1/3] drm/xe: Document structures for
 device query
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

On Thu, Jun 22, 2023 at 12:39:44PM +0000, Francois Dugast wrote:
>This adds documentation to the various structures used to query
>memory, GTs, topology, engines, and so on. It includes a functional
>code snippet to query engines.
>
>v2:
>  - Rebase on drm-xe-next
>  - Also document structures related to drm_xe_device_query, changed
>    pseudo code to snippet (Lucas De Marchi)
>v3:
>  - Move changelog to commit
>  - Fix warnings showed only using dim checkpath
>
>Reported-by: Oded Gabbay <ogabbay@kernel.org>
>Link: https://lists.freedesktop.org/archives/intel-xe/2023-May/004704.html
>Signed-off-by: Francois Dugast <francois.dugast@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi

>---
> include/uapi/drm/xe_drm.h | 75 +++++++++++++++++++++++++++++++++++++++
> 1 file changed, 75 insertions(+)
>
>diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>index 9bdea8b81435..9421e144005d 100644
>--- a/include/uapi/drm/xe_drm.h
>+++ b/include/uapi/drm/xe_drm.h
>@@ -119,8 +119,18 @@ struct xe_user_extension {
> #define XE_MEM_REGION_CLASS_SYSMEM	0
> #define XE_MEM_REGION_CLASS_VRAM	1
>
>+/**
>+ * struct drm_xe_query_mem_usage - describe memory regions and usage
>+ *
>+ * If a query is made with a struct drm_xe_device_query where .query
>+ * is equal to DRM_XE_DEVICE_QUERY_MEM_USAGE, then the reply uses
>+ * struct drm_xe_query_mem_usage in .data.
>+ */
> struct drm_xe_query_mem_usage {
>+	/** @num_params: number of memory regions returned in regions */
> 	__u32 num_regions;
>+
>+	/** @pad: MBZ */
> 	__u32 pad;
>
> 	struct drm_xe_query_mem_region {
>@@ -135,9 +145,20 @@ struct drm_xe_query_mem_usage {
> 	} regions[];
> };
>
>+/**
>+ * struct drm_xe_query_config - describe the device configuration
>+ *
>+ * If a query is made with a struct drm_xe_device_query where .query
>+ * is equal to DRM_XE_DEVICE_QUERY_CONFIG, then the reply uses
>+ * struct drm_xe_query_config in .data.
>+ */
> struct drm_xe_query_config {
>+	/** @num_params: number of parameters returned in info */
> 	__u32 num_params;
>+
>+	/** @pad: MBZ */
> 	__u32 pad;
>+
> #define XE_QUERY_CONFIG_REV_AND_DEVICE_ID	0
> #define XE_QUERY_CONFIG_FLAGS			1
> 	#define XE_QUERY_CONFIG_FLAGS_HAS_VRAM		(0x1 << 0)
>@@ -148,11 +169,22 @@ struct drm_xe_query_config {
> #define XE_QUERY_CONFIG_MEM_REGION_COUNT	5
> #define XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY	6
> #define XE_QUERY_CONFIG_NUM_PARAM		(XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY + 1)
>+	/** @info: array of elements containing the config info */
> 	__u64 info[];
> };
>
>+/**
>+ * struct drm_xe_query_gts - describe GTs
>+ *
>+ * If a query is made with a struct drm_xe_device_query where .query
>+ * is equal to DRM_XE_DEVICE_QUERY_GTS, then the reply uses struct
>+ * drm_xe_query_gts in .data.
>+ */
> struct drm_xe_query_gts {
>+	/** @num_gt: number of GTs returned in gts */
> 	__u32 num_gt;
>+
>+	/** @pad: MBZ */
> 	__u32 pad;
>
> 	/*
>@@ -175,6 +207,13 @@ struct drm_xe_query_gts {
> 	} gts[];
> };
>
>+/**
>+ * struct drm_xe_query_topology_mask - describe the topology mask of a GT
>+ *
>+ * If a query is made with a struct drm_xe_device_query where .query
>+ * is equal to DRM_XE_DEVICE_QUERY_GT_TOPOLOGY, then the reply uses
>+ * struct drm_xe_query_topology_mask in .data.
>+ */
> struct drm_xe_query_topology_mask {
> 	/** @gt_id: GT ID the mask is associated with */
> 	__u16 gt_id;
>@@ -192,6 +231,41 @@ struct drm_xe_query_topology_mask {
> 	__u8 mask[];
> };
>
>+/**
>+ * struct drm_xe_device_query - main structure to query device information
>+ *
>+ * If size is set to 0, the driver fills it with the required size for the
>+ * requested type of data to query. If size is equal to the required size,
>+ * the queried information is copied into data.
>+ *
>+ * For example the following code snippet allows retrieving and printing
>+ * information about the device engines with DRM_XE_DEVICE_QUERY_ENGINES:
>+ *
>+ * .. code-block:: C
>+ *
>+ *	struct drm_xe_engine_class_instance *hwe;
>+ *	struct drm_xe_device_query query = {
>+ *		.extensions = 0,
>+ *		.query = DRM_XE_DEVICE_QUERY_ENGINES,
>+ *		.size = 0,
>+ *		.data = 0,
>+ *	};
>+ *	ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query);
>+ *	hwe = malloc(query.size);
>+ *	query.data = (uintptr_t)hwe;
>+ *	ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query);
>+ *	int num_engines = query.size / sizeof(*hwe);
>+ *	for (int i = 0; i < num_engines; i++) {
>+ *		printf("Engine %d: %s\n", i,
>+ *			hwe[i].engine_class == DRM_XE_ENGINE_CLASS_RENDER ? "RENDER":
>+ *			hwe[i].engine_class == DRM_XE_ENGINE_CLASS_COPY ? "COPY":
>+ *			hwe[i].engine_class == DRM_XE_ENGINE_CLASS_VIDEO_DECODE ? "VIDEO_DECODE":
>+ *			hwe[i].engine_class == DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE ? "VIDEO_ENHANCE":
>+ *			hwe[i].engine_class == DRM_XE_ENGINE_CLASS_COMPUTE ? "COMPUTE":
>+ *			"UNKNOWN");
>+ *	}
>+ *	free(hwe);
>+ */
> struct drm_xe_device_query {
> 	/** @extensions: Pointer to the first extension struct, if any */
> 	__u64 extensions;
>@@ -526,6 +600,7 @@ struct drm_xe_engine_set_property {
> 	__u64 reserved[2];
> };
>
>+/** struct drm_xe_engine_class_instance - instance of an engine class */
> struct drm_xe_engine_class_instance {
> 	__u16 engine_class;
>
>-- 
>2.34.1
>
