Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E41D3C7EE22
	for <intel-xe@archiver.kernel.org>; Tue,  9 May 2023 14:35:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7514010E368;
	Tue,  9 May 2023 14:35:07 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D126110E368
 for <intel-xe@lists.freedesktop.org>; Tue,  9 May 2023 14:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683642905; x=1715178905;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=jJpVLMpK4wMDk5A0uwnOkF4MZ4FF+Qb81zoppjD3aQo=;
 b=foJOmf1qx60b3eJTOysZnvXpIpTQVPNjNNzl8aBooO3yMmxKwpmJe4Rm
 dNq8eh8F+aDfRRk8S5yptA+1I06lU44WVftYDe3sjhzLkreRx7Xd+Cpgv
 Xj/ZkzyFLZZLZoATWr5UKKeh8nXQoDun0qVBe4FQeNoEGx596thP9Jifj
 bvt1rukHLBsjcYdH8rgR4a5ykttdqW+GjFgVCd4Wa3evnsUN66PojK5wU
 LoxkiWYM6TX8Esp/aMzzFN5qoputc/zwlF+070BnHjPlGnRYc8s9ybzaP
 4jZmtRzorWtCjxltZNhTwmDxyPV3eKj1kKkpdKyTwFFM4AdMfciVWVtRN w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="413214775"
X-IronPort-AV: E=Sophos;i="5.99,262,1677571200"; d="scan'208";a="413214775"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2023 07:35:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="701877932"
X-IronPort-AV: E=Sophos;i="5.99,262,1677571200"; d="scan'208";a="701877932"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga007.fm.intel.com with ESMTP; 09 May 2023 07:35:03 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 9 May 2023 07:35:02 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 9 May 2023 07:35:02 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 9 May 2023 07:35:02 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 9 May 2023 07:35:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PLUZBtePYITGOuLiB6Ci5htIwULyHtqbl9VIodU3XFu1qaipyzvln436P8g5yz+FibVbcInImBzgDMspspi6OBpHQGKtGxSl1ZcoL8tQa75nIIO5v4qfnq6ANCRJs7X+GgdihWuHsCM+Od14Gh+I61eU4XM6EIP8ybcs6NfynFxv54ixPZGgSDgVyrcxOcmz1Ir7fJp6vCR6kLCFTGmpQslOybyfAv0/L4PSnFbwDuAOl58yFrxQ0zc/13K1FYm9/SbOGJUQSEDqeDcHIXCaEWqGZOI9rOZ7eIeb1vH8ZhO0+lcFmqLtZG1bgo0XT/dIp3X0yUvbyAUHHkxl5gSRHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mKxj5cyo1TLtj+LM7bsK167D/PEN/0W++4O0EbTb89c=;
 b=DP3p+BsUcI+NJWyLyYXY0m7eyK1i5hdPO41NPkr/xfZT53RXl3qiztDggkd1tZYcHiI/GC4TUWf8yjkemLDylaoT4WJQuVpA7yVDNG8ho+Ti8+EfT3DGUF4QFYAZo/22Zlb6qv6dScfQDN6P9UWu0rP5CuCJ8Lb0EynJfTpbDrGRtJx9dAKZ419fEpEoeMLb9M1zE1jgDPhzw6N2th7zDou2bQF+C2tQ9H9nFYFmI8bIox9p2tBG88lennuRSQoAo41X6ZO7mG0oxSPhdN+VY2VVXHZewd8rZbLV53wiWD2xMKz0JESKmPs+EfWrYLnUzUYLzzgovenLk5inD5Ks2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CY8PR11MB7800.namprd11.prod.outlook.com (2603:10b6:930:72::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Tue, 9 May
 2023 14:34:57 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004%6]) with mapi id 15.20.6363.032; Tue, 9 May 2023
 14:34:57 +0000
Date: Tue, 9 May 2023 10:34:52 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <ZFpaDFSZuDqtTbKH@intel.com>
References: <20230502001727.3211096-1-matthew.brost@intel.com>
 <20230502001727.3211096-18-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230502001727.3211096-18-matthew.brost@intel.com>
X-ClientProxiedBy: BY3PR05CA0030.namprd05.prod.outlook.com
 (2603:10b6:a03:254::35) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CY8PR11MB7800:EE_
