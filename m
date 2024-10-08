Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 125DACED272
	for <intel-xe@archiver.kernel.org>; Tue,  8 Oct 2024 06:53:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D061810E475;
	Tue,  8 Oct 2024 06:53:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PZfjp8i1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 370E110E478
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Oct 2024 06:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728370384; x=1759906384;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LQ4WFAOG3fdKPDI38jtzO6Jb5BdJqx6jI6dWugYSXnE=;
 b=PZfjp8i1pZ/uFI/+6N/RiBBGwerqNFUcjZ6APGrmBXLb3tX/jXIKvl78
 bQ1/3Wa6w2UuT/2whcmwr+3SAUUkOEOzMOFdyJOrFvxBTJ/NArWb5hHh6
 uNZRNmpVnP/5U8KBoiRxf+irKu3Ig7ApQ0uo/ciSpzrXGaOEbDEpbsFcG
 FOho1CzEoncmHRA3OeQZvAjMk/ZrK6HgTrL4368fnCl5LHjRVmtYfQO4M
 PN/+fOVQFgipQqi0cTR9tj2y5MEUfB5hfTI5LcJj7WrhzdzRGaxH7AU0I
 z3elE6dYRqYtX/ovsKGOkAWSXh5xP+xMcEvxMd0FARmhnCsCWSwNkabdG Q==;
X-CSE-ConnectionGUID: KlkLp7AZQsmxmRoOlx+jJQ==
X-CSE-MsgGUID: JVPw1DkaRkatRh/mPz0yfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="31430421"
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; d="scan'208";a="31430421"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2024 23:53:04 -0700
X-CSE-ConnectionGUID: eFjj0OK7T1SD7RhEq7WxAw==
X-CSE-MsgGUID: m1rsZk5qTharqFVs7uMLAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; d="scan'208";a="106577697"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orviesa002.jf.intel.com with ESMTP; 07 Oct 2024 23:53:02 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v8 09/26] drm/xe/gt: Update handling of xe_force_wake_get
 return
Date: Tue,  8 Oct 2024 12:40:58 +0530
Message-Id: <20241008071115.1862704-10-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241008071115.1862704-1-himal.prasad.ghimiray@intel.com>
References: <20241008071115.1862704-1-himal.prasad.ghimiray@intel.com>
MIME-Version: 1.0
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

xe_force_wake_get() now returns the reference count-incremented domain
mask. If it fails for individual domains, the return value will always
be 0. However, for XE_FORCEWAKE_ALL, it may return a non-zero value even
in the event of failure. Use helper xe_force_wake_ref_has_domain to verify
all domains are initialized or not. Update the return handling of
xe_force_wake_get() to reflect this behavior, and ensure that the return
value is passed as input to xe_force_wake_put().

v3
- return xe_wakeref_t instead of int in xe_force_wake_get()
- xe_force_wake_put() error doesn't need to be checked. It internally
WARNS on domain ack failure.

v4
- Rebase fix

v5
- return unsigned int for xe_force_wake_get()
- remove redundant XE_WARN_ON()

v6
- use helper for checking all initialized domains are awake or not.

v7
- Fix commit message

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c | 105 ++++++++++++++++++++-----------------
 1 file changed, 58 insertions(+), 47 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 2d5e78311b76..409f1ab6ea37 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -97,14 +97,14 @@ void xe_gt_sanitize(struct xe_gt *gt)
 
 static void xe_gt_enable_host_l2_vram(struct xe_gt *gt)
 {
+	unsigned int fw_ref;
 	u32 reg;
-	int err;
 
 	if (!XE_WA(gt, 16023588340))
 		return;
 
-	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-	if (WARN_ON(err))
+	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+	if (!fw_ref)
 		return;
 
 	if (!xe_gt_is_media_type(gt)) {
@@ -115,13 +115,13 @@ static void xe_gt_enable_host_l2_vram(struct xe_gt *gt)
 	}
 
 	xe_gt_mcr_multicast_write(gt, XEHPC_L3CLOS_MASK(3), 0x3);
-	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 }
 
 static void xe_gt_disable_host_l2_vram(struct xe_gt *gt)
 {
+	unsigned int fw_ref;
 	u32 reg;
-	int err;
 
 	if (!XE_WA(gt, 16023588340))
 		return;
@@ -129,15 +129,15 @@ static void xe_gt_disable_host_l2_vram(struct xe_gt *gt)
 	if (xe_gt_is_media_type(gt))
 		return;
 
-	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-	if (WARN_ON(err))
+	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+	if (WARN_ON(!fw_ref))
 		return;
 
 	reg = xe_gt_mcr_unicast_read_any(gt, XE2_GAMREQSTRM_CTRL);
 	reg &= ~CG_DIS_CNTLBUS;
 	xe_gt_mcr_multicast_write(gt, XE2_GAMREQSTRM_CTRL, reg);
 
-	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 }
 
 /**
@@ -403,11 +403,14 @@ static void dump_pat_on_error(struct xe_gt *gt)
 
 static int gt_fw_domain_init(struct xe_gt *gt)
 {
+	unsigned int fw_ref;
 	int err, i;
 
-	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-	if (err)
+	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+	if (!fw_ref) {
+		err = -ETIMEDOUT;
 		goto err_hw_fence_irq;
+	}
 
 	if (!xe_gt_is_media_type(gt)) {
 		err = xe_ggtt_init(gt_to_tile(gt)->mem.ggtt);
@@ -442,14 +445,12 @@ static int gt_fw_domain_init(struct xe_gt *gt)
 	 */
 	gt->info.gmdid = xe_mmio_read32(&gt->mmio, GMD_ID);
 
