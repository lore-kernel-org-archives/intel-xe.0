Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D82F1C64ED6
	for <intel-xe@archiver.kernel.org>; Tue, 28 Feb 2023 10:42:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B555110E03C;
	Tue, 28 Feb 2023 10:42:03 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0D8310E052
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Feb 2023 10:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677580921; x=1709116921;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QeT7U91B0Y/jB57UsHgnXB7mxDrM0YJnphYgK91/9nM=;
 b=Jdk+mtY4COA7dlzwU4XuGMV6eSeR7GwqOC+Z8L/KiUGZxFJqVc+vGRPO
 4MqnswHA40MT5rs4gdPoURyLsMqkWjshs0TNgQYLW5aqMVMne7OHa7Hk8
 mwLOwwdzby9h7NQnyCDcn6fNfTh6+AgSsvKP+MtuwZu6JdjwmMiHX4j2s
 OTRRiDgMvoNF3yh4QJJJlx6HYzFwqQgwdkJfk6CrhXFsVUyI1jWI2p3Kv
 VKtaA879QbL8ma/I+xgFOeF6xC6TaAfZ8B3KP+noYltPCWAO1+Tv7OkUs
 pSHlLhVtXxnsky9mQH27OJ5ABmJ3GxIjlrHf8PhChhbp82q6G0C/JxZ4e Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="398884685"
X-IronPort-AV: E=Sophos;i="5.98,221,1673942400"; d="scan'208";a="398884685"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2023 02:42:01 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="738108953"
X-IronPort-AV: E=Sophos;i="5.98,221,1673942400"; d="scan'208";a="738108953"
Received: from mistoan-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.9.93])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2023 02:42:00 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 28 Feb 2023 10:41:26 +0000
Message-Id: <20230228104137.80965-4-matthew.auld@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230228104137.80965-1-matthew.auld@intel.com>
References: <20230228104137.80965-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 03/14] drm/xe: prefer xe_bo_create_pin_map()
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

With small-bar we likely want to annotate all the kernel users that
require CPU access with vram. If xe_bo_create_pin_map() is the central
place for that then we should have a central place to annotate.

