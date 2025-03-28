Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B5B0C36013
	for <intel-xe@archiver.kernel.org>; Fri, 28 Mar 2025 02:57:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B80810E972;
	Fri, 28 Mar 2025 02:57:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gYdr84uT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B50C10E972
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Mar 2025 02:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743130639; x=1774666639;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=UnDp2dyk43BfusI47waJJ0LezK3FVnxy+ae6dfCrlUI=;
 b=gYdr84uTLXweOLWdT5FyXU5H17jPfApKULIREDiqbDT0dXSqQQD86MIO
 NLl5IYuqbe/WcPFhO8XsZvNKnndqrTd+D0yrY77/AMJOAW+knxzWlo4xf
 3oeRFnRwWot8UB7t1s/fKiYnMRVB9+mSzVsuo/UN54owsoREdUWPB7o+R
 qx6JDXW7KyzP12i//frEbjSTkDm7dRheXp6dNeUOysyS7UByo6ThZtaDJ
 3hrDLOfP74PVefSHl9w25aFKQhqyPgK/uCQHi9XmktXH+17iHn0Ou6Fqj
 kvzs9akhXk0LxIFTMJ00OBafnjakedxEYpAkxVSbnIoTqZsCfWB4YEgre Q==;
X-CSE-ConnectionGUID: AQVcwKukT92FtyINDdrlLA==
X-CSE-MsgGUID: E+yRrCz2RKqUQIpBmccOeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="48358157"
X-IronPort-AV: E=Sophos;i="6.14,282,1736841600"; d="scan'208";a="48358157"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 19:57:18 -0700
X-CSE-ConnectionGUID: L0UmZajHRLOc1CNDcrChkQ==
X-CSE-MsgGUID: gAtxIa1ATtWXreDj5o6eWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,282,1736841600"; d="scan'208";a="156307862"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 19:57:18 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Thu, 27 Mar 2025 19:57:17 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 27 Mar 2025 19:57:17 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 27 Mar 2025 19:57:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lFeblw13GwmKu2KDaGwHQMtUpyjIWoIvhfdBRCbNPwAkhpMbRBWZWwOqNdMvMbOBUTgKCTse2HbthVaXsrkeTr0TtDN+uJnw70co5SnvxCJZFo07NePLao4Dcerkxkny1iAK3B44hTID4x7P18QPyF5WqZ2vOlATZ6I1tkjqC8d0WCF+S9lemURGfZO5sG0Tche2QQvjbjLvJ8TXha/2bfHp7c7a1EGl7CgfU9lagYp0dtoNERlISWpY2N8OxN0XnWz0SeTAfh4fhwmV6lXyIaDNjcyjzHNe4HfrIjjd5N3QugyY/26+p3vHRx+3Vazw0lB5M00OsirdSpVnv4hVPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gjAnJ9Kd7pGgB2oSdF4ZgV7cWf6VbuTTVXu+oTq7JKo=;
 b=VXrhC8IMZN5JM0juosssWikiB1yHiTkOSOTTVsGin6NwsLLFBk26Tcf+fgXcBZrRhqZSOv/UQnAQyCiO7y033vSgoD6yjNi1kUfJy80tfnG1gsH0LAKySyRRqWPR3tc8umaKLwaT3vNDtCVC/oNNDTpwte6EvS23Km5uvph4NxDT3uxzTRmFilOTDI0gql+hIY9DWPADUU0iCqZUqg+gT87cIo0bMvDJcwF6nig2IMYVfGmRzz468+XQif/p1vk1JrOknP/TsmTeHzh3PAPlyY0ooiGFA4OnnGqtN3EAwtG64mg9c+fLs2fZ8gDGymwB8Dv3yZ2MuMSRsKSsjM3lmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH3PPFD80FA6330.namprd11.prod.outlook.com (2603:10b6:518:1::d52)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.46; Fri, 28 Mar
 2025 02:57:10 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 02:57:10 +0000
Date: Thu, 27 Mar 2025 19:58:23 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>,
 <oak.zeng@intel.com>
Subject: Re: [RFC 08/12] drm/xe: Rename lookup_vma function to
 xe_find_vma_by_addr
Message-ID: <Z+YQT9v294MDuWMS@lstrano-desk.jf.intel.com>
References: <20250310124341.1819568-1-himal.prasad.ghimiray@intel.com>
 <20250310124341.1819568-9-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250310124341.1819568-9-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW4PR04CA0322.namprd04.prod.outlook.com
 (2603:10b6:303:82::27) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH3PPFD80FA6330:EE_