-	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
-	XE_WARN_ON(err);
-
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 	return 0;
 
 err_force_wake:
 	dump_pat_on_error(gt);
-	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 err_hw_fence_irq:
 	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i)
 		xe_hw_fence_irq_finish(&gt->fence_irq[i]);
@@ -459,11 +460,14 @@ static int gt_fw_domain_init(struct xe_gt *gt)
 
 static int all_fw_domain_init(struct xe_gt *gt)
 {
+	unsigned int fw_ref;
 	int err, i;
 
-	err = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
-	if (err)
-		goto err_hw_fence_irq;
+	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL)) {
+		err = -ETIMEDOUT;
+		goto err_force_wake;
+	}
 
 	xe_gt_mcr_set_implicit_defaults(gt);
 	xe_reg_sr_apply_mmio(&gt->reg_sr, gt);
@@ -527,14 +531,12 @@ static int all_fw_domain_init(struct xe_gt *gt)
 	if (IS_SRIOV_PF(gt_to_xe(gt)))
 		xe_gt_sriov_pf_init_hw(gt);
 
-	err = xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
-	XE_WARN_ON(err);
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 
 	return 0;
 
 err_force_wake:
-	xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
-err_hw_fence_irq:
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i)
 		xe_hw_fence_irq_finish(&gt->fence_irq[i]);
 
@@ -547,11 +549,12 @@ static int all_fw_domain_init(struct xe_gt *gt)
  */
 int xe_gt_init_hwconfig(struct xe_gt *gt)
 {
+	unsigned int fw_ref;
 	int err;
 
-	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-	if (err)
-		goto out;
+	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+	if (!fw_ref)
+		return -ETIMEDOUT;
 
 	xe_gt_mcr_init_early(gt);
 	xe_pat_init(gt);
@@ -569,8 +572,7 @@ int xe_gt_init_hwconfig(struct xe_gt *gt)
 	xe_gt_enable_host_l2_vram(gt);
 
 out_fw:
-	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
-out:
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 	return err;
 }
 
@@ -765,6 +767,7 @@ static int do_gt_restart(struct xe_gt *gt)
 
 static int gt_reset(struct xe_gt *gt)
 {
+	unsigned int fw_ref;
 	int err;
 
 	if (xe_device_wedged(gt_to_xe(gt)))
@@ -785,9 +788,11 @@ static int gt_reset(struct xe_gt *gt)
 
 	xe_gt_sanitize(gt);
 
-	err = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
-	if (err)
-		goto err_msg;
+	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL)) {
+		err = -ETIMEDOUT;
+		goto err_out;
+	}
 
 	xe_uc_gucrc_disable(&gt->uc);
 	xe_uc_stop_prepare(&gt->uc);
@@ -805,8 +810,7 @@ static int gt_reset(struct xe_gt *gt)
 	if (err)
 		goto err_out;
 
-	err = xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
-	XE_WARN_ON(err);
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 	xe_pm_runtime_put(gt_to_xe(gt));
 
 	xe_gt_info(gt, "reset done\n");
@@ -814,8 +818,7 @@ static int gt_reset(struct xe_gt *gt)
 	return 0;
 
 err_out:
-	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
-err_msg:
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 	XE_WARN_ON(xe_uc_start(&gt->uc));
 err_fail:
 	xe_gt_err(gt, "reset failed (%pe)\n", ERR_PTR(err));
@@ -847,22 +850,25 @@ void xe_gt_reset_async(struct xe_gt *gt)
 
 void xe_gt_suspend_prepare(struct xe_gt *gt)
 {
-	XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL));
+	unsigned int fw_ref;
+
+	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 
 	xe_uc_stop_prepare(&gt->uc);
 
-	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 }
 
 int xe_gt_suspend(struct xe_gt *gt)
 {
+	unsigned int fw_ref;
 	int err;
 
 	xe_gt_dbg(gt, "suspending\n");
 	xe_gt_sanitize(gt);
 
-	err = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
-	if (err)
+	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))
 		goto err_msg;
 
 	err = xe_uc_suspend(&gt->uc);
@@ -873,14 +879,15 @@ int xe_gt_suspend(struct xe_gt *gt)
 
 	xe_gt_disable_host_l2_vram(gt);
 
-	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 	xe_gt_dbg(gt, "suspended\n");
 
 	return 0;
 
-err_force_wake:
-	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
 err_msg:
+	err = -ETIMEDOUT;
+err_force_wake:
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 	xe_gt_err(gt, "suspend failed (%pe)\n", ERR_PTR(err));
 
 	return err;
@@ -888,9 +895,11 @@ int xe_gt_suspend(struct xe_gt *gt)
 
 void xe_gt_shutdown(struct xe_gt *gt)
 {
-	xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	unsigned int fw_ref;
+
+	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	do_gt_reset(gt);
-	xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 }
 
 /**
@@ -915,11 +924,12 @@ int xe_gt_sanitize_freq(struct xe_gt *gt)
 
 int xe_gt_resume(struct xe_gt *gt)
 {
+	unsigned int fw_ref;
 	int err;
 
 	xe_gt_dbg(gt, "resuming\n");
-	err = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
-	if (err)
+	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))
 		goto err_msg;
 
 	err = do_gt_restart(gt);
@@ -928,14 +938,15 @@ int xe_gt_resume(struct xe_gt *gt)
 
 	xe_gt_idle_enable_pg(gt);
 
-	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 	xe_gt_dbg(gt, "resumed\n");
 
 	return 0;
 
-err_force_wake:
-	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
 err_msg:
+	err = -ETIMEDOUT;
+err_force_wake:
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 	xe_gt_err(gt, "resume failed (%pe)\n", ERR_PTR(err));
 
 	return err;
-- 
2.34.1

