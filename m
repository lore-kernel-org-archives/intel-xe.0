Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA6A8C4167B
	for <intel-xe@archiver.kernel.org>; Tue, 28 Nov 2023 16:40:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9471B10E0A8;
	Tue, 28 Nov 2023 16:40:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C5C110E0A8
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Nov 2023 16:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701189613; x=1732725613;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=hoFK4UDaLwsClW1+VqYVPZUwR5aVmweS52Xerz4r1o0=;
 b=eAwbPZZbSn750GJLarBpZhhwX0ZSrdsSbfp3E0QzX5TB8tfW0vNobv5q
 g8iW7OzhbgQU/7w2ao5dm261SG1spcNe8nvhTOJehfW8QbTIpP8YnP5z3
 oYO1214pvJgSLfzIVevWQtjc7pI2koBMUZDTdng7yVjezgwR7/RGwBYik
 4Xd7A3tDzGP4SN/FdRG5H+JO/NeE5G04t7clwl7upejbDdeXg1gjTnQSR
 Xnm1tca44TQyvX4R5cGsKjo/nJh+2q2tV3uqPhQig+/Q1JpJNFlFFIhKm
 eXg4n+WIAoKZ+S/Yew+uyp86oOvXNvuoGdXF8agEjrKrX0XRuorYipDZz Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="372332724"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="372332724"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 08:40:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="761994404"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="761994404"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Nov 2023 08:40:12 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 28 Nov 2023 08:40:11 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 28 Nov 2023 08:40:11 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 28 Nov 2023 08:40:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k64W4/nlO+cMX+NG/c7squJM6EQbLmn3zfv4vpCBmcBREiqkW0BohSrcyw2QAfiw5Pu/v2gaLW3BDPnTgae0QYar9mrcFCVegYM21qAVNmQhf7Y/9Vso6nwOsWBbt0uVuLGaA8QS/Ir+CiJd004CuSUUcURWCGmY5Vnj+gYjTeJAaCkp3enMdoHfrV1DjqC1c3mB9rzpafLE4hZZ6BfKV9ocLbSNnVN8F760u34R7DHABUlMpUtLk45qQmnZVtpKaHVvaFsumfYYYS0VPUosnTlDuLOaaceS38aiIvmtZf9xW89NvHli7j6Yxo3M9QCL8D/vh4WakJxCaBSAouInAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OxeqKS19LW9iYAtWzzRlOy9zRjOcZWdr0rcd5Y+dpaw=;
 b=P+pcbEr2O5noSzI/9afnL7/rY9EBiKkGLr5YuP9l8uCADNWcoGarMxMhoho9EVS/PQ4qtvCFxbupceBWh+NAjcUmAOHr5Qs+BlIRObdyvx0kIbvNZ2zUfu/waPsy67pgx077Kq612P5O4K6jDe1OfseBtxfkNaq+u5d+zTOiawOcgkr3D7+9tXo523p+MoASWaAy6+KbL26/men64XYOqqeuH9Z61Yf/zaNIC/w0tr5bucuV+u/f1HNgLOG4Rc0TDjLEYMneibyVrVyft5H9SiyatvZWqjiZJ3Glc1Qgy3k1wnrkbZ+nxGpkD9wmtNpjDnHADZzhRyIaiNAJyiFk4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BL3PR11MB6529.namprd11.prod.outlook.com (2603:10b6:208:38c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.28; Tue, 28 Nov
 2023 16:40:05 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7046.015; Tue, 28 Nov 2023
 16:40:05 +0000
Date: Tue, 28 Nov 2023 09:38:33 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Message-ID: <ZWW1GXuDuMBA3Jdz@DUT025-TGLU.fm.intel.com>
References: <20231127141125.2913415-1-riana.tauro@intel.com>
 <20231127141125.2913415-2-riana.tauro@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231127141125.2913415-2-riana.tauro@intel.com>
X-ClientProxiedBy: BYAPR02CA0002.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::15) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BL3PR11MB6529:EE_
X-MS-Office365-Filtering-Correlation-Id: 96babdde-5f01-42a7-8f7c-08dbf030acd2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ns34tDQq3aLsk89A6eFRLVBCruMi/j2x/bH1u97JSWSF7xPg5kpJYFR8r/J/PjJEy1qluBM8Ix8cTt241S+8hhJI+klFwta1AS1ybkVliiNoqNLWWr5n27ZIvP3mMSVMmjshUT4NCZSqZh0H49YFxA4AOrhbiw5Ctmt19SKzof6k4+ljBnVYds6LOFiO7wy5vM/FKsCWmtMagFPv+o088QOt6ScF943WgeV7H/4he/tS0O6NGjUQKOSsMyCDedvrOn8Au7ZJ7zHEdzI2VOIwbUoC6PhfuYnb/Bnnd3qXZVhUTqVtNsqGaSoydZYUzTRpgW1FxAygQVjAQblt1vY2iumAiRbSUY0WzdvgzXio7cz59ALmtzfugEW4pI2985KqBZdT8rKhUKiE+0lGfpGLok7alfpH7BGVjjaARSYZLk2A+HSxj4RVLTtpuCezrhgzGhstkfelJMFYpZrWOCNiJFWGz7Z+m91ypS2YTQR2pAUYsIfN+3gDqQfbMVL7WyRZxQlwsicW7ZXneEtI8DwU39EQtgoTVqBKPueHzAGmxmvLxXMvWGXYcrJZ9m9aM21c
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(230922051799003)(186009)(451199024)(1800799012)(6636002)(6512007)(86362001)(6506007)(6486002)(26005)(6666004)(508600001)(82960400001)(83380400001)(38100700002)(66476007)(66556008)(66946007)(5660300002)(44832011)(2906002)(8936002)(4326008)(6862004)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?acGM797s8w5SZivwVC+fmyFTaZWSaISrmjNZP7MXAMMO5lT5ZYqqRBfsnqyW?=
 =?us-ascii?Q?Vfz6tu3KrNC7xEO9+qZb4VUyPY/vTMIe3WFYZwyldCUMjFixxO3Dj0skPMp6?=
 =?us-ascii?Q?qjfmo9pk6CJjp1q8cJ5Iw1tjGdYJkWxxFbWuUSdHZ2wdDYbiMxsu4Rcf8TEq?=
 =?us-ascii?Q?G+8WLwLFqvj0p3S7Pg+IoS/jj0+YZvc6u4bl27JVU//aMFuVjR0kjwizq+b+?=
 =?us-ascii?Q?qQRddUHFm+1TTzzlqyXsNZVuWc714OI2dmJVayQnJVu9CJ3cxEKeCo6YTVXA?=
 =?us-ascii?Q?BVLB4hDGS3LGDw1AHpdSWIkAMEYQp6Vstxgl7mFstQxxIeHBRbIeohTi4Dgf?=
 =?us-ascii?Q?yU2lrMRgW8D07MxgizZ0QWDiSD6TbkmkE59HoqCGvImmFILcAOYU+m82MTra?=
 =?us-ascii?Q?ukjOFImvZbOel10cLD5GGddUF8hX2RMKS6+SXz7c/r6vdhwHdwL+4LqfAuqk?=
 =?us-ascii?Q?T5kF7gX588hlLfjX87EUuUiathydkBwti+0tSUVqbV7kBv9k3znW2ObqTtqE?=
 =?us-ascii?Q?W1UFTJM32FeUT0I23lggitACbixZlQjvK8pTaJONO0z6gdmoIPu86OkgIGnK?=
 =?us-ascii?Q?wZEx+p9XN7piH3WuUistIQ1zdkLfvSxlP3mB2hM6vRDj24a7IVBpprgO2Pbl?=
 =?us-ascii?Q?xy0H6rPDQ4pF5dRvQIaopLRoik6uLh+3KZSYasMxm3CsyuV46bz4oaoefB5e?=
 =?us-ascii?Q?GF/FtGw/PsVFJvcjPz30F1Ef5VOu0eVgsMIGQ5A0oqFeI2HSQugNLUDIM5Ae?=
 =?us-ascii?Q?Mv8k5O30R8r6a+4NTwBUtr91lxvyIpiNvs7cc3ffZoJbwTBIKg/iAOK/lOpl?=
 =?us-ascii?Q?iQg4StaYFsKMayl8XpROEXP+s0G1fQkLf+Fqu+mZ946n3Q7dqsJc7DRypRLo?=
 =?us-ascii?Q?TpS/22Cbmk4kHEw+xvP5MZZSOKjaNJ0MweR1uMzjzltNuD1EsTw5REaDeHsl?=
 =?us-ascii?Q?btvEWKJXQjiUFkySar94cftSE+Evqw1lWVn8gQTuY2N1MUXINW6XEyzp8qa7?=
 =?us-ascii?Q?lsB9zJ+Hz1rbA3FTdVCQ6omhafE8P0HnFNJFb3oe2SCOLn+8BVtSSgLg7X8y?=
 =?us-ascii?Q?RoPjbVg7TDIrNlaUUkcZPIkMQatnlUAre43Hr8r9pWrmA/aJ5s4D843/w+3v?=
 =?us-ascii?Q?FJu/zU4pQ+xmyWIU/oeiOtqRE07Lpcgn1KwxQyUZSSX9q5uPWyRjtGcUwixa?=
 =?us-ascii?Q?tAE/xkaVsSPSyW6URJamP0eZ9YY9aAQSZ3DfHyW4UCuxrAVyNjnOSExjF/nq?=
 =?us-ascii?Q?BfBxmLVSk7rH/CMtlgr6C2twqHp1CasiBszVZI+BlLtc4XXvkzRhd4t4aeWw?=
 =?us-ascii?Q?zz5ASe1VImBnMhrS1L66dC/9lVORl5AC4v9+8ThjMJnWBzEvv7DtQFLI1zXk?=
 =?us-ascii?Q?uBoZnZiXA/unpL87pI7Xpnf6JlyVKkmIiqxpO278ocGM7L2IjtRqenNx1TBa?=
 =?us-ascii?Q?xW/bbDS4AUPR4KMmymRuH5iNsqBMaV+4gJCaFcB0SSyeBREwuGRGCDqOaMDv?=
 =?us-ascii?Q?+KMraJG8QzcqoFXvZCGJiZDOG4p7mTtT92CG3kqa4kZ7WQq1NZ7nJ8KpMTgB?=
 =?us-ascii?Q?Pt8QF02/KHIETYDXLQT0h+l2lDUOujvULODYuzLQc0w4ta7S1eqSGHbpE93h?=
 =?us-ascii?Q?Xg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 96babdde-5f01-42a7-8f7c-08dbf030acd2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2023 16:40:05.2435 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RE2V2lAmt+EAsL9sf6Q7Zz6nQ/txYf+amqaFKiXbUkXGrJyrlLFa9ULCEjbYp0QENJu+OCrx8lnl7RsBbdvVQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6529
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/8] RFC drm/xe: Move user engine class
 mappings to header
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

