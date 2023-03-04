Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB364C61DA4
	for <intel-xe@archiver.kernel.org>; Sat,  4 Mar 2023 00:14:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B467010E790;
	Sat,  4 Mar 2023 00:14:14 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D665C10E790
 for <intel-xe@lists.freedesktop.org>; Sat,  4 Mar 2023 00:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677888849; x=1709424849;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hSd1J5R9UidSxet6LMImfSkKEpqM2NRW+X1r5aQMsBs=;
 b=Um82g+UihWUrSVj5ECaWgd5LLYO3UEZNxfRPCNTaJLsCGei5wWTg8PvJ
 PSs5dHoqP/tVYEzCR6SIpDXI9Xji/yGmHjLdPd1Af79+2amFwHjjhT3lF
 oAnpEFR5wXWkTJuY3oT++CLhy1nMr7pMSM1Pnwfa0loFEHEaG+choT6Yj
 chReSU23BJgYpTono4Z7NJ6zLKN7hGdBP0yTyU+yOTOZgPNcxUQ+YevSz
 x4VJIUkjSw/Wr3A4Hbyaxqkdqqbf2nV+454k+hCDkcVYhtzWl36l8wNj8
 qbGBCbjw1HAdgO84RbGXCb++WWiUK7MUzuhXnB5l5m0CdcbvpuC3E0Rph Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="336710233"
X-IronPort-AV: E=Sophos;i="5.98,232,1673942400"; d="scan'208";a="336710233"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2023 16:14:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="799389744"
X-IronPort-AV: E=Sophos;i="5.98,232,1673942400"; d="scan'208";a="799389744"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2023 16:14:09 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  3 Mar 2023 16:14:00 -0800
Message-Id: <20230304001403.11761-2-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
In-Reply-To: <20230304001403.11761-1-niranjana.vishwanathapura@intel.com>
References: <20230304001403.11761-1-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 1/4] drm/xe/migrate: Remove unused emit_pte()
 parameter
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
Cc: dev@mblankhorst.nl, thomas.hellstrom@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Remove unused 'struct xe_bo *bo' from emit_pte()

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/xe/tests/xe_migrate.c |  2 +-
 drivers/gpu/drm/xe/xe_migrate.c       | 13 +++++--------
 2 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
index 0de17e90aba9..3d8f4dfe2834 100644
--- a/drivers/gpu/drm/xe/tests/xe_migrate.c
+++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
@@ -276,7 +276,7 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
 		expected |= GEN12_PTE_PS64;
 	xe_res_first(pt->ttm.resource, 0, pt->size, &src_it);
 	emit_pte(m, bb, NUM_KERNEL_PDE - 1, xe_bo_is_vram(pt),
-		 &src_it, GEN8_PAGE_SIZE, pt);
+		 &src_it, GEN8_PAGE_SIZE);
 	run_sanity_job(m, xe, bb, bb->len, "Writing PTE for our fake PT", test);
 
 	retval = xe_map_rd(xe, &bo->vmap, GEN8_PAGE_SIZE * (NUM_KERNEL_PDE - 1),
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index bc69ec17d5ad..c2610e377eb1 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -425,7 +425,7 @@ static void emit_pte(struct xe_migrate *m,
 		     struct xe_bb *bb, u32 at_pt,
 		     bool is_vram,
 		     struct xe_res_cursor *cur,
-		     u32 size, struct xe_bo *bo)
+		     u32 size)
 {
 	u32 ptes;
 	u64 ofs = at_pt * GEN8_PAGE_SIZE;
@@ -674,19 +674,17 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 			emit_arb_clear(bb);
 
 		if (!src_is_vram)
-			emit_pte(m, bb, src_L0_pt, src_is_vram, &src_it, src_L0,
-				 bo);
+			emit_pte(m, bb, src_L0_pt, src_is_vram, &src_it, src_L0);
 		else
 			xe_res_next(&src_it, src_L0);
 
 		if (!dst_is_vram)
-			emit_pte(m, bb, dst_L0_pt, dst_is_vram, &dst_it, src_L0,
-				 bo);
+			emit_pte(m, bb, dst_L0_pt, dst_is_vram, &dst_it, src_L0);
 		else
 			xe_res_next(&dst_it, src_L0);
 
 		if (copy_system_ccs)
-			emit_pte(m, bb, ccs_pt, false, &ccs_it, ccs_size, bo);
+			emit_pte(m, bb, ccs_pt, false, &ccs_it, ccs_size);
 
 		bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
 		update_idx = bb->len;
@@ -858,8 +856,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 		/* Preemption is enabled again by the ring ops. */
 		if (!clear_vram) {
 			emit_arb_clear(bb);
-			emit_pte(m, bb, clear_L0_pt, clear_vram, &src_it, clear_L0,
-				 bo);
+			emit_pte(m, bb, clear_L0_pt, clear_vram, &src_it, clear_L0);
 		} else {
 			xe_res_next(&src_it, clear_L0);
 		}
-- 
2.21.0.rc0.32.g243a4c7e27

