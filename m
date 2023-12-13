Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBEF2C4332F
	for <intel-xe@archiver.kernel.org>; Wed, 13 Dec 2023 21:48:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B14C10E86E;
	Wed, 13 Dec 2023 21:48:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D39010E86A
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Dec 2023 21:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702504086; x=1734040086;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=E3ZZG2CV+SGugLeK3BjcQD/pZS/LBP3HRrWYEpJ9Uto=;
 b=mM8LYRDeUHhRpK3V/XdTUNS69O7SNOjuXhla4I04+tosRJbAJxqmoSAE
 xDLj5TOmpHsmlIiqo+yEpcWjNanqksKLu/aXomyQZGuG8Y8jSsKNDgf7m
 PTUBrPyENjaXWOSar3RU+/7qOa1TAQT0C4leoG9Q0FplCLBFZ0CqvMUEN
 cOpbCZMa4EAChX/lgVbv1B2snme/k+CewYAmY0N4dL/2xIyWiA8HcZ0ZD
 v1+J4IASoWiSMcrVljD7PJfayfM1EzjfyY/U3cb8fqw8YG2pi1oKsJCH9
 pfYEvLiVX/BVYF58eAn2b87xpxda6F43LIkq/bBgqg1q8qispCAYeZyaj Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="2176108"
X-IronPort-AV: E=Sophos;i="6.04,274,1695711600"; 
   d="scan'208";a="2176108"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2023 13:48:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="917804736"
X-IronPort-AV: E=Sophos;i="6.04,274,1695711600"; d="scan'208";a="917804736"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Dec 2023 13:48:05 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 13 Dec 2023 13:48:05 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 13 Dec 2023 13:48:04 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 13 Dec 2023 13:48:04 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 13 Dec 2023 13:48:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F7Iu/QbBClsmh5DiR5R7FL+aLkf4CG1qe8geAAhSf273sgK1lOM/S3EQfCfZtzr1tXNjo/HqNrIVsrAAbTIuvmIVIgj6PpOcuuORMsftWI/+/YZnbl2Pbbcu5t+oV7izisDwiNWbdTCYtmQI31WbQV4mg+qH/+b9Bv6FmWYKFmUJFfY+PdMQPpPiG//4ZL35bIeTEsh6ckRTUOHdrkkyVGwrpe1XzHmPB3eyhvfu9S7OB69AM8FhLZtFEa5lCdi+DjMjuAqQDPn/v1KR7RgQ5FaamCn6U2rf0qVuHwSL4AwjsLcGRTFTuD5BaAF9RuU2gyZtxkpvLEEN1Mb/50pozg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BmYq8tlkgsZng6bOs5MAbPNPWW6RnHTlEpBXr5e9tD4=;
 b=iBONfwaEwnYy9hoAyrOktnruvmgvk4O5XYaDFrj9u7FV2diGf1YUatfO3tTIfAxnVpBjU4CAGf73I7e3deJYuYBYxsy6pU6kHrtj1JLdZLhXN2NSNNbd3Cw5bDJ3AHCyhL6o+fndEEcWStImegzmaz0BfTi0ZhhQMUm7Ew4s5FpBgcNgMmSraiPW5RajT7iE1ZhQN//+DZUbUeP4qVJ1NpiymYCreBEVCE+5PqlMlJk8rK5ogQhALg0RDSGPPz1uFsBHcA11kuGSUewotPloHXn6AanwTLlfxcuSv/4GAuLFnX0uPZbNtMvUeTEczdmiDABgo/U/+0ocvjfwldMPlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH3PR11MB8209.namprd11.prod.outlook.com (2603:10b6:610:15d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.28; Wed, 13 Dec
 2023 21:48:02 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7091.028; Wed, 13 Dec 2023
 21:48:02 +0000
Date: Wed, 13 Dec 2023 16:47:57 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>
Subject: Re: [Intel-xe] [PATCH v2] drm/xe/dgfx: Release mmap mappings on rpm
 suspend
