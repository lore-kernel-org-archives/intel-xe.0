Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 872B2E77354
	for <intel-xe@archiver.kernel.org>; Sat, 30 Sep 2023 05:53:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CD4210E1BC;
	Sat, 30 Sep 2023 05:53:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7903910E1BC
 for <intel-xe@lists.freedesktop.org>; Sat, 30 Sep 2023 05:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696053198; x=1727589198;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2pp9S1meFpCiFExPnk4hAPjp/99QZOsyZWmURJGIlug=;
 b=NwtkfqHO0MbEzrgoGmPPd/Q7koAo+a365BVqxMR0riW+Ta3wvf+d2tpk
 V3bzfzpmvDcjHKR6A80bYZhuZzsg8t51KIWHJu/rNy7cVG6/3mTJW0kI/
 gmdT0QjZmT+8pcAR74ekONn2dvU08G1WR11IppEJIhZM3BRnvUZZ/f4vJ
 U+cq+ZKcEyR3kbd1B0dl51Gp51nY+/Iy25jYk4E735wt4+fYs0Dn+1NfB
 +5rEY7NVxX3VPXnZzJbkWm03dAJwThUl9kz72u7QuKpuUvMDWvvydjyD5
 664BJWNdavQi/gx1BKj3jYfLLKznOTSJyJbwU8OFANI48mJOCQOhOsoxG w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="448916845"
X-IronPort-AV: E=Sophos;i="6.03,189,1694761200"; d="scan'208";a="448916845"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2023 22:53:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="820381445"
X-IronPort-AV: E=Sophos;i="6.03,189,1694761200"; d="scan'208";a="820381445"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Sep 2023 22:53:17 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 29 Sep 2023 22:53:17 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 29 Sep 2023 22:53:17 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 29 Sep 2023 22:53:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S7h29KlTRC1d0oNUpsN+Ln8OCe6Cho6t9SCAsceXbHc/GdoTxR2pUo7a6RZlOly/ZytTOsftvEu4mx8Flt2BHNVIcXLPfhoPN7xpa2z9sv0EO/ONxZsUUfLCIctLJgpPn07ICEeXvijusK+p4qtIAvebWxrokGlEXowox7BEuwYKgrxqeFc1d9J5j9n8HwZSq3StGP30ANaRXSJWpxlp1iyxMKNDzT78nWzJ6wxjiv9ecFJEfH1tNteKPvUpXkcY+E8GMv5AC+c89mrpT7XlgjogWgy9nLu7MVpi1xQ/dE7FVztpVSiSmqT/J2d3DUzna0FZE933nEsXg8rFIN1MEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MTgsjs6/qwUbk5lCitRw2bp9gSC2VjKgJOZVXDJZb1E=;
 b=OejHYZSiWP39Dq5GURHGPDuJsyCiWHZ3AE2ydQb+rvmBt/rj0Y9PpOgU5k0JJ1S3U6KT9sIa78sbMb11b9PcX3Wa72xMP3ZXuC/ELZ/+VRLarQ5Or8YPiQbgESZ7xi+Jk6HlpZY/E7GBqwamRSsH3QneSTn5oezLvslMPenNaOrgN0msHowVJhmzSTdo+QCYDwiJUZ6ZCEviz4lkp16L0zOmidnM5ZlJx6gOqW0dirPNttKKcc/vwFS2tj033pO5GmiJuhLlj8VUDFxi0xbmWkMrZpo/OhKYeVnnf9UB3eJie/TqckIzJD073NwUGiuaU5JT4WU+Qiyiqt0GCUyS0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by PH7PR11MB7572.namprd11.prod.outlook.com (2603:10b6:510:27b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.22; Sat, 30 Sep
 2023 05:53:13 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::4182:281:404a:1042]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::4182:281:404a:1042%3]) with mapi id 15.20.6813.017; Sat, 30 Sep 2023
 05:53:12 +0000
Date: Fri, 29 Sep 2023 22:53:05 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
Message-ID: <ZRe3wZQzajycq9vR@nvishwa1-DESK>
References: <20230929062420.394375-1-tejas.upadhyay@intel.com>
 <20230929062420.394375-2-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230929062420.394375-2-tejas.upadhyay@intel.com>
