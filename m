Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED8F8FF8867
	for <intel-xe@archiver.kernel.org>; Mon, 27 Apr 2026 20:52:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6D5E10E931;
	Mon, 27 Apr 2026 20:52:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jdz4LX9p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26C9B10E931
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Apr 2026 20:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777323169; x=1808859169;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=yAYRiXCyXesHpu6lXXGMLEJKx6sMCmQ3YlyUkssWJY0=;
 b=jdz4LX9pI/I696nCYMCc/mdridqFxS9h01w/llwX2/RLAb7X+hvQO3Q4
 6kWv1gxP7aO1CW41astniKVSTEGKZC2Nz5ONO6kwHpUIyIi1Zm+MxFeG1
 UIBeBoTs7gQfXkhAb0+hV/fFb4/F4RlAwoPdpNOU8QUXHmQiVTYC7OSJK
 xSs/Zi9lD8V8eYas7+/1S4rlon7c8nJrB2+hWgkK/veBpzRZ3Qde1c2DL
 A1YGMRplnLbVFPuqBqlvfzkn6Uq1W/cWbwP22AmjqTfj96nNW5DA4qxcr
 laFmedniGq53NPWQD+g/j2fvSuSgAb/PFQZyfnIovr++eaAHdw8HYO4QC Q==;