Message-ID: <ZXomjRGzn8O9Drg-@intel.com>
References: <20231128154118.2915150-1-badal.nilawar@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231128154118.2915150-1-badal.nilawar@intel.com>
X-ClientProxiedBy: SJ0PR03CA0267.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::32) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CH3PR11MB8209:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a5da286-ba13-4377-8939-08dbfc252e07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WHyp6EbE3uPaBIfT5Lht+44LEPu0RNE5Ynuup6PLhsc+oTmPJHKIiYg9reA9hKST73Y244UuqO7LXwqLMXiBiqcW1s9iN5pJpjaym5uhyyDXUtVF9QTz9aR5DtAEBJCbKuN1x+pXmxpup+7eZi6t3fx06SCdqVuHPOm0eb8pv7bS+S8oSyBMOexyTNbJSCRg94VbNXxvuSNIwgZSleeJ/3qoffeIUpVobLfQGUnMUqIIbb/n0jSlki0Jr3Ki3KAbfwfCAVoiJy5EtiENqPtFnJy/ZXsip7cOzhqomQHhbweA8JhJJ60Bc/8N/4KWP731XH29GWJuMsOtgNrXckjGIjaqs1Y9EfrlVjL5fbmfMheaKr6Vb6RXqsONTVyFP0ADu5HYp8P5lYHDKVzi5ZhtFUV6c/394GYEFbHn2uNC0ZaxH+DhFX7isDiHNAysqCjpA7Q7MXUxMKB8Nct/YE71X/o4aKRRYxGpqHYmpc/z/fmSO6auMmbj82ccv2y+GnUXrRlLks7tiUe3UQmEXqe/WuWTL5em+Whk6CVfkRGD8Mb6IEQPDBfcNZkzZKrfrw/c
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(376002)(346002)(396003)(136003)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(478600001)(6512007)(36756003)(6486002)(66476007)(66556008)(66946007)(37006003)(38100700002)(6636002)(6666004)(82960400001)(26005)(107886003)(2616005)(83380400001)(6506007)(316002)(44832011)(6862004)(4326008)(86362001)(8676002)(8936002)(2906002)(15650500001)(41300700001)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?y2q+wYO9a/vnAHNDjbdtTMErjMXrLGw5+9A1qaIVqwAEFmAk4K+4CJxDm95B?=
 =?us-ascii?Q?EM0DwhFEBBFglH1RdwJgAJmbTviHPLiiHiDwcV9wD1xmIq5TnshjQeNkyGVD?=
 =?us-ascii?Q?mYxY4DFvInnoMjdpnrYjXLFf37hMmtxFzuhA78bJSAqOM2gyvqAPKuj7lSmh?=
 =?us-ascii?Q?TmLDoMQMoM+RRWavzqMc2Hozo7onoiOAhgFF/LCOwbM3iXrn3B/+ez/uNX2Q?=
 =?us-ascii?Q?oIT52D/FFmUE+MSl1pGwlrG3qAYw8BASF6/ruGTEoyZDvpcvzEqogZRfNJpq?=
 =?us-ascii?Q?t6sRbQ1NTu1PaaC0cUkFxOSrPyp1m04x7w1fCv4iRANpesS+xBCgl9eiomjh?=
 =?us-ascii?Q?cds/2ToMAEDZfnSFY+ts8A+5FR6HGylu9kpV3bLctQGqGX4isKmjgsH8ZgTa?=
 =?us-ascii?Q?i4Rf5ZSe0/Vv4bNq2TPJzEyiQgosVFg/2+TOLY4HxmkCIi6VZqf7O+MOPm6J?=
 =?us-ascii?Q?1l7Vxy8/qvwI3O56D5vD1UDOolsLBS8PMR4rCwFDR0dqQ5d9FvxKq9exemt6?=
 =?us-ascii?Q?UVKEIjSokW/LD7gWIFgqSyTlBJ0bvoUq7EKEUdBBku1iR2PhaT5b28wvQVA1?=
 =?us-ascii?Q?CUNyTvEniRg+YcmueCoAWhK6ztjIjkc2A9zjzAzCILAd2ZSIIhyt5UYZQjsO?=
 =?us-ascii?Q?kwDQlLX4wpZLTImrwtG+ANv3/rfuVAXgl4bvN8UuNYECfuTbXwEy4lRqk+5Z?=
 =?us-ascii?Q?02l4wl8eipSwKPY4pnZnZzPxuCGItDySr65TFK+qujtAF9VqBBF5lPwszrxt?=
 =?us-ascii?Q?y1lsaWM26t3JBao9DDn9xGbLtEAnjvZ0G16tbQg9mP3Bg1/Z5U6Df3EO2MJQ?=
 =?us-ascii?Q?tS32BlpyfpojGZeEnS3opsTNIs6s5o3w7TTKrwVZVf87J6t4q5+rGCrGLCEN?=
 =?us-ascii?Q?wg+bmgx+VOEAUkiyMtg2lrWzQfRpVo+g/6a0iMQt8gHk7abYAoR5Vp+e/hQg?=
 =?us-ascii?Q?DmP15t9zt9yBGbpXp4n90OhCd0m9WJQkaYns/xw9fZtd98QPegWuLwh2NMnx?=
 =?us-ascii?Q?AQoJGOIU6vU71kfLIlD4sZV+5NMpLxmkCTkI1pUzixYSfnbvZb6yAt16qHE6?=
 =?us-ascii?Q?3qMwEyJMMnPhEgYZvcD+iDMHIeAH0lAGuM+pUjmUTiOfVXq3+pid40SO+gg1?=
 =?us-ascii?Q?NobSA+/FSDQULzaQdEGM7lqx81KQoGcmu0J3HKH45p0u6/XAAZrYhnmxzECM?=
 =?us-ascii?Q?1dzH0TWe78+T7lAwKd9RJqHBdSiRzXz5djDtGFHw1/HM3OwJ3EaeIMk9oKhb?=
 =?us-ascii?Q?nevMQpuD/GlUHm0t6ycEbX6jHIViGRKnTEJkRrAdUxet7hd8qSvpxvzcuij8?=
 =?us-ascii?Q?lLOnLQupiQJeOQmCz+3JyxSmSMYOnqijNhOoGJIq8fX5szF+eTApxgypRDv6?=
 =?us-ascii?Q?DkBeJbKGCj81yngyYqI7QX2jlIsdiL1bSYuq3j4WIDIAsPGvp7I2mxSFCKQ/?=
 =?us-ascii?Q?gMd2K+n7HFIeTWuXZ1UcQaL8DiHINC3ky3YGbYlGdAxR8DqBVLyCReeqls7P?=
 =?us-ascii?Q?1ZTHkMhiUBurrhIpaqanQTLUmu9lNOoltseVx/kbyWturceryk6Em6bddtPo?=
 =?us-ascii?Q?lFu5awiehXAUPvryALYFc/yTBqq/bAJM/IaBYU2cEsJvtxOCsbojvRzoaX/u?=
 =?us-ascii?Q?sQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a5da286-ba13-4377-8939-08dbfc252e07
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2023 21:48:02.1717 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o2uIntrkvyGyl5HnnncydETiKCZva8NG9MCb4PDAUiGwLsV3MQp1HTXSyZsdn+mCvwqshXSmbFaIx73pwxxvYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8209
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
Cc: intel-xe@lists.freedesktop.org, matthew.auld@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Nov 28, 2023 at 09:11:18PM +0530, Badal Nilawar wrote:
> Release all mmap mappings for all vram objects which are associated