X-ClientProxiedBy: BY5PR20CA0021.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::34) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|PH7PR11MB7572:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b77040f-2e97-41e1-35a8-08dbc179881f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e9V2OHNYBGJayUbVv4X5X9390LP0TSshwJm63f2hzi/sFXqX4EikkenMTTvXhnokAUmORWPI3GSWPyTk14fRNsBlbnFRZcgEC9JU9h/0Ita49aM+A6q1vdCyTg7FP5CbkcUa62P9XO47quuFwWEr25Lm3mNiWsh3U3F+XFVHXBNPZNVLW3uB1Ryws29vuFKS6czh2qda94928FovYxiPCSTnLxi6/q44w/CA1oqjoze6BB2F+GNNawnhS0CwJgggb7v7WnMhVN3Fw0mAAWjA68h4J9eRBEQCbSCbDw33zZIOnpTGXmtrOaVzeW08m4WdpyMvMqkMQZhdtWlhJVQjOvF6HKjM4CsntsTpwYTyHQBeU4UByKzv7m89C1VYOUKST74d8uxQuU9ECb+c4nHfJfuKWqcm3xsU9oyasns6716wcqQu+aGI2OG7UE/PbAaR1PRs1zmZAQgFJQ+mFPbDFDyY8jGLnVtHvLpisRpNfCjhFXtuM+582tHOSy3Q+DDTn8eo3Tnm+u8MWa/OZO6tvZYQr8kVa+GO7x19hPSmbGHgBl4ScoR2itmzXFLPEsh2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(366004)(230922051799003)(1800799009)(186009)(451199024)(6512007)(9686003)(6636002)(66476007)(66556008)(66946007)(26005)(44832011)(38100700002)(82960400001)(86362001)(33716001)(107886003)(5660300002)(2906002)(4326008)(6862004)(8676002)(8936002)(6666004)(6506007)(508600001)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hBGtdPNddcOjBVoY/VmRGLgT/gjKDlTh+Y4F0BBwEej37gXkQy3iyFTAYlcb?=
 =?us-ascii?Q?V7dBovbFq4tfDFjSOoYiawEcr9p395lViaCR3GRwKAFq6PYtrd30xaztrDO9?=
 =?us-ascii?Q?teIyzl3D/meOjCQlp8lfwfPBSvefBa/dU1G/WBrewS8F/yG+j+UQPP/kU+nA?=
 =?us-ascii?Q?DCeW3xXd8a6L3XOIWiGPVySY9W7btpBF6i/H7bBg1dYM7IqJ4+7PgkuL3rJk?=
 =?us-ascii?Q?NpkVoWiFGBlaBQGgA4rhTAo960ZhYHo8v0pqshD3/KnoJnQl37SHPoi0siO5?=
 =?us-ascii?Q?0NsX+a81EpCV067bXkgClB8G94wHmFpGyfzMkD1fDd3lqfL4ixVh9Gp/hd5/?=
 =?us-ascii?Q?KmzlBCxntBQ8hVKBOGt6Y134RbI7OXQ8mRkyd3zVJAzVcP1ysXpvEXAKGDQP?=
 =?us-ascii?Q?dP5jt2QBFGOd84/jZ2dsZKmurdYlHx6Q4hu9uAuPoZg2xRN0CfXqwUDeHyaB?=
 =?us-ascii?Q?uoyiZBnpoJIyEOg8x0h4IMwqbOEo1910lHSuhQeKfRh971RhmRyyiyjzQ88P?=
 =?us-ascii?Q?wCiUMg4zKOW4zZkSgCs2Xi19aHmnwBstrgeaHE/O6aDiiMqAouvEY9AqhWBP?=
 =?us-ascii?Q?/i38YIn5+J3jl2Fajr87aSchRMJ616VkDRvq3vTM6MSA6f6AAAI7PGyIuXKM?=
 =?us-ascii?Q?N96O64h7IJ1mrhuPehCa9aEQWcZofOU4RjXqoHCXpgY/ZxWR5ModPZnzbekT?=
 =?us-ascii?Q?K622hNhl9xqquh0uMPSQ5/bl5l1TNnGpmRPENHOEy0iSVZ7IDLLEIVGsacVA?=
 =?us-ascii?Q?xDbeKM08vhPPKZfRQpW7zIm6GcVj6u27c5GIsfuP+8leYUbtAJg10HjO/jUF?=
 =?us-ascii?Q?2sYusWTC0mpdfAG25/Lgoz78O+X3Vxk+dia8wNro+TZBUcey1dwIeeMXoDul?=
 =?us-ascii?Q?8TqHu87LB4TojYaWVIzOFSqPNo0f7C7Z23sMSAWrkGNIqSzfXflklPtmGF+U?=
 =?us-ascii?Q?vk/nuA7uB6lMRHzwm8dUjWUqhhtOD41y4AT2hxHTnQAZxyIAF8kWbc8yUh7M?=
 =?us-ascii?Q?r5TSddZsx7rXKByIWo8TST9XzOiOHr0fIePqGwLNKOtdqa0GbLfdFL20iB0m?=
 =?us-ascii?Q?CTw82NLmm2OPfUqRpfZRtyqqVfm2dDdNdOEm/kbVd0efG0FJq+RttqBQSAVM?=
 =?us-ascii?Q?GTdQDLcM7a+VXsp1caJ8Pwv+xJBZmuIyocQaV0c4ZkJHktotKd5g9xEWFLNM?=
 =?us-ascii?Q?VQhjuEX0xHNAxc9LeUKixRWzyFnCUCRUcMjOxV8NUvWvCm9ct0ng5tD9hTiE?=
 =?us-ascii?Q?FPs6IOkUeYCpgPoI/N1Ezlqn/64nDeA+U+9Eu3MMMPFxGkZxymS3G9XnX3zf?=
 =?us-ascii?Q?Dxpq1IpRdwh1uuEpfzg4DZwapvAWT1wzZvzCK84MMsohNkF+l6hgIMfLlOae?=
 =?us-ascii?Q?jPcg9A1YhXOUJToBD8tlDX/ayVLX4Tjm7EmBSPvNkl9fOzrcz0lXx3vAIb23?=
 =?us-ascii?Q?SFl+VjFMb5bLSkHQkZEI0SvzhI4UI7TxaTuE4GdjUi0aaqtUrS6PzA5qaKV+?=
 =?us-ascii?Q?J2l6rnRVAa/9w8QzyTD+PVuj1aUuhpjVWUVkyCUUWzLBv0gV8zNJB4SgnAwR?=
 =?us-ascii?Q?rkatushxz6JS/gsuuHbjvYfFpWZaBUQD9KSRzqrcnWZzhrKYXJzl0fe0Hhrq?=
 =?us-ascii?Q?Gm+IgDpXcj0iqZDsHvreQJg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b77040f-2e97-41e1-35a8-08dbc179881f
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2023 05:53:12.5730 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8z1WdVXrw51w/1qat9CZcEL8CnKqLJZfEAkD+5ArwXPeF0AJkjxzyc4GPJm9l2cBpBB483Qn64C92cSm705N6Spn19ZFDpv2abW5Q3xxfNHedpGbDtA5MIH9U6iz09f1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7572
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH V5 1/2] drm/xe: Introduce low level driver
 error counting APIs
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
Cc: Roper@freedesktop.org, Matthew D <matthew.d.roper@intel.com>,
 intel-xe@lists.freedesktop.org, Wajdeczko@freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Sep 29, 2023 at 11:54:19AM +0530, Tejas Upadhyay wrote:
