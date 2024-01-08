Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04750C3DA6E
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jan 2024 21:57:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8851B89DFB;
	Mon,  8 Jan 2024 21:57:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E986089065
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jan 2024 21:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704751022; x=1736287022;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=JgG3rcngxWAIJnwL8djFT0qH0M3b0qmTR0IvBTSVxAc=;
 b=IqvjeR7DqrXWohp/RJh1mqv2C/iPb56QNNyWxFGVC3v7sRdkBckFuz5d
 lHQ97J/D9B7nJ8/D7rzXE+DUtzJcP+4KOfxACB5Gw9dH7iBSiokVcrqTE
 3kjtdYw30+7XruSjIrM5LQfehDzISsyjYH9CGkdIHNSQAo3WIa8HnbxpK
 YQM+UTZ53Ebyy/lnSHLfZ9xUt2sWJ3hL+BBPUYKhuiu2KdoNqZIxZgHvk
 aSNn3w2ibV7s6qWHUybPXIN+VH7Cyi11t5Sy5x5C/6qljmOmT0mrjCjdb
 487vaXD3JavVsGEznY8efHaKifiPqq8GvuRT29Xi03gu8ypbNBcMQh+3p w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="5362969"
X-IronPort-AV: E=Sophos;i="6.04,180,1695711600"; 
   d="scan'208";a="5362969"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2024 13:57:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,180,1695711600"; d="scan'208";a="23323379"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Jan 2024 13:57:00 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 8 Jan 2024 13:56:59 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 8 Jan 2024 13:56:59 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 8 Jan 2024 13:56:59 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 8 Jan 2024 13:56:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z3+VFQevT5+x9KOELpvL+3g6m6nQaJmD3huFgjYi41+OkTBj68bTcnmQU+TlCf5uDijGZD0wHuOe06/NNeYpHUON/j/KcPfxjyJCsWAIdl5OK4xIxjeF0sjrw/bUEGLYlyX1ri3NvSgFBKpRvkBvR1u8hYKzovvgyD+weuEuoG/zX5z5jYFjFlQH22vkbXwwKqElOQZwpssdtDFXxzxGkPCn+L3gQS9PtXOHuLzzA1yo5IutGwdtL4ExUzWM5ja6zSGXyKlxbezm1sASU78poCNHfuClGgPfXEoxzm4YRHcyXyxDt2Ce8ZQh0fZtgP++A5ZLEW8Yxbceb8zwpf6z9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6v3193DhQJP6iXwZ/B3F48tnY2Pr4xZceoEoUmB6S8o=;
 b=jE6zz3F4Ih13TbLdPveIW5U8O9JzYHxJDR2gQ9ykUPBPBHCN3A15Ls9WuyvM2VxzaJgQyTJEq6mZRcd8IVzL0IlJ8Ci8MRcuDlknfIAyPUag6R2JPvjkE3NPoR3ve9jDdIw/qOrG9QlnImlZJyI+3J/hz7CJqXqUvXYVpE08x0lhx/6Tk75+MtEDFAVCNgdzM4sKRu9bXMxVYkL5W1avXM2YNYu+AuchD7xzRAeVDu3170ZPX3JKmvgf5bZTgTyrwMyzmr5uaX9/UppuiWP/dSRsvGr1hJOoJuBTpU51HCus5ML8PV1jROdVlSFMlSv1x7mHoQ2EN8xKmoXc1U9gOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB5790.namprd11.prod.outlook.com (2603:10b6:a03:422::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Mon, 8 Jan
 2024 21:56:56 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7159.020; Mon, 8 Jan 2024
 21:56:56 +0000
Date: Mon, 8 Jan 2024 16:56:53 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>
Subject: Re: [PATCH v6] drm/xe/dgfx: Release mmap mappings on rpm suspend
Message-ID: <ZZxvpcBLQbwkneD0@intel.com>
References: <20240104130702.950078-1-badal.nilawar@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240104130702.950078-1-badal.nilawar@intel.com>
X-ClientProxiedBy: BYAPR06CA0042.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::19) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB5790:EE_
X-MS-Office365-Filtering-Correlation-Id: 2911432d-7e2e-495e-a9b6-08dc1094bb73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8zjd7ae5psRmuEfH8yWLSw9BeCPuzZ/IMMmIsSm6bM466DBc+hKZH2TbyK7q+5z5D7H1dO2EDBuqm0ik925jVF7aQYNSp40jVp6CkDflpm8Vr6WmQHUoz3U6A3Drj6wuqn1rXQUejzZ+yrwlwilckMZAwEmg5HtFM8GiIUEskWYYLKy9B6QVa1D4jW57IPvVNq/rrg/5zqTgyf2lJHB3Ctg3+vdv6inajtOMivuaCx9UvSglPMHs0nziamNCepTGvsEmbNYGl+TLncQwaNSm60v5fI8UGzpxstdWU+t+MNBVm50fP9cgXSoqp4rDoZScZHc6pXHFULuEHJ5y927+UM28MKn2AbC0mTYw+W0Xtdc9zI+sKhzzMClHz8YmTIQ1Fx/A/77MT50Ei9sP+/euaCAoysv87+CMfkxU7JBjvbM40pL3cu7FyQHrvempcYbceeHaWUZrIijSLcK0aAELiJgVCVWCotlhegK4l2ehGxAH7Md7UMSOzvj/kIEVt7oUxPM07N8Hg6Sqo3LXfxP8gUrEXU355uEFnZH50yBlu8rr1F2JrR2FAc8/P1q0CySu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(396003)(346002)(39860400002)(366004)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(6506007)(26005)(2616005)(6486002)(6666004)(478600001)(6512007)(5660300002)(83380400001)(66574015)(107886003)(41300700001)(15650500001)(2906002)(66556008)(6636002)(66476007)(316002)(37006003)(66946007)(6862004)(8936002)(8676002)(44832011)(4326008)(38100700002)(36756003)(86362001)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?bzscZgO8fapH8G8uWvrbXjDuVhe3wfJF6U+G5uYUFIHX8PDl3WrvKTmCRy?=
 =?iso-8859-1?Q?uzy8wjr09hbwNvt0D0px6jbJUXF/jHjQ09Xkr/nXKGJVpern3hisK0BGjF?=
 =?iso-8859-1?Q?s6WKp3DiGaRzu/EHiiqlNcWelDtqlzwRDOqX7c7k5gMQQe36tIVOxMlhx0?=
 =?iso-8859-1?Q?jitpiZlWPtVPINc0TVUeEB1nwWMQDPLNkNXTWJWfBKTUtizSiuKDux5OLn?=
 =?iso-8859-1?Q?3rK7Ecmpc2d2UDRQ3FzQ246qHHpevTHc4zHUai2+9qUkgcBvTBkc5H150c?=
 =?iso-8859-1?Q?zbsx8vRYBSfHTlQfy02uWluQif1+QkgMcqrNo8RhEpSvgem/B3gui+zmaY?=
 =?iso-8859-1?Q?vHViHVbWcN4TK2PavUOpAPMC64M1nFYMjuM7kndmcL4wXjX4zeOfYwuZjQ?=
 =?iso-8859-1?Q?JbgMXwRDN7rhWGanpkDORdn45z9M5j/4l8u2fYNdPzxFRjlRYrFps0z1zp?=
 =?iso-8859-1?Q?s+YDD7zruVR2jt5gF/Fe3HV843atOfRfMOAzu2WlwM10EMEA3c2bcAt2gN?=
 =?iso-8859-1?Q?JKsgZ7T2SlM0QW2ggCo+7oPgbrX8GQsLMJs9qB7JTXL8XyXiqCuzsKAHQ8?=
 =?iso-8859-1?Q?WjTbo2KGop4cemV8487qIrgH259pMd19uv7I+sGk9yh9g5R+nLi7bhy7rT?=
 =?iso-8859-1?Q?+Z97TXvI4LyKrYR3IHAlGp8IPoDBJ2ClyM+RhSDSxUOvw2nYOH220Z74k3?=
 =?iso-8859-1?Q?/AQNFRparFuXn+9zfpXgJy4fJksPzbmCivgXzcWfKrJ6UT1PDFLIx6JHAi?=
 =?iso-8859-1?Q?oRM6uBfpCGTRVk8ri9xS5oG6F3AV+A+0lqr94kazxXLV+R1haI4IK9fZ9c?=
 =?iso-8859-1?Q?1K39KK2BeZEG1ROG/TkCqCmlsOFkTcHnBn3gbha4dt6FIwFgxgOOXDMSu7?=
 =?iso-8859-1?Q?YoQdsurbsF22M47w8ZpmIBbhz1CEXvpX3AIcZynm0XJK5dY+YCo/n9o2nm?=
 =?iso-8859-1?Q?9hH8TMUwi2dK3wrMe2d5243du1AuxCTIay3APBfKGkPLQXWZ4RDM92MGKj?=
 =?iso-8859-1?Q?D90jvyFqRERnx0gu7TjLyDTq7oyFYFCQxlWh03irtZ4WJ8cW2kJnG1BgYe?=
 =?iso-8859-1?Q?29FgJ1u5kldHEAPgZcno7ZOxiSVMxzQ5hChzLU4cryNvKJhZoeHzkxTOmP?=
 =?iso-8859-1?Q?Oo6G82V44I0wf7682mNugv3TPGqebjQTwTtpkJZF7HDk3TWcDlh1Qxuudn?=
 =?iso-8859-1?Q?PR7uqwLKPrQ5oBUJoa9eE6maTjNR/ee0nRx6SR0MX3w527zlBEcCaZa2yH?=
 =?iso-8859-1?Q?GBebhJd5tEpL5BIO44uwM2aBuhzcDgSxC22UkOBUPjGW83gAowPtnOnA4K?=
 =?iso-8859-1?Q?N5GzkbzNN4+t576DPbSEkHT1hWq55E11lFQLOv5m4cfEFAPK1VRqM1yssU?=
 =?iso-8859-1?Q?GtWTzNSqasktbFzXLjD96uMIdj2fjuvVueVRDNsPzwZ2PhiVk9u1HpPpCU?=
 =?iso-8859-1?Q?9c5MzxMd9DSFZw9uTkjNMMVntwhJIxCd6+OicJteR22nfXXjbsHu2cqyzy?=
 =?iso-8859-1?Q?rV+8aRDFwNJj28P0oGvaX0UOV7yz1r2I6fVytx/b0r+5Snh9/6g62KyqwU?=
 =?iso-8859-1?Q?AFKbE/9q2xTp3Wod6QKcjO/4CdB7qyaZ7+SoIy9MDmRcra7AAHq+iGJnYC?=
 =?iso-8859-1?Q?CdHhFtubS56dVqlxfL9J4ylBSuRDQkZ1Wu?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2911432d-7e2e-495e-a9b6-08dc1094bb73
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2024 21:56:56.8702 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ocCriwPHQG0cWikdxxftef2kMPZyaBwBh/Z+c1FezdQPKo89AHD4u+BVCjF14NEqZ7LcD+DPObx6LlySMsDD1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5790
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
Cc: thomas.hellstrom@intel.com, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Jan 04, 2024 at 06:37:02PM +0530, Badal Nilawar wrote:
> Release all mmap mappings for all vram objects which are associated
> with userfault such that, while pcie function in D3hot, any access
> to memory mappings will raise a userfault.
> 
> Upon userfault, in order to access memory mappings, if graphics
> function is in D3 then runtime resume of dgpu will be triggered to
> transition to D0.
> 
> v2:
>   - Avoid iomem check before bo migration check as bo can migrate
>     to system memory (Matthew Auld)
> v3:
>   - Delete bo userfault link during bo destroy
>   - Upon bo move (vram-smem), do bo userfault link deletion in
>     xe_bo_move_notify instead of xe_bo_move (Thomas Hellström)
>   - Grab lock in rpm hook while deleting bo userfault link (Matthew Auld)
> v4:
>   - Add kernel doc and wrap vram_userfault related
>     stuff in the structure (Matthew Auld)
>   - Get rpm wakeref before taking dma reserve lock (Matthew Auld)
>   - In suspend path apply lock for entire list op
>     including list iteration (Matthew Auld)
> v5:
>   - Use mutex lock instead of spin lock
> v6:
>   - Fix review comments (Matthew Auld)
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> Acked-by: Thomas Hellström <thomas.hellstrom@linux.intel.com> #For the xe_bo_move_notify() changes
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>

