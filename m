Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45E40D21272
	for <intel-xe@archiver.kernel.org>; Thu, 17 Oct 2024 11:12:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12A9E10E316;
	Thu, 17 Oct 2024 11:12:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GgSr6Eb3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAA8910E316
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Oct 2024 11:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729163557; x=1760699557;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=tExxkdGVIScA6uxbbKZFMC8fYXC5KfUNAteDg+i1EDI=;
 b=GgSr6Eb3TXze+f3Al8OBgsBgdhS7hlMv5vOujArgYc2/vnG89J6udqA0
 Zy+ybbRQrSinhY7d727OEHkrkl3s+SlMgC1QpuSLH3Ybp8SSFJQOescZH
 feFE1PaUSpxVs0IS1AwP1rk2cPBm838FR4ROS4tBp/1cuczKdQQDgZjMx
 36PECnQaTZTwZSVHddclK1NmXvAQUw6Bipri5iw8MA0D+2hLhl7TwUtLZ
 Q6ZYNqsyMLo4YPmRYGifdhKh1bYF6GkQ+BOjMqOVbgGGtI7IVNvesYKz3
 JSDzMcvSOXODaJ1OEFl71gcf8nZ65Wug4Ss/FW1wu95XsGW8/rpHjlxwA A==;
X-CSE-ConnectionGUID: AsvECzkyT/W0H9igq+TyGg==
X-CSE-MsgGUID: S3knWMxKQ967dWnHSF9RbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="32328940"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="32328940"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 04:12:36 -0700
X-CSE-ConnectionGUID: A7XFOFlDRVCovJUmqvPhlw==
X-CSE-MsgGUID: StCUy+0pRYmE3ajamUOQfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; d="scan'208";a="83070944"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa005.fm.intel.com with ESMTP; 17 Oct 2024 04:12:34 -0700
Received: from [10.246.17.177] (mwajdecz-MOBL.ger.corp.intel.com
 [10.246.17.177])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id CC30A2FA8;
 Thu, 17 Oct 2024 12:12:32 +0100 (IST)
Message-ID: <b352367d-5f94-4406-ad3a-71f804bed078@intel.com>
Date: Thu, 17 Oct 2024 13:12:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] drm/xe/pf: Add functions to save and restore VF
 LMEM and CCS data
To: Lukasz Laguna <lukasz.laguna@intel.com>, intel-xe@lists.freedesktop.org
Cc: michal.winiarski@intel.com
References: <20241016095745.7477-1-lukasz.laguna@intel.com>
 <20241016095745.7477-4-lukasz.laguna@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20241016095745.7477-4-lukasz.laguna@intel.com>
Content-Type: text/plain; charset=UTF-8
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



On 16.10.2024 11:57, Lukasz Laguna wrote:
> State of VF LMEM and corresponding CCS metadata needs to be saved and
> restored during migration of VM with attached dGPU VF. Add helpers that
> allow it. We will start using them in upcoming patches.
> 
> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 100 ++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h |   7 ++
>  2 files changed, 107 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> index c712111aa30d..feb22d3e5dd5 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> @@ -12,6 +12,7 @@
>  #include "xe_gt_sriov_printk.h"
>  #include "xe_guc.h"
>  #include "xe_guc_ct.h"
> +#include "xe_migrate.h"
>  #include "xe_sriov.h"
>  
>  /* Return: number of dwords saved/restored/required or a negative error code on failure */
> @@ -382,6 +383,105 @@ ssize_t xe_gt_sriov_pf_migration_write_guc_state(struct xe_gt *gt, unsigned int
>  }
>  #endif /* CONFIG_DEBUG_FS */
>  
> +static int pf_save_restore_lmem(struct xe_gt *gt, unsigned int vfid, struct xe_bo *sysmem,
> +				struct xe_bo *ccs, u64 offset, size_t size, bool save)

bool flags are not welcomed by the maintainters

