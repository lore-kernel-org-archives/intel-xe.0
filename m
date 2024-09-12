Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98F94EED63A
	for <intel-xe@archiver.kernel.org>; Thu, 12 Sep 2024 18:58:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A59010EC21;
	Thu, 12 Sep 2024 18:58:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E/KBQZE8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DF9610EC1D
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Sep 2024 18:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726167495; x=1757703495;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=M2zOHLP6pWJSvSRZ7X5FCjXk/nTS5OV/1eS/IiG9OcQ=;
 b=E/KBQZE8DM1Dq6ZThpuXRMEf862yb8FTCokqgkbgQHNF3K3MyhmaEPKr
 LVef2KBF71JCFFFzzIwCLHS9CMQg1eADAI2d5hK/2t5/xel3YmyK5+4Vo
 0j6NzE0oCSgbTZOAftWCTjrdvZ+cu8cszpV5WdKJQbpxyyaKUFr2sipTF
 svGxzeYvJIOGBDTiBVnGWpsVVVboYWtb4f3HiBNiSvJr7nPk4jwR6g5KQ
 GrgTledqyOC9Fd6hwilV6vELNL0wAAFUys1ztZH/CQ/tWVyXKTG9G+MWm
 YJXScayLOMHuHT5sdxLVC8taX4rmMWNlpw3JPvZKARqfJ9z2s0SFuE3uT A==;
X-CSE-ConnectionGUID: LL7Vx2caTFy2shCWaHqQAw==
X-CSE-MsgGUID: 5VMazh0rRhSZNh3ImFJKmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="25202935"
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; d="scan'208";a="25202935"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 11:58:12 -0700
X-CSE-ConnectionGUID: JVz0gbvOT/u4fMU9LnZ8Cw==
X-CSE-MsgGUID: xSUum2VNS7W4oTSx7/8qUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; d="scan'208";a="71910125"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmviesa003.fm.intel.com with ESMTP; 12 Sep 2024 11:58:10 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v2 06/23] drm/xe/gt: Update handling of xe_force_wake_get
 return
Date: Fri, 13 Sep 2024 00:45:46 +0530
Message-Id: <20240912191603.194964-7-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240912191603.194964-1-himal.prasad.ghimiray@intel.com>
References: <20240912191603.194964-1-himal.prasad.ghimiray@intel.com>
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

With xe_force_wake_get() now returning the refcount-incremented domain
mask, a return value of 0 indicates failure for single domains
(excluding XE_FORCEWAKE_ALL).

A non-zero return value in the case of XE_FORCEWAKE_ALL does not
necessarily indicate success. Compare the return value with
XE_FORCEWAKE_ALL to determine the status of the call.

