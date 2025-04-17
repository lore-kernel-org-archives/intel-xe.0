Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07C81C369BD
	for <intel-xe@archiver.kernel.org>; Thu, 17 Apr 2025 02:49:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDB3710E15B;
	Thu, 17 Apr 2025 02:49:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gCYz1RhA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ABBF10E15B
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Apr 2025 02:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744858174; x=1776394174;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=gKhbjeQ4Uq1sL1HK9WrKREmIqKYjauY4CdjsOvaIFNg=;
 b=gCYz1RhA+PwDZd1bszPx1KYQUj0/p349sVEiyA5Q3CQ0nB/jnSKwdV7L
 snLSp/EWTt+Aep10iLmtnuAGPAkyBAv92fJ8PWpOZaBs6tJI4nMh9wwce
 RZ7BCEjlxlzchDsRNHlL+arjmzsKs5UxJqFusGUmOZEgcjEOMstRxiQ71
 zAFktdU5C9Keasn+sNjlnJonCXi4L8q7zXXuHv6EMgoAr1D977ANMYKNQ
 prMavkzsaeEUH3akKSfKd+tUB/XuU8KOF8c5BCKfx+l1Ga3VspF54MoWR
 gcPI/b2gQPF8zdCS9LKAfqQqPQcxSe0wi/saIVEgfYfvGuLr2uiGgwVq1 Q==;
X-CSE-ConnectionGUID: ymrTi9kURoeobv/+168MxQ==
X-CSE-MsgGUID: /qwmp0JjT5ySm98PScorsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="49126120"
X-IronPort-AV: E=Sophos;i="6.15,217,1739865600"; d="scan'208";a="49126120"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 19:49:33 -0700
X-CSE-ConnectionGUID: kXW7tL5cT6iBpt25Omi/tg==
X-CSE-MsgGUID: FynpBx0TTHGNW/+T7ssNmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,217,1739865600"; d="scan'208";a="134762179"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 19:49:33 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 16 Apr 2025 19:49:32 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 16 Apr 2025 19:49:32 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 16 Apr 2025 19:49:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IkfYMiQa1+d5Djm1nqQcbGuZTBvSJnlC+i0vrsHrm08/P60Y7BqypweoyyBlx9BYfgLGrS+pd8rhrF5M+3CbZKcE4CVSxtAAGnk9gJ0DSePM4AX1zNhqqC2FNosFxjgjfI4RU3RqJQ4Z0I4/X7oBY13eAB/3V8odS/bmnCHq3uxxERUiOKXtz+qoL2+dDxQkXjq0N/+UkPun3sj6TGkV+iU9dMsjUL4XCQIlaCmeBDwAtrJnvcokheeytj6wBDk9/K6lHknjhYBBbVgSRCS2eQVnBdkIlKht4EnszKHXfv5Hem1PPwjDtDF0O1B9zt3myj5Pe44EzKO/RWhH9MqDfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oGHpucvV8oJWBPkXmirspzJMIoK9j2HifcK4eyqzhSg=;
 b=bdtZkB6d72Hg4aV99q62c4B37qEqvKiXnKCsreyH4Iy0cSQWOt0URoqf3diG5yxsf0BOiiNP/1X6kmP5hWhyF5vdvyY93UlX/i6tqpVyVPW34E2zoYPYy+WAKjdnlOAc4dVUD7sYHHG6lHrhwm+mocLdSCVEGK0gzE/LjyCagA5CJ1aJJINtJZxtF5pO4AYBUXwgUeKZL8RGo7bFf5X94ZvK/X5/dfrNy/pzBA1XWItPqPJGfkAMxH++V5S9T8k5kCs7ETPSlvTCV636qa951DmZwFBp5l6eC/kfOT0WShqkCcAyTCWPS0hU3jUFD5P/feZCa/UMpjDJ/akylw2drg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BL1PR11MB5304.namprd11.prod.outlook.com (2603:10b6:208:316::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Thu, 17 Apr
 2025 02:49:16 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8632.036; Thu, 17 Apr 2025
 02:49:16 +0000
Date: Wed, 16 Apr 2025 19:50:35 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v2 02/32] drm/xe: Make xe_svm_alloc_vram public
Message-ID: <aABse87AfXKsFOn0@lstrano-desk.jf.intel.com>
References: <20250407101719.3350996-1-himal.prasad.ghimiray@intel.com>
 <20250407101719.3350996-3-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250407101719.3350996-3-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW2PR16CA0028.namprd16.prod.outlook.com (2603:10b6:907::41)
 To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BL1PR11MB5304:EE_
