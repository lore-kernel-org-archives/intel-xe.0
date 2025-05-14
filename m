Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3E92C3ABD8
	for <intel-xe@archiver.kernel.org>; Wed, 14 May 2025 20:03:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E2AE10E701;
	Wed, 14 May 2025 20:03:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bU9WK7U+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1880810E701
 for <intel-xe@lists.freedesktop.org>; Wed, 14 May 2025 20:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747253027; x=1778789027;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=lUAFH6APwt90qZEGWCX6jWkftGG1ji2NX8c+GYfhfHg=;
 b=bU9WK7U+Pwb+qUmKSLe8v6BNGYG5xaCq35e3nGhdRKGo8YxjtjHZryBo
 AJIoK9M2vSQaPp53AYJaKKQbTpPkb3iMk6tWccD70hTPl09WhBSYJQ0Vr
 5EyUFEGqe7O3b7kCr8XE/xTkmRIb7y6MrXhzk4pbSklXP7SztSU2JrwCp
 IpCzVnLCyAzBJdyw0ZED6iuLUkAOjzu8iO8D96P1qoIx6RVgDGQ8ts5TW
 xGgQ/0zCs9/lImA6fsAwn0jNBLMUOGpUkhgTaxYhG7H5G7P0jx9jdceRw
 7ah7VrxGa2L2nZ/IraSml40R+FvK5JSAFELBMXQHhPU189C5x9CGaL8E5 A==;
X-CSE-ConnectionGUID: QHn6w6XYSM2SgcMFAsGH8w==
X-CSE-MsgGUID: 2pjraB+8QQixJj+M8AFwXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="51809229"
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; d="scan'208";a="51809229"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 13:03:45 -0700
X-CSE-ConnectionGUID: +i16i4mxRk+TJWC9YCljUA==
X-CSE-MsgGUID: 4kAVOtDhSvO6DPRRk/VMmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; d="scan'208";a="143338744"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa004.fm.intel.com with ESMTP; 14 May 2025 13:03:43 -0700
Received: from [10.246.5.201] (mwajdecz-MOBL.ger.corp.intel.com [10.246.5.201])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id E507C3496C;
 Wed, 14 May 2025 21:03:41 +0100 (IST)
Message-ID: <689654c7-b47c-445d-be19-76671fda4a4a@intel.com>
Date: Wed, 14 May 2025 22:03:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 6/7] drm/xe/vf: Rebase MEMIRQ structures for all
 contexts after migration
To: Tomasz Lis <tomasz.lis@intel.com>, intel-xe@lists.freedesktop.org
Cc: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
References: <20250513224952.701343-1-tomasz.lis@intel.com>
 <20250513224952.701343-7-tomasz.lis@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250513224952.701343-7-tomasz.lis@intel.com>
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