On Mon, Nov 27, 2023 at 07:41:18PM +0530, Riana Tauro wrote:
> Move user engine class <-> hw engine class to header
> files so that it can be used by perf component.
> 
> No functional changes.
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c      | 17 +++++------------
>  drivers/gpu/drm/xe/xe_hw_engine_types.h | 18 ++++++++++++++++++
>  drivers/gpu/drm/xe/xe_query.c           | 22 +++-------------------
>  3 files changed, 26 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 62d0237e724e..6f27b78666f6 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -482,31 +482,24 @@ static int exec_queue_user_extensions(struct xe_device *xe, struct xe_exec_queue
>  	return 0;
>  }
>  
> -static const enum xe_engine_class user_to_xe_engine_class[] = {
> -	[DRM_XE_ENGINE_CLASS_RENDER] = XE_ENGINE_CLASS_RENDER,
> -	[DRM_XE_ENGINE_CLASS_COPY] = XE_ENGINE_CLASS_COPY,
> -	[DRM_XE_ENGINE_CLASS_VIDEO_DECODE] = XE_ENGINE_CLASS_VIDEO_DECODE,
> -	[DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE] = XE_ENGINE_CLASS_VIDEO_ENHANCE,
> -	[DRM_XE_ENGINE_CLASS_COMPUTE] = XE_ENGINE_CLASS_COMPUTE,
> -};
> -
>  static struct xe_hw_engine *
>  find_hw_engine(struct xe_device *xe,
>  	       struct drm_xe_engine_class_instance eci)
>  {
>  	u32 idx;
>  
> -	if (eci.engine_class > ARRAY_SIZE(user_to_xe_engine_class))
> +	if (eci.engine_class > ARRAY_SIZE(xe_user_to_engine_class))
>  		return NULL;
>  
>  	if (eci.gt_id >= xe->info.gt_count)
>  		return NULL;
>  
>  	idx = array_index_nospec(eci.engine_class,
> -				 ARRAY_SIZE(user_to_xe_engine_class));
> +				 ARRAY_SIZE(xe_user_to_engine_class));
> +
>  
>  	return xe_gt_hw_engine(xe_device_get_gt(xe, eci.gt_id),
> -			       user_to_xe_engine_class[idx],
> +			       xe_user_to_engine_class[idx],
>  			       eci.engine_instance, true);
>  }
>  
> @@ -532,7 +525,7 @@ static u32 bind_exec_queue_logical_mask(struct xe_device *xe, struct xe_gt *gt,
>  			continue;
>  
>  		if (hwe->class ==
> -		    user_to_xe_engine_class[DRM_XE_ENGINE_CLASS_COPY])
> +		    xe_user_to_engine_class[DRM_XE_ENGINE_CLASS_COPY])
>  			logical_mask |= BIT(hwe->logical_instance);
>  	}
>  
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> index 39908dec042a..8269f77c4ca2 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> @@ -6,6 +6,8 @@
>  #ifndef _XE_HW_ENGINE_TYPES_H_
>  #define _XE_HW_ENGINE_TYPES_H_
>  
> +#include <drm/xe_drm.h>
> +
>  #include "xe_force_wake_types.h"
>  #include "xe_lrc_types.h"
>  #include "xe_reg_sr_types.h"
> @@ -58,6 +60,22 @@ enum xe_hw_engine_id {
>  	XE_NUM_HW_ENGINES,
>  };
>  
> +static const u16 xe_engine_to_user_class[] = {

s/xe_engine_to_user_class/xe_hwe_engine_to_user_class

> +	[XE_ENGINE_CLASS_RENDER] = DRM_XE_ENGINE_CLASS_RENDER,
> +	[XE_ENGINE_CLASS_COPY] = DRM_XE_ENGINE_CLASS_COPY,
> +	[XE_ENGINE_CLASS_VIDEO_DECODE] = DRM_XE_ENGINE_CLASS_VIDEO_DECODE,
> +	[XE_ENGINE_CLASS_VIDEO_ENHANCE] = DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE,
> +	[XE_ENGINE_CLASS_COMPUTE] = DRM_XE_ENGINE_CLASS_COMPUTE,
> +};
> +
> +static const enum xe_engine_class xe_user_to_engine_class[] = {

s/xe_user_to_engine_class/xe_user_to_hwe_engine_class

Otherwise LGTM.

Matt

> +	[DRM_XE_ENGINE_CLASS_RENDER] = XE_ENGINE_CLASS_RENDER,
> +	[DRM_XE_ENGINE_CLASS_COPY] = XE_ENGINE_CLASS_COPY,
> +	[DRM_XE_ENGINE_CLASS_VIDEO_DECODE] = XE_ENGINE_CLASS_VIDEO_DECODE,
> +	[DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE] = XE_ENGINE_CLASS_VIDEO_ENHANCE,
> +	[DRM_XE_ENGINE_CLASS_COMPUTE] = XE_ENGINE_CLASS_COMPUTE,
> +};
> +
>  /* FIXME: s/XE_HW_ENGINE_MAX_INSTANCE/XE_HW_ENGINE_MAX_COUNT */
>  #define XE_HW_ENGINE_MAX_INSTANCE	9
>  
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index 61a7d92b7e88..caa98c6b5853 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -22,22 +22,6 @@
>  #include "xe_mmio.h"
>  #include "xe_ttm_vram_mgr.h"
>  
> -static const u16 xe_to_user_engine_class[] = {
> -	[XE_ENGINE_CLASS_RENDER] = DRM_XE_ENGINE_CLASS_RENDER,
> -	[XE_ENGINE_CLASS_COPY] = DRM_XE_ENGINE_CLASS_COPY,
> -	[XE_ENGINE_CLASS_VIDEO_DECODE] = DRM_XE_ENGINE_CLASS_VIDEO_DECODE,
> -	[XE_ENGINE_CLASS_VIDEO_ENHANCE] = DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE,
> -	[XE_ENGINE_CLASS_COMPUTE] = DRM_XE_ENGINE_CLASS_COMPUTE,
> -};
> -
> -static const enum xe_engine_class user_to_xe_engine_class[] = {
> -	[DRM_XE_ENGINE_CLASS_RENDER] = XE_ENGINE_CLASS_RENDER,
> -	[DRM_XE_ENGINE_CLASS_COPY] = XE_ENGINE_CLASS_COPY,
> -	[DRM_XE_ENGINE_CLASS_VIDEO_DECODE] = XE_ENGINE_CLASS_VIDEO_DECODE,
> -	[DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE] = XE_ENGINE_CLASS_VIDEO_ENHANCE,
> -	[DRM_XE_ENGINE_CLASS_COMPUTE] = XE_ENGINE_CLASS_COMPUTE,
> -};
> -
>  static size_t calc_hw_engine_info_size(struct xe_device *xe)
>  {
>  	struct xe_hw_engine *hwe;
> @@ -138,10 +122,10 @@ query_engine_cycles(struct xe_device *xe,
>  	if (!gt)
>  		return -EINVAL;
>  
> -	if (eci->engine_class >= ARRAY_SIZE(user_to_xe_engine_class))
> +	if (eci->engine_class >= ARRAY_SIZE(xe_user_to_engine_class))
>  		return -EINVAL;
>  
> -	hwe = xe_gt_hw_engine(gt, user_to_xe_engine_class[eci->engine_class],
> +	hwe = xe_gt_hw_engine(gt, xe_user_to_engine_class[eci->engine_class],
>  			      eci->engine_instance, true);
>  	if (!hwe)
>  		return -EINVAL;
> @@ -212,7 +196,7 @@ static int query_engines(struct xe_device *xe,
>  				continue;
>  
>  			hw_engine_info[i].engine_class =
> -				xe_to_user_engine_class[hwe->class];
> +				xe_engine_to_user_class[hwe->class];
>  			hw_engine_info[i].engine_instance =
>  				hwe->logical_instance;
>  			hw_engine_info[i].gt_id = gt->info.id;
> -- 
> 2.40.0
> 