X-MS-Office365-Filtering-Correlation-Id: f9164b55-fbb3-4885-fbc8-08dd7d5a716c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ypsDY1zG2k4SNjteI0yEMtMtgesxiaCxaTWo9mmAGdSx6vh8gU7z6IDnTVqQ?=
 =?us-ascii?Q?5aZgVUVDHxHzmV3HwUuDsS7X7Dy5nXbrhPl84G5JfMSeBRXQQP9fjHP8TmjB?=
 =?us-ascii?Q?HdiTG+lDWOiIdRAlvfK5ojNUhza97lH0aBmO5tvBnDUB0d/kD5LhQ049zdJt?=
 =?us-ascii?Q?mrVbr7qkAmZOu2nxZ3lpGviE2cx0hWPuU8LsW8JLfypksSICtWb/aYAXb2pt?=
 =?us-ascii?Q?zTlYxat0jMrsDL+mbTiDjAWMBOcgnWNLg6BvvgGFakv8zpLqhMBp+E1Nix8B?=
 =?us-ascii?Q?Tr0MJKozQ4w1BwTXd6N9tZNO9lUcRPgc9yy5lA2kiPAVKteqsj1+cawYLS0D?=
 =?us-ascii?Q?pHs4KFOqooj2Naku69ZSursM/2vugLbQiCNyLBOKX9WnVZGP4lDvgoSHfx0f?=
 =?us-ascii?Q?VkOMSDGY4WpIHtbinirkPFqXee41+iY0N+/lvCbD9RvqVXmrIHhpcFoYrEeb?=
 =?us-ascii?Q?6/sQ5CMK7yeb9jaPLA6tVlt9RKkYhRWTEQHI+4NLy2j79NvZNCX3SSymnzoN?=
 =?us-ascii?Q?nNDntz0BCnA/nYaIQw6F8OYE0/20uoPqQ24Ztv7ZFnRaLz1PF0OhGqg6vLlp?=
 =?us-ascii?Q?qHPdKktxbUnP8fqFom4cxRNxNO3lOd7boi3FUqXcvrxhGfnEZNNcNFINGRVF?=
 =?us-ascii?Q?SNQ34yccoPrBHX6XT3ZiIwe+L357zcVP4NJ7So/OYx5azgFBWE9Bf2/hwfdD?=
 =?us-ascii?Q?QtkucAkDEeUP2LLXnEx+s2JEe5LrBqeJ5/nVF/Y/mLUPReJacLCd2qJnYKYR?=
 =?us-ascii?Q?M2k6/oBP3049WiRlpyRuwDX3MsG9sG19VBF2DwB7xMonMRnecQfYukdpmgzb?=
 =?us-ascii?Q?mAU1H51EjbI85yQoc02h+OiWBTWxLttLx7neVdOZEoJvJYXl4rjZ3qGgjhDz?=
 =?us-ascii?Q?l5Pzjqc+0KZizARH5hSX4qOCXZq2Zy4svYG3e+nPsWSnpylJuxHVViTrk3ij?=
 =?us-ascii?Q?pRrHMirYHR7Y7FZZiQLfzaQMEREKu/iL/kHMIivQc8ziXEZy5fzo1op6z9/1?=
 =?us-ascii?Q?JDRWOa9fH6f6A7Wj7JPxf4QBeUONdJOYwAyWNyKdBGA7vB61oeQozHunXrWw?=
 =?us-ascii?Q?f9aTVHBblkaWtXpL3tUaVwqj8nzkjFW76x/IIzz/YR76m2EMhWz8LKJQ0Dbw?=
 =?us-ascii?Q?YlnOdOdMk2/pn1FjDSgqtylM3f+tbA8vCCSI+K6DpUrMd6OlcrgrLFTBKfKH?=
 =?us-ascii?Q?JTPAjfa/uQlYEGZP4xMB4x29JAPLQyrJqyVIBHhWWkv0EgGL0jGQf45z0IBQ?=
 =?us-ascii?Q?WpxVecDfVUnr0bIect0snuuG6ZGXCyJKfzy1+4mH7RnT/BI5aZDGraYHakKa?=
 =?us-ascii?Q?jSv1RfV4bHJR/n8+rrQKc7g7QdZK6i44bK29CeouGbjSjGRUQlm8c00lHJZW?=
 =?us-ascii?Q?PdP9s3PFUYkGQ4/ia1Gikdf4kHHlNZQa/VsSUBTxw9f/6DV0kyu72OO/rvI6?=
 =?us-ascii?Q?KIB60fZMeVk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?phJeDQr/W2flOOF+cu8jHAxk0aw4usfNTHj6p9wcpKgfLCbNkxtpZHm6pOr1?=
 =?us-ascii?Q?xRxVXRmDJ6kkZk0BvcUWYja5KaSI038NfkeH5UCD6e8/iU9kgVJ+OHQTOwF5?=
 =?us-ascii?Q?u6XraxowixvVPp4RKLDnJ8vX1fwxxMRG8T3RD3mckyZWkVsR6zKutpdIwT8K?=
 =?us-ascii?Q?NBqC4LWGFPfpRWJqmI6+lB9Vw3y3fyanPbH2QGZUJRnbbajgB99LIAkA8kLb?=
 =?us-ascii?Q?xulEwx9pga5rrKmal5UpYG7zV8rKN7s09IVtYZuMal+bqSgWhWYPpqsgjri4?=
 =?us-ascii?Q?Gv2PbZXHNqkz2d4KNDvJU04POj0+nMDtibWyTh2jOhQvclIXzkkltkP/CNTL?=
 =?us-ascii?Q?kd0XxPljNIxWRPNlJl67XCEyknisZnL7zOJ4GCGLm7jwcWm6uWhSWtTtNIIN?=
 =?us-ascii?Q?4xtEyqDGn7Khs0e8uJG8htjRdEAWNDzg+QUQOn98GdWzQ8A9Ijcw8ncwWH93?=
 =?us-ascii?Q?x8dHlEbqGmdPgJ433q3GGePE7MqRyFv+D+zzfS6KGWRh1GAGANubv/zmKFB0?=
 =?us-ascii?Q?1VjtSLRjr0TpRyAnJP+Vaajrpz7hdEcbsNjuCGMtmFhLnk/VDQ/VVmGlcm5c?=
 =?us-ascii?Q?Abw2oYvvo1rwyFlTYcMSJs8f+GMHufv8MRZ1EpU/ibfTTyv0L7avtrLA2+On?=
 =?us-ascii?Q?tTcu6kvx8sRgRuvNBtH3MdLaxtC5ItAXHaNOapvRYUUZcnM1XpeJeMbLUaTC?=
 =?us-ascii?Q?rQal9ErTL6lwUeSuHYPOoqK3sb2EzvmVR/QUoxU6Zn0U5r7RQCFxxj2brrKb?=
 =?us-ascii?Q?YOG6DvLk09MqA8+3WDRb92AtagcGRTzAaBObhyblTI0vAm9BWHW/ewaW5L6t?=
 =?us-ascii?Q?5Zz71rLXFFeM1IZA3uks3Z9DGz88vzcjJtEcPPrI9Fi3Iw9SXeifIeHf42+8?=
 =?us-ascii?Q?oc7CHA7cDZXLIGxbiJBi7r9B8/tOebhwTslYGpFPojuWNAA0HNkWPonDugcM?=
 =?us-ascii?Q?yvhK/DWo8jycTdZcnOfochr/dW519r04UIJMkYFlN2ULqbYuCdaZP+0PueM3?=
 =?us-ascii?Q?zF0E8S+UpE7OeqykAf+BYBEpIpdgi9xaYheSP4iBa5I8ocIhAzY+nhiBbMuM?=
 =?us-ascii?Q?N7QhQflUNo+qU7KsMyqkpHAFIBrX+Sc2K2QG+SiFuv0n2c3S80lqi14OGQx/?=
 =?us-ascii?Q?Lwq8/1OsULVKDB6ntQpF/Mos4XnQZQxD4TZ+hEJAnToSqG9uzjIG7JFd6uL1?=
 =?us-ascii?Q?zraH3HhEtcdW5Y2bFlbOVYjX0aErb37yuox54oUyv5T5erQSXSAiQVvZuxJg?=
 =?us-ascii?Q?3lBkDsIQ8TZjvQvXnKNJ1SUHzO0HrBXbqlvElHp6xYL7ssCQ+FgDAB8Xsw4j?=
 =?us-ascii?Q?hJIADj9UrAPpNea3zFJqBYJhQ19lbUelbobNRXyIj6OVeuPMe4aDHmgmpigq?=
 =?us-ascii?Q?5ykJ3A442QovwTSgI7kb3P6scfbgKuGihduhS7BFnEKnbPcC0g1rGKEoNuEw?=
 =?us-ascii?Q?Ig/2X10FIZBQIV4z4KrhEvjX/s1h69oO7sb8QresHLRlkynoneNV0VdgfAPD?=
 =?us-ascii?Q?m59di8GXmtRxB4oxZ25NNsUYpVO/D0kVDIl4+GgMXHwZCvewm9bWbJsY6F+A?=
 =?us-ascii?Q?g9Qw7QaMuUutPnGyp7trHZYc3vUtRe4yPkb62vmBbQijpXiZ/BBWzxIy+UVs?=
 =?us-ascii?Q?Ww=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f9164b55-fbb3-4885-fbc8-08dd7d5a716c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 02:49:16.1535 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rEd/YntlcHPp1vyh0ZNC5F0UYyXBrwLsUDcE6FQ8MrlQ7Thr0CXDz9HoLJUICSHcNysXeVofWpr0D7P/MTjPeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5304
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