>Low level driver error that might have power or performance
>impact on the system, we are adding a new error counter to GT
>and tile and increment on each occurrance. Lets introduce APIs
>to define and increment each error type counter.
>
>V4:
>  - Move API declaration under tile.h - Jani
>  - Typos
>V3:
>  - correct #define max value
>V2:
>  - Move some code to its related patch - Michal
>  - Renaming if API and enum - Michal
>  - GUC errors are moved per GT - Michal
>  - Some nits - Michal
>
>Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
>---
> drivers/gpu/drm/xe/xe_device_types.h |  9 +++++++++
> drivers/gpu/drm/xe/xe_gt.c           | 18 ++++++++++++++++++
> drivers/gpu/drm/xe/xe_gt.h           |  3 +++
> drivers/gpu/drm/xe/xe_gt_types.h     | 10 ++++++++++
> drivers/gpu/drm/xe/xe_tile.c         | 18 ++++++++++++++++++
> drivers/gpu/drm/xe/xe_tile.h         |  2 ++
> 6 files changed, 60 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>index 0717839ae964..dc57b38d7e63 100644
>--- a/drivers/gpu/drm/xe/xe_device_types.h
>+++ b/drivers/gpu/drm/xe/xe_device_types.h
>@@ -59,6 +59,12 @@ struct xe_pat_ops;
> 		 const struct xe_tile * : (const struct xe_device *)((tile__)->xe),	\
> 		 struct xe_tile * : (tile__)->xe)
>
>+#define XE_TILE_DRV_ERR_MAX	2
>+enum xe_tile_drv_err_type {
>+	XE_TILE_DRV_ERR_GGTT,
>+	XE_TILE_DRV_ERR_INTR

We can add XE_TILE_DRV_ERR_MAX here instead of the #define above.

>+};
>+
> /**
>  * struct xe_mem_region - memory region structure
>  * This is used to describe a memory region in xe
>@@ -175,6 +181,9 @@ struct xe_tile {
>
> 	/** @sysfs: sysfs' kobj used by xe_tile_sysfs */
> 	struct kobject *sysfs;
>+
>+	/** @drv_err_cnt: driver error counter for this tile */
>+	u32 drv_err_cnt[XE_TILE_DRV_ERR_MAX];

Should these counters need to get reset to 0 upon tile/gt reset?
Should it be put under CONFIG_DRM_XE_DEBUG or define new debug
config?

