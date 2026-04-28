Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D078AFF885D
	for <intel-xe@archiver.kernel.org>; Tue, 28 Apr 2026 10:38:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9418410EACA;
	Tue, 28 Apr 2026 10:38:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QtrjqDL0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C3BF10E31A
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Apr 2026 10:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777372737; x=1808908737;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ZBrGv2KgacHecNp4CpXh4LclZTfpFcLWdQzlMR0lyhs=;
 b=QtrjqDL09yClVMN7zS8jKQ5vxhRYRQxwqZX1U4iFUBoGT+hkBlSGlicl
 hngVEM3EbfkwnBFTFCYG6wfYznu4YNKXSd6tiBMinYtuJ7uYLso8bk8UW
 ZHscucaGdymvEEtYykuvv1iqHjfRV8aRIObFSOzuJB1B0pOPO3aO33HyL
 kgsNt/B42GX3GNx9Q1YgybIXSf6kmkolfHGnKnuzryc6rHfhAhY+UlYFu
 00NIAhk0ReMnE9GXuYR+bpKO9r/MVBbKB925b+ER7N20hs/N7VgNmaBAe
 CC0rKzzT5lWBTY+MwQ2tD/ZHUw82+jaeyan9T3GeddgpoIFpNTsV91akh g==;
X-CSE-ConnectionGUID: c0RTYL/QTeuItuI1we6veg==
X-CSE-MsgGUID: dEP9iBi7TSm4s7DziLFlqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="78339783"
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; d="scan'208";a="78339783"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 03:38:57 -0700
X-CSE-ConnectionGUID: DkAW/PVkSSiKATNEA4L9Qg==
X-CSE-MsgGUID: 3Ujq5RCZQ12PFKOuBqUK7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; d="scan'208";a="238950374"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.245.18])
 ([10.245.245.18])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 03:38:56 -0700
Message-ID: <d9a80b36-f54f-4ec4-9045-c24d2f493b01@intel.com>
Date: Tue, 28 Apr 2026 11:38:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Destroy mutex on gpu_buddy_init failure in VRAM
 manager init
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 himal.prasad.ghimiray@intel.com
References: <20260428103202.3889095-2-tejas.upadhyay@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260428103202.3889095-2-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 28/04/2026 11:32, Tejas Upadhyay wrote:
> In __xe_ttm_vram_mgr_init(), if gpu_buddy_init() fails, the function
> returns early without calling mutex_destroy() on mgr->lock which was
> previously initialized via mutex_init(). The normal cleanup path in
> xe_ttm_vram_mgr_fini() is registered via drmm_add_action_or_reset()
> only after gpu_buddy_init() succeeds, so it never runs for this error
> case.
> 
> Add mutex_destroy() before the early return to properly clean up the
> initialized mutex.
> 
> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM buddy based VRAM manager")
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_ttm_vram_mgr.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> index 5fd0d5506a7e..3189e4b7ad05 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> @@ -319,8 +319,10 @@ int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
>   
>   	ttm_resource_manager_init(man, &xe->ttm, size);
>   	err = gpu_buddy_init(&mgr->mm, man->size, default_page_size);
> -	if (err)
> +	if (err) {
> +		mutex_destroy(&mgr->lock);
>   		return err;
> +	}

Can we not use drmm_mutex_init() instead? Also can then drop the manual 
destroy in fini(().

>   
>   	ttm_set_driver_manager(&xe->ttm, mem_type, &mgr->manager);
>   	ttm_resource_manager_set_used(&mgr->manager, true);

