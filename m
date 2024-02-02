Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19B0BC48286
	for <intel-xe@archiver.kernel.org>; Fri,  2 Feb 2024 03:34:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B0E310E471;
	Fri,  2 Feb 2024 03:34:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="izm2RT61";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9849210E471
 for <intel-xe@lists.freedesktop.org>; Fri,  2 Feb 2024 03:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706844840; x=1738380840;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=csHbOehulgRuZggAVu/OgMMm+T5s5F9oRCi2zeH9ZEU=;
 b=izm2RT61uhZfxX7xAd03LrSCM7gHJnZZ10SWsuEFzbEy+CIkN8rNaldQ
 cAFvRWgGd6YlY2zsJfSDB28A+eEubLQHEfSpCKpOfdnnG6ysr3A278VAE
 mN07Hbv7wVl71c2nbkzOJsQ89M66vsfU+sWlyy83iCdcTyUf5pX3H9e7z
 w0E6SNP/bl6aXD099scP9fhceATdUsFDOYp3/nKiRV1r4jaOVlOvxw8nz
 q8MidlIqEQvxzYCKYsrccf0nNUR8O4Ww3pnEc2s5LjXyASr/nHtLVwZjn
 DKk8muE3o2AIQpLI9pYNAZK/Di9Lx0bT38TtajaO34CAL9kFZ2kwftJmJ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="243046"
X-IronPort-AV: E=Sophos;i="6.05,237,1701158400"; 
   d="scan'208";a="243046"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 19:33:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="789123675"
X-IronPort-AV: E=Sophos;i="6.05,237,1701158400"; d="scan'208";a="789123675"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 19:33:57 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe: Map both mem.kernel_bb_pool and usm.bb_pool
Date: Thu,  1 Feb 2024 19:34:40 -0800
Message-Id: <20240202033440.2351862-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

For integrated devices we need to map both mem.kernel_bb_pool and
usm.bb_pool to be able to run batches from both pools.

Fixes: a682b6a42d4d ("drm/xe: Support device page faults on integrated platforms")
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c      |  5 ++++-
 drivers/gpu/drm/xe/xe_migrate.c | 23 ++++++++++++++++++-----
 2 files changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 675a2927a19e..295cba1c688f 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -456,7 +456,10 @@ static int all_fw_domain_init(struct xe_gt *gt)
 		 * USM has its only SA pool to non-block behind user operations
 		 */
 		if (gt_to_xe(gt)->info.has_usm) {
-			gt->usm.bb_pool = xe_sa_bo_manager_init(gt_to_tile(gt), SZ_1M, 16);
+			struct xe_device *xe = gt_to_xe(gt);
+
+			gt->usm.bb_pool = xe_sa_bo_manager_init(gt_to_tile(gt),
+								IS_DGFX(xe) ? SZ_1M : SZ_512, 16);
 			if (IS_ERR(gt->usm.bb_pool)) {
 				err = PTR_ERR(gt->usm.bb_pool);
 				goto err_force_wake;
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 9ab004871f9a..7465f8d14028 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -180,11 +180,6 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 	if (!IS_DGFX(xe)) {
 		/* Write out batch too */
 		m->batch_base_ofs = NUM_PT_SLOTS * XE_PAGE_SIZE;
-		if (xe->info.has_usm) {
-			batch = tile->primary_gt->usm.bb_pool->bo;
-			m->usm_batch_base_ofs = m->batch_base_ofs;
-		}
-
 		for (i = 0; i < batch->size;
 		     i += vm->flags & XE_VM_FLAG_64K ? XE_64K_PAGE_SIZE :
 		     XE_PAGE_SIZE) {
@@ -195,6 +190,24 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 				  entry);
 			level++;
 		}
+		if (xe->info.has_usm) {
+			xe_tile_assert(tile, batch->size == SZ_1M);
+
+			batch = tile->primary_gt->usm.bb_pool->bo;
+			m->usm_batch_base_ofs = m->batch_base_ofs + SZ_1M;
+			xe_tile_assert(tile, batch->size == SZ_512);
+
+			for (i = 0; i < batch->size;
+			     i += vm->flags & XE_VM_FLAG_64K ? XE_64K_PAGE_SIZE :
+			     XE_PAGE_SIZE) {
+				entry = vm->pt_ops->pte_encode_bo(batch, i,
+								  pat_index, 0);
+
+				xe_map_wr(xe, &bo->vmap, map_ofs + level * 8, u64,
+					  entry);
+				level++;
+			}
+		}
 	} else {
 		u64 batch_addr = xe_bo_addr(batch, 0, XE_PAGE_SIZE);
 
-- 
2.34.1

