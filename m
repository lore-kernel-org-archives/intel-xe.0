Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7EB0C0015E
	for <intel-xe@archiver.kernel.org>; Fri, 21 Jul 2023 17:56:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84C1D10E6C8;
	Fri, 21 Jul 2023 17:56:04 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AFDD10E6C8
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Jul 2023 17:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689962163; x=1721498163;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OtmrDi6dbwHLj5OSK25DXnUGMYVGduEbEFE3SlUB8MI=;
 b=SBsoDB4TrILM9MqYuB52IAlNWeOnA1wdDv/7Eh36bbhSeSYmTFrjEhKi
 ghAVIv2RL45TUF8pDGxr1Q1zL6KCdThDLqIMK7OgTJIyypaXcFJeTZWe/
 oymmI+dA5eQvfjmOeP16MovbEqyteCl5cs0Pf5R5rHWCrhCImxtyuOurP
 BLdsF9nzK97CdwZeyC0R1FTC/3Xh0SqBHtmlvQuAaV+qmDeO4eRZdaQBu
 pN1FjRAkx8RP4/YvjENVsEZEtFIqyyHJWeKSiia772fWZoO0wOOicCivS
 12MHSBAhbQuC9wWv+R4wnYiqFbgGCtP1vgtuiSNObXrX1htD/cjnft/CL g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="430873439"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; d="scan'208";a="430873439"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 10:56:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="760037587"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; d="scan'208";a="760037587"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.147])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 10:56:02 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 21 Jul 2023 10:55:58 -0700
Message-ID: <20230721175557.1513250-3-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/2] drm/xe/mtl: Map PPGTT as CPU:WC
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On MTL and beyond, the GPU performs non-coherent accesses to the PPGTT
page tables.  These page tables should be mapped as CPU:WC.

Removes CAT errors triggered by xe_exec_basic@once-basic on MTL:

   xe 0000:00:02.0: [drm:__xe_pt_bind_vma [xe]] Preparing bind, with range [1a0000...1a0fff) engine 0000000000000000.
   xe 0000:00:02.0: [drm:xe_vm_dbg_print_entries [xe]] 1 entries to update
   xe 0000:00:02.0: [drm:xe_vm_dbg_print_entries [xe]]  0: Update level 3 at (0 + 1) [0...8000000000) f:0
   xe 0000:00:02.0: [drm] Engine memory cat error: guc_id=2
   xe 0000:00:02.0: [drm] Engine memory cat error: guc_id=2
   xe 0000:00:02.0: [drm] Timedout job: seqno=4294967169, guc_id=2, flags=0x4

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 17 +++++++++++++----
 drivers/gpu/drm/xe/xe_bo.h |  1 +
 drivers/gpu/drm/xe/xe_pt.c |  3 ++-
 3 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 828a9fea420b..d04538e65f11 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -301,6 +301,7 @@ static struct ttm_tt *xe_ttm_tt_create(struct ttm_buffer_object *ttm_bo,
 	struct xe_device *xe = xe_bo_device(bo);
 	struct xe_ttm_tt *tt;
 	unsigned long extra_pages;
+	enum ttm_caching caching = ttm_cached;
 	int err;
 
 	tt = kzalloc(sizeof(*tt), GFP_KERNEL);
@@ -314,10 +315,18 @@ static struct ttm_tt *xe_ttm_tt_create(struct ttm_buffer_object *ttm_bo,
 		extra_pages = DIV_ROUND_UP(xe_device_ccs_bytes(xe, bo->size),
 					   PAGE_SIZE);
 
-	/* TODO: Select caching mode */
-	err = ttm_tt_init(&tt->ttm, &bo->ttm, page_flags,
-			  bo->flags & XE_BO_SCANOUT_BIT ? ttm_write_combined : ttm_cached,
-			  extra_pages);
+	/*
+	 * Display scanout is always non-coherent with the CPU cache.
+	 *
+	 * For Xe_LPG and beyond, PPGTT PTE lookups are also non-coherent and
+	 * require a CPU:WC mapping.
+	 *
+	 */
+	if (bo->flags & XE_BO_SCANOUT_BIT ||
+	    (xe->info.graphics_verx100 >= 1270 && bo->flags & XE_BO_PPGTT_BIT))
+		caching = ttm_write_combined;
+
+	err = ttm_tt_init(&tt->ttm, &bo->ttm, page_flags, caching, extra_pages);
 	if (err) {
 		kfree(tt);
 		return NULL;
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 72c68facd481..fd103b64f446 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -31,6 +31,7 @@
 #define XE_BO_DEFER_BACKING		BIT(9)
 #define XE_BO_SCANOUT_BIT		BIT(10)
 #define XE_BO_FIXED_PLACEMENT_BIT	BIT(11)
+#define XE_BO_PPGTT_BIT			BIT(12)
 /* this one is trigger internally only */
 #define XE_BO_INTERNAL_TEST		BIT(30)
 #define XE_BO_INTERNAL_64K		BIT(31)
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index a458224a88ca..fe91b10f951e 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -221,7 +221,8 @@ struct xe_pt *xe_pt_create(struct xe_vm *vm, struct xe_tile *tile,
 				  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
 				  XE_BO_CREATE_IGNORE_MIN_PAGE_SIZE_BIT |
 				  XE_BO_CREATE_PINNED_BIT |
-				  XE_BO_CREATE_NO_RESV_EVICT);
+				  XE_BO_CREATE_NO_RESV_EVICT |
+				  XE_BO_PPGTT_BIT);
 	if (IS_ERR(bo)) {
 		err = PTR_ERR(bo);
 		goto err_kfree;
-- 
2.41.0

