Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CD33D116E2
	for <intel-xe@archiver.kernel.org>; Mon,  1 Dec 2025 06:05:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB6B910E112;
	Mon,  1 Dec 2025 06:05:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IG9dZUMG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F13DC10E112
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Dec 2025 06:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764569107; x=1796105107;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=vBZfdRxog1x6nfY0NHgbvg6dt3vWEAAwTVR95naK6LE=;
 b=IG9dZUMG7YWCdOZJPZnmzsKiQ20fnUyDULCKZjzM+EekNq+YJlQdvHdp
 6ul91lN1BDjCZKi0An9ZHp9OePAgzP9DSvWsY74zM7OogbmRGPtN9StHQ
 nmqrG98foaN5qvHyeLTmzKonyrKjGTIyx9HM1bJiHZFTVmOy8XCSrkDTk
 c33F2WJV7j9kXbg6k98TUq/rmEe8mXj3/NOEbcjFXKoV6Kuk7RxQeZjnm
 KP34oEIAJqjcVJb4Yp08Eaqj6t5svKCV4N7ECrBOyqJI043NN5KXvyoEy
 is4ZntwbgsWFA8J2meYZ8IEAK0R2b/os0VPiM16LP3kY+0mldXZS+bRcM g==;
X-CSE-ConnectionGUID: vS7D0zqwRneNu5JaWb8w1Q==
X-CSE-MsgGUID: 7gNyc+vnT06FjX5AaNITdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="66532474"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="66532474"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2025 22:05:07 -0800
X-CSE-ConnectionGUID: MG5s+GHERVCKMBNm+FBtcQ==
X-CSE-MsgGUID: x52e4ZSAQwWbkIHMdpiAYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="193235931"
Received: from amiszcza-mobl.ger.corp.intel.com (HELO [10.246.21.85])
 ([10.246.21.85])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2025 22:05:05 -0800
Message-ID: <5fe9573b-3de7-4605-b4f5-6ab9dc3ed0bb@linux.intel.com>
Date: Mon, 1 Dec 2025 07:04:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/4] drm/xe/vf: Add debugfs entries to test VF double
 migration
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, Tomasz Lis <tomasz.lis@intel.com>
References: <20251128133052.17120-6-satyanarayana.k.v.p@intel.com>
 <20251128133052.17120-10-satyanarayana.k.v.p@intel.com>
