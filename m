Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A08C3C4828D
	for <intel-xe@archiver.kernel.org>; Mon,  5 Feb 2024 13:18:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5370810EE95;
	Mon,  5 Feb 2024 13:18:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iqSKPG7q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7929310EE95
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Feb 2024 13:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707139135; x=1738675135;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=1x8w9L5SbdPq1SADXKNjiGa+CdpaQuXN3gmn5T5yHTU=;
 b=iqSKPG7qWLVR6SYqOe1f+8JZ1kBC7ujNIOxWrS2McQ3VGXyJQKvIu2jf
 gKg4nxT2lH8kGIcX67+4ffJjaQRMj79HXuWdHYLKkB5W4Ou+gi/6YK5s8
 3fNxg8i2VFND8zY6PLLb/QHlQr6BA0a6fDZGLBHTZCFtZMMpE5MWMezl4
 gEQru5DXKxdf4aGUbtdBLh/jytc0OyVS3xKEReFnCf0RVrIYvvAgSZpmt
 5VtPMe7qudz0IHYl7pLS0n6W424rfTF/5zxgmrBOsycJ6gDVLHRmmZkpr
 7ZnoEuF7NR++z4nwxoHj/URfQGVBQmaLlD9wxa9ka1bchCQm1+Dqf19Tg g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10974"; a="11874588"
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; d="scan'208";a="11874588"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2024 05:18:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="5326153"
Received: from vgolodni-mobl.ger.corp.intel.com (HELO [10.252.0.151])
 ([10.252.0.151])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2024 05:18:52 -0800
Message-ID: <611e04a2-8409-460d-a078-1b2658482892@intel.com>
Date: Mon, 5 Feb 2024 13:18:50 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 27/34] drm/xe: Remove useless mem_access during probe
Content-Language: en-GB
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org
References: <20240126203044.1104705-1-rodrigo.vivi@intel.com>
 <20240126203044.1104705-28-rodrigo.vivi@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240126203044.1104705-28-rodrigo.vivi@intel.com>
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

On 26/01/2024 20:30, Rodrigo Vivi wrote:
> xe_pm_init is the very last thing during the xe_pci_probe(),
> hence these protections are useless from the point of view
> of ensuring that the device is awake.
> 
> Let's remove it so we continue towards the goal of killing
> xe_device_mem_access.
> 
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_ggtt.c |  2 --
>   drivers/gpu/drm/xe/xe_gt.c   |  6 ------
>   drivers/gpu/drm/xe/xe_tile.c | 10 +++-------
>   3 files changed, 3 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 6fdf830678b3..7faf02523b03 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -201,14 +201,12 @@ static void xe_ggtt_initial_clear(struct xe_ggtt *ggtt)
>   	u64 start, end;
>   
>   	/* Display may have allocated inside ggtt, so be careful with clearing here */
> -	xe_device_mem_access_get(tile_to_xe(ggtt->tile));
>   	mutex_lock(&ggtt->lock);
>   	drm_mm_for_each_hole(hole, &ggtt->mm, start, end)
>   		xe_ggtt_clear(ggtt, start, end - start);
>   
>   	xe_ggtt_invalidate(ggtt);
>   	mutex_unlock(&ggtt->lock);
> -	xe_device_mem_access_put(tile_to_xe(ggtt->tile));
>   }
>   
>   int xe_ggtt_init(struct xe_ggtt *ggtt)
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 675a2927a19e..c6c4292c21f5 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -349,7 +349,6 @@ static int gt_fw_domain_init(struct xe_gt *gt)
>   {
>   	int err, i;
>   
> -	xe_device_mem_access_get(gt_to_xe(gt));
>   	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>   	if (err)
>   		goto err_hw_fence_irq;
> @@ -407,7 +406,6 @@ static int gt_fw_domain_init(struct xe_gt *gt)
>   
>   	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>   	XE_WARN_ON(err);
> -	xe_device_mem_access_put(gt_to_xe(gt));
>   
>   	return 0;
>   
> @@ -417,7 +415,6 @@ static int gt_fw_domain_init(struct xe_gt *gt)
>   err_hw_fence_irq:
>   	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i)
>   		xe_hw_fence_irq_finish(&gt->fence_irq[i]);
> -	xe_device_mem_access_put(gt_to_xe(gt));
>   
>   	return err;
>   }
> @@ -426,7 +423,6 @@ static int all_fw_domain_init(struct xe_gt *gt)
>   {
>   	int err, i;
>   
> -	xe_device_mem_access_get(gt_to_xe(gt));
>   	err = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>   	if (err)
>   		goto err_hw_fence_irq;
> @@ -489,7 +485,6 @@ static int all_fw_domain_init(struct xe_gt *gt)
>   
>   	err = xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>   	XE_WARN_ON(err);
> -	xe_device_mem_access_put(gt_to_xe(gt));
>   
>   	return 0;
>   
> @@ -498,7 +493,6 @@ static int all_fw_domain_init(struct xe_gt *gt)
>   err_hw_fence_irq:
>   	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i)
>   		xe_hw_fence_irq_finish(&gt->fence_irq[i]);
> -	xe_device_mem_access_put(gt_to_xe(gt));
>   
>   	return err;
>   }
> diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
> index 044c20881de7..74ecb5f39438 100644
> --- a/drivers/gpu/drm/xe/xe_tile.c
> +++ b/drivers/gpu/drm/xe/xe_tile.c
> @@ -160,23 +160,19 @@ int xe_tile_init_noalloc(struct xe_tile *tile)
>   {
>   	int err;
>   
> -	xe_device_mem_access_get(tile_to_xe(tile));
> -
>   	err = tile_ttm_mgr_init(tile);
>   	if (err)
> -		goto err_mem_access;
> +		return err;
>   
>   	tile->mem.kernel_bb_pool = xe_sa_bo_manager_init(tile, SZ_1M, 16);
>   	if (IS_ERR(tile->mem.kernel_bb_pool))
> -		err = PTR_ERR(tile->mem.kernel_bb_pool);
> +		return PTR_ERR(tile->mem.kernel_bb_pool);

Previously this was just falling through with the err. This deserves to 
be a separate change, from the other more mechanical stuff here.

>   
>   	xe_wa_apply_tile_workarounds(tile);
>   
>   	xe_tile_sysfs_init(tile);
>   
> -err_mem_access:
> -	xe_device_mem_access_put(tile_to_xe(tile));
> -	return err;
> +	return 0;
>   }
>   
>   void xe_tile_migrate_wait(struct xe_tile *tile)