X-MS-Office365-Filtering-Correlation-Id: c69871fe-4314-47ca-b456-08dd6da43bdc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ihZh+C5nOfh3CIl9WwVFSb02nXsiBr+WwLYmTZLx8gB7KUWFp6LfY3y2555K?=
 =?us-ascii?Q?q6UyNImIuA3D8v0oB3/JUlNvGMsdvMlFHyFGoA5Q9KRIJbqBWCuA1Hb9YjUE?=
 =?us-ascii?Q?XKCM10vhSDMvyio8pHDoRzYBh0+8WUVI1VkjfmVa01iGy+LwvLkqvRxeXmo5?=
 =?us-ascii?Q?J2QZpgRNvN+3yooNeRsBp+3t7uDNVpW+bnGj8ADu16RjhJkFdK9au1izr3Bd?=
 =?us-ascii?Q?eL78ZBS09A+nsndTGMCEIeD0P64M4jwoSXs0qrh0csVwaWERsf+qzuiG9XSY?=
 =?us-ascii?Q?q8JAuw+R1lZEk0HQXxSsWhtPkp0fi/NaKJQf2YShrjprD9GN+XGv0MrgebIG?=
 =?us-ascii?Q?711D5bXLNOHBQqHBAYp7vXF3YWu3JLgpL9ZOq1+vKOLlYEewNUvTuXY++uFb?=
 =?us-ascii?Q?IoJ3jxy8XojTpC+I+OOK8uOrreQ3e1O7lmDHGoVUaKmjFlWTXhwXJn+aDNDj?=
 =?us-ascii?Q?um1sHJRfXBy+0z7Cp8l6TteSdsFzQjC+zspGqNWV3MvhUZ0eAciYZIBM00AC?=
 =?us-ascii?Q?Qj0VtDagEBpuYCnU1rVU9DyEf+Jk+Ktg5TdmgLuQAkUFeDkvcoatsErPpD1L?=
 =?us-ascii?Q?cqb3tDswGMXlzpbZtk7zM5D6t4RuLhzEy8XUSR5Cgirzc/xEuVx8/Aw8WLRQ?=
 =?us-ascii?Q?eigu4235LL6Fs+tPJvayA3I1M5pzEwevYdZ5+xET4B3tk/25wZpxnYpcV/WL?=
 =?us-ascii?Q?7IRF1ViDer3hkbUNb48GCHndHduSnMVmCcWlwqRQr3SgmFchwgVwm0s/8XAO?=
 =?us-ascii?Q?ltnSZTbS66qYdsgi5+arKXJwzoOFNnjzU3zUjVcJfH4i1L7ktGH4Lrt3s6tD?=
 =?us-ascii?Q?kMj3Qa1Kg5gCBQDZUCfzEllLvzr0LSNVjLLuQ9a7S2ko5KlRK4XsPSf+6qk2?=
 =?us-ascii?Q?En1P2CvoC3a5gmYrhF4qLW1Gic+YfPJW3meco2kRKyFklIBVtmAQswCqJG35?=
 =?us-ascii?Q?4kgDoYxdBESGfN/1tCV3H6t7eUFmFStvEs/z/WOHWzoclb8kQJd2wqbwv+eB?=
 =?us-ascii?Q?7vVGCq90MHdfJnRDx5h9jxHcOSdOoMLGiGSd4TjVwviHtW3GEVlFvlFsR8Ga?=
 =?us-ascii?Q?io+g0TRWp5sy13pTkTez7XXmqnBwh2RWXG+iqQOGhllzYHnF/gicvb6aySge?=
 =?us-ascii?Q?YDrOM6ecXgORqr6Sk2FEDk6Wl034laRt17xvDhVykCmnDfR0GCGSQkzzNS5O?=
 =?us-ascii?Q?yj9L3B63bt1p8JsDUqMiFa49odpO597i/c9uXh233dq1MjQxA6JaTUubsNh+?=
 =?us-ascii?Q?W+xBTDM+WszIYdnGinpzD6HlJkTA84ZVP7enOxiZUAxUWyvMUNCKeG4I8y07?=
 =?us-ascii?Q?FDGK1fNjTbhgGHCzxMlKK58fnRahaUeoczX1h8UZFpDWFeAqw86bR3EwGhaz?=
 =?us-ascii?Q?ZEI0Nc/hJr+arNJu6HYdd3gAXFCb?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Xf9muDgrIkaFAzocE3vO6gr+yrIUt4BvFjqilrfXP1JtuQ4aQeIUsXRpfhWC?=
 =?us-ascii?Q?KqBlIsZKAT9sk47KwFB5QbQnlCFH5LlsEnw1eCkbs5w0kHn3JUNbcb+zr7lQ?=
 =?us-ascii?Q?wueWH79/ld7QcCVIl0Bmn2Bh9xkDHwsSqkiBWxITKJtsg2dNbJ8fzr1l1ze0?=
 =?us-ascii?Q?iEGCiFXCjP00I3cHpn2dMMUYCbi0cFj1aEIgL6RjJB/3NA3DSX4wj5dPBR8C?=
 =?us-ascii?Q?hyeaRvLsjSIWxF9XOMjeFoNbhAGftarVh0S/AlIVvTRKX5j8oRogsBPreqZN?=
 =?us-ascii?Q?VMGbK3FGihLu3qMe5I52sv6Xb321J4fRd1AmK4A5oia2DkjMVshHYhU2mtIP?=
 =?us-ascii?Q?WNOoEaVC9cgsl/pQRW7dj+0rGQco4E9u4DqlB9CUrLDVMfi9AodWkp489xEn?=
 =?us-ascii?Q?FmUSX33sJsSf5EYcmOrOJ3oflGLPVJAuA0FDYnDM0CsF59nWwIz/Ax7n7UbV?=
 =?us-ascii?Q?gU3pbo1ecNcB+LMbO+RU1VmU9U2n0xkCa9jkniipWh4jzoW25Hdx97ywIbcJ?=
 =?us-ascii?Q?kbw5AGKoRaCTJa1UWN6Ye1iUolh6IMz5vxFW2kfUz0ycwbCwaok/fQNpwJhp?=
 =?us-ascii?Q?OtpTHP0M7hWFmM5QGQilafeDCsh+UItKym2zUwCSxJ8D2yFY1nAc7Sjb/pjq?=
 =?us-ascii?Q?OubtFZk5l/Q2pgooxel299WGchflHnwSyxdHe0mqYSk7kp8uRttSGN/zbekB?=
 =?us-ascii?Q?Nhg9bMXZ5k8VGT0olCDIPGy40DlYoZ4iDS2w5Le6jNo+GX2bjnGiNC643AVt?=
 =?us-ascii?Q?TFJVgAXo0nASI2Ln6mBIpdVeNVC1o4AtO+1Q6ohOO2UaK142AR8cJtKpt71v?=
 =?us-ascii?Q?aP7h0ijDjcgB4g0CvKKsZQx/aFt18/3CLlxmXIpynylP7jxaec0hcYhODt7K?=
 =?us-ascii?Q?VjREu6mCsHWUzY9ZXG897M2rj8nja0kDBO3ueBHmn9MJeats2E0X0l+FpAvH?=
 =?us-ascii?Q?2hQDEPpbZzAf98C92QZB+0FhgzcCTJp6+OE1qsnRq46V+q0Ib/DrQvS6lgON?=
 =?us-ascii?Q?B1/AHlw/g+b0HNmweM0u7y+qb4yzGFOMHve31WFjNeiG59JoMqkuq+WtsttZ?=
 =?us-ascii?Q?pRRh3Wi2maUjvUtiwI1civm7yA+xby5vkpH5QodFqB5YulX3OcI6NYGsHZYP?=
 =?us-ascii?Q?ggtjgVfX/UQ8ltmoWx93pjV7pT8gyI9OoU+0xq2eX3eVX6FzGMwX68nr9RVW?=
 =?us-ascii?Q?H4bTEF+aLvlAWD0wBEyoAKTT8cgV7/Au2PhNWd+IpQ3oZYVZ/MP5A723DM/Y?=
 =?us-ascii?Q?/ukbotlZy133i8RrQ+f9KtMmU9BhKmKLvFYImMh8humYeGrDm6wDleQ6pCf2?=
 =?us-ascii?Q?yibYBxjQujvbPY4AlQkjL2l7QQeEI/dkr0ZPOZcffwvdmp6PfQ7w4smB6LT0?=
 =?us-ascii?Q?WixmzHmY9e5FP+Uan7WtaShF1Ie2FJMbh6Zk/5Q1lIgkOC6UHigU4OaLiFJq?=
 =?us-ascii?Q?iB03fQizZSkEMpyD7eYLj/RRJVnLhUIcbkz8N4NwsPpU95ymj1TPB1524vfr?=
 =?us-ascii?Q?vuFaavxXchMjsM/O342eaceRAzZDdyB4/vEyhROcgG3ZTJnQbaRXxmPar/7u?=
 =?us-ascii?Q?inQRtiDXo9vD8ap5X47g69a6avv2KFzvl3KGiaogmJDrEwGYDiILbdpQQiuQ?=
 =?us-ascii?Q?JQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c69871fe-4314-47ca-b456-08dd6da43bdc
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 02:57:10.4000 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UvB71VXegRHSaaGKKiUnsAkDD8Ub7zSzi7sNQ0fNpU0BbAkGY9S0j7XIBiuZzQ04IL+Kc3OOFEg9cIL7WbRc5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFD80FA6330
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