I wonder if it would be possible to extend that to system mappings as well?

> with userfault such that, while pcie function in D3hot, any access
> to memory mappings will raise a userfault.
> 
> Upon userfault, in order to access memory mappings, if graphics
> function is in D3 then runtime resume of dgpu will be triggered to
> transition to D0.
> 
> v2:
>   - Add lock dep assertion before updating vram_userfault_count (Rodrigo)
>   - Avoid iomem check before bo migration check as bo can migrate
>     to system memory (Matthew Auld)
> 
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.c           | 53 +++++++++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_bo.h           |  2 ++
>  drivers/gpu/drm/xe/xe_bo_types.h     |  6 ++++
>  drivers/gpu/drm/xe/xe_device_types.h | 20 +++++++++++
>  drivers/gpu/drm/xe/xe_pm.c           |  7 ++++
>  5 files changed, 87 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index c5aa01c0861c..03e699e3383f 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -784,6 +784,18 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>  		dma_fence_put(fence);
>  	}
>  
> +	/*
> +	 * TTM has already nuked the mmap for us (see ttm_bo_unmap_virtual),
> +	 * so if we moved from VRAM make sure to unlink this from the userfault
> +	 * tracking.
> +	 */
> +	if (mem_type_is_vram(old_mem_type)) {
> +		spin_lock(&xe->mem_access.vram_userfault_lock);
> +		if (!list_empty(&bo->vram_userfault_link))
> +			list_del_init(&bo->vram_userfault_link);
> +		spin_unlock(&xe->mem_access.vram_userfault_lock);
> +	}
> +
>  	xe_device_mem_access_put(xe);
>  
>  out:
> @@ -1112,6 +1124,8 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
>  {
>  	struct ttm_buffer_object *tbo = vmf->vma->vm_private_data;
>  	struct drm_device *ddev = tbo->base.dev;
> +	struct xe_bo *bo = NULL;
> +	struct xe_device *xe = to_xe_device(ddev);
>  	vm_fault_t ret;
>  	int idx, r = 0;
>  
> @@ -1120,7 +1134,7 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
>  		return ret;
>  
>  	if (drm_dev_enter(ddev, &idx)) {
> -		struct xe_bo *bo = ttm_to_xe_bo(tbo);
> +		bo = ttm_to_xe_bo(tbo);
>  
>  		trace_xe_bo_cpu_fault(bo);
>  
> @@ -1139,10 +1153,31 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
>  	} else {
>  		ret = ttm_bo_vm_dummy_page(vmf, vmf->vma->vm_page_prot);
>  	}
> +
>  	if (ret == VM_FAULT_RETRY && !(vmf->flags & FAULT_FLAG_RETRY_NOWAIT))
>  		return ret;
> +	/*
> +	 * ttm_bo_vm_reserve() already has dma_resv_lock.
> +	 * vram_userfault_count is protected by dma_resv lock and rpm wakeref.
> +	 */
> +	if (ret == VM_FAULT_NOPAGE && bo && !bo->vram_userfault_count) {
> +		if (tbo->resource->bus.is_iomem) {
> +			dma_resv_assert_held(tbo->base.resv);
> +
> +			xe_device_mem_access_get(xe);

should/could we get the rpm ref directly here?

Also, I wonder if we should anyway get that at the beginning of page fault,
regardless of the mentioned conditions above?!

> +
> +			bo->vram_userfault_count = 1;
> +
> +			spin_lock(&xe->mem_access.vram_userfault_lock);
> +			list_add(&bo->vram_userfault_link, &xe->mem_access.vram_userfault_list);
> +			spin_unlock(&xe->mem_access.vram_userfault_lock);
> +
> +			xe_device_mem_access_put(xe);

okay, so in the next second we have another page fault if this is continuous access?!
shouldn't we block that for a longer period if this ever happened?

> +		}
> +	}
>  
>  	dma_resv_unlock(tbo->base.resv);
> +
>  	return ret;
>  }
>  
> @@ -2168,6 +2203,22 @@ int xe_bo_dumb_create(struct drm_file *file_priv,
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
> +	/*
> +	 * We have exclusive access here via runtime suspend. All other callers
> +	 * must first grab the rpm wakeref.
> +	 */
> +	XE_WARN_ON(!bo->vram_userfault_count);
> +	list_del(&bo->vram_userfault_link);

to be really honest I got confused with the list here.
Why do we need the list if we are adding all buffers on suspend and
removing on page fault?

I was expecting some list of buffers that are mmaped but not exported
and once we have some buffer like that we ummap that and then uppon
page fault we wake up the device, but we would only remove from the list
when buffer is gone... So I'm not understanding the list usage here.

> +	bo->vram_userfault_count = 0;
> +}
> +
>  #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
>  #include "tests/xe_bo.c"
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index 9f373f6d25f2..c9f52e3f6b97 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -229,6 +229,8 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
>  			struct drm_file *file);
>  int xe_gem_mmap_offset_ioctl(struct drm_device *dev, void *data,
>  			     struct drm_file *file);
> +void xe_bo_runtime_pm_release_mmap_offset(struct xe_bo *bo);
> +
>  int xe_bo_dumb_create(struct drm_file *file_priv,
>  		      struct drm_device *dev,
>  		      struct drm_mode_create_dumb *args);
> diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
> index 4bff60996168..032773bb097d 100644
> --- a/drivers/gpu/drm/xe/xe_bo_types.h
> +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> @@ -79,6 +79,12 @@ struct xe_bo {
>  	struct llist_node freed;
>  	/** @created: Whether the bo has passed initial creation */
>  	bool created;
> +	/**
> +	 * Whether the object is currently in fake offset mmap backed by vram.
> +	 */
> +	unsigned int vram_userfault_count;
> +	struct list_head vram_userfault_link;
> +
>  };
>  
>  #define intel_bo_to_drm_bo(bo) (&(bo)->ttm.base)
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 2712905c7a91..046085af4c56 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -359,6 +359,26 @@ struct xe_device {
>  	struct {
>  		/** @ref: ref count of memory accesses */
>  		atomic_t ref;
> +		/*
> +		 *  Protects access to vram usefault list.
> +		 *  It is required, if we are outside of the runtime suspend path,
> +		 *  access to @vram_userfault_list requires always first grabbing the
> +		 *  runtime pm, to ensure we can't race against runtime suspend.
> +		 *  Once we have that we also need to grab @vram_userfault_lock,
> +		 *  at which point we have exclusive access.
> +		 *  The runtime suspend path is special since it doesn't really hold any locks,
> +		 *  but instead has exclusive access by virtue of all other accesses requiring
> +		 *  holding the runtime pm wakeref.
> +		 */
> +		spinlock_t vram_userfault_lock;
> +
> +		/*
> +		 *  Keep list of userfaulted gem obj, which require to release their
> +		 *  mmap mappings at runtime suspend path.
> +		 */
> +		struct list_head vram_userfault_list;
> +
> +		bool vram_userfault_ongoing;
>  	} mem_access;
>  
>  	/**
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index e31a91cf311c..e2bda8bc75bf 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -181,6 +181,8 @@ void xe_pm_init(struct xe_device *xe)
>  	}
>  
>  	xe_pm_runtime_init(xe);
> +	INIT_LIST_HEAD(&xe->mem_access.vram_userfault_list);
> +	spin_lock_init(&xe->mem_access.vram_userfault_lock);
>  }
>  
>  void xe_pm_runtime_fini(struct xe_device *xe)
> @@ -214,6 +216,7 @@ struct task_struct *xe_pm_read_callback_task(struct xe_device *xe)
>  
>  int xe_pm_runtime_suspend(struct xe_device *xe)
>  {
> +	struct xe_bo *bo, *on;
>  	struct xe_gt *gt;
>  	u8 id;
>  	int err = 0;
> @@ -247,6 +250,10 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
>  	 */
>  	lock_map_acquire(&xe_device_mem_access_lockdep_map);
>  
> +	list_for_each_entry_safe(bo, on,
> +				 &xe->mem_access.vram_userfault_list, vram_userfault_link)
> +		xe_bo_runtime_pm_release_mmap_offset(bo);
> +
>  	if (xe->d3cold.allowed) {
>  		err = xe_bo_evict_all(xe);
>  		if (err)
> -- 
> 2.25.1
> 