> +{
> +	struct xe_bo *vram;
> +	struct dma_fence *fence;
> +	int ret;

you may want to assert that vfid != PFID

> +
> +	if (!sysmem && !ccs)
> +		return -EINVAL;

input parameters shall be validated at the top public function, in all
internal static functions/helpers we should just have asserts

> +
> +	vram = gt->sriov.pf.vfs[vfid].config.lmem_obj;

access to config.lmem_obj should be under xe_gt_sriov_pf_master_mutex

> +	if (!vram)
> +		return -ENXIO;
> +
> +	if (!xe_bo_trylock(vram))
> +		return -EBUSY;
> +
> +	if (sysmem) {
> +		if (!xe_bo_trylock(sysmem)) {
> +			ret = -EBUSY;
> +			goto err_vram_unlock;
> +		}
> +	}
> +	if (ccs) {
> +		if (!xe_bo_trylock(ccs)) {
> +			ret = -EBUSY;
> +			goto err_sysmem_unlock;
> +		}
> +	}
> +
> +	fence = xe_migrate_raw_vram_copy(vram, offset, sysmem, 0, ccs, 0, size, save);
> +	if (IS_ERR(fence)) {
> +		ret = PTR_ERR(fence);
> +		goto err_ccs_unlock;
> +	}
> +	ret = dma_fence_wait_timeout(fence, false, 5 * HZ);

do you want to keep this hardcoded 5s for all cases?
maybe the fence should be returned to the caller?

> +	if (!ret)
> +		ret = -ETIME;
> +
> +	dma_fence_put(fence);
> +
> +err_ccs_unlock:
> +	if (ccs)
> +		xe_bo_unlock(ccs);
> +err_sysmem_unlock:
> +	if (sysmem)
> +		xe_bo_unlock(sysmem);
> +err_vram_unlock:
> +	xe_bo_unlock(vram);
> +
> +	return ret < 0 ? ret : 0;
> +}
> +
> +/**
> + * xe_gt_sriov_pf_migration_save_lmem() - Save a VF LMEM and corresponding CCS.
> + * @gt: the &xe_gt
> + * @vfid: the VF identifier
> + * @smem: the sysmem BO to save LMEM data to (NULL if not needed)

likely the vfio driver will not be able to provide such BO, so do we
plan to introduce yet another layer for it?

> + * @ccs: the sysmem BO to save CCS data to (NULL if not needed)

shouldn't the logic about need of the CCS data be somehow hidden from
the caller?

> + * @offset: the offset of VF LMEM chunk
> + * @size: the size of VF LMEM chunk
> + *
> + * This function is for PF only.
> + *
> + * This functions saves VF LMEM and corresponding CCS data into sysmem buffer
> + * objects.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_gt_sriov_pf_migration_save_lmem(struct xe_gt *gt, unsigned int vfid,
> +				       struct xe_bo *sysmem, struct xe_bo *ccs, u64 offset,
> +				       size_t size)
> +{
> +	return pf_save_restore_lmem(gt, vfid, sysmem, ccs, offset, size, true);
> +}
> +
> +/**
> + * xe_gt_sriov_pf_migration_restore_lmem() - Restore a VF LMEM and corresponding CCS.
> + * @gt: the &xe_gt
> + * @vfid: the VF identifier
> + * @smem: the sysmem BO to restore LMEM data from (NULL if not needed)
> + * @ccs: the sysmem BO to restore CCS data from (NULL if not needed)
> + * @offset: the offset of VF LMEM chunk
> + * @size: the size of VF LMEM chunk
> + *
> + * This function is for PF only.
> + *
> + * This functions restores VF LMEM and corresponding CCS data from sysmem
> + * buffer objects.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_gt_sriov_pf_migration_restore_lmem(struct xe_gt *gt, unsigned int vfid,
> +					  struct xe_bo *sysmem, struct xe_bo *ccs, u64 offset,
> +					  size_t size)
> +{
> +	return pf_save_restore_lmem(gt, vfid, sysmem, ccs, offset, size, false);
> +}
> +
>  static bool pf_check_migration_support(struct xe_gt *gt)
>  {
>  	/* GuC 70.25 with save/restore v2 is required */
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
> index 09faeae00ddb..dc1e6c5b44fa 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
> @@ -8,11 +8,18 @@
>  
>  #include <linux/types.h>
>  
> +struct xe_bo;
>  struct xe_gt;
>  
>  int xe_gt_sriov_pf_migration_init(struct xe_gt *gt);
>  int xe_gt_sriov_pf_migration_save_guc_state(struct xe_gt *gt, unsigned int vfid);
>  int xe_gt_sriov_pf_migration_restore_guc_state(struct xe_gt *gt, unsigned int vfid);
> +int xe_gt_sriov_pf_migration_save_lmem(struct xe_gt *gt, unsigned int vfid,
> +				       struct xe_bo *sysmem, struct xe_bo *ccs, u64 offset,
> +				       size_t size);
> +int xe_gt_sriov_pf_migration_restore_lmem(struct xe_gt *gt, unsigned int vfid,
> +					  struct xe_bo *sysmem, struct xe_bo *ccs, u64 offset,
> +					  size_t size);
>  
>  #ifdef CONFIG_DEBUG_FS
>  ssize_t xe_gt_sriov_pf_migration_read_guc_state(struct xe_gt *gt, unsigned int vfid,