X-CSE-ConnectionGUID: JQXY4hTzS/+CSt62IEvjdA==
X-CSE-MsgGUID: WMvBbTeGT0e65JVcpAgsaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="78332164"
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; d="scan'208";a="78332164"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 13:52:49 -0700
X-CSE-ConnectionGUID: fVSorLsZSym2HYLPqoomgg==
X-CSE-MsgGUID: gV/c5S5VSbm+J2WVR7xOqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; d="scan'208";a="231101921"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 13:52:48 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 27 Apr 2026 13:52:48 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 27 Apr 2026 13:52:48 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.22) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 27 Apr 2026 13:52:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MWg51geWjeZGbiaaAJaVrha0PUcLBAnnefUT5DAvpVyyK1jYtjNKlZaY4RcsSmcje6yAqM7vW77yxmvvN4oH/sB/Ii0/VWKqZ2InreqAOf95fVFlPfz3jUVs8jFzW3G8YKCsuDne3D/cvARdIuZMRZ+18tfVziDMSxBKc9Jo7mrvVW7U//0XjADhN+ZAhsNBT1H3R9jnnmIKDXW4I7gklQl4fyMQ3wY38P/QxptGCEN7Di+zS7MHe5vF8MzxaFrtYSk1TIJ9BzzzG1QINEz3kOuCLVkBWlPuxRAOQq8fKHQTybxVM/oq3j8amnn8V8uH/8HCQ2ZRB4BNKOSVWdmt0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e2YF0bBg1Y2djSwtl5UUxye0W5X84CrxRdl18Rm+0TQ=;
 b=gZKI/pCBvGE7FfWuXFQQoARzVgHJDRAWKL7rEcEx45OxVHZUIfrskouWgPscIKOSCy900M13lRttkwUro4sy/juobA0kCz1WSUQ6JV9MkCwmjmWpvFyXIX9fzxLJU4nOyAPbpdwHME9N+9NahacNMewkDEmCqg4nPUuh+GupXjmjLyzm6seU6g04v46GUc1PwC3L33PhGHHCa9twhY+dDRz86DhPJpOJrg/agF3K15XpoXPHWfJHeeo5yXz4O6bAxnaVLESYVnNoAimOEoqhTeUdr2b36XzoSCXcvcOm2E0vNP8ji8sQ79X9BZg2oHbQCIbVxu9gnty/skQnISFlGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH8PR11MB8063.namprd11.prod.outlook.com (2603:10b6:510:252::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.16; Mon, 27 Apr
 2026 20:52:43 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9870.013; Mon, 27 Apr 2026
 20:52:43 +0000
Date: Mon, 27 Apr 2026 13:52:41 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>
Subject: Re: [PATCH 3/3] drm/xe/oa: Implement Wa_14026633728
Message-ID: <20260427205241.GK2131374@mdroper-desk1.amr.corp.intel.com>
References: <20260427202655.2493474-1-ashutosh.dixit@intel.com>
 <20260427202655.2493474-4-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260427202655.2493474-4-ashutosh.dixit@intel.com>
X-ClientProxiedBy: SJ0PR05CA0116.namprd05.prod.outlook.com
 (2603:10b6:a03:334::31) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH8PR11MB8063:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ba0ece8-e771-4e68-29d1-08dea49eedab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: LAIdD52l1omCRc9M/B2GPR4PF/rlb4TdTzoeuGDH5HcBkmIC12GOGhMzhL9Oi+f/5zPjmaJiXeo3Q55I54bs3lk6udHOd1LNLxI7o/2wfD/fWHITbcn6vvUx5t43jVjvApg4N+tUkaoFtckDHEBuswHY9+QEfURkxjwKqrXCP6DZH60lujDdIAEu5vhS7Fnf+ioSZYSwdBVwCCMxvaLmAbDgqjQcHKBo+/YIGKgjcCdqgPEm1+vuSsa2dJK3GFD1IrczXtqoKtvOC+s19H6RK7QTjb2AwqmNYuOY2F7JweEs16Yy3yDF9xszQ4i4u/T/8RDBBM9YW/Az9bH9wdzt96IOaAf29qN/PlAymA0MAEUeJZW79ed0IItmD4FI2w9z5SL2ZxavDUG/LuypMRqadcR2i77hVBtl3PIVWpC1RYn0Y12Rf6IudCARGECT4xb3Cyj3Bi2brO+GRDzb1hQ6qqE69pCjmxWVhvPk8NrekOoVz1UJo5Jeo8shlYQqaLrIp6rrZOp1rx+8IODON/FcJTDUdVVxTkwH8u2wYvhT2fOR02IBAhjRI5ZGaJ8JEjZX63y5eU8IiHBoLnuJkImt1Mzqo8GbNBkP6RoFaXyUqzva9CrjRLF5NVYeNS/AtABJuBvQRERDyn6sBWCTJMiGFYq/6Liga72S1n8OzK1MR5lpFRLq5LR9zAJfTfuY/9q3whlYJadbw9xPftk4HVpQFNPDbo85bA+FoVNn3laaDus=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RFmjA8vJJ2sznRBaVWToF3BqMywhFC+8guyy0Uwss4nHs2oFMBh6W579lif8?=
 =?us-ascii?Q?XSj7mccmHUzkv5oaVA4pNx/4+aucNNbgQe62s9gZz8i4NV79OF2+HECK9sTI?=
 =?us-ascii?Q?gbJWtahgbpNrHA9WCjN1sgL5GGPiDHB00MgW4asuW3UU5kbYPzoxEYOA5oWe?=
 =?us-ascii?Q?SA3wWM1q5QsMsX7NEhtTfq50yRpuBz7U2iqB/isFVGfF8iTovtag29k/SU23?=
 =?us-ascii?Q?GaSN3PSKhG8QtTNN34c8JXmugt9qLkYJgQBrnEGuxeJxGMs2SLlUdYUH1THH?=
 =?us-ascii?Q?PB3dEGKLksZ1rX1U3/sqCWSPhbZ/MYPHhwzb194ibn7ftypQf/lFiPrSH8Za?=
 =?us-ascii?Q?L2V6UkbUW2PmArT7Ze0lKATRclWcNN6HBf7ozj8zvPUsiEUEQJd0ck8qpY87?=
 =?us-ascii?Q?0Z0KmXdRnv4t6IE8m4EqtBr/q0hi4U5EbNEJMXPZl5b/fQqMYneWReDwXk+7?=
 =?us-ascii?Q?/W7k0nNgcfUisLsHTDV6dFg6X4C2Txs+GiEltbw4OS6bsMRdZV7K7GXNDjqf?=
 =?us-ascii?Q?CuQ26nri9Boqm8udUyAXy24jcOs1vU+oQB48jExLL2Vq82WpalqqyRKEdL0B?=
 =?us-ascii?Q?276QXzi8uyERrzF+7+THXZVMvmit2OnfkH07YIqlfeBPh5CvkU4rtLMeKWjP?=
 =?us-ascii?Q?r90nZ5IZhFIXV8Oe3Id2iRSbz/t0Aj6am3QWe8/vFRq+imsy7tIi4MFAiq5X?=
 =?us-ascii?Q?K0vZHgtUsU/P76BCEbPAOWDAXheJVWsCqG9byJKoldW7ab5zgKmSYuJcf4pV?=
 =?us-ascii?Q?7rpYgZLfA4zcjMrg29aVvQWiM5UdEDzjb2Ti8wvnUsO7mA2ihrOKDjeFRnlm?=
 =?us-ascii?Q?Ry8vs74KeWp0JWWmHhhKrN1X8+1f1mLtzsL/PNe60fVHlN2jCIwc6sLu2pA7?=
 =?us-ascii?Q?yiOy8daCI/x47PizR533ZSBNyDEDyio5hYsfbeoLv05umOmjBK91fzDt/SAt?=
 =?us-ascii?Q?DtO4UcsJ3huuwnUETb9U93kr2NPASRk1KTg/0W9+nguYEiVRvnjr0LnMT13I?=
 =?us-ascii?Q?191bUS1Y+zan0kCFfPvbkjfH57XwWbCNfCydH9iEvjxH35cVaCGLtWsn0meK?=
 =?us-ascii?Q?vLzBhMfh9mCMn8VdRjgaLxSIJhD13F0gRCYjZb3Uc1u5nCwZR9yOaUttvW5I?=
 =?us-ascii?Q?BZp5cEOm4yiNN06ue5KbASkcHQ0rq/t4vOTga4pCGLhwNZ0CJAzKcIPd5+T2?=
 =?us-ascii?Q?S0QqQyIArNaSAz2nQqaqWIKQJx0XcfE50YDNMFkoKtXDcuscym6Y+Nn0Fmcb?=
 =?us-ascii?Q?VeUqB+/I64rDMLkvfvbZYZacYMXRwcZNkkeWJk9jy4/SdT1RlkXT4PXxlLd8?=
 =?us-ascii?Q?hQnfqEr7QRtsXRUhk4opvKW4aZLBt2RvlWuCbJn3PB7ThNGOctnxbOa4uRu+?=
 =?us-ascii?Q?Qw1D+tSkSdGOI8uM/N7JLGdOQfqthb2pIQbjBHEtbG6g5iJO+1FJeQJq0fp7?=
 =?us-ascii?Q?gmpuKA8Y9VYsQFJWRQO5RKTVYlajaS91fFr7t//FeozHqE+cj6sSZunUHTKb?=
 =?us-ascii?Q?ocRDqHimkWfjq8LJYGEfvqRU/YNE63Y/79btBptrjRt+7fLSHsGib+0fg1/f?=
 =?us-ascii?Q?eGAmLjr0uOlNDNgxhALScg4v2IgZCWMGjYpZgXNA8gijYfLhJ4szeBkj5Niq?=
 =?us-ascii?Q?Hsu/gXXBe9V0zps6Tfl+ma6CBZGlb2kjysHjCEJtXN2WeZwRy5L530tcTS/P?=
 =?us-ascii?Q?hdBpq6d9weJ0uwiS9bUuRNRzSF1UyTzgXbp9MSuRJXsDMcK9FjsomBlhVVRV?=
 =?us-ascii?Q?70u3Evigd9TOfQ2cbV3rDYEL5oLtYUk=3D?=
X-Exchange-RoutingPolicyChecked: EulM9JuIJ/QDBUneC5acY9rWftOKAWYiMB5+rbiJCz9Lc/isBntNneL38MB3PGfdZYz5exgUvpHKwVnKc3pXmNAkpfbJ6sw8icAWZrKusGqc2BPSRavSPZDcIIZ1XrOphf9Uzt00urFRprp3TsA+7ybwXKHo1uKEjr0cSiJtAtKaTZ1c3v986WOvTuFjpdffUaHayFJkR00FXPwzPJAhJINVyBY/jx5l1frEqetwHipCY1uz7rzN9PsfYeYI+fj8JE7WDUvfS7BoJqFEDbYrdEs1xNpfVJiyDHdgQL1SKt9pha4CfbXSEacTPd++UtQxoh4u3ARfAwz2htQwN7AiSw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ba0ece8-e771-4e68-29d1-08dea49eedab
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 20:52:43.4497 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pauc5YbE9La8/4pt2T4i/RWC3FBcat1t73CiXrcc7sZMd6wyZ+zEd8lLHWjvtnN1CYlNvITi15Kxr7n7Sg7LTaU3quVh00HdVFuColwyErM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8063
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

On Mon, Apr 27, 2026 at 01:26:55PM -0700, Ashutosh Dixit wrote:
> CRI Wa_14026633728 requires MERTOA buffer to be allocated in device memory,
> not system memory (which is the default for OA buffers).
> 
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_oa.c         | 10 +++++++++-
>  drivers/gpu/drm/xe/xe_wa_oob.rules |  1 +
>  2 files changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index 83797c9479f7c..d905302f3f151 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c
> @@ -250,6 +250,11 @@ static void oa_timestamp_clear(struct xe_oa_stream *stream, u32 report_offset)
>  		xe_map_wr(stream->oa->xe, map, report_offset + 4, u32, 0);
>  }
>  
> +static bool mert_wa_14026633728(struct xe_oa_stream *s)
> +{
> +	return s->oa_unit->type == DRM_XE_OA_UNIT_TYPE_MERT && XE_GT_WA(s->gt, 14026633728);
> +}
> +
>  static bool xe_oa_buffer_check_unlocked(struct xe_oa_stream *stream)
>  {
>  	u32 gtt_offset = xe_bo_ggtt_addr(stream->oa_buffer.bo);
> @@ -893,11 +898,14 @@ static void xe_oa_stream_destroy(struct xe_oa_stream *stream)
>  
>  static int xe_oa_alloc_oa_buffer(struct xe_oa_stream *stream, size_t size)
>  {
> +	u32 vram = mert_wa_14026633728(stream) ?
> +		XE_BO_FLAG_VRAM_IF_DGFX(xe_device_get_root_tile(stream->oa->xe)) :
> +		XE_BO_FLAG_SYSTEM;
>  	struct xe_bo *bo;
>  
>  	bo = xe_bo_create_pin_map_novm(stream->oa->xe, stream->gt->tile,
>  				       size, ttm_bo_type_kernel,
> -				       XE_BO_FLAG_SYSTEM | XE_BO_FLAG_GGTT, false);
> +				       vram | XE_BO_FLAG_GGTT, false);
>  	if (IS_ERR(bo))
>  		return PTR_ERR(bo);
>  
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index f8a185103b805..a7c1bd9bcb943 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -65,3 +65,4 @@
>  
>  14025883347	MEDIA_VERSION_RANGE(1301, 3503)
>  		GRAPHICS_VERSION_RANGE(2004, 3005)
> +14026633728	PLATFORM(CRESCENTISLAND)

Is the underlying defect here tied to the graphics IP or the
platform/SoC? If graphics IP, this should key off the graphics version
instead of platform).  If platform, we should treat it as a device
workaround rather than a GT workaround. I.e., definition in
xe_device_wa_oob.rules and use XE_DEVICE_WA() at the check sites.


Matt

> -- 
> 2.54.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