On Mon, Apr 07, 2025 at 03:46:49PM +0530, Himal Prasad Ghimiray wrote:
> This function will be used in prefetch too, hence make it public.
> 
> v2:
>   - Add kernel-doc (Matthew Brost)
>   - Rebase
> 
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_svm.c | 23 +++++++++++++----------
>  drivers/gpu/drm/xe/xe_svm.h | 23 +++++++++++++++++++++++
>  2 files changed, 36 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index c7424c824a14..de19ad056287 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -661,9 +661,19 @@ static struct xe_vram_region *tile_to_vr(struct xe_tile *tile)
>  	return &tile->mem.vram;
>  }
>  
> -static int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
> -			     struct xe_svm_range *range,
> -			     const struct drm_gpusvm_ctx *ctx)
> +/**
> + * xe_svm_alloc_vram()- Allocate device memory pages for range,
> + * migrating existing data.
> + * @vm: The VM.
> + * @tile: tile to allocate vram from
> + * @range: SVM range
> + * @ctx: DRM GPU SVM context
> + *
> + * Return: 0 on success, error code on failure.
> + */
> +int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
> +		      struct xe_svm_range *range,
> +		      const struct drm_gpusvm_ctx *ctx)
>  {
>  	struct mm_struct *mm = vm->svm.gpusvm.mm;
>  	struct xe_vram_region *vr = tile_to_vr(tile);
> @@ -717,13 +727,6 @@ static int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
>  
>  	return err;
>  }
> -#else
> -static int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
> -			     struct xe_svm_range *range,
> -			     const struct drm_gpusvm_ctx *ctx)
> -{
> -	return -EOPNOTSUPP;
> -}
>  #endif
>  
>  
> diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> index 3d441eb1f7ea..d8772f841ab7 100644
> --- a/drivers/gpu/drm/xe/xe_svm.h
> +++ b/drivers/gpu/drm/xe/xe_svm.h
> @@ -75,6 +75,20 @@ int xe_svm_bo_evict(struct xe_bo *bo);
>  
>  void xe_svm_range_debug(struct xe_svm_range *range, const char *operation);
>  
> +#if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
> +int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
> +		      struct xe_svm_range *range,
> +		      const struct drm_gpusvm_ctx *ctx);
> +#else
> +static inline
> +int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
> +		      struct xe_svm_range *range,
> +		      const struct drm_gpusvm_ctx *ctx)
> +{
> +	return -EOPNOTSUPP;
> +}
> +#endif
> +
>  /**
>   * xe_svm_range_has_dma_mapping() - SVM range has DMA mapping
>   * @range: SVM range
> @@ -100,6 +114,7 @@ static inline bool xe_svm_range_has_dma_mapping(struct xe_svm_range *range)
>  #include <linux/interval_tree.h>
>  
>  struct drm_pagemap_device_addr;
> +struct drm_gpusvm_ctx;
>  struct xe_bo;
>  struct xe_gt;
>  struct xe_vm;
> @@ -170,6 +185,14 @@ void xe_svm_range_debug(struct xe_svm_range *range, const char *operation)
>  {
>  }
>  
> +static inline
> +int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
> +		      struct xe_svm_range *range,
> +		      const struct drm_gpusvm_ctx *ctx)
> +{
> +	return -EOPNOTSUPP;
> +}
> +

It is a little goofy to have 2 versions of xe_svm_alloc_vram stubbed
out in a single file. How about...

#if IS_ENABLED(CONFIG_DRM_GPUSVM) && IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
prototyope
#else
stub
#endif

Or another option is in xe_svm.c we stub out xe_devm_add behind
CONFIG_DRM_XE_DEVMEM_MIRROR so maybe stick xe_svm_alloc_vram there?

Or lastly, I don't think anything in xe_svm_alloc_vram actually depends
on CONFIG_DRM_XE_DEVMEM_MIRROR either as static version is not hidden
behind CONFIG_DRM_XE_DEVMEM_MIRROR.

Matt

>  #define xe_svm_assert_in_notifier(...) do {} while (0)
>  #define xe_svm_range_has_dma_mapping(...) false
>  
> -- 
> 2.34.1
> 
