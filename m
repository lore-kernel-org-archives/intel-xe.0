Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39568C636D7
	for <intel-xe@archiver.kernel.org>; Wed, 22 Feb 2023 01:23:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D728210E1A2;
	Wed, 22 Feb 2023 01:23:48 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E6FC10E1A2
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Feb 2023 01:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677029027; x=1708565027;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=t/sx19jZQ2NSvq1WjCqtvJu/6JQ4gInA9sxtcWaWgOQ=;
 b=PgSYqoewO26uBzDIJ2m5ORL9vwZKx1tuU50S8ECdD7mjz7viVvia1YV8
 QQTDs+K1VWMTb03HPuxogBAHZ5nboCd84E5EFZ4chvBi5qx2tkAy6knkW
 o625Ulg/t/50An7XhxqOqWCui6+PPzs2WKa9Z5V9LAIWJJtSETL0KSsO0
 XFTNDwZIfi2TYz/foLmpEGYwzcoVF6AHwbH0UucWGU30t4izYCq/9Myvk
 THAmXWVzwmKmTn5bide3JNyHKS8mu5LxG3wrvMTdQshaVl4vjDEaDZd8j
 rVKau5GnBZaoAh/8VXhoH7X8VUm3DbxI3geBsUVC/v8WPrSP5/YCbKln4 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="360283888"
X-IronPort-AV: E=Sophos;i="5.97,317,1669104000"; d="scan'208";a="360283888"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2023 17:23:46 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="702229515"
X-IronPort-AV: E=Sophos;i="5.97,317,1669104000"; d="scan'208";a="702229515"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2023 17:23:46 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 21 Feb 2023 17:23:40 -0800
Message-Id: <20230222012340.7099-1-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe/migrate: Some cleanups and fixes
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
Cc: thomas.hellstrom@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Some minor fixes and cleanups in migration code.

1) Remove unused 'struct xe_bo *bo' from emit_pte()
2) Use 'false' for is_vram of  emit_pte() where it is obvious
3) Pass source bo as 'bo' in xe_migrate_copy() calls
4) Kernel-doc fix for function xe_migrate_clear()
5) In write_pgtable(), consider 'ofs' while calculating chunk size
6) Update xe_migrate_doc.h with 32 page table structs (not 48)

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_migrate.c |  4 ++--
 drivers/gpu/drm/xe/xe_migrate.c       | 17 +++++++----------
 drivers/gpu/drm/xe/xe_migrate_doc.h   |  2 +-
 3 files changed, 10 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
index 03a60d5b42f1..12e8f79e65cb 100644
--- a/drivers/gpu/drm/xe/tests/xe_migrate.c
+++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
@@ -148,7 +148,7 @@ static void test_copy(struct xe_migrate *m, struct xe_bo *bo,
 	xe_map_memset(xe, &sysmem->vmap, 0, 0xd0, sysmem->size);
 	xe_map_memset(xe, &bo->vmap, 0, 0xc0, bo->size);
 
-	fence = xe_migrate_copy(m, sysmem, bo->ttm.resource,
+	fence = xe_migrate_copy(m, bo, bo->ttm.resource,
 				sysmem->ttm.resource);
 	if (!sanity_fence_failed(xe, fence, big ? "Copying big bo vram -> sysmem" :
 				 "Copying small bo vram -> sysmem", test)) {
@@ -274,7 +274,7 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
 		expected |= GEN12_PTE_PS64;
 	xe_res_first(pt->ttm.resource, 0, pt->size, &src_it);
 	emit_pte(m, bb, NUM_KERNEL_PDE - 1, xe_bo_is_vram(pt),
-		 &src_it, GEN8_PAGE_SIZE, pt);
+		 &src_it, GEN8_PAGE_SIZE);
 	run_sanity_job(m, xe, bb, bb->len, "Writing PTE for our fake PT", test);
 
 	retval = xe_map_rd(xe, &bo->vmap, GEN8_PAGE_SIZE * (NUM_KERNEL_PDE - 1),
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index cbcc355cd391..cf6ad1b1ccd5 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -423,7 +423,7 @@ static void emit_pte(struct xe_migrate *m,
 		     struct xe_bb *bb, u32 at_pt,
 		     bool is_vram,
 		     struct xe_res_cursor *cur,
-		     u32 size, struct xe_bo *bo)
+		     u32 size)
 {
 	u32 ptes;
 	u64 ofs = at_pt * GEN8_PAGE_SIZE;
@@ -672,19 +672,17 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 			emit_arb_clear(bb);
 
 		if (!src_is_vram)
-			emit_pte(m, bb, src_L0_pt, src_is_vram, &src_it, src_L0,
-				 bo);
+			emit_pte(m, bb, src_L0_pt, false, &src_it, src_L0);
 		else
 			xe_res_next(&src_it, src_L0);
 
 		if (!dst_is_vram)
-			emit_pte(m, bb, dst_L0_pt, dst_is_vram, &dst_it, src_L0,
-				 bo);
+			emit_pte(m, bb, dst_L0_pt, false, &dst_it, src_L0);
 		else
 			xe_res_next(&dst_it, src_L0);
 
 		if (copy_system_ccs)
-			emit_pte(m, bb, ccs_pt, false, &ccs_it, ccs_size, bo);
+			emit_pte(m, bb, ccs_pt, false, &ccs_it, ccs_size);
 
 		bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
 		update_idx = bb->len;
@@ -783,7 +781,7 @@ static int emit_clear(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
 }
 
 /**
- * xe_migrate_clear() - Copy content of TTM resources.
+ * xe_migrate_clear() - Clear content of TTM resources.
  * @m: The migration context.
  * @bo: The buffer object @dst is currently bound to.
  * @dst: The dst TTM resource to be cleared.
@@ -856,8 +854,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 		/* Preemption is enabled again by the ring ops. */
 		if (!clear_vram) {
 			emit_arb_clear(bb);
-			emit_pte(m, bb, clear_L0_pt, clear_vram, &src_it, clear_L0,
-				 bo);
+			emit_pte(m, bb, clear_L0_pt, false, &src_it, clear_L0);
 		} else {
 			xe_res_next(&src_it, clear_L0);
 		}
@@ -941,7 +938,7 @@ static void write_pgtable(struct xe_gt *gt, struct xe_bb *bb, u64 ppgtt_ofs,
 
 	do {
 		u64 addr = ppgtt_ofs + ofs * 8;
-		chunk = min(update->qwords, 0x1ffU);
+		chunk = min(update->qwords, 0x1ffU - (ofs & 0x1ff));
 
 		/* Ensure populatefn can do memset64 by aligning bb->cs */
 		if (!(bb->len & 1))
diff --git a/drivers/gpu/drm/xe/xe_migrate_doc.h b/drivers/gpu/drm/xe/xe_migrate_doc.h
index 6a68fdff08dc..584972c4d3be 100644
--- a/drivers/gpu/drm/xe/xe_migrate_doc.h
+++ b/drivers/gpu/drm/xe/xe_migrate_doc.h
@@ -21,7 +21,7 @@
  * table BOs for updates, and identity map the entire device's VRAM with 1 GB
  * pages.
  *
- * Currently the page structure consists of 48 phyiscal pages with 16 being
+ * Currently the page structure consists of 32 phyiscal pages with 16 being
  * reserved for BO mapping during copies and clear, 1 reserved for kernel binds,
  * several pages are needed to setup the identity mappings (exact number based
  * on how many bits of address space the device has), and the rest are reserved
-- 
2.21.0.rc0.32.g243a4c7e27