This also simplifies the code and fixes what appears to be a double
xe_bo_put(hwe->hwsp) in the error handling.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c | 23 +++-----------
 drivers/gpu/drm/xe/xe_lrc.c       | 53 +++++++++++--------------------
 drivers/gpu/drm/xe/xe_lrc_types.h |  1 -
 3 files changed, 22 insertions(+), 55 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index ae541b5e50f3..b035e2fa6744 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -310,24 +310,14 @@ static int hw_engine_init(struct xe_gt *gt, struct xe_hw_engine *hwe,
 	xe_reg_sr_apply_mmio(&hwe->reg_sr, gt);
 	xe_reg_sr_apply_whitelist(&hwe->reg_whitelist, hwe->mmio_base, gt);
 
-	hwe->hwsp = xe_bo_create_locked(xe, gt, NULL, SZ_4K, ttm_bo_type_kernel,
-					XE_BO_CREATE_VRAM_IF_DGFX(gt) |
-					XE_BO_CREATE_GGTT_BIT);
+	hwe->hwsp = xe_bo_create_pin_map(xe, gt, NULL, SZ_4K, ttm_bo_type_kernel,
+					 XE_BO_CREATE_VRAM_IF_DGFX(gt) |
+					 XE_BO_CREATE_GGTT_BIT);
 	if (IS_ERR(hwe->hwsp)) {
 		err = PTR_ERR(hwe->hwsp);
 		goto err_name;
 	}
 
-	err = xe_bo_pin(hwe->hwsp);
-	if (err)
-		goto err_unlock_put_hwsp;
-
-	err = xe_bo_vmap(hwe->hwsp);
-	if (err)
-		goto err_unpin_hwsp;
-
-	xe_bo_unlock_no_vm(hwe->hwsp);
-
 	err = xe_lrc_init(&hwe->kernel_lrc, hwe, NULL, NULL, SZ_16K);
 	if (err)
 		goto err_hwsp;
@@ -353,15 +343,10 @@ static int hw_engine_init(struct xe_gt *gt, struct xe_hw_engine *hwe,
 
 	return 0;
 
-err_unpin_hwsp:
-	xe_bo_unpin(hwe->hwsp);
-err_unlock_put_hwsp:
-	xe_bo_unlock_no_vm(hwe->hwsp);
-	xe_bo_put(hwe->hwsp);
 err_kernel_lrc:
 	xe_lrc_finish(&hwe->kernel_lrc);
 err_hwsp:
-	xe_bo_put(hwe->hwsp);
+	xe_bo_unpin_map_no_vm(hwe->hwsp);
 err_name:
 	hwe->name = NULL;
 
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index af4518a82db2..9140b057a5ba 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -615,7 +615,11 @@ int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 
 	lrc->flags = 0;
 
-	lrc->bo = xe_bo_create_locked(xe, hwe->gt, vm,
+	/*
+	 * FIXME: Perma-pinning LRC as we don't yet support moving GGTT address
+	 * via VM bind calls.
+	 */
+	lrc->bo = xe_bo_create_pin_map(xe, hwe->gt, vm,
 				      ring_size + xe_lrc_size(xe, hwe->class),
 				      ttm_bo_type_kernel,
 				      XE_BO_CREATE_VRAM_IF_DGFX(hwe->gt) |
@@ -628,21 +632,6 @@ int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 	else
 		lrc->full_gt = hwe->gt;
 
-	/*
-	 * FIXME: Perma-pinning LRC as we don't yet support moving GGTT address
-	 * via VM bind calls.
-	 */
-	err = xe_bo_pin(lrc->bo);
-	if (err)
-		goto err_unlock_put_bo;
-	lrc->flags |= XE_LRC_PINNED;
-
-	err = xe_bo_vmap(lrc->bo);
-	if (err)
-		goto err_unpin_bo;
-
-	xe_bo_unlock_vm_held(lrc->bo);
-
 	lrc->ring.size = ring_size;
 	lrc->ring.tail = 0;
 
@@ -652,8 +641,8 @@ int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 	if (!gt->default_lrc[hwe->class]) {
 		init_data = empty_lrc_data(hwe);
 		if (!init_data) {
-			xe_lrc_finish(lrc);
-			return -ENOMEM;
+			err = -ENOMEM;
+			goto err_lrc_finish;
 		}
 	}
 
@@ -710,12 +699,8 @@ int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 
 	return 0;
 
-err_unpin_bo:
-	if (lrc->flags & XE_LRC_PINNED)
-		xe_bo_unpin(lrc->bo);
-err_unlock_put_bo:
-	xe_bo_unlock_vm_held(lrc->bo);
-	xe_bo_put(lrc->bo);
+err_lrc_finish:
+	xe_lrc_finish(lrc);
 	return err;
 }
 
@@ -724,17 +709,15 @@ void xe_lrc_finish(struct xe_lrc *lrc)
 	struct ww_acquire_ctx ww;
 
 	xe_hw_fence_ctx_finish(&lrc->fence_ctx);
-	if (lrc->flags & XE_LRC_PINNED) {
-		if (lrc->bo->vm)
-			xe_vm_lock(lrc->bo->vm, &ww, 0, false);
-		else
-			xe_bo_lock_no_vm(lrc->bo, NULL);
-		xe_bo_unpin(lrc->bo);
-		if (lrc->bo->vm)
-			xe_vm_unlock(lrc->bo->vm, &ww);
-		else
-			xe_bo_unlock_no_vm(lrc->bo);
-	}
+	if (lrc->bo->vm)
+		xe_vm_lock(lrc->bo->vm, &ww, 0, false);
+	else
+		xe_bo_lock_no_vm(lrc->bo, NULL);
+	xe_bo_unpin(lrc->bo);
+	if (lrc->bo->vm)
+		xe_vm_unlock(lrc->bo->vm, &ww);
+	else
+		xe_bo_unlock_no_vm(lrc->bo);
 	xe_bo_put(lrc->bo);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_lrc_types.h b/drivers/gpu/drm/xe/xe_lrc_types.h
index 2827efa2091d..8fe08535873d 100644
--- a/drivers/gpu/drm/xe/xe_lrc_types.h
+++ b/drivers/gpu/drm/xe/xe_lrc_types.h
@@ -25,7 +25,6 @@ struct xe_lrc {
 
 	/** @flags: LRC flags */
 	u32 flags;
-#define XE_LRC_PINNED BIT(1)
 
 	/** @ring: submission ring state */
 	struct {
-- 
2.39.2

