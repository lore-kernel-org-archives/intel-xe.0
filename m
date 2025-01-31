Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 002EFC02192
	for <intel-xe@archiver.kernel.org>; Fri, 31 Jan 2025 22:32:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF81210E3CC;
	Fri, 31 Jan 2025 22:32:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hwr3nPnk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 946E110E257
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Jan 2025 22:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738362718; x=1769898718;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0HFlT73nikxUgjLysu/1ASChsg0EZzOPASMztJKYoAQ=;
 b=Hwr3nPnkwkgs0Kra7St39TVU6emB3QI9buuskuVsAFCXaiqKfDgIOSpy
 6vRrye+BaZqprq0LcLSlBmUYLYq3YRiZGxtV08T4UrJzzV23GmCQnev6T
 xOB/9pAyq90r4rvwic7jC5bQYgwH1lhCteSw19McNE/Hdvi0Y0UwKQq4x
 AVybAnyHjrEjKDu86y5LCm4uCRWczbzn1MzjDVBtt66D70tNGaN1FyA7h
 pVlnI1pHKOIZaiHGs1Cy2OBvkgQtFt16RQC0SqS2MTY24Ld5J5PpBnbPe
 gM46Vc6H844Scc2f2z20NPySpeEIn4iIOOuekBoHzIr87qIEKtinChAMI g==;
X-CSE-ConnectionGUID: 2jc6tUzIQ6mfKkmo5Pht1A==
X-CSE-MsgGUID: wdQgedNMQkmjeF3ZlTzWQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11332"; a="38149068"
X-IronPort-AV: E=Sophos;i="6.13,249,1732608000"; d="scan'208";a="38149068"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2025 14:31:56 -0800
X-CSE-ConnectionGUID: 1F7iI+nQQei77ohYgwss9A==
X-CSE-MsgGUID: ytvayJyvTzus+ZR2rhPa6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="110622322"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2025 14:31:56 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Maarten Lankhorst <dev@lankhorst.se>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 5/7] drm/xe: Cleanup unwind of gt initialization
Date: Fri, 31 Jan 2025 14:31:38 -0800
Message-ID: <20250131223140.4144292-6-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250131223140.4144292-1-lucas.demarchi@intel.com>
References: <20250131223140.4144292-1-lucas.demarchi@intel.com>
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

Move the xe_gt_remove() to be handled by xe_gt.c itself so the caller,
xe_device_probe() doesn't have to unwind the gt loop. It's also more in
line with the xe_device_probe() style.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 21 ++-----------------
 drivers/gpu/drm/xe/xe_gt.c     | 37 ++++++++++++++++------------------
 drivers/gpu/drm/xe/xe_gt.h     |  1 -
 3 files changed, 19 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index e519f435b1606..bea626f6b4cbf 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -743,7 +743,6 @@ int xe_device_probe(struct xe_device *xe)
 	struct xe_tile *tile;
 	struct xe_gt *gt;
 	int err;
-	u8 last_gt;
 	u8 id;
 
 	xe_pat_init_early(xe);
@@ -851,18 +850,16 @@ int xe_device_probe(struct xe_device *xe)
 		return err;
 
 	for_each_gt(gt, xe, id) {
-		last_gt = id;
-
 		err = xe_gt_init(gt);
 		if (err)
-			goto err_fini_gt;
+			return err;
 	}
 
 	xe_heci_gsc_init(xe);
 
 	err = xe_oa_init(xe);
 	if (err)
-		goto err_fini_gt;
+		return err;
 
 	err = xe_display_init(xe);
 	if (err)
@@ -895,14 +892,6 @@ int xe_device_probe(struct xe_device *xe)
 err_fini_oa:
 	xe_oa_fini(xe);
 
-err_fini_gt:
-	for_each_gt(gt, xe, id) {
-		if (id < last_gt)
-			xe_gt_remove(gt);
-		else
-			break;
-	}
-
 	return err;
 }
 
@@ -916,9 +905,6 @@ static void xe_device_remove_display(struct xe_device *xe)
 
 void xe_device_remove(struct xe_device *xe)
 {
-	struct xe_gt *gt;
-	u8 id;
-
 	xe_oa_unregister(xe);
 
 	xe_device_remove_display(xe);
@@ -926,9 +912,6 @@ void xe_device_remove(struct xe_device *xe)
 	xe_oa_fini(xe);
 
 	xe_heci_gsc_fini(xe);
-
-	for_each_gt(gt, xe, id)
-		xe_gt_remove(gt);
 }
 
 void xe_device_shutdown(struct xe_device *xe)
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 01a4a852b8f43..48f6fd8c14b65 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -140,26 +140,6 @@ static void xe_gt_disable_host_l2_vram(struct xe_gt *gt)
 	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 }
 
-/**
- * xe_gt_remove() - Clean up the GT structures before driver removal
- * @gt: the GT object
- *
- * This function should only act on objects/structures that must be cleaned
- * before the driver removal callback is complete and therefore can't be
- * deferred to a drmm action.
- */
-void xe_gt_remove(struct xe_gt *gt)
-{
-	int i;
-
-	xe_uc_remove(&gt->uc);
-
-	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i)
-		xe_hw_fence_irq_finish(&gt->fence_irq[i]);
-
-	xe_gt_disable_host_l2_vram(gt);
-}
-
 static void gt_reset_worker(struct work_struct *w);
 
 static int emit_nop_job(struct xe_gt *gt, struct xe_exec_queue *q)
@@ -582,6 +562,19 @@ int xe_gt_init_hwconfig(struct xe_gt *gt)
 	return err;
 }
 
+static void xe_gt_remove(void *arg)
+{
+	struct xe_gt *gt = arg;
+	int i;
+
+	xe_uc_remove(&gt->uc);
+
+	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i)
+		xe_hw_fence_irq_finish(&gt->fence_irq[i]);
+
+	xe_gt_disable_host_l2_vram(gt);
+}
+
 int xe_gt_init(struct xe_gt *gt)
 {
 	int err;
@@ -594,6 +587,10 @@ int xe_gt_init(struct xe_gt *gt)
 		xe_hw_fence_irq_init(&gt->fence_irq[i]);
 	}
 
+	err = devm_add_action_or_reset(gt_to_xe(gt)->drm.dev, xe_gt_remove, gt);
+	if (err)
+		return err;
+
 	err = xe_gt_pagefault_init(gt);
 	if (err)
 		return err;
diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
index e504cc33ade4f..187fa6490eafc 100644
--- a/drivers/gpu/drm/xe/xe_gt.h
+++ b/drivers/gpu/drm/xe/xe_gt.h
@@ -54,7 +54,6 @@ int xe_gt_resume(struct xe_gt *gt);
 void xe_gt_reset_async(struct xe_gt *gt);
 void xe_gt_sanitize(struct xe_gt *gt);
 int xe_gt_sanitize_freq(struct xe_gt *gt);
-void xe_gt_remove(struct xe_gt *gt);
 
 /**
  * xe_gt_wait_for_reset - wait for gt's async reset to finalize.
-- 
2.48.0