> };
>
> /**
>diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>index 68cd9a7ee087..a8b5f012588b 100644
>--- a/drivers/gpu/drm/xe/xe_gt.c
>+++ b/drivers/gpu/drm/xe/xe_gt.c
>@@ -47,6 +47,24 @@
> #include "xe_wa.h"
> #include "xe_wopcm.h"
>
>+/**
>+ * xe_gt_report_driver_error - Count driver error for gt
>+ * @gt: GT to count error for
>+ * @err: enum error type
>+ *
>+ * Increment the driver error counter in respective error
>+ * category for this GT.
>+ *
>+ * Returns void.
>+ */
>+void xe_gt_report_driver_error(struct xe_gt *gt,
>+			       const enum xe_gt_drv_err_type err)
>+{
>+	xe_gt_assert(gt, err >= ARRAY_SIZE(gt->drv_err_cnt));
>+	WRITE_ONCE(gt->drv_err_cnt[err],
>+		   READ_ONCE(gt->drv_err_cnt[err]) + 1);
>+}

Same as above.

>+
> struct xe_gt *xe_gt_alloc(struct xe_tile *tile)
> {
> 	struct xe_gt *gt;
>diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
>index caded203a8a0..9442d615042f 100644
>--- a/drivers/gpu/drm/xe/xe_gt.h
>+++ b/drivers/gpu/drm/xe/xe_gt.h
>@@ -67,4 +67,7 @@ static inline bool xe_gt_is_usm_hwe(struct xe_gt *gt, struct xe_hw_engine *hwe)
> 		hwe->instance == gt->usm.reserved_bcs_instance;
> }
>
>+void xe_gt_report_driver_error(struct xe_gt *gt,
>+			       const enum xe_gt_drv_err_type err);
>+
> #endif
>diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
>index d4310be3e1e7..4645ea9b7893 100644
>--- a/drivers/gpu/drm/xe/xe_gt_types.h
>+++ b/drivers/gpu/drm/xe/xe_gt_types.h
>@@ -24,6 +24,13 @@ enum xe_gt_type {
> 	XE_GT_TYPE_MEDIA,
> };
>
>+#define XE_GT_DRV_ERR_MAX	3
>+enum xe_gt_drv_err_type {
>+	XE_GT_DRV_ERR_GUC_COMM,
>+	XE_GT_DRV_ERR_ENGINE,
>+	XE_GT_DRV_ERR_OTHERS

We can add XE_GT_DRV_ERR_MAX here instead of the #define above.

>+};
>+
> #define XE_MAX_DSS_FUSE_REGS	3
> #define XE_MAX_EU_FUSE_REGS	1
>
>@@ -347,6 +354,9 @@ struct xe_gt {
> 		/** @oob: bitmap with active OOB workaroudns */
> 		unsigned long *oob;
> 	} wa_active;
>+
>+	/** @drv_err_cnt: driver error counter for this GT */
>+	u32 drv_err_cnt[XE_GT_DRV_ERR_MAX];
> };
>
> #endif
>diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
>index 131752a57f65..708dd385f2b1 100644
>--- a/drivers/gpu/drm/xe/xe_tile.c
>+++ b/drivers/gpu/drm/xe/xe_tile.c
>@@ -71,6 +71,24 @@
>  *  - MOCS and PAT programming
>  */
>
>+/**
>+ * xe_tile_report_driver_error - Count driver error for tile
>+ * @tile: Tile to count error for
>+ * @err: enum error type
>+ *
>+ * Increment the driver error counter in respective error
>+ * category for this tile.
>+ *
>+ * Returns void.
>+ */
>+void xe_tile_report_driver_error(struct xe_tile *tile,
>+				 const enum xe_tile_drv_err_type err)
>+{
>+	xe_assert(tile_to_xe(tile), err >= ARRAY_SIZE(tile->drv_err_cnt));
>+	WRITE_ONCE(tile->drv_err_cnt[err],
>+		   READ_ONCE(tile->drv_err_cnt[err]) + 1);
>+}

Same as above.

Niranjana

>+
> /**
>  * xe_tile_alloc - Perform per-tile memory allocation
>  * @tile: Tile to perform allocations for
>diff --git a/drivers/gpu/drm/xe/xe_tile.h b/drivers/gpu/drm/xe/xe_tile.h
>index 782c47f8bd45..092a6b17a97e 100644
>--- a/drivers/gpu/drm/xe/xe_tile.h
>+++ b/drivers/gpu/drm/xe/xe_tile.h
>@@ -14,5 +14,7 @@ int xe_tile_alloc(struct xe_tile *tile);
> int xe_tile_init_noalloc(struct xe_tile *tile);
>
> void xe_tile_migrate_wait(struct xe_tile *tile);
>+void xe_tile_report_driver_error(struct xe_tile *tile,
>+				 const enum xe_tile_drv_err_type err);
>
> #endif
>-- 
>2.25.1
>
