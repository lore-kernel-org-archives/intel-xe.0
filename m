Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1EF3C001DD
	for <intel-xe@archiver.kernel.org>; Fri, 14 Jul 2023 14:51:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ACAC10E8B1;
	Fri, 14 Jul 2023 14:51:52 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 805BD10E8B1
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Jul 2023 14:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689346310; x=1720882310;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=NZrmeoQR+CwLV4/a2C+hr3kqxDWhIfnyCprJCINEW3Q=;
 b=jEuKW1/xo9mImbSzi2aJ0XxdqT7dcBA86RN+P3ISLzB8ACqJutZC+5a4
 /FreNxFZDJsstisSiw06/ERB1pbpy8DvG50BMHP3nNaikRY/Z3LWAoEk8
 I5lUSlZMQBxfN6fPM1mm7QZ0l+TXQLSLYr5UsBPovTS27eYTClYX5EZEk
 E01uZlpHDb7IwZ0Ky4a8WTSIFa5j5fFOP4lw9FtXzl4ymhIIl8D0hDIv1
 OhiFJBVU6A+OBg6uWgvO98h62LubOaZPzHXv8I4cEUQyYpUy8eKUKtOny
 Ma2xEUOA2quZBRqqt7LctFIW5+psUVhr1TBG+JJTLBbWAndh9EQ1VW5Qf g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10771"; a="345803402"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200"; d="scan'208";a="345803402"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2023 07:51:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10771"; a="1053088256"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200"; d="scan'208";a="1053088256"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga005.fm.intel.com with ESMTP; 14 Jul 2023 07:51:47 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 14 Jul 2023 07:51:47 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 14 Jul 2023 07:51:46 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 14 Jul 2023 07:51:46 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 14 Jul 2023 07:51:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Im3SV/og6+r0O0pNB5Sw/4/VviSvO1/5CIT2teciH7Q6oj0EfqsbwCTpCJu4kVbZL/kk48XLRwd8Q4Kgr7zuYn7xC/xHKDv8er60N9oV95k3FhFZs51odvlTk4z7zRyMPSd3+5pACyuJvt1VfdhB8t6dXX7qA061mNPA3NCZe3eAVkPa7j8i9bZZ6GtqBO9CX8o5kbw9YcLbztN+BLAK/CegE023+069KNAEKTM6Xswjnn707c4AOhDOnWYipLTO9C1yKdiyN3g53UUJWCNvdGr8CpnppXc9zwUuYBg08COrunV1Ma/qWXQmfTVpLX8r1S6Pl22w2/KNIzkX30/kaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UJKuvIWnl/cdzpMDqh0lPPKaOhqW3g7qGd/PjQieyzk=;
 b=X2voVFWbhl9bdnrr82hiuI4SSQ2WblcPvs1HVXmdP14IwtjguhExnqfi5kZargwjjIjkhbQlrJrSXJRjB61Ca2Qw7fEzK7bVsUMmJOET/zoueYlFpPn/eXTxzX/8+5bkoA45mc8M+lPywWlOszS7cqAdeNmJ1Mp72soCNen2P9pip3yidoZF/muG+ux/x/JW8OGPTzdl1fo+qel2MHDFxUOURswGAw+oGMUJ/71bxhtJ2VhAEUfZRqnuXhQomWdHG0DmUDzdd3veuytcmx5URsYHQeWS0T1EQN6NE8K24lw5Lwn0ga58rCgF/OtAodTsd6Xqeky7cH68bp1c1LjYdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB8667.namprd11.prod.outlook.com (2603:10b6:8:1b3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.27; Fri, 14 Jul
 2023 14:51:44 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::c65d:c846:f197:3ca5]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::c65d:c846:f197:3ca5%4]) with mapi id 15.20.6565.028; Fri, 14 Jul 2023
 14:51:44 +0000
Date: Fri, 14 Jul 2023 14:50:54 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Message-ID: <ZLFgzlrwopNGvwKl@DUT025-TGLU>
References: <20230713150611.7-1-francois.dugast@intel.com>
 <20230713150611.7-2-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230713150611.7-2-francois.dugast@intel.com>