On 14.05.2025 00:49, Tomasz Lis wrote:
> All contexts require an update of state data, as the data includes
> GGTT references to memirq-related buffers.
> 
> Default contexts need these references updated as well, because they
> are not refreshed when a new context is created from them.
> 
> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_lrc.c      | 41 ++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_lrc.h      |  2 ++
>  drivers/gpu/drm/xe/xe_sriov_vf.c | 17 +++++++++++--
>  3 files changed, 58 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 43e1c18e1769..5a7f0077ef31 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -898,6 +898,47 @@ static void *empty_lrc_data(struct xe_hw_engine *hwe)
>  	return data;
>  }
>  
> +/**
> + * xe_default_lrc_update_memirq_regs_with_address - Re-compute GGTT references in default LRC
> + *   of given engine.
> + * @hwe: the &xe_hw_engine struct instance
> + */
> +void xe_default_lrc_update_memirq_regs_with_address(struct xe_hw_engine *hwe)
> +{
> +	struct xe_gt *gt = hwe->gt;
> +	u32 *regs;
> +
> +	if (!gt->default_lrc[hwe->class])
> +		return;
> +
> +	regs = gt->default_lrc[hwe->class] + LRC_PPHWSP_SIZE;
> +	set_memory_based_intr(regs, hwe);
> +}
> +
> +/**
> + * xe_lrc_update_memirq_regs_with_address - Re-compute GGTT references in mem interrupt data
> + *   for given LRC.
> + * @hwe: the &xe_hw_engine struct instance
> + * @lrc: the &xe_lrc struct instance
> + */
> +void xe_lrc_update_memirq_regs_with_address(struct xe_hw_engine *hwe, struct xe_lrc *lrc)
> +{
> +	struct xe_gt *gt = hwe->gt;
> +	struct iosys_map map;
> +	size_t regs_len;
> +	u32 *regs;
> +
> +	map = __xe_lrc_regs_map(lrc);
> +	regs_len = lrc_reg_size(gt_to_xe(gt));
> +	regs = kzalloc(regs_len, GFP_ATOMIC);
> +	if (!regs)
> +		return;

no error ? but recovery will be now broken, no?

> +	xe_map_memcpy_from(gt_to_xe(gt), regs, &map, 0, regs_len);
> +	set_memory_based_intr(regs, hwe);
> +	xe_map_memcpy_to(gt_to_xe(gt), &map, 0, regs, regs_len);
> +	kfree(regs);

maybe instead of this alloc + RMW + free just update:

	[CTX_INT_MASK_ENABLE_PTR]
	[CTX_INT_STATUS_REPORT_PTR]
	[CTX_INT_SRC_REPORT_PTR]

using 3x xe_lrc_write_ctx_reg() like it was done in patch 5/7 ?

> +}
> +
>  static void xe_lrc_set_ppgtt(struct xe_lrc *lrc, struct xe_vm *vm)
>  {
>  	u64 desc = xe_vm_pdp4_descriptor(vm, gt_to_tile(lrc->gt));
> diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
> index e7a99cfd0abe..3f0ae3affafe 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.h
> +++ b/drivers/gpu/drm/xe/xe_lrc.h
> @@ -89,6 +89,8 @@ u32 xe_lrc_indirect_ring_ggtt_addr(struct xe_lrc *lrc);
>  u32 xe_lrc_ggtt_addr(struct xe_lrc *lrc);
>  u32 *xe_lrc_regs(struct xe_lrc *lrc);
>  void xe_lrc_update_hwctx_regs_with_address(struct xe_lrc *lrc);
> +void xe_default_lrc_update_memirq_regs_with_address(struct xe_hw_engine *hwe);
> +void xe_lrc_update_memirq_regs_with_address(struct xe_hw_engine *hwe, struct xe_lrc *lrc);
>  
>  u32 xe_lrc_read_ctx_reg(struct xe_lrc *lrc, int reg_nr);
>  void xe_lrc_write_ctx_reg(struct xe_lrc *lrc, int reg_nr, u32 val);
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
> index 016faa29cddd..c08c44dbd383 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
> @@ -225,12 +225,23 @@ static int vf_post_migration_requery_guc(struct xe_device *xe)
>  	return ret;
>  }
>  
> +static void xe_gt_default_lrcs_hwsp_rebase(struct xe_gt *gt)
> +{
> +	struct xe_hw_engine *hwe;
> +	enum xe_hw_engine_id id;
> +
> +	for_each_hw_engine(hwe, gt, id)
> +		xe_default_lrc_update_memirq_regs_with_address(hwe);
> +}
> +
>  static void xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *eq)
>  {
>  	int i;
>  
> -	for (i = 0; i < eq->width; ++i)
> +	for (i = 0; i < eq->width; ++i) {
> +		xe_lrc_update_memirq_regs_with_address(eq->hwe, eq->lrc[i]);
>  		xe_lrc_update_hwctx_regs_with_address(eq->lrc[i]);
> +	}
>  }
>  
>  static void xe_guc_contexts_hwsp_rebase(struct xe_guc *guc)
> @@ -249,8 +260,10 @@ static void vf_post_migration_fixup_contexts(struct xe_device *xe)
>  	struct xe_gt *gt;
>  	unsigned int id;
>  
> -	for_each_gt(gt, xe, id)
> +	for_each_gt(gt, xe, id) {
> +		xe_gt_default_lrcs_hwsp_rebase(gt);
>  		xe_guc_contexts_hwsp_rebase(&gt->uc.guc);
> +	}
>  }
>  
>  static void vf_post_migration_fixup_ctb(struct xe_device *xe)

