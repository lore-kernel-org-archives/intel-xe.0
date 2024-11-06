Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DA62D3E783
	for <intel-xe@archiver.kernel.org>; Wed,  6 Nov 2024 02:24:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E66110E657;
	Wed,  6 Nov 2024 02:24:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RWAyVMTK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1179310E657
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Nov 2024 02:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730859890; x=1762395890;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SMn+NUD88JmOYTCitAVklGa7fptCy5rtwc43DqLKXd0=;
 b=RWAyVMTKauox8d0ASZOVSUHMiI1XgECTxMCwberYHDY8o09qC3vmOutF
 IV9onSvn54d7EYoSrTJVHhLpSSWyvjaUGgWk62Hcwm9/gsKZPYTh7mO1O
 A1/m1j2sYnwzzb1RHplYcCLOb6ut9+wXRWWSWW1EOfnfsAmwlLl2Ymmv/
 9Mdd5xEe2Hc66qpl62oe6mLuxIPQIbONpVdJpZouF7RM4hUzEFMQSx0da
 Sv/0lAFp6WwSmhohRJFR+gJTYnZ1sb6OyQuv+H9CggzXElVBofmr08tcT
 oreE0N8OnJPj9AT2RUW9UmRRSmNHxDVR6ASEFPIo8fNlzoNE+ZjREiNg4 A==;
X-CSE-ConnectionGUID: Q86gZXfuTLWRRzJPuYE49w==
X-CSE-MsgGUID: 4h0CfRv5SDaiC2n2CKhykQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="56037909"
X-IronPort-AV: E=Sophos;i="6.11,261,1725346800"; d="scan'208";a="56037909"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2024 18:24:50 -0800
X-CSE-ConnectionGUID: Q7iCKuV0Rm2NIVB5Kx0E1w==
X-CSE-MsgGUID: 8DiH+bSyT+moS7qsWFUxww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,261,1725346800"; d="scan'208";a="84405189"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2024 18:24:49 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: lucas.demarchi@intel.com,
	matthew.auld@intel.com
Subject: [PATCH v2 2/2] drm/xe: Clear GGTT in xe_bo_restore_kernel
Date: Tue,  5 Nov 2024 18:25:19 -0800
Message-Id: <20241106022519.4165224-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241106022519.4165224-1-matthew.brost@intel.com>
References: <20241106022519.4165224-1-matthew.brost@intel.com>
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

Part of what xe_bo_restore_kernel does, is restore BO's GGTT mappings
which may have been lost during a power state change. Missing is
restoring the GGTT entries without BO mappings to a known state (e.g.,
scratch pages). Update xe_bo_restore_kernel to clear the entire GGTT
before restoring BO's GGTT mappings.

v2:
 - Include missing local change of tile and id variable (CI

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Cc: <stable@vger.kernel.org> # v6.8+
---
 drivers/gpu/drm/xe/xe_bo_evict.c |  8 +++++++-
 drivers/gpu/drm/xe/xe_ggtt.c     | 17 ++++++++++++++---
 drivers/gpu/drm/xe/xe_ggtt.h     |  2 ++
 3 files changed, 23 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo_evict.c b/drivers/gpu/drm/xe/xe_bo_evict.c
index b01bc20eb90b..26c7736cc3a8 100644
--- a/drivers/gpu/drm/xe/xe_bo_evict.c
+++ b/drivers/gpu/drm/xe/xe_bo_evict.c
@@ -112,7 +112,8 @@ int xe_bo_evict_all(struct xe_device *xe)
  * @xe: xe device
  *
  * Move kernel BOs from temporary (typically system) memory to VRAM via CPU. All
- * moves done via TTM calls.
+ * moves done via TTM calls. All GGTT are restored too, first by clearing GGTT
+ * to known state and then restoring individual BO's GGTT mappings.
  *
  * This function should be called early, before trying to init the GT, on device
  * resume.
@@ -120,8 +121,13 @@ int xe_bo_evict_all(struct xe_device *xe)
 int xe_bo_restore_kernel(struct xe_device *xe)
 {
 	struct xe_bo *bo;
+	struct xe_tile *tile;
+	u8 id;
 	int ret;
 
+	for_each_tile(tile, xe, id)
+		xe_ggtt_clear(tile->mem.ggtt);
+
 	spin_lock(&xe->pinned.lock);
 	for (;;) {
 		bo = list_first_entry_or_null(&xe->pinned.evicted,
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 558fac8bb6fb..1ee57f06f0e8 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -140,7 +140,7 @@ static void xe_ggtt_set_pte_and_flush(struct xe_ggtt *ggtt, u64 addr, u64 pte)
 	ggtt_update_access_counter(ggtt);
 }
 
-static void xe_ggtt_clear(struct xe_ggtt *ggtt, u64 start, u64 size)
+static void __xe_ggtt_clear(struct xe_ggtt *ggtt, u64 start, u64 size)
 {
 	u16 pat_index = tile_to_xe(ggtt->tile)->pat.idx[XE_CACHE_WB];
 	u64 end = start + size - 1;
@@ -160,6 +160,17 @@ static void xe_ggtt_clear(struct xe_ggtt *ggtt, u64 start, u64 size)
 	}
 }
 
+/**
+ * xe_ggtt_cleared - GGTT clear
+ * @ggtt: the &xe_ggtt to be cleared
+ *
+ * Clear all GGTT to a known state
+ */
+void xe_ggtt_clear(struct xe_ggtt *ggtt)
+{
+	__xe_ggtt_clear(ggtt, 0, ggtt->size);
+}
+
 static void ggtt_fini_early(struct drm_device *drm, void *arg)
 {
 	struct xe_ggtt *ggtt = arg;
@@ -277,7 +288,7 @@ static void xe_ggtt_initial_clear(struct xe_ggtt *ggtt)
 	/* Display may have allocated inside ggtt, so be careful with clearing here */
 	mutex_lock(&ggtt->lock);
 	drm_mm_for_each_hole(hole, &ggtt->mm, start, end)
-		xe_ggtt_clear(ggtt, start, end - start);
+		__xe_ggtt_clear(ggtt, start, end - start);
 
 	xe_ggtt_invalidate(ggtt);
 	mutex_unlock(&ggtt->lock);
@@ -294,7 +305,7 @@ static void ggtt_node_remove(struct xe_ggtt_node *node)
 
 	mutex_lock(&ggtt->lock);
 	if (bound)
-		xe_ggtt_clear(ggtt, node->base.start, node->base.size);
+		__xe_ggtt_clear(ggtt, node->base.start, node->base.size);
 	drm_mm_remove_node(&node->base);
 	node->base.size = 0;
 	mutex_unlock(&ggtt->lock);
diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
index 27e7d67de004..b7ae440cdebf 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.h
+++ b/drivers/gpu/drm/xe/xe_ggtt.h
@@ -13,6 +13,8 @@ struct drm_printer;
 int xe_ggtt_init_early(struct xe_ggtt *ggtt);
 int xe_ggtt_init(struct xe_ggtt *ggtt);
 
+void xe_ggtt_clear(struct xe_ggtt *ggtt);
+
 struct xe_ggtt_node *xe_ggtt_node_init(struct xe_ggtt *ggtt);
 void xe_ggtt_node_fini(struct xe_ggtt_node *node);
 int xe_ggtt_node_insert_balloon(struct xe_ggtt_node *node,
-- 
2.34.1

