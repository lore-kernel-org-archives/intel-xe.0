Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61DDFCD98CF
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jun 2026 16:10:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CC0110EA83;
	Fri, 12 Jun 2026 16:10:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UgOb8clY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF3BB10EA83
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jun 2026 16:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781280623; x=1812816623;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=9gkBQt7VEpqlQpX8FcmlXbnTfVD6gvEAKGZKHrTQJvE=;
 b=UgOb8clYoSf4x6EDECK7ewQaQkSizzgSd/CUFRy835gJs1n7XV8llAjI
 CBOPI8h5iTPm80n0jkMNLvc0wTAHPJU2NV3LdKWqPu+Vbpm2EHNpoGIUR
 gbBojQ9jYw3lBUUwrAPfB7m60UnvgReAgVnlCarRXKX79lHQ2Ys1ElcZU
 G4fjC6eXqsavhY2y7kuSkLxkYhwrqJB2YCSpaY6drYev9svIncB+RzGr8
 BYR7sCBsOf4ctJfL5/8zJadFtZnJMiTphecwPp4gqNHG3zfetvf7EJI5s
 yI6+MKFd8MMBN8uEwV/c7L6CE/U/JosCgpYuR0l0tSWXWeqo7lCKXmhkh g==;
X-CSE-ConnectionGUID: DLuwhhxZQ1CXNQdrjZhGXw==
X-CSE-MsgGUID: JrXzDz2TQmKr+7AoEFPgpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="93505202"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; d="scan'208";a="93505202"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2026 09:10:22 -0700
X-CSE-ConnectionGUID: FJcomQ84R/KwdHsqUASQKw==
X-CSE-MsgGUID: MgOTOvvnTpCGS2kH5BZNVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; d="scan'208";a="246917308"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2026 09:10:22 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 12 Jun 2026 09:10:21 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 12 Jun 2026 09:10:21 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.31) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 12 Jun 2026 09:10:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X9heAk7/ymIEeRZ7ZqiGNk1AOKGQsKJsIrkZUgm0iV+aYHwWKnddecJ8x9gvcPXsX6hneoRChLsvyCXoHacjvQGu+izmXfV2rya1m3yunA7kS6VlkJRsCUYs4cFgAePhCqKnCSOjeb+6y1gpLgK1KjUL7v0cXK3/UczhzyYL1kkr8R6NXNE6KJpvgzG8lZTkfeICocOlW9ImtqMwQL0BblC/6er6MGeahiraF628nBf9BlRbdxVPlqwCCRk8MeiDrBs07tGQX7RmSkHBT5tYi4JtO3kfdjz+1vUstQ/+gYicC6YQRr4EAtDELbBJ0KEAUNOfb9OImUDZHY3gV4t/mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YAUEFbz18qZkLJbZA1mdEoV7uk4a4AquM9hRfNRwj6Q=;
 b=wTpdW4sSJ/M/DO+vibQ4Kxihi/5JoACyB+dUvHSFnNmjo1oV156L1umEYGKSQU0gQxmWTo5NxnvNxe6IrvS97479rd57gO/4noLKf25doiPqWFOppB9efxKXDZN2E/hI9WSrUIzjfdcSYMWE7tsu71F/CpVftHsnze0JqFabnzijhvWDZLIzcMdpKCYIbdai5qI5ZCQWSWGiYHK42cTkGfNCBeyUZRb851e3sdhoSj5to7PF9siS7qWhRFK1dYAnYgpq68v1q7fHO3S73LcBu+9YCy5HnUxji6yab3eyd0GUtZopUOrQLzjI2LNki8bTR0CqW8+tv3pB54CfbZdRmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA3PR11MB7553.namprd11.prod.outlook.com (2603:10b6:806:316::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.15; Fri, 12 Jun
 2026 16:10:18 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 16:10:15 +0000
Date: Fri, 12 Jun 2026 09:10:12 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/xe/bo: Add xe_bo_addr_iter.
Message-ID: <aiwvZMflMd3lpeR0@gsse-cloud1.jf.intel.com>
References: <20260612141122.17959-1-dev@lankhorst.se>
 <20260612141122.17959-2-dev@lankhorst.se>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260612141122.17959-2-dev@lankhorst.se>
X-ClientProxiedBy: MW4PR03CA0251.namprd03.prod.outlook.com
 (2603:10b6:303:b4::16) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA3PR11MB7553:EE_
X-MS-Office365-Filtering-Correlation-Id: 504607c3-b1bb-4804-c0e4-08dec89d1696
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|56012099006|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: gYJLIMGpcJXpPyg9NncZPHEZeqP2ojhWivpbbcU3JOu78diK+BXMGzCmFPz1rJWI+/UFkB7uAqM3ukGdQEDBOamBnMB9GpjLsxUaUEbzE8FScoby6Y07c6dgnC/Xh/i+maAMX7XY+KU2DmsUCcQ/L/l9Lxfos4PFbE204C3aN8Pccb/CgmY/ojcCevOy89e1+HrnxgdQBiD5TQLUAI0WL3MALN0S6UdIn8aI3geqvWmFxGoORxgMi7KUpWkg3YSr87Th8lkkeOXA+4EF1LcnaRNzj6l0YnUlrmhMulELOFpk7RKIVsgqv4KWDdWGTtQRLx9nJO7udkkdRN9C+N7l0uHqegf8hpjiwifuAJIA1/SDpt8N5aGyAXAKyuql5ejoXj1GgNmqx3peisIMuBc1Vv/TqcojJQYZ9ny0dLjbijNPPwSSminEiP5ft+qUmeXJZXeR3ljQpMu/SJVGCM0UR1RE2rCFhmwukQ9XpKFltj6/KLRl/JNg/GQhTT68NLeLvxILjAgHILIMoWTEAk6NArqhkjNgJjNUOARQ5zdetEm++KTVw9OAtpWFDwyuPYG3/ZerNQeZ8SvNTUeONCeasosrPBg5oPibse7192yQa1rOuPJC0nAtYZkpnOQpK0S8wOxIto/PzINathh/RQoaAMtWomR6YOirSSmPuOwdpWMggxKVxEIlwtEwDDgaojAl
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?M9jfcy6OuPFC4UUN0rzdoayOZVZw0KW0bHFk85iEOSx+A41T3uXYJqZL7xTp?=
 =?us-ascii?Q?FMV/0cVO0aihcBqYSCYjw/b/zLSbbZcdPr7VURvkSxta+sTUKEPpBCLsyQWv?=
 =?us-ascii?Q?KTvpz7ZCt2bO7V0oRrFV3SfNLGOzQJEB2b4SZcAJNTh6LVHotsfN4gllbPom?=
 =?us-ascii?Q?63v7tK+knbNyLBtOmg9yGVXSbSY5MS/FmOHsNokBZX0Gf0cik+rn9hDsXWTo?=
 =?us-ascii?Q?6/BBuE1MiZxJkFy28c58TnBBH5x8K1GewnTgmYjAMfpBjk3HSR1ehpq4O38U?=
 =?us-ascii?Q?6Lfhb2ndOucyLttuWb1Kv3iezyv1hxKrw8w5xr39UPGtrKEcLmRMZjwW1DNr?=
 =?us-ascii?Q?hU3esE3ChAfqeLxHrQOQJpDb9SPB0Z5Er4DxoVqkwA6WdOuCmZ+tTr7mDeZg?=
 =?us-ascii?Q?sB/2Z15KaXIua3UHKWw6d4ynnEuyKBUDpM8I4aTDpYSyho3u2YPx78bHMtGw?=
 =?us-ascii?Q?0csNWaKlJj5cgjd9D6R1d8Z8OK89l89ulo2d9Mi72El+PXyS8gABnfe1+jaU?=
 =?us-ascii?Q?ZdBvmAfBtsDxDuTYF3pUTBkzypci1SNYcoyqE8i1qXjENOOHkUqtSnbjhrWd?=
 =?us-ascii?Q?jtn+7ButZt3WgKyX+xuCyCWn+KKO3dyUhqfSNhrG55ikpzHMIz7KacxMtfkZ?=
 =?us-ascii?Q?WPNMy+ecLfQWyJvRENNfwCuW3UdSKVHTXbaNICciO2r12dMUI5FNwL2Hotza?=
 =?us-ascii?Q?fWCWFMx05hSVRZT3EGLGK7e4vCXtz314TteutycmFCC12r4pZpw5GSYUgGHD?=
 =?us-ascii?Q?KDUGqbFNTlAMsXks/oS2ldmR7a5lefxCn1tR1ZMV+2d2huxA6uzWyV2Ba8kI?=
 =?us-ascii?Q?QUJzrvMzlG2/679HC8Oot2dbQc3Uc+w38u+wuGtQHz914Sd8L8jSIjIzVjSz?=
 =?us-ascii?Q?MMsmNDJfWJcu8fwsmAQRGsNTclT8MpxJUwQOTm/ztG0BMk9b4VPg6o/Pa2Wb?=
 =?us-ascii?Q?yzuxCKz5Dy1UKcwrO/nEA4dhPHnDeFbIAyF8na3+jIYvmPWai88XZURjbmzl?=
 =?us-ascii?Q?O8PpXIVdU7KsJjaCbwiJRnCFdqwr9ew+k2wAkNeX7fVGuYdaGe24UnXjHjfh?=
 =?us-ascii?Q?iwAHRrTSvydAPEd3oVEPERZgxiTI+iwwYo8Ia2drnls9dptmO6PR4XgwchUx?=
 =?us-ascii?Q?ciuxYnZgLW77gUFHP+7cFSsUSufZOP+cXKWUESFu6hdnIgyq4kO7I4DNZap1?=
 =?us-ascii?Q?7SPV7Ohq8fp8wMPqcKeVsxYe9LSGTihR7F2U9pEhlhChHRvogC8nUhuPMbGI?=
 =?us-ascii?Q?JKDnIasIspOq0VjVGz7cYR4OdiMdM7oqUNY4j7SxVv1XkOPgCEIuz8cLVRdo?=
 =?us-ascii?Q?A4CBhNhtWuxShknseiyZszhvmkI2K+JXGr3HmYi8M5EZqwjaTIrJ8sZRtuuX?=
 =?us-ascii?Q?D2lJB5laPVaBVJzoW5bSK1la55knvaXePjaUqaEo+zY2cWz6NHclSpeCykiv?=
 =?us-ascii?Q?LKA6KoQNS1vC7EdFXGV56SyuHujG4C5O90FxjIiKarE7KQayrQcxaR/y/xjR?=
 =?us-ascii?Q?4OwD2eFiyw5IpXHze3wPS+MPcQs/6ThTRYmhp32MHGLtYy32M99wibuK85DK?=
 =?us-ascii?Q?Ay/e2tFRzZ4bQoYEiy40NdqoVcsq2zRq5u50lYErEP8n9gpkyW2BYHtKaOSn?=
 =?us-ascii?Q?zMjPhz9hJPsxSTpUjm6d5WSmqCNidtWpUfC+FD4DfAEMuvAjcA6ZsRNK/cDx?=
 =?us-ascii?Q?/6J6EneMrUkIXNYvA73u//HTUlgJG5A7QUJE0stz+WK7m3SsXNC/FKiurout?=
 =?us-ascii?Q?1ZnRh9yQQA=3D=3D?=
X-Exchange-RoutingPolicyChecked: dgE5FX0eA72Qy6N2z1V2uW4OTaamNYvxZh1F84Lxp8Ge47ivyxkRm8L3SCwUHwVE/U2Hp3aZiJmxEiWLgmo7NPOuSjpg/ccCCPlRlYZXRBcb7CWCl96xIDnG9/f2ucOQuI52z0lMChhzT/fWPMIIMPLI+6Z2zQvKyAsQEB8K4gbteOU7k06iJFGCBUlkWCPeJyEYsK9pXXtoFixtr0WhilR/MgXkTvdPM5yJzXpFL5I6y2sEqLcUNifgbNftruYKdPOhdO2Qa6xYwRIfsUeOTO3IfpEaOZBxfTm63/HpQrB23+u7sxtipI6yZbpy/CAst/Ruj3V+sSO5USJ8ryVA6A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 504607c3-b1bb-4804-c0e4-08dec89d1696
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 16:10:14.9239 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FoGope5EsaXAi2fEMkAcJl1/oZca4WBZlJd3FGRppJ5eVJTxsVe8yMnt/2P2qxonkHiijVTTq75HKYEKCkOM4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7553
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

On Fri, Jun 12, 2026 at 04:11:20PM +0200, Maarten Lankhorst wrote:
> For display we iterate often over the pinned VRAM/system memory BO.
> Add some code to speed up DPT/GGTT programming.
> 
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> ---
>  drivers/gpu/drm/xe/xe_bo.c | 45 ++++++++++++++++++++++----------------
>  drivers/gpu/drm/xe/xe_bo.h |  3 +++
>  2 files changed, 29 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 5275badb024cd..38223bb8b74c6 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -3143,6 +3143,30 @@ bool xe_bo_is_xe_bo(struct ttm_buffer_object *bo)
>  	return false;
>  }
>  
> +void xe_bo_addr_iter_first(struct xe_bo *bo, struct xe_res_cursor *cur, u64 offset, u64 size)