X-ClientProxiedBy: SJ0PR05CA0030.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::35) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB8667:EE_
X-MS-Office365-Filtering-Correlation-Id: 95a31c15-3544-4a53-9e47-08db8479d73d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HakxF2kZwkaV63+8DBz5XZrQUQckmE7089VKvzxocPfuW8OAz2a59J/TE5NrmZ9ZJcX2rxSKOZzles6jIREr5r1nJp6CqXfmKE6efJxcca8DSkyWeL/6coJNFBFL+Qp4B66kVIR/QGEsYZ2U7JKd4/qfk4Cjv+F72bJv4zrSX2nzNqFNYJXU3C+NRLmZtrWkj5jsiN11NdFmwaKBip4Vry7xrYalh3fGWY5VuFkj78qTXJ5QGOidxrMMeCLD5fhdqisPsu8uZv3HoaabvsOcDWBZILSpCahhjknGfqTi5nanCA8jWLC859LSVeAjrGSRkDAKO8wMTScsdcHHsych2ckcXyqaOq8FGsBFi588X3YKKIO5bwHYEcIUNmdkFnZCyRTyP6+YcP6ysz7vtqFVZE4IRhsezSlx/4WEcZhCWN9ecr5W3ZPKf4/jBY5n0l8mSJwYFI8yk2M5l+fNOFDw1JwWWH8gaqKIS3iyqUF6MF/SoDHfuTeQt37Qat8x5tUbZt3WAqYWuea6frDDriY0W0MEhd4SnYnUeK+OuI6gc6pz5AAmyN3kRkS0XhgYnbmn
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(376002)(346002)(136003)(366004)(39860400002)(396003)(451199021)(41300700001)(44832011)(66476007)(4326008)(66946007)(6636002)(66556008)(478600001)(5660300002)(6862004)(2906002)(8936002)(8676002)(316002)(6666004)(6486002)(6512007)(82960400001)(26005)(9686003)(6506007)(86362001)(186003)(83380400001)(38100700002)(33716001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0ujX7KmekLpJgCNf3umYNAFOC0KmnR7AO1KEzoJZty9mT1D84KMpIfISzhhY?=
 =?us-ascii?Q?ejQuyUvkytV/ApJjTJxViqqMb2LKTgVqhB3669NAMuZg+MnO/P0NXUDCDQ4u?=
 =?us-ascii?Q?Hh/rUrkOjcrG2iedfdkxpiI92nEV0HdO6gMZ1ct9LNaIKMABoMjGQkeU5Iay?=
 =?us-ascii?Q?t9qQTyWfb05DiIHMfzAoeTJYXpvOOFZsc7QsHSO2J3NilFDHCv6iWiyTRYI7?=
 =?us-ascii?Q?UxegkDGh8CwSupVjrXBWER11hT6W7Vm2W0Juv9bMisOtaRkUrtMBVq2N9/sv?=
 =?us-ascii?Q?6KBtuNtZcWoiQ8KZp1z/tzUGnXACuPVR2V+VzBBkMJ/1nMPryszjjhTwaPyG?=
 =?us-ascii?Q?1u8Qi+dce6STE9rVqkligkxVf1Z3hJJAxPt0rKL4sGZ8Yu0G+14HHOa0jiWa?=
 =?us-ascii?Q?Z3qh48cX10ObS1pxtivhkdj9zsiNeMyGZwowl4froluRSVdfABCJ8Br2we99?=
 =?us-ascii?Q?r36LuwZ3UDeDTS7bF4kDlEBnen0AYwpl0gLIQaDKikgM9KThRKwT5rEkNxiW?=
 =?us-ascii?Q?WbEib2XGe1xo/P+m8oxGGe7MiQ0RNCir+KpsZoYWl0NYIJ0KOflOiP4bETEI?=
 =?us-ascii?Q?hI1YxAlSUcskzsXI3NTSjxRniuAdWFJka3axmIOWUzH2YEW/YWMC0vdOEPAx?=
 =?us-ascii?Q?hMoKA2xp28eek3O23UtoeDm4GqEhBGeFKtPhGk6DV4q8ceMQG1H0ygPzhtwS?=
 =?us-ascii?Q?+Y0adoiOg1V3sd+5kvhWSLaxbQ2PnzjXUb6Tosb13aK8OCcaS0xuBozYFoCC?=
 =?us-ascii?Q?ae/PqBlIH2ELV9E//vXLyAP3b3S6lnWhb1o2lTOjNbbm69CqalypwivGdn2i?=
 =?us-ascii?Q?ypykKahq49iwM1JK0MFqVcuGTsXawx+qETD6eWE0FnzFKl2tEum4YP7ISFWe?=
 =?us-ascii?Q?IRgr2/CddoXcQeuxcFCDNllyyAvSexIFA5UvegChJUYb814vWqmNninHNIqR?=
 =?us-ascii?Q?b1qqwi3VRsDOFqVdHCwO/7zKhMXHpCTVPyIBACZs3SlUSUA4fGgUBTv8nnC4?=
 =?us-ascii?Q?s4o60Fi1TPh4aIi+DvM7ZGVQf/SiTskdaVABwniQVlOM0YrZQ0TROm6olxr8?=
 =?us-ascii?Q?nXH/kcZWf/2l60QUxgPatY5t7RYlbLQs1BVsvlOvC7b9ltpjUXKXbc2BQkyi?=
 =?us-ascii?Q?fFixdiAbLXwIjyjGbsiBNrLSeC7gRkBP1XKGWYCIUVappzzbz20EJZTxcLiA?=
 =?us-ascii?Q?lQUfEDRAyuwjjyBNL2n2FRIwLEf3KkSFHxxkBpUbIEuTYFuOX05Q6qwY4Dwv?=
 =?us-ascii?Q?dKHFQ8+IEaR2H9Jlgi92+BkE7gQYzayRzTqlz6CrSICbwiqgT0dKCiytHzPA?=
 =?us-ascii?Q?MW+F183nrC9aKTI+dWdfrKiMq8+U/jTfcGgBWOK2RetAkaQm6PGkHOjTTcKt?=
 =?us-ascii?Q?PANxKsqge5vyJR+TJERFTuaUBwPgmJltBRD6i/xIciLBmJ1GOBkwH2ADzH3X?=
 =?us-ascii?Q?9dWX+v10wTUpLa/BnMl8SKy4vWE1YYQjksFlWMZhKCDc2BgdGRy5+/VhL+pQ?=
 =?us-ascii?Q?PHxWjUGsltU4VhTxLZiJOOTODqadrSVArI/SchexuBnJ+K75/kvoNn83zOI1?=
 =?us-ascii?Q?kOyP2bKmjsk7feUB+4ITKEMBMUYqDdmmtMFEVperrHCN/hKd76HLghb06Lrs?=
 =?us-ascii?Q?QQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 95a31c15-3544-4a53-9e47-08db8479d73d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2023 14:51:44.1571 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fY7SUbW3nTEThwQX5Sm7zUePG4bjEvPxsGlqbSA/u+ueEgrnnzzYrfGOBy63hXYDGwxMaEBBKBYbPZ152hh2hA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8667
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/7] drm/xe: Cleanup SPACING style issues
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

