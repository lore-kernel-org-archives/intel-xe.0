Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E027BC43458
	for <intel-xe@archiver.kernel.org>; Tue, 30 Jun 2026 04:04:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98B5410E13F;
	Tue, 30 Jun 2026 04:04:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ByDLRNt0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAB9610E13F
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Jun 2026 04:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782792269; x=1814328269;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=apVaGO2h+I+twyB9+iQmpXlPx2nG8Hpsog3IAv4/DJ4=;
 b=ByDLRNt0zd2W4QEHYkmfNOBTHAk8gy1v0moodfib/EHm9rwzl4FgYqQI
 kIYVTOnf/YwcMtw68nnGJbvmLdyKLuhVPfg8WCBXAuyoCPmMtAdPk5+xt
 bDEb9WF0ZUROK6/N3bcVQFvrQNoEHNW7n2YmQHy1QRG/GSX5dbTqE9j5+
 T5NqpbSw7d0YeTQHbKcENYQyIM2UDz2aIKnnhrL67nHDLAwJB8dHudT2i
 Zt4JeFD2sgRoiIMUaEFuXVFX3c+qjhLt1pTu9lm+t87b09TKXNnGTljqe
 6snsGgSxYsnEXxcM8PYqZrGZQ1UkGcgnmqF+4B1fIWgcVVcYKA5Oop8aI w==;
X-CSE-ConnectionGUID: w/yW5JizRAC60WLn5StAjw==
X-CSE-MsgGUID: ByyS4FmPTra8vWm6CR1MvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="82608944"
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; d="scan'208";a="82608944"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2026 21:04:28 -0700
X-CSE-ConnectionGUID: JbwJ/FJxRGm405foQmkPdQ==
X-CSE-MsgGUID: DY6u6v8gQf6tjstrIxpWJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; d="scan'208";a="256535902"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2026 21:04:29 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 29 Jun 2026 21:04:27 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 29 Jun 2026 21:04:27 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.9) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 29 Jun 2026 21:04:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wy5oB4LPtPpHVb4NBxVak8noLgqYrOIXiUFX7jwN2O971ALJMkqvsDFoyo3FdyhIELpg9NpoVaF7aMwnUK3wAJpE2XWHL7Er/MpLRyG67CkK4oZqiCkOlV2I90ipILaSgTIgfWM4zIJ9qwNMTtrbmLdnWFDAI+yzSFTVo2dMUiRsugjlBejSCowelSRdEILJO2BFjEKEdjtC1YrP/7+oSVDJNDtUy94NrA0/GXfOkWC4qINzeLWvKU4HrQdl67y2HTgRp318lDSd+piemznCf5XOOUvAhnv+s8PUv3wY851AMRUSYyiL4n6eKZa8gwCJO0sY/rSwRFVo9Ie3/Q7TCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i9wU1EvHSxocRNPdKbSl7ce6D2JxU1ds9d2DjsjGOss=;
 b=fBRcceIIMZyHWUOCWXqL9uY984THSucOI70im8ygRZr8uZxjIpq0VYRzGXdYC825vMJbKz7Hb63b6lTCOQ5/7XQxa3cChENG9cG/LXWHU/5qUFfWaAcQ1ucvrc/zGLGXI+qJwBqWU/6vD7vIOAsFNXe6gaKnwhHsUj/+fLEJJYCPxffaWgoZTpXP6IU8ljf8p+eAc36PT74CsZBMck7rRWnSBdQKNRRGFX/eSIG7BuB1M5bAbOX4mlqVlpKz1cibFYlOMmlmYWWVrtTwOPkyjzU6wgKGCUGkAkU1GloIYPlCmk/Cf6Gsm1bLQmJ37jm0+r71RPxMRwA9ITC+8k/YoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ2PR11MB8585.namprd11.prod.outlook.com (2603:10b6:a03:56b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 04:04:25 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0159.018; Tue, 30 Jun 2026
 04:04:25 +0000
Date: Mon, 29 Jun 2026 21:04:22 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Honglei Huang <honghuan@amd.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 1/3] drm/gpusvm: free the whole IOVA reservation on
 unmap
