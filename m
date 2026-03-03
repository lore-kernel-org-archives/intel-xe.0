Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07F97EDEBE0
	for <intel-xe@archiver.kernel.org>; Tue,  3 Mar 2026 18:14:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBD6110E89E;
	Tue,  3 Mar 2026 18:14:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yn9O/6n4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67A8010E89E
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Mar 2026 18:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772561648; x=1804097648;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=X+PMPY1GPE3XRRfEpsjak2oZgxe0N6ADA5ZxqzaD8FM=;
 b=Yn9O/6n4RHc8g7i0+k+rOyxT9QyWRRDyjDcHT0Lz73VkI1Pt9I+FiTxM
 cnKq7jSaxFmtUsCUE+HZLuutpOlBq64SzRW9m9JgEBItNW8Muq02NzfF6
 WFFgYDGxsfsR5X/lIsPLfa9WMY0AqUfBQhIjaAkDrWD6hq263VgLIDiLq
 iwLYlCkb3faeHbNM2D3Pbsrli83LbwD4L+FMQDowxE4NLIyZLUprrgaRX
 hQUuPM7xIOtJP4g1eNc5lp8iDZmh8PQkVbNRZ7M7BnFpPwZkn67Q/GBmp
 BwGsp2CIKmcgTplbAREC0lyn2PiqmvjgIWS6XlufrgNV755Cr+llpNcDY w==;
X-CSE-ConnectionGUID: 4IpiT+LpSFS3jQ+6lplz+w==
X-CSE-MsgGUID: AjOSQbSuSfO6C9oI/kZu0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="76212791"
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="76212791"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 10:14:02 -0800
X-CSE-ConnectionGUID: Kp1RsDN6QZ+rtP0AdM/egw==
X-CSE-MsgGUID: Tx6lCoy5T+WUZC10qMqzcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="222744539"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 10:14:00 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 3 Mar 2026 10:13:59 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 3 Mar 2026 10:13:59 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.1) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 3 Mar 2026 10:13:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hef1jinQ8Mmj2GQ+Ij3PhSWAvmMdOuY0eJjdsX3GP+2T9ksu9lWUh8SURFj7VdJ23/llvFLTQ5BJjPNMRZ0upGcC4Lu2KMJJTnYZpKTSPJYIDrYH4pIwYtSDHXgDhov9AiCPwzShgRvcQ8kADwGL72BD35CSrfD/E96uluq66VID/SKlKbZMAgH/3C3Cwqt+dljR29NAqJT6ne5cqmiqZf4LD5jGq96a2xJdJjGoyTah9J5OHABSNrw9VGVHRlATbJ9mN+BnVwKkXFZ18JE0QbKE1h3AL8rh6jGCa/l6SVZjl/iIWpHbdk0qmSXV9wYzzuPcIoa2SFQM0KIal2qUNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sKaMh0n8dIhAtfzP3Nox6bsnCSA+mVn/7KhuA7SgXUw=;
 b=GHNTD+kR01i5F+qH9+o1Fn3Vl0Xdyi45ptFOkD4zy9oPHmY6lsrRGXeNCK9VHHlTv9mwaBARkEhM9OMAvyQmXQ/W1BDIAVi9Xw8ecZ4Np0mI425dnOiMzvDZWmOBFb7/tHRkAr7pu9WprsHLTF5dlj5N69iZfy2NhHQu2vAZLsXv6j0HXOfxZBwl4n03gaAIWepn/NB6vlKKmbr9sGcSzjzxxLUFA5vUGSJCKMeASmWYN8YGnVd4m+c15GRcPYd4+tRGPXPol6rptFrfJpQIZwZ4IQzWuJa6Lg6eTLifGx37XT88Xphz0ioU3kHBQYpyPe9//IXnfOAFHNSMGkWTGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by DS0PR11MB7286.namprd11.prod.outlook.com (2603:10b6:8:13c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 18:13:56 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9654.020; Tue, 3 Mar 2026
 18:13:56 +0000