On Mon, Mar 10, 2025 at 06:13:37PM +0530, Himal Prasad Ghimiray wrote:
> This update renames the lookup_vma function to xe_vm_find_vma_by_addr and
> makes it accessible externally. The function, which looks up a VMA by
> its address within a specified VM, will be utilized in upcoming patches.
> 
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

>  drivers/gpu/drm/xe/xe_gt_pagefault.c | 24 +----------------------
>  drivers/gpu/drm/xe/xe_vm.c           | 29 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_vm.h           |  2 ++
>  3 files changed, 32 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> index c5ad9a0a89c2..3aaf4090fcfe 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> @@ -72,28 +72,6 @@ static bool vma_is_valid(struct xe_tile *tile, struct xe_vma *vma)
>  		!(BIT(tile->id) & vma->tile_invalidated);
>  }
>  
> -static bool vma_matches(struct xe_vma *vma, u64 page_addr)
> -{
> -	if (page_addr > xe_vma_end(vma) - 1 ||
> -	    page_addr + SZ_4K - 1 < xe_vma_start(vma))
> -		return false;
> -
> -	return true;
> -}
> -
> -static struct xe_vma *lookup_vma(struct xe_vm *vm, u64 page_addr)
> -{
> -	struct xe_vma *vma = NULL;
> -
> -	if (vm->usm.last_fault_vma) {   /* Fast lookup */
> -		if (vma_matches(vm->usm.last_fault_vma, page_addr))
> -			vma = vm->usm.last_fault_vma;
> -	}
> -	if (!vma)
> -		vma = xe_vm_find_overlapping_vma(vm, page_addr, SZ_4K);
> -
> -	return vma;
> -}
>  
>  static int xe_pf_begin(struct drm_exec *exec, struct xe_vma *vma,
>  		       bool atomic, unsigned int id)
> @@ -231,7 +209,7 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
>  		goto unlock_vm;
>  	}
>  
> -	vma = lookup_vma(vm, pf->page_addr);
> +	vma = xe_vm_find_vma_by_addr(vm, pf->page_addr);
>  	if (!vma) {
>  		err = -EINVAL;
>  		goto unlock_vm;
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 3dd08dd5e6d5..a54e78621074 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2138,6 +2138,35 @@ int xe_vm_destroy_ioctl(struct drm_device *dev, void *data,
>  	return err;
>  }
>  
> +static bool vma_matches(struct xe_vma *vma, u64 page_addr)
> +{
> +	if (page_addr > xe_vma_end(vma) - 1 ||
> +	    page_addr + SZ_4K - 1 < xe_vma_start(vma))
> +		return false;
> +
> +	return true;
> +}
> +
> +/**
> + * xe_vm_find_vma_by_addr() - Find a VMA by its address
> + *
> + * @vm: the xe_vm the vma belongs to
> + * @page_address: address to look up
> + */
> +struct xe_vma *xe_vm_find_vma_by_addr(struct xe_vm *vm, u64 page_addr)
> +{
> +	struct xe_vma *vma = NULL;
> +
> +	if (vm->usm.last_fault_vma) {   /* Fast lookup */
> +		if (vma_matches(vm->usm.last_fault_vma, page_addr))
> +			vma = vm->usm.last_fault_vma;
> +	}
> +	if (!vma)
> +		vma = xe_vm_find_overlapping_vma(vm, page_addr, SZ_4K);
> +
> +	return vma;
> +}
> +
>  static const u32 region_to_mem_type[] = {
>  	XE_PL_TT,
>  	XE_PL_VRAM0,
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index 0ef811fc2bde..99e164852f63 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -169,6 +169,8 @@ static inline bool xe_vma_is_userptr(struct xe_vma *vma)
>  		!xe_vma_is_cpu_addr_mirror(vma);
>  }
>  
> +struct xe_vma *xe_vm_find_vma_by_addr(struct xe_vm *vm, u64 page_addr);
> +
>  /**
>   * to_userptr_vma() - Return a pointer to an embedding userptr vma
>   * @vma: Pointer to the embedded struct xe_vma
> -- 
> 2.34.1
> 