pushed do drm-xe-next. Thanks for the patch.

> ---
>  drivers/gpu/drm/xe/xe_bo.c           | 56 ++++++++++++++++++++++++++--
>  drivers/gpu/drm/xe/xe_bo.h           |  2 +
>  drivers/gpu/drm/xe/xe_bo_types.h     |  3 ++
>  drivers/gpu/drm/xe/xe_device_types.h | 16 ++++++++
>  drivers/gpu/drm/xe/xe_pci.c          |  2 +
>  drivers/gpu/drm/xe/xe_pm.c           | 17 +++++++++
>  drivers/gpu/drm/xe/xe_pm.h           |  1 +
>  7 files changed, 93 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 8e4a3b1f6b93..2e4d2157179c 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -586,6 +586,8 @@ static int xe_bo_move_notify(struct xe_bo *bo,
>  {
>  	struct ttm_buffer_object *ttm_bo = &bo->ttm;
>  	struct xe_device *xe = ttm_to_xe_device(ttm_bo->bdev);
> +	struct ttm_resource *old_mem = ttm_bo->resource;
> +	u32 old_mem_type = old_mem ? old_mem->mem_type : XE_PL_SYSTEM;
>  	int ret;
>  
>  	/*
> @@ -605,6 +607,18 @@ static int xe_bo_move_notify(struct xe_bo *bo,
>  	if (ttm_bo->base.dma_buf && !ttm_bo->base.import_attach)
>  		dma_buf_move_notify(ttm_bo->base.dma_buf);
>  
> +	/*
> +	 * TTM has already nuked the mmap for us (see ttm_bo_unmap_virtual),
> +	 * so if we moved from VRAM make sure to unlink this from the userfault
> +	 * tracking.
> +	 */
> +	if (mem_type_is_vram(old_mem_type)) {
> +		mutex_lock(&xe->mem_access.vram_userfault.lock);
> +		if (!list_empty(&bo->vram_userfault_link))
> +			list_del_init(&bo->vram_userfault_link);
> +		mutex_unlock(&xe->mem_access.vram_userfault.lock);
> +	}
> +
>  	return 0;
>  }
>  
> @@ -1063,6 +1077,11 @@ static void xe_ttm_bo_destroy(struct ttm_buffer_object *ttm_bo)
>  	if (bo->vm && xe_bo_is_user(bo))
>  		xe_vm_put(bo->vm);
>  
> +	mutex_lock(&xe->mem_access.vram_userfault.lock);
> +	if (!list_empty(&bo->vram_userfault_link))
> +		list_del(&bo->vram_userfault_link);
> +	mutex_unlock(&xe->mem_access.vram_userfault.lock);
> +
>  	kfree(bo);
>  }
>  
> @@ -1110,16 +1129,20 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
>  {
>  	struct ttm_buffer_object *tbo = vmf->vma->vm_private_data;
>  	struct drm_device *ddev = tbo->base.dev;
> +	struct xe_device *xe = to_xe_device(ddev);
> +	struct xe_bo *bo = ttm_to_xe_bo(tbo);
> +	bool needs_rpm = bo->flags & XE_BO_CREATE_VRAM_MASK;
>  	vm_fault_t ret;
>  	int idx, r = 0;
>  
> +	if (needs_rpm)
> +		xe_device_mem_access_get(xe);
> +
>  	ret = ttm_bo_vm_reserve(tbo, vmf);
>  	if (ret)
> -		return ret;
> +		goto out;
>  
>  	if (drm_dev_enter(ddev, &idx)) {
> -		struct xe_bo *bo = ttm_to_xe_bo(tbo);
> -
>  		trace_xe_bo_cpu_fault(bo);
>  
>  		if (should_migrate_to_system(bo)) {
> @@ -1137,10 +1160,24 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
>  	} else {
>  		ret = ttm_bo_vm_dummy_page(vmf, vmf->vma->vm_page_prot);
>  	}
> +
>  	if (ret == VM_FAULT_RETRY && !(vmf->flags & FAULT_FLAG_RETRY_NOWAIT))
> -		return ret;
> +		goto out;
> +	/*
> +	 * ttm_bo_vm_reserve() already has dma_resv_lock.
> +	 */
> +	if (ret == VM_FAULT_NOPAGE && mem_type_is_vram(tbo->resource->mem_type)) {
> +		mutex_lock(&xe->mem_access.vram_userfault.lock);
> +		if (list_empty(&bo->vram_userfault_link))
> +			list_add(&bo->vram_userfault_link, &xe->mem_access.vram_userfault.list);
> +		mutex_unlock(&xe->mem_access.vram_userfault.lock);
> +	}
>  
>  	dma_resv_unlock(tbo->base.resv);
> +out:
> +	if (needs_rpm)
> +		xe_device_mem_access_put(xe);
> +
>  	return ret;
>  }
>  
> @@ -1254,6 +1291,7 @@ struct xe_bo *___xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
>  #ifdef CONFIG_PROC_FS
>  	INIT_LIST_HEAD(&bo->client_link);
>  #endif
> +	INIT_LIST_HEAD(&bo->vram_userfault_link);
>  
>  	drm_gem_private_object_init(&xe->drm, &bo->ttm.base, size);
>  
> @@ -2264,6 +2302,16 @@ int xe_bo_dumb_create(struct drm_file *file_priv,
>  	return err;
>  }
>  
> +void xe_bo_runtime_pm_release_mmap_offset(struct xe_bo *bo)
> +{
> +	struct ttm_buffer_object *tbo = &bo->ttm;
> +	struct ttm_device *bdev = tbo->bdev;
> +
> +	drm_vma_node_unmap(&tbo->base.vma_node, bdev->dev_mapping);
> +
> +	list_del_init(&bo->vram_userfault_link);
> +}
> +
>  #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
>  #include "tests/xe_bo.c"
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index 97b32528c600..350cc73cadf8 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -249,6 +249,8 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
>  			struct drm_file *file);
>  int xe_gem_mmap_offset_ioctl(struct drm_device *dev, void *data,
>  			     struct drm_file *file);
> +void xe_bo_runtime_pm_release_mmap_offset(struct xe_bo *bo);
> +
>  int xe_bo_dumb_create(struct drm_file *file_priv,
>  		      struct drm_device *dev,
>  		      struct drm_mode_create_dumb *args);
> diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
> index 64c2249a4e40..14ef13b7b421 100644
> --- a/drivers/gpu/drm/xe/xe_bo_types.h
> +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> @@ -88,6 +88,9 @@ struct xe_bo {
>  	 * objects.
>  	 */
>  	u16 cpu_caching;
> +
> +	/** @vram_userfault_link: Link into @mem_access.vram_userfault.list */
> +		struct list_head vram_userfault_link;
>  };
>  
>  #define intel_bo_to_drm_bo(bo) (&(bo)->ttm.base)
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 71f23ac365e6..dd0f4fb57683 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -385,6 +385,22 @@ struct xe_device {
>  	struct {
>  		/** @ref: ref count of memory accesses */
>  		atomic_t ref;
> +
> +		/** @vram_userfault: Encapsulate vram_userfault related stuff */
> +		struct {
> +			/**
> +			 * @lock: Protects access to @vram_usefault.list
> +			 * Using mutex instead of spinlock as lock is applied to entire
> +			 * list operation which may sleep
> +			 */
> +			struct mutex lock;
> +
> +			/**
> +			 * @list: Keep list of userfaulted vram bo, which require to release their
> +			 * mmap mappings at runtime suspend path
> +			 */
> +			struct list_head list;
> +		} vram_userfault;
>  	} mem_access;
>  
>  	/**
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 1f997353a78f..4de79a7c5dc2 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -775,6 +775,8 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  		str_yes_no(xe_device_has_sriov(xe)),
>  		xe_sriov_mode_to_string(xe_device_sriov_mode(xe)));
>  
> +	xe_pm_init_early(xe);
> +
>  	err = xe_device_probe(xe);
>  	if (err)
>  		return err;
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index b429c2876a76..d5f219796d7e 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -163,6 +163,12 @@ static void xe_pm_runtime_init(struct xe_device *xe)
>  	pm_runtime_put(dev);
>  }
>  
> +void xe_pm_init_early(struct xe_device *xe)
> +{
> +	INIT_LIST_HEAD(&xe->mem_access.vram_userfault.list);
> +	drmm_mutex_init(&xe->drm, &xe->mem_access.vram_userfault.lock);
> +}
> +
>  void xe_pm_init(struct xe_device *xe)
>  {
>  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> @@ -214,6 +220,7 @@ struct task_struct *xe_pm_read_callback_task(struct xe_device *xe)
>  
>  int xe_pm_runtime_suspend(struct xe_device *xe)
>  {
> +	struct xe_bo *bo, *on;
>  	struct xe_gt *gt;
>  	u8 id;
>  	int err = 0;
> @@ -247,6 +254,16 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
>  	 */
>  	lock_map_acquire(&xe_device_mem_access_lockdep_map);
>  
> +	/*
> +	 * Applying lock for entire list op as xe_ttm_bo_destroy and xe_bo_move_notify
> +	 * also checks and delets bo entry from user fault list.
> +	 */
> +	mutex_lock(&xe->mem_access.vram_userfault.lock);
> +	list_for_each_entry_safe(bo, on,
> +				 &xe->mem_access.vram_userfault.list, vram_userfault_link)
> +		xe_bo_runtime_pm_release_mmap_offset(bo);
> +	mutex_unlock(&xe->mem_access.vram_userfault.lock);
> +
>  	if (xe->d3cold.allowed) {
>  		err = xe_bo_evict_all(xe);
>  		if (err)
> diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
> index 6b9031f7af24..64a97c6726a7 100644
> --- a/drivers/gpu/drm/xe/xe_pm.h
> +++ b/drivers/gpu/drm/xe/xe_pm.h
> @@ -20,6 +20,7 @@ struct xe_device;
>  int xe_pm_suspend(struct xe_device *xe);
>  int xe_pm_resume(struct xe_device *xe);
>  
> +void xe_pm_init_early(struct xe_device *xe);
>  void xe_pm_init(struct xe_device *xe);
>  void xe_pm_runtime_fini(struct xe_device *xe);
>  int xe_pm_runtime_suspend(struct xe_device *xe);
> -- 
> 2.25.1
> 