On Thu, Jul 13, 2023 at 03:06:05PM +0000, Francois Dugast wrote:
> Remove almost all existing style issues of type SPACING reported
> by checkpatch.
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h |  4 ++--
>  drivers/gpu/drm/xe/xe_device.h                    |  4 ++--
>  drivers/gpu/drm/xe/xe_device_types.h              |  4 ++--
>  drivers/gpu/drm/xe/xe_force_wake.c                |  2 +-
>  drivers/gpu/drm/xe/xe_gt.h                        |  2 +-
>  drivers/gpu/drm/xe/xe_gt_clock.c                  |  8 ++++----
>  drivers/gpu/drm/xe/xe_gt_types.h                  |  8 ++++----
>  drivers/gpu/drm/xe/xe_rtp.h                       |  4 ++--
>  drivers/gpu/drm/xe/xe_rtp_helpers.h               | 10 +++++-----
>  drivers/gpu/drm/xe/xe_sched_job.c                 |  2 +-
>  drivers/gpu/drm/xe/xe_uc_fw.c                     |  4 ++--
>  11 files changed, 26 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
> index a51889af7c23..234df629af8d 100644
> --- a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
> +++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
> @@ -94,8 +94,8 @@ static inline struct drm_i915_private *kdev_to_i915(struct device *kdev)
>  #define HAS_LLC(xe) (!IS_DGFX((xe)))
>  
>  /* Workarounds not handled yet */
> -#define IS_DISPLAY_STEP(xe, first, last) ({u8 __step = (xe)->info.step.display; first <= __step && __step <= last;})
> -#define IS_GRAPHICS_STEP(xe, first, last) ({u8 __step = (xe)->info.step.graphics; first <= __step && __step <= last;})
> +#define IS_DISPLAY_STEP(xe, first, last) ({u8 __step = (xe)->info.step.display; first <= __step && __step <= last; })
> +#define IS_GRAPHICS_STEP(xe, first, last) ({u8 __step = (xe)->info.step.graphics; first <= __step && __step <= last; })
>  #define IS_LP(xe) (0)
>  
>  #define IS_TGL_UY(xe) (xe && 0)
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index 8e01bbadb149..5c827beaea28 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -122,7 +122,7 @@ static inline void xe_device_guc_submission_disable(struct xe_device *xe)
>  
>  #define for_each_tile(tile__, xe__, id__) \
>  	for ((id__) = 0; (id__) < (xe__)->info.tile_count; (id__)++) \
> -		for_each_if ((tile__) = &(xe__)->tiles[(id__)])
> +		for_each_if((tile__) = &(xe__)->tiles[(id__)])
>  
>  /*
>   * FIXME: This only works for now since multi-tile and standalone media
> @@ -130,7 +130,7 @@ static inline void xe_device_guc_submission_disable(struct xe_device *xe)
>   */
>  #define for_each_gt(gt__, xe__, id__) \
>  	for ((id__) = 0; (id__) < (xe__)->info.gt_count; (id__)++) \
> -		for_each_if ((gt__) = xe_device_get_gt((xe__), (id__)))
> +		for_each_if((gt__) = xe_device_get_gt((xe__), (id__)))
>  
>  static inline struct xe_force_wake * gt_to_fw(struct xe_gt *gt)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 26a8de77138a..5267ae02785d 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -54,8 +54,8 @@ struct xe_ggtt;
>  
>  #define tile_to_xe(tile__)								\
>  	_Generic(tile__,								\
> -		 const struct xe_tile *: (const struct xe_device *)((tile__)->xe),	\
> -		 struct xe_tile *: (tile__)->xe)
> +		 const struct xe_tile * : (const struct xe_device *)((tile__)->xe),	\
> +		 struct xe_tile * : (tile__)->xe)
>  
>  /**
>   * struct xe_tile - hardware tile structure
> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
> index f0f0592fc598..7403673d532d 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake.c
> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
> @@ -87,7 +87,7 @@ void xe_force_wake_init_engines(struct xe_gt *gt, struct xe_force_wake *fw)
>  			    BIT(0), BIT(16));
>  	}
>  
> -	for (i = XE_HW_ENGINE_VECS0, j =0; i <= XE_HW_ENGINE_VECS3; ++i, ++j) {
> +	for (i = XE_HW_ENGINE_VECS0, j = 0; i <= XE_HW_ENGINE_VECS3; ++i, ++j) {
>  		if (!(gt->info.engine_mask & BIT(i)))
>  			continue;
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> index 21d9044088de..a523d7941afe 100644
> --- a/drivers/gpu/drm/xe/xe_gt.h
> +++ b/drivers/gpu/drm/xe/xe_gt.h
> @@ -13,7 +13,7 @@
>  
>  #define for_each_hw_engine(hwe__, gt__, id__) \
>  	for ((id__) = 0; (id__) < ARRAY_SIZE((gt__)->hw_engines); (id__)++) \
> -	     for_each_if (((hwe__) = (gt__)->hw_engines + (id__)) && \
> +	     for_each_if(((hwe__) = (gt__)->hw_engines + (id__)) && \
>  			  xe_hw_engine_is_valid((hwe__)))
>  
>  struct xe_gt *xe_gt_alloc(struct xe_tile *tile);
> diff --git a/drivers/gpu/drm/xe/xe_gt_clock.c b/drivers/gpu/drm/xe/xe_gt_clock.c
> index 7cf11078ff57..932b61e0cf67 100644
> --- a/drivers/gpu/drm/xe/xe_gt_clock.c
> +++ b/drivers/gpu/drm/xe/xe_gt_clock.c
> @@ -38,13 +38,13 @@ static u32 get_crystal_clock_freq(u32 rpm_config_reg)
>  					  rpm_config_reg);
>  
>  	switch (crystal_clock) {
> -	case RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_24_MHZ :
> +	case RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_24_MHZ:
>  		return f24_mhz;
> -	case RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_19_2_MHZ :
> +	case RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_19_2_MHZ:
>  		return f19_2_mhz;
> -	case RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_38_4_MHZ :
> +	case RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_38_4_MHZ:
>  		return f38_4_mhz;
> -	case RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_25_MHZ :
> +	case RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_25_MHZ:
>  		return f25_mhz;
>  	default:
>  		XE_BUG_ON("NOT_POSSIBLE");
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index 28b8e8a86fc9..78a9fe9f0bd3 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -75,13 +75,13 @@ enum xe_steering_type {
>  
>  #define gt_to_tile(gt__)							\
>  	_Generic(gt__,								\
> -		 const struct xe_gt *: (const struct xe_tile *)((gt__)->tile),	\
> -		 struct xe_gt *: (gt__)->tile)
> +		 const struct xe_gt * : (const struct xe_tile *)((gt__)->tile),	\
> +		 struct xe_gt * : (gt__)->tile)
>  
>  #define gt_to_xe(gt__)										\
>  	_Generic(gt__,										\
> -		 const struct xe_gt *: (const struct xe_device *)(gt_to_tile(gt__)->xe),	\
> -		 struct xe_gt *: gt_to_tile(gt__)->xe)
> +		 const struct xe_gt * : (const struct xe_device *)(gt_to_tile(gt__)->xe),	\
> +		 struct xe_gt * : gt_to_tile(gt__)->xe)
>  
>  /**
>   * struct xe_gt - A "Graphics Technology" unit of the GPU
> diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
> index 8581bd9b1426..04ccb26452ad 100644
> --- a/drivers/gpu/drm/xe/xe_rtp.h
> +++ b/drivers/gpu/drm/xe/xe_rtp.h
> @@ -373,8 +373,8 @@ struct xe_reg_sr;
>  	}
>  
>  #define XE_RTP_PROCESS_CTX_INITIALIZER(arg__) _Generic((arg__),							\
> -	struct xe_hw_engine *:	(struct xe_rtp_process_ctx){ { (void *)(arg__) }, XE_RTP_PROCESS_TYPE_ENGINE },	\
> -	struct xe_gt *:		(struct xe_rtp_process_ctx){ { (void *)(arg__) }, XE_RTP_PROCESS_TYPE_GT })
> +	struct xe_hw_engine * :	(struct xe_rtp_process_ctx){ { (void *)(arg__) }, XE_RTP_PROCESS_TYPE_ENGINE },	\
> +	struct xe_gt * :	(struct xe_rtp_process_ctx){ { (void *)(arg__) }, XE_RTP_PROCESS_TYPE_GT })
>  
>  void xe_rtp_process_ctx_enable_active_tracking(struct xe_rtp_process_ctx *ctx,
>  					       unsigned long *active_entries,
> diff --git a/drivers/gpu/drm/xe/xe_rtp_helpers.h b/drivers/gpu/drm/xe/xe_rtp_helpers.h
> index 1beea434d52d..181b6290fac3 100644
> --- a/drivers/gpu/drm/xe/xe_rtp_helpers.h
> +++ b/drivers/gpu/drm/xe/xe_rtp_helpers.h
> @@ -14,13 +14,13 @@
>   * Helper macros - not to be used outside this header.
>   */
>  #define _XE_ESC(...) __VA_ARGS__
> -#define _XE_COUNT_ARGS(...) _XE_ESC(__XE_COUNT_ARGS(__VA_ARGS__,5,4,3,2,1,))
> -#define __XE_COUNT_ARGS(_,_5,_4,_3,_2,X_,...) X_
> +#define _XE_COUNT_ARGS(...) _XE_ESC(__XE_COUNT_ARGS(__VA_ARGS__, 5, 4, 3, 2, 1,))
> +#define __XE_COUNT_ARGS(_, _5, _4, _3, _2, X_, ...) X_
>  
>  #define _XE_FIRST(...) _XE_ESC(__XE_FIRST(__VA_ARGS__,))
> -#define __XE_FIRST(x_,...) x_
> +#define __XE_FIRST(x_, ...) x_
>  #define _XE_TUPLE_TAIL(...) _XE_ESC(__XE_TUPLE_TAIL(__VA_ARGS__))
> -#define __XE_TUPLE_TAIL(x_,...) (__VA_ARGS__)
> +#define __XE_TUPLE_TAIL(x_, ...) (__VA_ARGS__)
>  
>  #define _XE_DROP_FIRST(x_, ...) __VA_ARGS__
>  
> @@ -59,7 +59,7 @@
>   *
>   *	XE_RTP_TEST_FOO BANANA XE_RTP_TEST_BAR
>   */
> -#define XE_RTP_PASTE_FOREACH(prefix_, sep_, args_) _XE_ESC(_XE_RTP_CONCAT(PASTE_,_XE_COUNT_ARGS args_)(prefix_, sep_, args_))
> +#define XE_RTP_PASTE_FOREACH(prefix_, sep_, args_) _XE_ESC(_XE_RTP_CONCAT(PASTE_, _XE_COUNT_ARGS args_)(prefix_, sep_, args_))
>  #define XE_RTP_PASTE_1(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, _XE_FIRST args_)
>  #define XE_RTP_PASTE_2(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, _XE_FIRST args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_1(prefix_, sep_, _XE_TUPLE_TAIL args_)
>  #define XE_RTP_PASTE_3(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, _XE_FIRST args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_2(prefix_, sep_, _XE_TUPLE_TAIL args_)
> diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
> index ed0b69ef449c..f581472cb391 100644
> --- a/drivers/gpu/drm/xe/xe_sched_job.c
> +++ b/drivers/gpu/drm/xe/xe_sched_job.c
> @@ -35,7 +35,7 @@ int __init xe_sched_job_module_init(void)
>  		kmem_cache_create("xe_sched_job_parallel",
>  				  sizeof(struct xe_sched_job) +
>  				  sizeof(u64) *
> -				  XE_HW_ENGINE_MAX_INSTANCE , 0,
> +				  XE_HW_ENGINE_MAX_INSTANCE, 0,
>  				  SLAB_HWCACHE_ALIGN, NULL);
>  	if (!xe_sched_job_parallel_slab) {
>  		kmem_cache_destroy(xe_sched_job_slab);
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> index 1aa9a4925574..23ea40b52c24 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> @@ -100,8 +100,8 @@ struct fw_blobs_by_type {
>  };
>  
>  #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)			\
> -	fw_def(METEORLAKE,	mmp_ver(  i915,	guc,	mtl,	70, 6, 4))	\
> -	fw_def(PVC,		mmp_ver(  xe,	guc,	pvc,	70, 6, 4))	\
> +	fw_def(METEORLAKE,	mmp_ver(i915,	guc,	mtl,	70, 6, 4))	\
> +	fw_def(PVC,		mmp_ver(xe,	guc,	pvc,	70, 6, 4))	\
>  	fw_def(DG2,		major_ver(i915,	guc,	dg2,	70, 5))		\
>  	fw_def(DG1,		major_ver(i915,	guc,	dg1,	70, 5))		\
>  	fw_def(ALDERLAKE_N,	major_ver(i915,	guc,	tgl,	70, 5))		\
> -- 
> 2.34.1
> 