Kernel doc.

> +{
> +	struct xe_device *xe = xe_bo_device(bo);
> +
> +	if (!xe_bo_is_vram(bo) && !xe_bo_is_stolen(bo)) {
> +		xe_assert(xe, bo->ttm.ttm);
> +
> +		xe_res_first_sg(xe_bo_sg(bo), offset, size, cur);
> +	} else {
> +		xe_res_first(bo->ttm.resource, offset, size, cur);
> +
> +		xe_assert(xe, !cur->dma_addr);
> +		cur->dma_start = vram_region_gpu_offset(bo->ttm.resource);
> +	}
> +}
> +
> +dma_addr_t xe_bo_addr_iter_addr(struct xe_res_cursor *cur)

Kernel doc.

> +{
> +	if (cur->mem_type == XE_PL_TT)
> +		return xe_res_dma(cur);
> +
> +	return cur->start + cur->dma_start;
> +}
> +
>  /*
>   * Resolve a BO address. There is no assert to check if the proper lock is held
>   * so it should only be used in cases where it is not fatal to get the wrong
> @@ -3151,27 +3175,10 @@ bool xe_bo_is_xe_bo(struct ttm_buffer_object *bo)
>   */
>  dma_addr_t __xe_bo_addr(struct xe_bo *bo, u64 offset, size_t page_size)
>  {
> -	struct xe_device *xe = xe_bo_device(bo);
>  	struct xe_res_cursor cur;
> -	u64 page;
> -
> -	xe_assert(xe, page_size <= PAGE_SIZE);
> -	page = offset >> PAGE_SHIFT;
> -	offset &= (PAGE_SIZE - 1);

I'd mention in the commit message the code which aligns the addeess to a
page in __xe_bo_addr has been droppped.

Otherwise LGTM.

Matt

>  
> -	if (!xe_bo_is_vram(bo) && !xe_bo_is_stolen(bo)) {
> -		xe_assert(xe, bo->ttm.ttm);
> -
> -		xe_res_first_sg(xe_bo_sg(bo), page << PAGE_SHIFT,
> -				page_size, &cur);
> -		return xe_res_dma(&cur) + offset;
> -	} else {
> -		struct xe_res_cursor cur;
> -
> -		xe_res_first(bo->ttm.resource, page << PAGE_SHIFT,
> -			     page_size, &cur);
> -		return cur.start + offset + vram_region_gpu_offset(bo->ttm.resource);
> -	}
> +	xe_bo_addr_iter_first(bo, &cur, offset, page_size);
> +	return xe_bo_addr_iter_addr(&cur);
>  }
>  
>  dma_addr_t xe_bo_addr(struct xe_bo *bo, u64 offset, size_t page_size)
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index 4128dbf7fe695..9155e424f081c 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -111,6 +111,7 @@ enum xe_madv_purgeable_state {
>  };
>  
>  struct sg_table;
> +struct xe_res_cursor;
>  
>  struct xe_bo *xe_bo_alloc(void);
>  void xe_bo_free(struct xe_bo *bo);
> @@ -370,6 +371,8 @@ static inline void xe_bo_unpin_map_no_vm(struct xe_bo *bo)
>  }
>  
>  bool xe_bo_is_xe_bo(struct ttm_buffer_object *bo);
> +void xe_bo_addr_iter_first(struct xe_bo *bo, struct xe_res_cursor *cur, u64 offset, u64 size);
> +dma_addr_t xe_bo_addr_iter_addr(struct xe_res_cursor *cur);
>  dma_addr_t __xe_bo_addr(struct xe_bo *bo, u64 offset, size_t page_size);
>  dma_addr_t xe_bo_addr(struct xe_bo *bo, u64 offset, size_t page_size);
>  
> -- 
> 2.53.0
> 
