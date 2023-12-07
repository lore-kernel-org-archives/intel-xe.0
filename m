Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54346C10F05
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 09:12:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07AC010E826;
	Thu,  7 Dec 2023 09:12:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90F2F10E1B8
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 09:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701940313; x=1733476313;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gcuGsGaO3d9lirHYyl+j5jth3EtMcgMEfLIxWVkICas=;
 b=iY60AekZqji3VmzrYnzAuyrU6N8E2WkVS84DMPXKj9rA8errst44uru9
 lHBiY0OXDNjPlvXEFUiyPNtzDnztv/pMod06dVWK5MQ8EcljRziO4DBRv
 996FoW/CqrNUSDzAEMNqi6QMNyzaf9IjvlE4CcCf5+hC0X5Zem+kpP/3n
 TC2VYxgYMvfvIm1CkBoSw4eixtqn8wvHszfNx4KzEIV2aukP2nfv8jTCP
 8oVB5UF551StZDxdy/UOYeI+u2tDoBtVkSScmNzJctdV+lv6zdbzmE1Pf
 Pwtt2/K8mvKhS41P1wrzuHJ47KhAk7jGmEXjK5dtpMpdEa7P91iSMFhFm Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="391374015"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="391374015"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 01:11:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="895067861"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="895067861"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orsmga004.jf.intel.com with ESMTP; 07 Dec 2023 01:11:47 -0800
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  7 Dec 2023 14:49:19 +0530
Message-Id: <20231207091922.1224800-7-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231207091922.1224800-1-himal.prasad.ghimiray@intel.com>
References: <20231207091922.1224800-1-himal.prasad.ghimiray@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v6 6/9] drm/xe/xe2: Update emit_pte to use
 compression enabled PAT index
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
Cc: Matthew Auld <matthew.auld@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

For indirect accessed buffer use compression enabled PAT index.

v2:
 - Fix parameter name.

Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_migrate.c |  2 +-
 drivers/gpu/drm/xe/xe_migrate.c       | 20 ++++++++++++++------
 2 files changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
index 83d6a66ed369..f77477f7e9fa 100644
--- a/drivers/gpu/drm/xe/tests/xe_migrate.c
+++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
@@ -330,7 +330,7 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
 	else
 		xe_res_first_sg(xe_bo_sg(pt), 0, pt->size, &src_it);
 
-	emit_pte(m, bb, NUM_KERNEL_PDE - 1, xe_bo_is_vram(pt),
+	emit_pte(m, bb, NUM_KERNEL_PDE - 1, xe_bo_is_vram(pt), false,
 		 &src_it, XE_PAGE_SIZE, pt);
 
 	run_sanity_job(m, xe, bb, bb->len, "Writing PTE for our fake PT", test);
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 98dca906a023..1bfb249680f4 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -416,15 +416,23 @@ static u32 pte_update_size(struct xe_migrate *m,
 
 static void emit_pte(struct xe_migrate *m,
 		     struct xe_bb *bb, u32 at_pt,
-		     bool is_vram,
+		     bool is_vram, bool is_comp_pte,
 		     struct xe_res_cursor *cur,
 		     u32 size, struct xe_bo *bo)
 {
-	u16 pat_index = tile_to_xe(m->tile)->pat.idx[XE_CACHE_WB];
+	struct xe_device *xe = tile_to_xe(m->tile);
+
+	u16 pat_index;
 	u32 ptes;
 	u64 ofs = at_pt * XE_PAGE_SIZE;
 	u64 cur_ofs;
 
+	/* Indirect access needs compression enabled uncached PAT index */
+	if (GRAPHICS_VERx100(xe) >= 2000)
+		pat_index = is_comp_pte ? 12 : xe->pat.idx[XE_CACHE_NONE];
+	else
+		pat_index = xe->pat.idx[XE_CACHE_WB];
+
 	/*
 	 * FIXME: Emitting VRAM PTEs to L0 PTs is forbidden. Currently
 	 * we're only emitting VRAM PTEs during sanity tests, so when
@@ -722,19 +730,19 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 		}
 
 		if (!src_is_vram)
-			emit_pte(m, bb, src_L0_pt, src_is_vram, &src_it, src_L0,
+			emit_pte(m, bb, src_L0_pt, src_is_vram, true, &src_it, src_L0,
 				 src_bo);
 		else
 			xe_res_next(&src_it, src_L0);
 
 		if (!dst_is_vram)
-			emit_pte(m, bb, dst_L0_pt, dst_is_vram, &dst_it, src_L0,
+			emit_pte(m, bb, dst_L0_pt, dst_is_vram, true, &dst_it, src_L0,
 				 dst_bo);
 		else
 			xe_res_next(&dst_it, src_L0);
 
 		if (copy_system_ccs)
-			emit_pte(m, bb, ccs_pt, false, &ccs_it, ccs_size, src_bo);
+			emit_pte(m, bb, ccs_pt, false, false, &ccs_it, ccs_size, src_bo);
 
 		bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
 		update_idx = bb->len;
@@ -975,7 +983,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 
 		/* Preemption is enabled again by the ring ops. */
 		if (!clear_vram) {
-			emit_pte(m, bb, clear_L0_pt, clear_vram, &src_it, clear_L0,
+			emit_pte(m, bb, clear_L0_pt, clear_vram, true, &src_it, clear_L0,
 				 bo);
 		} else {
 			xe_res_next(&src_it, clear_L0);
-- 
2.25.1