Date: Tue, 3 Mar 2026 13:13:53 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: <intel-xe@lists.freedesktop.org>, <kernel-dev@igalia.com>
Subject: Re: [PATCH v17 6/8] drm/xe/xelp: Add AuxCCS invalidation to the
 indirect context workarounds
Message-ID: <aack4Q1MRQ-Eq1pM@intel.com>
References: <20260128101333.37765-1-tvrtko.ursulin@igalia.com>
 <20260128101333.37765-7-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260128101333.37765-7-tvrtko.ursulin@igalia.com>
X-ClientProxiedBy: BY1P220CA0003.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::10) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|DS0PR11MB7286:EE_
X-MS-Office365-Filtering-Correlation-Id: fc12512d-99da-4e46-a5b5-08de7950a261
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: s2+tS/ZDAw/rLYskxp3MtMKOFdfr+3I2XrhWlJv/Q3wOE2QI3l+kIK1Mn4SSmUURkOcC8h+Zung9JxSvYKOks9O7k0cvt95vXCQ33GxATAtdjuuYKRYEWUac66JkbZ2UF9yoXoRtHQpMGA2p7ErimL0GIdhIP13so2V4bcxlRAFFVpFzziy4c3meqX48M3qALQpAbGfpK6+LAQ5YmcE+6BEGWGO7QQA97V318GiqRcaJqyJTg0sU6DY0a4koA2VZPbAVPithU0BnFAfg/VIlbzJIXE4GnvvhbUv3V1zPrfySmvtpLyvmfoDy5Fy+6LbsNWulTUlHzKv2LR5sJphtTYHEUhgujpU1qCmBLwi/k9mLszcfr171fIxDUk5tRv0XROaqvhn91ngAKbF6fR1uDruUyznIQjzxBKim7ydqokC21oymo4ECHrpVeO57R418C5cNvfSGb3sHH1GdoTaYnCvAJA/Z5XW3nJyByWg33F99W4xvYXRNuItrBao4gYXRFZ5wrYE+YusV7qKcyFbO493M5bBaeH79fBOjI1/noOloWbFATqD0v/EJF7GxMVCbQ5h2fjUffUp9ZPIlTEqrHAsTIYeb9rvfq1DhJ3nzES13J4E9fr25IJrERw9vnlzeaRxOOLqUTf6+lKrwJTjyAutdGZxxc+2VV7lUz6wVN03FeMbNWNTwuAZPoPYZ42o2qpC/9OTEPiB8Dt5OwrtXJCA12WmbSltfcrZNfKVHgnU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gjK4Ji0Legh3GpXx7QerevFn+NcZrpKYEXGvQExW8TZPEWgi0j5kKOQNaRAa?=
 =?us-ascii?Q?A9Q86Nk1ebpUG1mbTWC90ymxrlV6HmjJ496VYhuGDI12NO6yr0U7ien5tpJi?=
 =?us-ascii?Q?dls3GYfeWGxE2B23zRTmUWm3Bf/OhUcruV4fNuZQE8k0GK/mtx3j7mxUGF/2?=
 =?us-ascii?Q?EuDOtScDcU0Hx3ecYr/FmCXP4UwTYdSTvwjMBaeyTWQUBLSKuD2UjDUfoKx3?=
 =?us-ascii?Q?SppoQrbcsDLdbfpNO2WVjYIDBtDtlfWmBw//6K627nJZD0yyHgSAu4OHPpkZ?=
 =?us-ascii?Q?902fJKH1l98JKYBl2UOR4eJS7LJIuMrpfr92OgwVOM9G3twIc6mxX38VohWZ?=
 =?us-ascii?Q?QJadYJQ6AD6jpaVjJxCDp9jsQaPd8qoOXc3mSmkJG9nCpqZ7lfjXUbR3TuHN?=
 =?us-ascii?Q?Yk5/1bPNzisLuHs67XFF+6vRygwMTmHY1F1hP1OBtTNvtaZ/epVeqd+LF1gb?=
 =?us-ascii?Q?k9IyhVvHQYxgRL7gGDFN4r5GBhaCvgeqZwRFCt88ZwHzwkTE5PNMqo1XaBCg?=
 =?us-ascii?Q?MWfyDaN9ybRNRdDpNFPTqM0pQgrVdKsXe48DV0e2adOoxzJUY6wBI+71t//d?=
 =?us-ascii?Q?ZSgA3kf86j2ygSrChCVC6ht/GVovm9q9RNQpz7pnIcUH6Mh3Fbn83rqmLaCp?=
 =?us-ascii?Q?5wn/9/PccwT3UddO82lgJIKWvBBm8HKXjGgRrfzvXx0nNuCMH/Wi/XMsXmaQ?=
 =?us-ascii?Q?shJA0WND4cm9tbjPY9XidEmqHhiYppEVCq5avYkI7XH5zvD4lj3ZjS+rkP6/?=
 =?us-ascii?Q?BQ9Fc8NLjR8dNWFzjF23ydwecXjwaoyPd3T2rvYeWnMLf7rd2dt9UboLlUo6?=
 =?us-ascii?Q?l7YwaQ+aud68q/xzKwoak3o8AZFs6PFXIfy4/WORHGhJLisApQNaxyTNgeCi?=
 =?us-ascii?Q?HVRM0f6F/mJxdNSsZ/kfS0WDim0gxZe7cTd1B4LMw2hqbhqh31GbOUJb3Ol+?=
 =?us-ascii?Q?b/ryP0zOXByD1FBkU+mEkv5CdbTr3JJDCPVFWmW2ArY6xyvFN+TaCcDhLpUE?=
 =?us-ascii?Q?s1iKGo0wrlCrECDKGMUwFYxMVHeQKoLL09HNe3lcVeur7IEWi2ZcO0qX6ydk?=
 =?us-ascii?Q?WFupMCLYNfnpiA07PWmzWQQ6NL1SS/yE9lBW7J1VwWKfbaPmz7/RprjOZQfQ?=
 =?us-ascii?Q?iFoOxDIQmDET9tzMJA6aWC881k/ssDIeic5iVEy99k4mcUwNp4REzTNgrft5?=
 =?us-ascii?Q?nDf8aEKbJusHpJawgkpeMuXfyZGs7hKCRfdRrnVnaQVrYkalGQJFS0oixv3U?=
 =?us-ascii?Q?fBckA85FGNnQ7PYb6WJGSebOx+wggGbo+BThtErQi2lqkVsrJghtYCLgbd0E?=
 =?us-ascii?Q?BmtFWk3V9G/7WAD96gjI+/aE+ittviZ0YIbrMmUS9QN++CY7dFR24q50XkJQ?=
 =?us-ascii?Q?TuqgvAxW8Z0JHfDpnmSbWh3i8KQ2PJTdNqX9ml89mfp5NaSp947Hsnsa8clc?=
 =?us-ascii?Q?WL1NyiImJ1OkU2NoONwqJVvdWE9b6QAxSNIXZac0p72gYUIS7EsduBsuTzME?=
 =?us-ascii?Q?kPVfWGOvuX5zG3HdJAv7BSseLf0Kz4VzMFTos2wAr27goc3DQ3NqRN9wmC3z?=
 =?us-ascii?Q?IkPEsi1b76XfdzExEIeUbOCVXRgyPyXC5OJsiLT5ZBfbexLTcZPly7Uz5SEl?=
 =?us-ascii?Q?s+y7WamM132b4y72RrlvxXoS71z8tW+/A9E/VHayQU+E7sspbwy1EeQ+UFz9?=
 =?us-ascii?Q?aoOGLx85Z6EtOm4W8l0ywDsfW3/FmBXMOfCrEj1o8WXEeTS4j/zYR1HFO+6M?=
 =?us-ascii?Q?/5DpsVEvPQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fc12512d-99da-4e46-a5b5-08de7950a261
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 18:13:56.3746 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5krgNoErpbQ2Mof5yUjtQiouzqXSWYyKLU1wH2+NiQZiGT2lpNir8JJo66AAuEaUR8lYSS00HNmxX97VLDPz3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7286
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