Modify the return handling of xe_force_wake_get() accordingly and pass
the return value to xe_force_wake_put().

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c | 109 ++++++++++++++++++++-----------------
 1 file changed, 60 insertions(+), 49 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 935d1dfd9459..b0126daee359 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -100,13 +100,13 @@ void xe_gt_sanitize(struct xe_gt *gt)
 static void xe_gt_enable_host_l2_vram(struct xe_gt *gt)
 {
 	u32 reg;
-	int err;
+	int fw_ref;
 
 	if (!XE_WA(gt, 16023588340))
 		return;
 
-	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-	if (WARN_ON(err))
+	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+	if (WARN_ON(!fw_ref))
 		return;
 
 	if (!xe_gt_is_media_type(gt)) {
@@ -117,13 +117,13 @@ static void xe_gt_enable_host_l2_vram(struct xe_gt *gt)
 	}
 
 	xe_gt_mcr_multicast_write(gt, XEHPC_L3CLOS_MASK(3), 0x3);
-	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 }
 
 static void xe_gt_disable_host_l2_vram(struct xe_gt *gt)
 {
+	int fw_ref;
 	u32 reg;
-	int err;
 
 	if (!XE_WA(gt, 16023588340))
 		return;
@@ -131,15 +131,15 @@ static void xe_gt_disable_host_l2_vram(struct xe_gt *gt)
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
@@ -405,11 +405,13 @@ static void dump_pat_on_error(struct xe_gt *gt)
 
 static int gt_fw_domain_init(struct xe_gt *gt)
 {
-	int err, i;
+	int fw_ref, err, i;
 
-	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-	if (err)
+	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+	if (!fw_ref) {
+		err = -ETIMEDOUT;
 		goto err_hw_fence_irq;
+	}
 
 	if (!xe_gt_is_media_type(gt)) {
 		err = xe_ggtt_init(gt_to_tile(gt)->mem.ggtt);
@@ -444,14 +446,14 @@ static int gt_fw_domain_init(struct xe_gt *gt)
 	 */
 	gt->info.gmdid = xe_mmio_read32(&gt->mmio, GMD_ID);
 
-	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
+	err = xe_force_wake_put(gt_to_fw(gt), fw_ref);
 	XE_WARN_ON(err);
 
 	return 0;
 
 err_force_wake:
 	dump_pat_on_error(gt);
-	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 err_hw_fence_irq:
 	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i)
 		xe_hw_fence_irq_finish(&gt->fence_irq[i]);
@@ -461,11 +463,13 @@ static int gt_fw_domain_init(struct xe_gt *gt)
 
 static int all_fw_domain_init(struct xe_gt *gt)
 {
-	int err, i;
+	int fw_ref, err, i;
 
-	err = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
-	if (err)
-		goto err_hw_fence_irq;
+	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	if (fw_ref != XE_FORCEWAKE_ALL) {
+		err = -ETIMEDOUT;
+		goto err_force_wake;
+	}
 
 	xe_gt_mcr_set_implicit_defaults(gt);
 	xe_reg_sr_apply_mmio(&gt->reg_sr, gt);
@@ -529,14 +533,13 @@ static int all_fw_domain_init(struct xe_gt *gt)
 	if (IS_SRIOV_PF(gt_to_xe(gt)))
 		xe_gt_sriov_pf_init_hw(gt);
 
-	err = xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	err = xe_force_wake_put(gt_to_fw(gt), fw_ref);
 	XE_WARN_ON(err);
 
 	return 0;
 
 err_force_wake:
-	xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
-err_hw_fence_irq:
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i)
 		xe_hw_fence_irq_finish(&gt->fence_irq[i]);
 
@@ -549,11 +552,11 @@ static int all_fw_domain_init(struct xe_gt *gt)
  */
 int xe_gt_init_hwconfig(struct xe_gt *gt)
 {
-	int err;
+	int fw_ref, err;
 
-	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-	if (err)
-		goto out;
+	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+	if (!fw_ref)
+		return -ETIMEDOUT;
 
 	xe_gt_mcr_init_early(gt);
 	xe_pat_init(gt);
@@ -571,8 +574,7 @@ int xe_gt_init_hwconfig(struct xe_gt *gt)
 	xe_gt_enable_host_l2_vram(gt);
 
 out_fw:
-	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
-out:
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 	return err;
 }
 
@@ -743,7 +745,7 @@ static int do_gt_restart(struct xe_gt *gt)
 
 static int gt_reset(struct xe_gt *gt)
 {
-	int err;
+	int fw_ref, err;
 
 	if (xe_device_wedged(gt_to_xe(gt)))
 		return -ECANCELED;
@@ -763,9 +765,11 @@ static int gt_reset(struct xe_gt *gt)
 
 	xe_gt_sanitize(gt);
 
-	err = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
-	if (err)
-		goto err_msg;
+	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	if (fw_ref != XE_FORCEWAKE_ALL) {
+		err = -ETIMEDOUT;
+		goto err_out;
+	}
 
 	xe_uc_gucrc_disable(&gt->uc);
 	xe_uc_stop_prepare(&gt->uc);
@@ -783,7 +787,7 @@ static int gt_reset(struct xe_gt *gt)
 	if (err)
 		goto err_out;
 
-	err = xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	err = xe_force_wake_put(gt_to_fw(gt), fw_ref);
 	XE_WARN_ON(err);
 	xe_pm_runtime_put(gt_to_xe(gt));
 
@@ -792,8 +796,7 @@ static int gt_reset(struct xe_gt *gt)
 	return 0;
 
 err_out:
-	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
-err_msg:
+	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
 	XE_WARN_ON(xe_uc_start(&gt->uc));
 err_fail:
 	xe_gt_err(gt, "reset failed (%pe)\n", ERR_PTR(err));
@@ -825,22 +828,25 @@ void xe_gt_reset_async(struct xe_gt *gt)
 
 void xe_gt_suspend_prepare(struct xe_gt *gt)
 {
-	XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL));
+	int fw_ref;
+
+	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	XE_WARN_ON(fw_ref != XE_FORCEWAKE_ALL);
 
 	xe_uc_stop_prepare(&gt->uc);
 
-	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
+	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
 }
 
 int xe_gt_suspend(struct xe_gt *gt)
 {
-	int err;
+	int fw_ref, err;
 
 	xe_gt_dbg(gt, "suspending\n");
 	xe_gt_sanitize(gt);
 
-	err = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
-	if (err)
+	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	if (fw_ref != XE_FORCEWAKE_ALL)
 		goto err_msg;
 
 	err = xe_uc_suspend(&gt->uc);
@@ -851,14 +857,15 @@ int xe_gt_suspend(struct xe_gt *gt)
 
 	xe_gt_disable_host_l2_vram(gt);
 
-	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
+	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
 	xe_gt_dbg(gt, "suspended\n");
 
 	return 0;
 
-err_force_wake:
-	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
 err_msg:
+	err = -ETIMEDOUT;
+err_force_wake:
+	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
 	xe_gt_err(gt, "suspend failed (%pe)\n", ERR_PTR(err));
 
 	return err;
@@ -866,9 +873,12 @@ int xe_gt_suspend(struct xe_gt *gt)
 
 void xe_gt_shutdown(struct xe_gt *gt)
 {
-	xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	int fw_ref;
+
+	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	XE_WARN_ON(fw_ref != XE_FORCEWAKE_ALL);
 	do_gt_reset(gt);
-	xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 }
 
 /**
@@ -891,11 +901,11 @@ int xe_gt_sanitize_freq(struct xe_gt *gt)
 
 int xe_gt_resume(struct xe_gt *gt)
 {
-	int err;
+	int fw_ref, err;
 
 	xe_gt_dbg(gt, "resuming\n");
-	err = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
-	if (err)
+	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	if (fw_ref != XE_FORCEWAKE_ALL)
 		goto err_msg;
 
 	err = do_gt_restart(gt);
@@ -904,14 +914,15 @@ int xe_gt_resume(struct xe_gt *gt)
 
 	xe_gt_idle_enable_pg(gt);
 
-	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
+	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
 	xe_gt_dbg(gt, "resumed\n");
 
 	return 0;
 
-err_force_wake:
-	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
 err_msg:
+	err = -ETIMEDOUT;
+err_force_wake:
+	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
 	xe_gt_err(gt, "resume failed (%pe)\n", ERR_PTR(err));
 
 	return err;
-- 
2.34.1