Message-ID: <akNARmCitub0EIio@gsse-cloud1.jf.intel.com>
References: <20260630034021.362571-1-honghuan@amd.com>
 <20260630034021.362571-2-honghuan@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260630034021.362571-2-honghuan@amd.com>
X-ClientProxiedBy: SJ0PR03CA0074.namprd03.prod.outlook.com
 (2603:10b6:a03:331::19) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ2PR11MB8585:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f4fae24-8202-4541-f098-08ded65cac74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|4143699003|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: NBDoSYEaeB3gD465+qmhDrH5GgA5D10TR632STxsWWL3WRq6BCcfASV3owclrT2mt790mFljGHr/5oxbIF/HLjW2E/IXn9/G5Fr0PlvcL0McLOXLSbgVDSv19BOKR5IksR1y/3LPCyTGPUJtp+cg9kHUU5H09JAt+CJqMq6U7ICJBT/NwNHoZ0Yxqz60S0lQUOQh65dSbvohLwxn7g3gDETSGL/XWi++VD0CS6zP4P1wemZRwKvWgN5GVRvKVQrLn+5MOXgOAbZE2YHj+4rthtrNQQ59bmFkj1x21wEzLc6mGhQAahEjNmHVOkGRHBKMkzjHe+5P++fzbH7ybzXsjZPbAUbpFSDXXxPfUKHAz5OwzPtH4+uyWbF4ldc3C8MjbdExBHMuuKjTp2099D0N0BIRRTs01gsihuMbD8C3Ne7+7qZmlJYpUkYatall9k4bsjaqIHiEtgBUs+/O/NUAvE5W4K22G0q2JHkcipcW3wA+heq52ONIxxGRkQIxOVtX5bDDt/sTwFuFA/nxHIbGG05zAOcBp/F4FNArwQ5ojc+c5jNVmkYasLslsmmr5txhAyq+6AyXnMG4lV4EjvK9J4+9G3MNw892QRaIOO9GNfC1IkQuqghgIiBqLXp48xhUtwoG6TEqZDzkUQmJjS1Y3MGO4rGpQuSaxzgbsps9ky0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(4143699003)(22082099003)(18002099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fv7IzY6Qy6TnOUgDJfK2IYWszubqsuHFC4W59zOAApefvrejGfPaX8/STDBb?=
 =?us-ascii?Q?sdjLyp+yZfyC0++tpAx4uaK5SXkN+KU9ra5j85C0lErWb4xyqkx0gaQtAG24?=
 =?us-ascii?Q?iVpg+sZA8Gqv/bx8/2hMLmoTxv3/eP7eLUF7Qc2Hdh+jujSPXuuWWvtp2Hrp?=
 =?us-ascii?Q?DEMAUTF2zSt7au4ZtiQ7+vWwpLj/n1igVnqeYrSeaE9YARpXV5Bi9jJUyUXK?=
 =?us-ascii?Q?Xozjpo4UiLgu5tGsheXKXqNSH6XDSOBvQcrfRGh4APIdE/QiVHMANsP6bPOX?=
 =?us-ascii?Q?FWrtIy9ry5R3tFsD3cu9h23jYi5v7xjTf0OdQP74nFAxG/5C210jLxXxLHkx?=
 =?us-ascii?Q?g1Ih2fxYK3acyti0E7qx79lS7pcH1P4U3FHHKpMCVmaLJFN9T1yr+4aPt/6w?=
 =?us-ascii?Q?bUd5wAqCY3x2nIRu9Zqt2VJM0q5fawFIzUOIBNRbiCtReNCwU9jJTvBYIiUn?=
 =?us-ascii?Q?B11hX8mKfBBnj+nrUBaVcxhw+2ILF5F19SgZR6HZufPDaNGw73u4JbW9ga2+?=
 =?us-ascii?Q?xmxlZbxrwXaGwhS1bHcq9t88sbbCU+bGGG3pPpX5qVxAYvqfh51jQQYRbPa+?=
 =?us-ascii?Q?kZ3UndwcEiqG1pa5TPYgqg/+zdPHAZ4nJVe4XfZzluZHJrSnLy66RuMhrK8q?=
 =?us-ascii?Q?50mhhKpG0lh6OMN4oJZnErXmZtKaMt7FEZc4f+vhGD7sKt5PSs4V0vz5QxQg?=
 =?us-ascii?Q?6Ud3hL6inuLfRMpE6RAVFmEbN2XoCxf121kVKoDQU3Hlm5aiVO0G5Fjw0zzq?=
 =?us-ascii?Q?uAfhMtC/2BSIQMaBZ1JfE1OJx9YO7uMGUeqlPIKsZaS5t4pBiOp6QrDxIdRt?=
 =?us-ascii?Q?o2alylP576p1j+NRIUMi7duqyX852Q1s+3yiRE6Y4WwCrP0GB2fMShj2jaia?=
 =?us-ascii?Q?73dLT9BT6bEjLztJjMChr9aJ5WcmE39C49qnwFOsBS9lAR7gPm8lsGzT+27O?=
 =?us-ascii?Q?1HixMY4VsO254Tjcki4LPI9YQVdnNrNmPbehso0J70XNywZ/NkJk24d3JZ3O?=
 =?us-ascii?Q?6O/Es7XmwRRB40Vb80NvPyp/xuNS2tOK52YRBQH0DiNJqijwgLTytMnYFHCx?=
 =?us-ascii?Q?JP3tDgvtmAq214+4D9tbyOthVfVmV5xZJElxSYN2zErUizu9fhmJ7saeMPzd?=
 =?us-ascii?Q?Th7lxe+fAjgjw9FABS6KpfoY0fKznJF3cBgRXkxqEb7q8vI6F4d4GOUO/404?=
 =?us-ascii?Q?RGF2/d8fVcwIm0tIQAltYoTPXNqa3OBVM+zSVXNX63UmPrmHgrfGxQRRGtNr?=
 =?us-ascii?Q?Gt0huJDLhwEBz+Ipv3UdVZpUWcMFpN+oJKdgYCGF8TlHbw5+60LkBtD4MYFi?=
 =?us-ascii?Q?CwcEoLRyyofTNcGeWQ+A5+7O6NV8cuoUUz5xyYmaQIITXK4OXti84eNGp2rR?=
 =?us-ascii?Q?EiVdRiw4l8HOhhL8eZII1acVSgeYwvsra8qtbasRaQ8DG0uYhJ7OfJr+NI3H?=
 =?us-ascii?Q?6eXaap/SKFjNhDpOtQU1Ihv/L55tYLuzPtJX86G/CXrkkACLgKyV57dCrxy7?=
 =?us-ascii?Q?49W/EzqRkhM64FzFkzZb0IbKpRV0prUuIQOMQ6PldNnpBDIu/x23fyRJVBbZ?=
 =?us-ascii?Q?u0g0szAO5mz1zCZgRqy/WN3kov0HtZRl7WRLHA1kmyfW5b14kupLz8R9tnue?=
 =?us-ascii?Q?/IZNybouErAIVMsx9daje16an8dGsRnu27XKz9xXavrFwg0TkmkLp5+V8Ebv?=
 =?us-ascii?Q?Vy8HBvHv4sBQhakjdEwctM50bH+KnQgPBYq6dFWD6OEow9Dbp3T3XISKY0j/?=
 =?us-ascii?Q?kFTRHhyIBA=3D=3D?=
X-Exchange-RoutingPolicyChecked: pj3qDE3TIDxenlhBJobTcJc4CjKhy0axN/wq7EbE4wR+O59uGo2YEQMZiNOP3SHDsZfhWPkeDKso6FHql+5rlJ1LX5P6DeSkjoKtuhfTnrCjv0ES5cROLs+ouo8TbRZTyMRnvuRFFK8USNSDN7ls4xMW7EXEKQFdMvDlF3u4KTFWiKMRCDMDks4h9uJILiNv24ksS0oMJMf3GEVKFLeqXapoJyJJOwIqn9735iCKGjuSKv17MoW1C+vkD4a8c6r5Xg0M1MKKue4TTFsSv6E644MwJsF5rt2F2QucritbVf90rV24BGdee8mF+EzCyOtP3LGyw+2qBriOb/q51G4G3Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f4fae24-8202-4541-f098-08ded65cac74
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 04:04:25.3601 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: svp+Ymucde7awFpOs0QzJ08viFxsrnO1Jh/HnxMk3Na+B6/2jDw5PVYuhogxbMlz64SlQJey0R38ETUyQ1U3rQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8585
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

On Tue, Jun 30, 2026 at 11:40:19AM +0800, Honglei Huang wrote:
> dma_iova_try_alloc() reserves IOVA for the entire range, but in a mixed
> range only the system pages are linked (their total size is state_offset)
> while device pages never touch the IOVA state. dma_iova_destroy() with
> state_offset only frees the linked part, permanently leaking the IOVA
> reserved for the device pages and eventually exhausting the IOVA space.
> 
> Unlink the linked system-page portion and free the whole reserved IOVA
> instead. On the get_pages() error path state_offset is 0 (no page linked,
> dma_addr[0] unpopulated), so skip the unlink and just free the reservation;
> this also avoids reading the uninitialized dma_addr[0].dir there.
> 
> Allocate the dma_addr array with the zeroing kvzalloc_objs() so every entry
> has a well-defined value.
> 
> Reported-by: Sashiko AI review

Reported-by: sashiko <sashiko@sashiko.dev>

Fixes

Cc stable too

But fix looks good, so with proper tags:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Signed-off-by: Honglei Huang <honghuan@amd.com>
> ---
>  drivers/gpu/drm/drm_gpusvm.c | 19 ++++++++++++++-----
>  1 file changed, 14 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
> index 958cb605aed..3145d55cd86 100644
> --- a/drivers/gpu/drm/drm_gpusvm.c
> +++ b/drivers/gpu/drm/drm_gpusvm.c
> @@ -1146,10 +1146,19 @@ static void __drm_gpusvm_unmap_pages(struct drm_gpusvm *gpusvm,
>  		};
>  		bool use_iova = dma_use_iova(&svm_pages->state);
>  
> -		if (use_iova)
> -			dma_iova_destroy(dev, &svm_pages->state,
> -					 svm_pages->state_offset,
> -					 svm_pages->dma_addr[0].dir, 0);
> +		/*
> +		 * IOVA is reserved for the whole range but only the linked
> +		 * system pages (state_offset bytes) need unlinking; free the
> +		 * entire reservation to avoid leaking the device-page part.
> +		 * On the error path state_offset is 0, so just free it.
> +		 */
> +		if (use_iova) {
> +			if (svm_pages->state_offset)
> +				dma_iova_unlink(dev, &svm_pages->state, 0,
> +						svm_pages->state_offset,
> +						svm_pages->dma_addr[0].dir, 0);
> +			dma_iova_free(dev, &svm_pages->state);
> +		}
>  
>  		for (i = 0, j = 0; i < npages; j++) {
>  			struct drm_pagemap_addr *addr = &svm_pages->dma_addr[j];
> @@ -1486,7 +1495,7 @@ int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
>  		/* Unlock and restart mapping to allocate memory. */
>  		drm_gpusvm_notifier_unlock(gpusvm);
>  		svm_pages->dma_addr =
> -			kvmalloc_objs(*svm_pages->dma_addr, npages);
> +			kvzalloc_objs(*svm_pages->dma_addr, npages);
>  		if (!svm_pages->dma_addr) {
>  			err = -ENOMEM;
>  			goto err_free;
> -- 
> 2.34.1
> 