X-MS-Office365-Filtering-Correlation-Id: ca3bc236-1636-491d-9b49-08db509a8f6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: b+wizFu7T/t89CpXoX7S+I7DEfK5TB6uvkn25vmlafbuOHsHV+JzxYnVbRDcKGXiyihv0WP4YcjVmTpTQQQGmGMt5HbOIy1flMI99e/KEqehSxHwtA/Ypbdee26Ja67P8KDcjmWEiaCt51riKyErGMdRWx60+s9xnIYKJX2GzP3XLWsIGbvqPVB7nQ4A6BMpVDFYrbXCSQH/PkbbyTGObQM2xSWgfkR/IYR9tlijl1BQ/a7F4WTKdXGguxr9+8FxDpv1l5VNrjmPgXLVHZEYVklUu7XsSBrostU1VCOtJKCyu/QVf6+CJkZqmYLxerWom49WWuCnrw5THyM7eMj9UwG4lpUQ1Hd6i5Kq5Unzs6yQaz5d+JFbU15wdgmMvBuli2kYyHuuMw8bvA43xboY2TGR/Znzqbsttx+Ofk7U0/2LUHOt1DKqChaHGqvfszripggMWe/ZDMxCcfcmDg1SuNiA2m66DNZHCOTw7v0U8hLMDxywmOTUu1gNODLFQ0NvoZfh0ZDLIkQwEvgAygJN859cxDkjR6I+Psi0yJA8TB5LZCuKLDSUS2zlQ+Jl3ljU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(346002)(396003)(136003)(366004)(376002)(451199021)(36756003)(478600001)(6486002)(2616005)(83380400001)(82960400001)(41300700001)(38100700002)(6512007)(6506007)(66476007)(66556008)(66946007)(37006003)(86362001)(26005)(4326008)(6636002)(6666004)(5660300002)(44832011)(316002)(6862004)(8676002)(8936002)(186003)(30864003)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TwPq2am9I6YwB7998bzZQ+FgP4VijDXdVwHAQGlbNWS2PF9RWWsAv1jG0uFe?=
 =?us-ascii?Q?pehY0vSLLyPD3nsDHGHERo2N8sUyjZOR9ndbJDchqjFHgt6r3Z2kTuJ7BRCF?=
 =?us-ascii?Q?nQzIObOrNKnO0yNk08r5u455P3WMmgsVI/Nkdr+gR6bJWRaxC3tUtjjYxj4S?=
 =?us-ascii?Q?05jE1hIFsGbMBIblm2kiIknpa8tfgzgqZKWqvpksTJHEM2KGbefQr95QpMNS?=
 =?us-ascii?Q?QQmDXtAAfP6Cey0z1IkjGSilhLeo8pKTBlUouPJQ84riJTLWL8eBglqf+sd3?=
 =?us-ascii?Q?rC/5q4HaTW0VdeflFjf3Arg3KRXg/Vnpl5uX/u21vlSC0kP1v8BWMzFnQMkU?=
 =?us-ascii?Q?22+JaiA8A/xsTd0fwl1v4UlwqwzmT71zrf4bbQAgbD2n1BMqluu4yiZi8B6A?=
 =?us-ascii?Q?pHmggE55EVFONwI2E+y9BzlW0wEBMzcjGgeShSbRnae0e6mx56fZ5nLUmvrX?=
 =?us-ascii?Q?EHbeLDb0HJAyWanLWCS66H5RVP3S7oFztCiJ3KucKYdfGOSUFXVECEq1Vr/9?=
 =?us-ascii?Q?N2UsFZOF4YxYumB8MhNpbhXq4y6wk4AEN41IWYladEmUACEoau40QoJdwSeD?=
 =?us-ascii?Q?OnTSvHBrTzBAsqg+6XUMRFGv2MzoQmjQq7oXnafJxa+6wQ7eUghkOb2fJPkR?=
 =?us-ascii?Q?NCGILMWMacuzv27fz0PL8XRJkPBp0kWDOGJpI6XVjwBOSaJ0wQW6d/aUJopz?=
 =?us-ascii?Q?LrdD9sOAEdjgfK6QYr3fdi98ER2lRgPJzLRPxMRrU64oaa9O4qq2QZ3AwfEJ?=
 =?us-ascii?Q?93haOUdp9l0YH9k2fUfk2FE0tUR15twS9D3xC+cKDucAukdcT7xuYsnXFbHi?=
 =?us-ascii?Q?LLCoPGLLmOzxrnt6yBNql0oldVim6Ed4ShGfO/UlnDseMg/Nbtow/RrkxJGI?=
 =?us-ascii?Q?scPQgu9CU+RmJhkTDFusxIDIdWVrCAYvgsGJy21YjULUYH7gt8sRShL0e8a6?=
 =?us-ascii?Q?hh82SB+UGLkNRxThNnQA01AQ1Cs33oQYmYBtdelBv6XO3tNgr89+/XNbd499?=
 =?us-ascii?Q?YaoYQv8bXNmtzlXoDTEBnB/QSFe+L+DcClt0t0pitHqcjGECnp0gx6iBXZ80?=
 =?us-ascii?Q?9c8xRXzDS24kF/wbk29I1cCzk/gfVcHBTBX24LQREJfpvDQoq3Wsyu8KrlQO?=
 =?us-ascii?Q?xtXDuTdJA1DbFNx5DGpLL0RJ/TclXMG4QwxxuUUpf21aHdy3QzulrXX4axHz?=
 =?us-ascii?Q?ER2KLcZag0Fxf9ePAumz1GnZgWPIMmY5liV5d8B0ho7ttHrYQKhKXihqSDbw?=
 =?us-ascii?Q?m/AOpZjEDmxAqEvpo/H/Yt5fseYMKrTuCiyhpfOWkLfWlLE1vrgpf9tHPU+p?=
 =?us-ascii?Q?X8AbN+2+SKgUqZr5nRVK9qTRVW/CvFHe+bs9FdL5ZXvrhF0FCLlUgXGMHYh8?=
 =?us-ascii?Q?zu5wxG4+xEHRx55fwjmsI/1TkZULcD48Cr7LMj6Y+sWMTZCJMf76+yAItPsN?=
 =?us-ascii?Q?XcYS8AKM0MS8xUiPsi0yHEiF23HaQRzRVg7E7itM/GoXdb5HY/4SVSu0jdjt?=
 =?us-ascii?Q?EKpaaEzmLWb7Mzqqrjg23SqWHYrOmbFwS0toQ5rDIQ4EyV5HFClvqwKmV3ID?=
 =?us-ascii?Q?j1M4H0zG5wkrsjNgtPeic8G+7uA5ZwDi4bOXpScy?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ca3bc236-1636-491d-9b49-08db509a8f6e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2023 14:34:57.0153 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZmsBRxiLOVWoNRH+XZqaDbXMILsHG5DBoug2EDubfcd+NJ4su8OJf57kLkIhYpZ0k9QGi5QaRGjNyYX6UmYgZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7800
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 17/31] drm/xe: NULL binding implementation
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