On Wed, Jan 28, 2026 at 10:13:31AM +0000, Tvrtko Ursulin wrote:
> Following from the i915 reference implementation, we add the AuxCCS
> invalidation to the indirect context workarounds page.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_hw_engine.h | 24 ++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_lrc.c       | 27 +++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_ring_ops.c  | 19 +++----------------
>  3 files changed, 54 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
> index 6b5f9fa2a594..725467b5877c 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.h
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.h
> @@ -6,6 +6,7 @@
>  #ifndef _XE_HW_ENGINE_H_
>  #define _XE_HW_ENGINE_H_
>  
> +#include "xe_device_types.h"
>  #include "xe_hw_engine_types.h"
>  
>  struct drm_printer;
> @@ -79,4 +80,27 @@ enum xe_force_wake_domains xe_hw_engine_to_fw_domain(struct xe_hw_engine *hwe);
>  void xe_hw_engine_mmio_write32(struct xe_hw_engine *hwe, struct xe_reg reg, u32 val);
>  u32 xe_hw_engine_mmio_read32(struct xe_hw_engine *hwe, struct xe_reg reg);
>  
> +static inline bool
> +xe_engine_class_has_auxccs(struct xe_device *xe, enum xe_engine_class class)
> +{
> +	/*
> +	 * PVC is a special case that has no compression of either type
> +	 * (FlatCCS or AuxCCS).  Also, AuxCCS is no longer used from Xe2
> +	 * onward, so any future platforms with no FlatCCS will not have
> +	 * AuxCCS, and we explicity do not want to support it on MTL.
> +	 */
> +	if (GRAPHICS_VERx100(xe) >= 1270 ||
> +	    xe->info.platform == XE_PVC ||
> +	    xe->info.has_flat_ccs)
> +		return false;
> +
> +	if (class == XE_ENGINE_CLASS_RENDER ||
> +	    class == XE_ENGINE_CLASS_COMPUTE ||
> +	    class == XE_ENGINE_CLASS_VIDEO_DECODE ||
> +	    class == XE_ENGINE_CLASS_VIDEO_ENHANCE)
> +		return true;
> +
> +	return false;
> +}
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 3db7968aa5e2..25e4392e303f 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -23,10 +23,12 @@
>  #include "xe_exec_queue_types.h"
>  #include "xe_gt.h"
>  #include "xe_gt_printk.h"
> +#include "xe_hw_engine.h"
>  #include "xe_hw_fence.h"
>  #include "xe_map.h"
>  #include "xe_memirq.h"
>  #include "xe_mmio.h"
> +#include "xe_ring_ops.h"
>  #include "xe_sriov.h"
>  #include "xe_trace_lrc.h"
>  #include "xe_vm.h"
> @@ -93,6 +95,10 @@ gt_engine_needs_indirect_ctx(struct xe_gt *gt, enum xe_engine_class class)
>  					       class, NULL))
>  		return true;
>  
> +	/* For AuxCCS invalidation */
> +	if (xe_engine_class_has_auxccs(xe, class))
> +		return true;
> +
>  	return false;
>  }
>  
> @@ -1209,6 +1215,25 @@ static ssize_t setup_invalidate_state_cache_wa(struct xe_lrc *lrc,
>  	return cmd - batch;
>  }
>  
> +static ssize_t setup_invalidate_auxccs_wa(struct xe_lrc *lrc,
> +					  struct xe_hw_engine *hwe,
> +					  u32 *batch, size_t max_len)
> +{
> +	struct xe_gt *gt = lrc->gt;
> +	struct xe_device *xe = gt_to_xe(gt);
> +	u32 *cmd;
> +
> +	if (!xe_engine_class_has_auxccs(xe, hwe->class))
> +		return 0;
> +
> +	if (xe_gt_WARN_ON(gt, max_len < 8))
> +		return -ENOSPC;
> +
> +	cmd = xe_emit_aux_table_inv(hwe, batch);
> +
> +	return cmd - batch;
> +}
> +
>  struct bo_setup {
>  	ssize_t (*setup)(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>  			 u32 *batch, size_t max_size);
> @@ -1341,9 +1366,11 @@ setup_indirect_ctx(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
>  {
>  	static const struct bo_setup rcs_funcs[] = {
>  		{ .setup = setup_timestamp_wa },
> +		{ .setup = setup_invalidate_auxccs_wa },
>  		{ .setup = setup_configfs_mid_ctx_restore_bb },
>  	};
>  	static const struct bo_setup xcs_funcs[] = {
> +		{ .setup = setup_invalidate_auxccs_wa },
>  		{ .setup = setup_configfs_mid_ctx_restore_bb },
>  	};
>  	struct bo_setup_state state = {
> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
> index e6ecd70618c3..cb6c7d18b939 100644
> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> @@ -12,6 +12,7 @@
>  #include "regs/xe_engine_regs.h"
>  #include "regs/xe_gt_regs.h"
>  #include "xe_exec_queue.h"
> +#include "xe_hw_engine.h"
>  #include "xe_gt_printk.h"
>  #include "xe_gt_types.h"
>  #include "xe_lrc.h"
> @@ -331,20 +332,6 @@ static void __emit_job_gen12_simple(struct xe_sched_job *job, struct xe_lrc *lrc
>  	xe_lrc_write_ring(lrc, dw, i * sizeof(*dw));
>  }
>  
> -static bool has_aux_ccs(struct xe_device *xe)
> -{
> -	/*
> -	 * PVC is a special case that has no compression of either type
> -	 * (FlatCCS or AuxCCS).  Also, AuxCCS is no longer used from Xe2
> -	 * onward, so any future platforms with no FlatCCS will not have
> -	 * AuxCCS, and we explicity do not want to support it on MTL.
> -	 */
> -	if (GRAPHICS_VERx100(xe) >= 1270 || xe->info.platform == XE_PVC)
> -		return false;
> -
> -	return !xe->info.has_flat_ccs;
> -}
> -
>  static void __emit_job_gen12_video(struct xe_sched_job *job, struct xe_lrc *lrc,
>  				   u64 batch_addr, u32 *head, u32 seqno)
>  {
> @@ -360,7 +347,7 @@ static void __emit_job_gen12_video(struct xe_sched_job *job, struct xe_lrc *lrc,
>  	dw[i++] = preparser_disable(true);
>  
>  	/* hsdes: 1809175790 */
> -	if (has_aux_ccs(xe))
> +	if (xe_engine_class_has_auxccs(xe, job->q->class))
>  		i = emit_aux_table_inv(job->q->hwe, dw, i);
>  
>  	if (job->ring_ops_flush_tlb)
> @@ -401,7 +388,7 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
>  	struct xe_gt *gt = job->q->gt;
>  	struct xe_device *xe = gt_to_xe(gt);
>  	bool lacks_render = !(gt->info.engine_mask & XE_HW_ENGINE_RCS_MASK);
> -	const bool aux_ccs = has_aux_ccs(xe);
> +	const bool aux_ccs = xe_engine_class_has_auxccs(xe, job->q->class);
>  	u32 mask_flags = 0;
>  
>  	*head = lrc->ring.tail;
> -- 
> 2.52.0
> 