Content-Language: en-US
From: Adam Miszczak <adam.miszczak@linux.intel.com>
In-Reply-To: <20251128133052.17120-10-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 11/28/2025 2:30 PM, Satyanarayana K V P wrote:
> VF migration sends a marker to the GUC before resource fixups begin,
> and repeats the marker with the RESFIX_DONE notification. This prevents
> the GUC from submitting jobs during double migration events.
>
> To reliably test double migration, a second migration must be triggered
> while fixups from the first migration are still in progress. Since fixups
> complete quickly, reproducing this scenario is difficult. Introduce
> debugfs controls to add delays in the post-fixup phase, creating a
> deterministic window for subsequent migrations.
>
> New debugfs entries:
> 	/sys/kernel/debug/dri/BDF/
> 	├── tile0
> 	│   ├─gt0
> 	│   │ ├──vf
> 	│   │ │  ├── resfix_stoppers
>
> resfix_stoppers: Predefined checkpoints that allow the migration process
> to pause at specific stages. The stages are given below.
>
> VF_MIGRATION_WAIT_RESFIX_START		- BIT(0)
> VF_MIGRATION_WAIT_FIXUPS		- BIT(1)
> VF_MIGRATION_WAIT_RESTART_JOBS		- BIT(2)
> VF_MIGRATION_WAIT_RESFIX_DONE		- BIT(3)
>
> Each state will pause with a 1-second delay per iteration, continuing until
> its corresponding bit is cleared.
>
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Tomasz Lis <tomasz.lis@intel.com>
>
> ---
> V6 -> V7:
> - Fixed review comments (Michal W).
> - Updated commit message.
>
> V5 -> V6:
> - Fixed review comments (Michal W).
> - Removed timeout and VF KMD waits infinately when resfix_stoppers bits are
> set.
> - Created helper macro for WAIT positions.
>
> V4 -> V5:
> - Updated debugfs entries (Michal W).
>
> V3 -> V4:
> - New commit
>
> V2 -> V3:
> - None.
>
> V1 -> V2:
> - None.
> ---
>   drivers/gpu/drm/xe/xe_gt_sriov_vf.c         | 40 +++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.c | 12 +++++++
>   drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h   |  8 +++++
>   3 files changed, 60 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 937554657440..75c5c6ad0b75 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -5,6 +5,7 @@
>   
>   #include <linux/bitfield.h>
>   #include <linux/bsearch.h>
> +#include <linux/delay.h>
>   
>   #include <drm/drm_managed.h>
>   #include <drm/drm_print.h>
> @@ -41,6 +42,37 @@
>   
>   #define make_u64_from_u32(hi, lo) ((u64)((u64)(u32)(hi) << 32 | (u32)(lo)))
>   
> +#ifdef CONFIG_DRM_XE_DEBUG
> +enum VF_MIGRATION_WAIT_POINTS {
> +	VF_MIGRATION_WAIT_RESFIX_START	= BIT(0),
> +	VF_MIGRATION_WAIT_FIXUPS	= BIT(1),
> +	VF_MIGRATION_WAIT_RESTART_JOBS	= BIT(2),
> +	VF_MIGRATION_WAIT_RESFIX_DONE	= BIT(3),
> +};
> +
> +#define VF_MIGRATION_WAIT_DELAY_IN_MS	1000
> +static void vf_post_migration_inject_wait(struct xe_gt *gt,
> +					  enum VF_MIGRATION_WAIT_POINTS wait)
> +{
> +	while (gt->sriov.vf.migration.debug.resfix_stoppers & wait) {
> +		xe_gt_dbg(gt,
> +			  "*TESTING* injecting %u ms delay due to resfix_stoppers=%#x, to continue clear %#x\n",
> +			  VF_MIGRATION_WAIT_DELAY_IN_MS,
> +			  gt->sriov.vf.migration.debug.resfix_stoppers, wait);
> +
> +		msleep(VF_MIGRATION_WAIT_DELAY_IN_MS);
> +	}
> +}
> +
> +#define VF_MIGRATION_INJECT_WAIT(gt, _POS) ({					\
> +	struct xe_gt *__gt = (gt);						\
> +	vf_post_migration_inject_wait(__gt, VF_MIGRATION_WAIT_##_POS);		\
> +	})
> +
> +#else
> +#define VF_MIGRATION_INJECT_WAIT(_gt, _POS)	typecheck(struct xe_gt *, (_gt))
> +#endif
> +
>   static int guc_action_vf_reset(struct xe_guc *guc)
>   {
>   	u32 request[GUC_HXG_REQUEST_MSG_MIN_LEN] = {
> @@ -320,6 +352,8 @@ static int vf_resfix_start(struct xe_gt *gt, u16 marker)
>   
>   	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>   
> +	VF_MIGRATION_INJECT_WAIT(gt, RESFIX_START);
> +
>   	xe_gt_sriov_dbg_verbose(gt, "Sending resfix start marker %u\n", marker);
>   
>   	return guc_action_vf_resfix_start(guc, marker);
> @@ -1158,6 +1192,8 @@ static int vf_post_migration_fixups(struct xe_gt *gt)
>   	void *buf = gt->sriov.vf.migration.scratch;
>   	int err;
>   
> +	VF_MIGRATION_INJECT_WAIT(gt, FIXUPS);
> +
>   	/* xe_gt_sriov_vf_query_config will fixup the GGTT addresses */
>   	err = xe_gt_sriov_vf_query_config(gt);
>   	if (err)
> @@ -1176,6 +1212,8 @@ static int vf_post_migration_fixups(struct xe_gt *gt)
>   
>   static void vf_post_migration_rearm(struct xe_gt *gt)
>   {
> +	VF_MIGRATION_INJECT_WAIT(gt, RESTART_JOBS);
> +
>   	xe_guc_ct_restart(&gt->uc.guc.ct);
>   	xe_guc_submit_unpause_prepare_vf(&gt->uc.guc);
>   }
> @@ -1199,6 +1237,8 @@ static void vf_post_migration_abort(struct xe_gt *gt)
>   
>   static int vf_post_migration_resfix_done(struct xe_gt *gt, u16 marker)
>   {
> +	VF_MIGRATION_INJECT_WAIT(gt, RESFIX_DONE);
> +
>   	spin_lock_irq(&gt->sriov.vf.migration.lock);
>   	if (gt->sriov.vf.migration.recovery_queued)
>   		xe_gt_sriov_dbg(gt, "another recovery imminent\n");
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.c
> index 2ed5b6780d30..507718326e1f 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.c
> @@ -69,4 +69,16 @@ void xe_gt_sriov_vf_debugfs_register(struct xe_gt *gt, struct dentry *root)
>   	vfdentry->d_inode->i_private = gt;
>   
>   	drm_debugfs_create_files(vf_info, ARRAY_SIZE(vf_info), vfdentry, minor);
> +
> +	/*
> +	 *      /sys/kernel/debug/dri/BDF/
> +	 *      ├── tile0
> +	 *          ├── gt0
> +	 *              ├── vf
> +	 *                  ├── resfix_stoppers
> +	 */
> +	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {
> +		debugfs_create_x8("resfix_stoppers", 0600, vfdentry,
> +				  &gt->sriov.vf.migration.debug.resfix_stoppers);
> +	}
>   }
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> index db2f8b3ed3e9..510c33116fbd 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> @@ -52,6 +52,14 @@ struct xe_gt_sriov_vf_migration {
>   	wait_queue_head_t wq;
>   	/** @scratch: Scratch memory for VF recovery */
>   	void *scratch;
> +	/** @debug: Debug hooks for delaying migration */
> +	struct {
> +		/**
> +		 * @debug.resfix_stoppers: Stop and wait at different stages
> +		 * during post migration recovery
> +		 */
> +		u8 resfix_stoppers;
> +	} debug;
>   	/**
>   	 * @resfix_marker: Marker sent on start and on end of post-migration
>   	 * steps.
Solution preliminarily tested, this approach to debug hooks works for me.
Acked-by: Adam Miszczak <adam.miszczak@linux.intel.com>