On Mon, May 01, 2023 at 05:17:13PM -0700, Matthew Brost wrote:
> Add uAPI and implementation for NULL bindings. A NULL binding is defined
> as writes dropped and read zero. A single bit in the uAPI has been added
> which results in a single bit in the PTEs being set.

I have confirmed in the spec that this is the case for the BIT 9!

"If Null=1, the h/w will avoid the memory access and return all
zero's for the read access with a null completion, write accesses are dropped"

The code looks good, but just a few questions / comments below.

> 
> NULL bindings are indended to be used to implement VK sparse bindings.

is there any example available or any documentation that could explain
how this is used and why this is needed?

any IGT?

> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.h           |  1 +
>  drivers/gpu/drm/xe/xe_exec.c         |  2 +
>  drivers/gpu/drm/xe/xe_gt_pagefault.c |  4 +-
>  drivers/gpu/drm/xe/xe_pt.c           | 77 ++++++++++++++++-------
>  drivers/gpu/drm/xe/xe_vm.c           | 92 ++++++++++++++++++----------
>  drivers/gpu/drm/xe/xe_vm.h           | 10 +++
>  drivers/gpu/drm/xe/xe_vm_madvise.c   |  2 +-
>  drivers/gpu/drm/xe/xe_vm_types.h     |  3 +
>  include/uapi/drm/xe_drm.h            |  8 +++
>  9 files changed, 144 insertions(+), 55 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index 25457b3c757b..81051f456874 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -56,6 +56,7 @@
>  #define XE_PDE_IPS_64K			BIT_ULL(11)
>  
>  #define XE_GGTT_PTE_LM			BIT_ULL(1)
> +#define XE_PTE_NULL			BIT_ULL(9)
>  #define XE_USM_PPGTT_PTE_AE		BIT_ULL(10)
>  #define XE_PPGTT_PTE_LM			BIT_ULL(11)
>  #define XE_PDE_64K			BIT_ULL(6)
> diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> index 90c46d092737..68f876afd13c 100644
> --- a/drivers/gpu/drm/xe/xe_exec.c
> +++ b/drivers/gpu/drm/xe/xe_exec.c
> @@ -116,6 +116,8 @@ static int xe_exec_begin(struct xe_engine *e, struct ww_acquire_ctx *ww,
>  	 * to a location where the GPU can access it).
>  	 */
>  	list_for_each_entry(vma, &vm->rebind_list, rebind_link) {
> +		XE_BUG_ON(xe_vma_is_null(vma));

Can we avoid BUG here? Maybe a WARN?

> +
>  		if (xe_vma_is_userptr(vma))
>  			continue;
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> index f7a066090a13..cfffe3398fe4 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> @@ -526,8 +526,8 @@ static int handle_acc(struct xe_gt *gt, struct acc *acc)
>  
>  	trace_xe_vma_acc(vma);
>  
> -	/* Userptr can't be migrated, nothing to do */
> -	if (xe_vma_is_userptr(vma))
> +	/* Userptr or null can't be migrated, nothing to do */
> +	if (xe_vma_has_no_bo(vma))
>  		goto unlock_vm;
>  
>  	/* Lock VM and BOs dma-resv */
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 2b5b05a8a084..b4edb751bfbb 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -82,7 +82,9 @@ u64 gen8_pde_encode(struct xe_bo *bo, u64 bo_offset,
>  static dma_addr_t vma_addr(struct xe_vma *vma, u64 offset,
>  			   size_t page_size, bool *is_vram)
>  {
> -	if (xe_vma_is_userptr(vma)) {
> +	if (xe_vma_is_null(vma)) {
> +		return 0;
> +	} else if (xe_vma_is_userptr(vma)) {
>  		struct xe_res_cursor cur;
>  		u64 page;
>  
> @@ -563,6 +565,10 @@ static bool xe_pt_hugepte_possible(u64 addr, u64 next, unsigned int level,
>  	if (next - xe_walk->va_curs_start > xe_walk->curs->size)
>  		return false;
>  
> +	/* null VMA's do not have dma adresses */
> +	if (xe_walk->pte_flags & XE_PTE_NULL)
> +		return true;
> +
>  	/* Is the DMA address huge PTE size aligned? */
>  	size = next - addr;
>  	dma = addr - xe_walk->va_curs_start + xe_res_dma(xe_walk->curs);
> @@ -585,6 +591,10 @@ xe_pt_scan_64K(u64 addr, u64 next, struct xe_pt_stage_bind_walk *xe_walk)
>  	if (next > xe_walk->l0_end_addr)
>  		return false;
>  
> +	/* null VMA's do not have dma adresses */
> +	if (xe_walk->pte_flags & XE_PTE_NULL)
> +		return true;
> +
>  	xe_res_next(&curs, addr - xe_walk->va_curs_start);
>  	for (; addr < next; addr += SZ_64K) {
>  		if (!IS_ALIGNED(xe_res_dma(&curs), SZ_64K) || curs.size < SZ_64K)
> @@ -630,17 +640,34 @@ xe_pt_stage_bind_entry(struct drm_pt *parent, pgoff_t offset,
>  	struct xe_pt *xe_child;
>  	bool covers;
>  	int ret = 0;
> -	u64 pte;
> +	u64 pte = 0;
>  
>  	/* Is this a leaf entry ?*/
>  	if (level == 0 || xe_pt_hugepte_possible(addr, next, level, xe_walk)) {
>  		struct xe_res_cursor *curs = xe_walk->curs;
> +		bool null = xe_walk->pte_flags & XE_PTE_NULL;
>  
>  		XE_WARN_ON(xe_walk->va_curs_start != addr);
>  
> -		pte = __gen8_pte_encode(xe_res_dma(curs) + xe_walk->dma_offset,
> -					xe_walk->cache, xe_walk->pte_flags,
> -					level);
> +		if (null) {
> +			pte |= XE_PAGE_PRESENT | XE_PAGE_RW;
> +
> +			if (unlikely(xe_walk->pte_flags & XE_PTE_READ_ONLY))
> +				pte &= ~XE_PAGE_RW;
> +
> +			if (level == 1)
> +				pte |= XE_PDE_PS_2M;
> +			else if (level == 2)
> +				pte |= XE_PDPE_PS_1G;
> +
> +			pte |= XE_PTE_NULL;
> +		} else {
> +			pte = __gen8_pte_encode(xe_res_dma(curs) +
> +						xe_walk->dma_offset,
> +						xe_walk->cache,
> +						xe_walk->pte_flags,
> +						level);
> +		}
>  		pte |= xe_walk->default_pte;
>  
>  		/*
> @@ -658,7 +685,8 @@ xe_pt_stage_bind_entry(struct drm_pt *parent, pgoff_t offset,
>  		if (unlikely(ret))
>  			return ret;
>  
> -		xe_res_next(curs, next - addr);
> +		if (!null)
> +			xe_res_next(curs, next - addr);
>  		xe_walk->va_curs_start = next;
>  		*action = ACTION_CONTINUE;
>  
> @@ -751,7 +779,8 @@ xe_pt_stage_bind(struct xe_gt *gt, struct xe_vma *vma,
>  		.gt = gt,
>  		.curs = &curs,
>  		.va_curs_start = xe_vma_start(vma),
> -		.pte_flags = xe_vma_read_only(vma) ? XE_PTE_READ_ONLY : 0,
> +		.pte_flags = xe_vma_read_only(vma) ? XE_PTE_READ_ONLY : 0 |
> +			xe_vma_is_null(vma) ? XE_PTE_NULL : 0,
>  		.wupd.entries = entries,
>  		.needs_64K = (xe_vma_vm(vma)->flags & XE_VM_FLAGS_64K) &&
>  			is_vram,
> @@ -769,23 +798,28 @@ xe_pt_stage_bind(struct xe_gt *gt, struct xe_vma *vma,
>  			gt_to_xe(gt)->mem.vram.io_start;
>  		xe_walk.cache = XE_CACHE_WB;
>  	} else {
> -		if (!xe_vma_is_userptr(vma) && bo->flags & XE_BO_SCANOUT_BIT)
> +		if (!xe_vma_has_no_bo(vma) && bo->flags & XE_BO_SCANOUT_BIT)
>  			xe_walk.cache = XE_CACHE_WT;
>  		else
>  			xe_walk.cache = XE_CACHE_WB;
>  	}
> -	if (!xe_vma_is_userptr(vma) && xe_bo_is_stolen(bo))
> +	if (!xe_vma_has_no_bo(vma) && xe_bo_is_stolen(bo))
>  		xe_walk.dma_offset = xe_ttm_stolen_gpu_offset(xe_bo_device(bo));
>  
>  	xe_bo_assert_held(bo);
> -	if (xe_vma_is_userptr(vma))
> -		xe_res_first_sg(vma->userptr.sg, 0, xe_vma_size(vma), &curs);
> -	else if (xe_bo_is_vram(bo) || xe_bo_is_stolen(bo))
> -		xe_res_first(bo->ttm.resource, xe_vma_bo_offset(vma),
> -			     xe_vma_size(vma), &curs);
> -	else
> -		xe_res_first_sg(xe_bo_get_sg(bo), xe_vma_bo_offset(vma),
> -				xe_vma_size(vma), &curs);
> +	if (!xe_vma_is_null(vma)) {
> +		if (xe_vma_is_userptr(vma))
> +			xe_res_first_sg(vma->userptr.sg, 0, xe_vma_size(vma),
> +					&curs);
> +		else if (xe_bo_is_vram(bo) || xe_bo_is_stolen(bo))
> +			xe_res_first(bo->ttm.resource, xe_vma_bo_offset(vma),
> +				     xe_vma_size(vma), &curs);
> +		else
> +			xe_res_first_sg(xe_bo_get_sg(bo), xe_vma_bo_offset(vma),
> +					xe_vma_size(vma), &curs);
> +	} else {
> +		curs.size = xe_vma_size(vma);
> +	}
>  
>  	ret = drm_pt_walk_range(&pt->drm, pt->level, xe_vma_start(vma),
>  				xe_vma_end(vma), &xe_walk.drm);
> @@ -979,7 +1013,7 @@ static void xe_pt_commit_locks_assert(struct xe_vma *vma)
>  
>  	if (xe_vma_is_userptr(vma))
>  		lockdep_assert_held_read(&vm->userptr.notifier_lock);
> -	else
> +	else if (!xe_vma_is_null(vma))
>  		dma_resv_assert_held(xe_vma_bo(vma)->ttm.base.resv);
>  
>  	dma_resv_assert_held(&vm->resv);
> @@ -1283,7 +1317,8 @@ __xe_pt_bind_vma(struct xe_gt *gt, struct xe_vma *vma, struct xe_engine *e,
>  	struct xe_vm_pgtable_update entries[XE_VM_MAX_LEVEL * 2 + 1];
>  	struct xe_pt_migrate_pt_update bind_pt_update = {
>  		.base = {
> -			.ops = xe_vma_is_userptr(vma) ? &userptr_bind_ops : &bind_ops,
> +			.ops = xe_vma_is_userptr(vma) ? &userptr_bind_ops :
> +				&bind_ops,
>  			.vma = vma,
>  		},
>  		.bind = true,
> @@ -1348,7 +1383,7 @@ __xe_pt_bind_vma(struct xe_gt *gt, struct xe_vma *vma, struct xe_engine *e,
>  				   DMA_RESV_USAGE_KERNEL :
>  				   DMA_RESV_USAGE_BOOKKEEP);
>  
> -		if (!xe_vma_is_userptr(vma) && !xe_vma_bo(vma)->vm)
> +		if (!xe_vma_has_no_bo(vma) && !xe_vma_bo(vma)->vm)
>  			dma_resv_add_fence(xe_vma_bo(vma)->ttm.base.resv, fence,
>  					   DMA_RESV_USAGE_BOOKKEEP);
>  		xe_pt_commit_bind(vma, entries, num_entries, rebind,
> @@ -1667,7 +1702,7 @@ __xe_pt_unbind_vma(struct xe_gt *gt, struct xe_vma *vma, struct xe_engine *e,
>  				   DMA_RESV_USAGE_BOOKKEEP);
>  
>  		/* This fence will be installed by caller when doing eviction */
> -		if (!xe_vma_is_userptr(vma) && !xe_vma_bo(vma)->vm)
> +		if (!xe_vma_has_no_bo(vma) && !xe_vma_bo(vma)->vm)
>  			dma_resv_add_fence(xe_vma_bo(vma)->ttm.base.resv, fence,
>  					   DMA_RESV_USAGE_BOOKKEEP);
>  		xe_pt_commit_unbind(vma, entries, num_entries,
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index f3608865e259..a46f44ab2546 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -60,6 +60,7 @@ int xe_vma_userptr_pin_pages(struct xe_vma *vma)
>  
>  	lockdep_assert_held(&vm->lock);
>  	XE_BUG_ON(!xe_vma_is_userptr(vma));
> +	XE_BUG_ON(xe_vma_is_null(vma));
>  retry:
>  	if (vma->gpuva.flags & XE_VMA_DESTROYED)
>  		return 0;
> @@ -581,7 +582,7 @@ static void preempt_rebind_work_func(struct work_struct *w)
>  		goto out_unlock;
>  
>  	list_for_each_entry(vma, &vm->rebind_list, rebind_link) {
> -		if (xe_vma_is_userptr(vma) ||
> +		if (xe_vma_has_no_bo(vma) ||
>  		    vma->gpuva.flags & XE_VMA_DESTROYED)
>  			continue;
>  
> @@ -813,7 +814,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>  				    struct xe_bo *bo,
>  				    u64 bo_offset_or_userptr,
>  				    u64 start, u64 end,
> -				    bool read_only,
> +				    bool read_only, bool null,
>  				    u64 gt_mask)
>  {
>  	struct xe_vma *vma;
> @@ -843,6 +844,8 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>  	vma->gpuva.va.range = end - start + 1;
>  	if (read_only)
>  		vma->gpuva.flags |= XE_VMA_READ_ONLY;
> +	if (null)
> +		vma->gpuva.flags |= XE_VMA_NULL;
>  
>  	if (gt_mask) {
>  		vma->gt_mask = gt_mask;
> @@ -862,23 +865,26 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>  		vma->gpuva.gem.obj = &bo->ttm.base;
>  		vma->gpuva.gem.offset = bo_offset_or_userptr;
>  		drm_gpuva_link(&vma->gpuva);
> -	} else /* userptr */ {
> -		u64 size = end - start + 1;
> -		int err;
> -
> -		vma->gpuva.gem.offset = bo_offset_or_userptr;
> +	} else /* userptr or null */ {
> +		if (!null) {
> +			u64 size = end - start + 1;
> +			int err;
> +
> +			vma->gpuva.gem.offset = bo_offset_or_userptr;
> +			err = mmu_interval_notifier_insert(&vma->userptr.notifier,
> +							   current->mm,
> +							   xe_vma_userptr(vma),
> +							   size,
> +							   &vma_userptr_notifier_ops);
> +			if (err) {
> +				kfree(vma);
> +				vma = ERR_PTR(err);
> +				return vma;
> +			}
>  
> -		err = mmu_interval_notifier_insert(&vma->userptr.notifier,
> -						   current->mm,
> -						   xe_vma_userptr(vma), size,
> -						   &vma_userptr_notifier_ops);
> -		if (err) {
> -			kfree(vma);
> -			vma = ERR_PTR(err);
> -			return vma;
> +			vma->userptr.notifier_seq = LONG_MAX;
>  		}
>  
> -		vma->userptr.notifier_seq = LONG_MAX;
>  		xe_vm_get(vm);
>  	}
>  
> @@ -916,6 +922,8 @@ static void xe_vma_destroy_late(struct xe_vma *vma)
>  		 */
>  		mmu_interval_notifier_remove(&vma->userptr.notifier);
>  		xe_vm_put(vm);
> +	} else if (xe_vma_is_null(vma)) {
> +		xe_vm_put(vm);
>  	} else {
>  		xe_bo_put(xe_vma_bo(vma));
>  	}
> @@ -954,7 +962,7 @@ static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
>  		list_del_init(&vma->userptr.invalidate_link);
>  		spin_unlock(&vm->userptr.invalidated_lock);
>  		list_del(&vma->userptr_link);
> -	} else {
> +	} else if (!xe_vma_is_null(vma)) {
>  		xe_bo_assert_held(xe_vma_bo(vma));
>  		drm_gpuva_unlink(&vma->gpuva);
>  		if (!xe_vma_bo(vma)->vm)
> @@ -1305,7 +1313,7 @@ void xe_vm_close_and_put(struct xe_vm *vm)
>  	drm_gpuva_iter_for_each(gpuva, it) {
>  		vma = gpuva_to_vma(gpuva);
>  
> -		if (xe_vma_is_userptr(vma)) {
> +		if (xe_vma_has_no_bo(vma)) {
>  			down_read(&vm->userptr.notifier_lock);
>  			vma->gpuva.flags |= XE_VMA_DESTROYED;
>  			up_read(&vm->userptr.notifier_lock);
> @@ -1315,7 +1323,7 @@ void xe_vm_close_and_put(struct xe_vm *vm)
>  		drm_gpuva_iter_remove(&it);
>  
>  		/* easy case, remove from VMA? */
> -		if (xe_vma_is_userptr(vma) || xe_vma_bo(vma)->vm) {
> +		if (xe_vma_has_no_bo(vma) || xe_vma_bo(vma)->vm) {
>  			xe_vma_destroy(vma, NULL);
>  			continue;
>  		}
> @@ -1964,7 +1972,7 @@ static int xe_vm_prefetch(struct xe_vm *vm, struct xe_vma *vma,
>  
>  	XE_BUG_ON(region > ARRAY_SIZE(region_to_mem_type));
>  
> -	if (!xe_vma_is_userptr(vma)) {
> +	if (!xe_vma_has_no_bo(vma)) {
>  		err = xe_bo_migrate(xe_vma_bo(vma), region_to_mem_type[region]);
>  		if (err)
>  			return err;
> @@ -2170,6 +2178,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
>  				operation & XE_VM_BIND_FLAG_IMMEDIATE;
>  			op->map.read_only =
>  				operation & XE_VM_BIND_FLAG_READONLY;
> +			op->map.null = operation & XE_VM_BIND_FLAG_NULL;
>  		}
>  		break;
>  	case XE_VM_BIND_OP_UNMAP:
> @@ -2226,7 +2235,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
>  }
>  
>  static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
> -			      u64 gt_mask, bool read_only)
> +			      u64 gt_mask, bool read_only, bool null)
>  {
>  	struct xe_bo *bo = op->gem.obj ? gem_to_xe_bo(op->gem.obj) : NULL;
>  	struct xe_vma *vma;
> @@ -2242,7 +2251,7 @@ static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
>  	}
>  	vma = xe_vma_create(vm, bo, op->gem.offset,
>  			    op->va.addr, op->va.addr +
> -			    op->va.range - 1, read_only,
> +			    op->va.range - 1, read_only, null,
>  			    gt_mask);
>  	if (bo)
>  		xe_bo_unlock(bo, &ww);
> @@ -2254,7 +2263,7 @@ static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
>  			xe_vma_destroy(vma, NULL);
>  			return ERR_PTR(err);
>  		}
> -	} else if(!bo->vm) {
> +	} else if(!xe_vma_has_no_bo(vma) && !bo->vm) {
>  		vm_insert_extobj(vm, vma);
>  		err = add_preempt_fences(vm, bo);
>  		if (err) {
> @@ -2332,7 +2341,8 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_engine *e,
>  				struct xe_vma *vma;
>  
>  				vma = new_vma(vm, &op->base.map,
> -					      op->gt_mask, op->map.read_only);
> +					      op->gt_mask, op->map.read_only,
> +					      op->map.null );
>  				if (IS_ERR(vma)) {
>  					err = PTR_ERR(vma);
>  					goto free_fence;
> @@ -2347,9 +2357,13 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_engine *e,
>  					bool read_only =
>  						op->base.remap.unmap->va->flags &
>  						XE_VMA_READ_ONLY;
> +					bool null =
> +						op->base.remap.unmap->va->flags &
> +						XE_VMA_NULL;
>  
>  					vma = new_vma(vm, op->base.remap.prev,
> -						      op->gt_mask, read_only);
> +						      op->gt_mask, read_only,
> +						      null);
>  					if (IS_ERR(vma)) {
>  						err = PTR_ERR(vma);
>  						goto free_fence;
> @@ -2364,8 +2378,13 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_engine *e,
>  						op->base.remap.unmap->va->flags &
>  						XE_VMA_READ_ONLY;
>  
> +					bool null =
> +						op->base.remap.unmap->va->flags &
> +						XE_VMA_NULL;
> +
>  					vma = new_vma(vm, op->base.remap.next,
> -						      op->gt_mask, read_only);
> +						      op->gt_mask, read_only,
> +						      null);
>  					if (IS_ERR(vma)) {
>  						err = PTR_ERR(vma);
>  						goto free_fence;
> @@ -2853,11 +2872,12 @@ static void vm_bind_ioctl_ops_unwind(struct xe_vm *vm,
>  #ifdef TEST_VM_ASYNC_OPS_ERROR
>  #define SUPPORTED_FLAGS	\
>  	(FORCE_ASYNC_OP_ERROR | XE_VM_BIND_FLAG_ASYNC | \
> -	 XE_VM_BIND_FLAG_READONLY | XE_VM_BIND_FLAG_IMMEDIATE | 0xffff)
> +	 XE_VM_BIND_FLAG_READONLY | XE_VM_BIND_FLAG_IMMEDIATE | \
> +	 XE_VM_BIND_FLAG_NULL | 0xffff)
>  #else
>  #define SUPPORTED_FLAGS	\
>  	(XE_VM_BIND_FLAG_ASYNC | XE_VM_BIND_FLAG_READONLY | \
> -	 XE_VM_BIND_FLAG_IMMEDIATE | 0xffff)
> +	 XE_VM_BIND_FLAG_IMMEDIATE | XE_VM_BIND_FLAG_NULL | 0xffff)
>  #endif
>  #define XE_64K_PAGE_MASK 0xffffull
>  
> @@ -2903,6 +2923,7 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
>  		u32 obj = (*bind_ops)[i].obj;
>  		u64 obj_offset = (*bind_ops)[i].obj_offset;
>  		u32 region = (*bind_ops)[i].region;
> +		bool null = op &  XE_VM_BIND_FLAG_NULL;
>  
>  		if (i == 0) {
>  			*async = !!(op & XE_VM_BIND_FLAG_ASYNC);
> @@ -2929,8 +2950,12 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
>  		if (XE_IOCTL_ERR(xe, VM_BIND_OP(op) >
>  				 XE_VM_BIND_OP_PREFETCH) ||
>  		    XE_IOCTL_ERR(xe, op & ~SUPPORTED_FLAGS) ||
> +		    XE_IOCTL_ERR(xe, obj && null) ||
> +		    XE_IOCTL_ERR(xe, obj_offset && null) ||
> +		    XE_IOCTL_ERR(xe, VM_BIND_OP(op) != XE_VM_BIND_OP_MAP &&
> +				 null) ||
>  		    XE_IOCTL_ERR(xe, !obj &&
> -				 VM_BIND_OP(op) == XE_VM_BIND_OP_MAP) ||
> +				 VM_BIND_OP(op) == XE_VM_BIND_OP_MAP && !null) ||
>  		    XE_IOCTL_ERR(xe, !obj &&
>  				 VM_BIND_OP(op) == XE_VM_BIND_OP_UNMAP_ALL) ||
>  		    XE_IOCTL_ERR(xe, addr &&
> @@ -3254,6 +3279,7 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
>  	int ret;
>  
>  	XE_BUG_ON(!xe_vm_in_fault_mode(xe_vma_vm(vma)));
> +	XE_BUG_ON(xe_vma_is_null(vma));
>  	trace_xe_vma_usm_invalidate(vma);
>  
>  	/* Check that we don't race with page-table updates */
> @@ -3313,8 +3339,11 @@ int xe_analyze_vm(struct drm_printer *p, struct xe_vm *vm, int gt_id)
>  	drm_gpuva_iter_for_each(gpuva, it) {
>  		struct xe_vma* vma = gpuva_to_vma(gpuva);
>  		bool is_userptr = xe_vma_is_userptr(vma);
> +		bool null = xe_vma_is_null(vma);
>  
> -		if (is_userptr) {
> +		if (null) {
> +			addr = 0;
> +		} else if (is_userptr) {
>  			struct xe_res_cursor cur;
>  
>  			xe_res_first_sg(vma->userptr.sg, 0, XE_PAGE_SIZE, &cur);
> @@ -3324,7 +3353,8 @@ int xe_analyze_vm(struct drm_printer *p, struct xe_vm *vm, int gt_id)
>  		}
>  		drm_printf(p, " [%016llx-%016llx] S:0x%016llx A:%016llx %s\n",
>  			   xe_vma_start(vma), xe_vma_end(vma), xe_vma_size(vma),
> -			   addr, is_userptr ? "USR" : is_vram ? "VRAM" : "SYS");
> +			   addr, null ? "NULL" :
> +			   is_userptr ? "USR" : is_vram ? "VRAM" : "SYS");
>  	}
>  	up_read(&vm->lock);
>  
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index 21b1054949c4..96e2c6b07bf8 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -175,7 +175,17 @@ static inline void xe_vm_reactivate_rebind(struct xe_vm *vm)
>  	}
>  }
>  
> +static inline bool xe_vma_is_null(struct xe_vma *vma)
> +{
> +	return vma->gpuva.flags & XE_VMA_NULL;
> +}
> +
>  static inline bool xe_vma_is_userptr(struct xe_vma *vma)
> +{
> +	return !xe_vma_bo(vma) && !xe_vma_is_null(vma);
> +}
> +
> +static inline bool xe_vma_has_no_bo(struct xe_vma *vma)
>  {
>  	return !xe_vma_bo(vma);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
> index 02d27a354b36..03508645fa08 100644
> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> @@ -227,7 +227,7 @@ get_vmas(struct xe_vm *vm, int *num_vmas, u64 addr, u64 range)
>  	drm_gpuva_iter_for_each_range(gpuva, it, addr + range) {
>  		struct xe_vma *vma = gpuva_to_vma(gpuva);
>  
> -		if (xe_vma_is_userptr(vma))
> +		if (xe_vma_has_no_bo(vma))
>  			continue;
>  
>  		if (*num_vmas == max_vmas) {
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index 243dc91a61b0..b61007b70502 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -29,6 +29,7 @@ struct xe_vm;
>  #define XE_VMA_ATOMIC_PTE_BIT	(DRM_GPUVA_USERBITS << 2)
>  #define XE_VMA_FIRST_REBIND	(DRM_GPUVA_USERBITS << 3)
>  #define XE_VMA_LAST_REBIND	(DRM_GPUVA_USERBITS << 4)
> +#define XE_VMA_NULL		(DRM_GPUVA_USERBITS << 5)
>  
>  struct xe_vma {
>  	/** @gpuva: Base GPUVA object */
> @@ -315,6 +316,8 @@ struct xe_vma_op_map {
>  	bool immediate;
>  	/** @read_only: Read only */
>  	bool read_only;
> +	/** @null: NULL (writes dropped, read zero) */
> +	bool null;
>  };
>  
>  /** struct xe_vma_op_unmap - VMA unmap operation */
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index b0b80aae3ee8..27c51946fadd 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -447,6 +447,14 @@ struct drm_xe_vm_bind_op {
>  	 * than differing the MAP to the page fault handler.
>  	 */
>  #define XE_VM_BIND_FLAG_IMMEDIATE	(0x1 << 18)
> +	/*
> +	 * When the NULL flag is set, the page tables are setup with a special
> +	 * bit which indicates writes are dropped and all reads return zero. The
> +	 * NULL flags is only valid for XE_VM_BIND_OP_MAP operations, the BO
> +	 * handle MBZ, and the BO offset MBZ. This flag is intended to implement
> +	 * VK sparse bindings.
> +	 */
> +#define XE_VM_BIND_FLAG_NULL		(0x1 << 19)
>  
>  	/** @reserved: Reserved */
>  	__u64 reserved[2];
> -- 
> 2.34.1
> 
