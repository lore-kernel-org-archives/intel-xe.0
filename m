Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62F87C54E4A
	for <intel-xe@archiver.kernel.org>; Tue,  5 Mar 2024 10:17:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EC281129D3;
	Tue,  5 Mar 2024 10:17:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DI8PE4eE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21FDA1129D3
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Mar 2024 10:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709633830; x=1741169830;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=QVe2ggzxRzUZMjaHcHuXoa+xA/wyCtRE4qjfTjJXdUw=;
 b=DI8PE4eE044gh61Zo4V0Cuv0T03Feey9Kb/vrIf5RW3s7QsadH/sgHi7
 pIKzTUHHg61GOWap5Wm6OYQY70xKk2qNbhow+EepgKgTItOoVNBRDGbcJ
 JAkwwYnqj4WG2dA8JPPADTFQQH+7zaqZCIH6KH2bSfB2VxBSqRvRqtzE0
 yUl3ftgHlQO7xK6AibT4GtXOxtgizFIR5ZBanPAHXWgiG0ranyVH+57hn
 Ybb9EyjvTJplveGT6qm9IZZLO8a9tP3W6vTvW4xukhN/PeEdC6+Mx2v47
 qssbem50AWSgLMY8TRDE1dsmDZDdv1B9+8SporawRAuEzIQwejJpeLwga g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="4101389"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="4101389"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 02:17:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; d="scan'208";a="13982431"
Received: from pkunieck-mobl.ger.corp.intel.com (HELO [10.249.140.91])
 ([10.249.140.91])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 02:17:05 -0800
Message-ID: <67ab395f-c143-4ad5-959d-a9c245e46d2a@intel.com>
Date: Tue, 5 Mar 2024 10:17:02 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/9] drm/xe: Remove useless mem_access during probe
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org
References: <20240304182154.42611-1-rodrigo.vivi@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240304182154.42611-1-rodrigo.vivi@intel.com>
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

On 04/03/2024 18:21, Rodrigo Vivi wrote:
> xe_pm_init is the very last thing during the xe_pci_probe(),
> hence these protections are useless from the point of view
> of ensuring that the device is awake.
> 
> Let's remove it so we continue towards the goal of killing
> xe_device_mem_access.
> 
> v2: Adding more cases
> 
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_ggtt.c |  2 --
>   drivers/gpu/drm/xe/xe_gt.c   |  9 ---------
>   drivers/gpu/drm/xe/xe_tile.c | 10 +++-------
>   drivers/gpu/drm/xe/xe_uc.c   | 11 -----------
>   4 files changed, 3 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 717d0e76277a..355e4bb987cb 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -206,14 +206,12 @@ static void xe_ggtt_initial_clear(struct xe_ggtt *ggtt)
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
> index 85408e7a932b..063b710a8c7b 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -347,7 +347,6 @@ static int gt_fw_domain_init(struct xe_gt *gt)
>   {
>   	int err, i;
>   
> -	xe_device_mem_access_get(gt_to_xe(gt));
>   	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>   	if (err)
>   		goto err_hw_fence_irq;
> @@ -389,7 +388,6 @@ static int gt_fw_domain_init(struct xe_gt *gt)
>   
>   	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>   	XE_WARN_ON(err);
> -	xe_device_mem_access_put(gt_to_xe(gt));
>   
>   	return 0;
>   
> @@ -399,7 +397,6 @@ static int gt_fw_domain_init(struct xe_gt *gt)
>   err_hw_fence_irq:
>   	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i)
>   		xe_hw_fence_irq_finish(&gt->fence_irq[i]);
> -	xe_device_mem_access_put(gt_to_xe(gt));
>   
>   	return err;
>   }
> @@ -408,7 +405,6 @@ static int all_fw_domain_init(struct xe_gt *gt)
>   {
>   	int err, i;
>   
> -	xe_device_mem_access_get(gt_to_xe(gt));
>   	err = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>   	if (err)
>   		goto err_hw_fence_irq;
> @@ -474,7 +470,6 @@ static int all_fw_domain_init(struct xe_gt *gt)
>   
>   	err = xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>   	XE_WARN_ON(err);
> -	xe_device_mem_access_put(gt_to_xe(gt));
>   
>   	return 0;
>   
> @@ -483,7 +478,6 @@ static int all_fw_domain_init(struct xe_gt *gt)
>   err_hw_fence_irq:
>   	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i)
>   		xe_hw_fence_irq_finish(&gt->fence_irq[i]);
> -	xe_device_mem_access_put(gt_to_xe(gt));
>   
>   	return err;
>   }
> @@ -496,7 +490,6 @@ int xe_gt_init_hwconfig(struct xe_gt *gt)
>   {
>   	int err;
>   
> -	xe_device_mem_access_get(gt_to_xe(gt));
>   	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>   	if (err)
>   		goto out;
> @@ -519,8 +512,6 @@ int xe_gt_init_hwconfig(struct xe_gt *gt)
>   out_fw:
>   	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>   out:
> -	xe_device_mem_access_put(gt_to_xe(gt));
> -
>   	return err;
>   }
>   
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

I think it was commented on previous version, but this should be split 
into separate change. We now no longer call 
xe_wa_apply_tile_workarounds() etc. Is that a bugfix?

Otherwise,
Reviewed-by: Matthew Auld <mattew.auld@intel.com>

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
> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> index 7033f8c1b431..4feb35c95a1c 100644
> --- a/drivers/gpu/drm/xe/xe_uc.c
> +++ b/drivers/gpu/drm/xe/xe_uc.c
> @@ -32,11 +32,8 @@ uc_to_xe(struct xe_uc *uc)
>   /* Should be called once at driver load only */
>   int xe_uc_init(struct xe_uc *uc)
>   {
> -	struct xe_device *xe = uc_to_xe(uc);
>   	int ret;
>   
> -	xe_device_mem_access_get(xe);
> -
>   	/*
>   	 * We call the GuC/HuC/GSC init functions even if GuC submission is off
>   	 * to correctly move our tracking of the FW state to "disabled".
> @@ -65,16 +62,8 @@ int xe_uc_init(struct xe_uc *uc)
>   		goto err;
>   
>   	ret = xe_guc_db_mgr_init(&uc->guc.dbm, ~0);
> -	if (ret)
> -		goto err;
> -
> -	xe_device_mem_access_put(xe);
> -
> -	return 0;
>   
>   err:
> -	xe_device_mem_access_put(xe);
> -
>   	return ret;
>   }
>   
