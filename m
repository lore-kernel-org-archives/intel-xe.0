Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5A3EC43458
	for <intel-xe@archiver.kernel.org>; Wed,  8 Jul 2026 08:38:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CEB510F05D;
	Wed,  8 Jul 2026 08:38:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wr3CVNsW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7F2310F060
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Jul 2026 08:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783499925; x=1815035925;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IbPEtjb6G3yWAsf9Dfs6D2zVHXDyIoNAyTSVgZDyefw=;
 b=Wr3CVNsWsGYafxLcYwyIDFsbYQPrpjnTvsjoDdAiTBwGRCwvNtheIkhy
 YKsVKIqwozI4Uuk4OO+ARMNRxDGhj6WozrZz5Upu0Tlqzx162DhoPMKr2
 Y8Fnw0IxMZDvTO8lumE9zAqjuuk2YC2DewD8mx6gRTU9Lpqiv257TZ6cS
 DufQZMb4YyFOxUhH9MoGblH5S3jurc0/7yaPgt2mcIhcE8fyKxT1M2fIN
 t6kXfHLZ+07Uk5uGXG2wFC21yLk5sXWzklUZdcFf3WEkGvvWMptGMsM1J
 GoLfZOknFO8Xto8miqOZNOLFX80cYA+4dj6cElAKYQEmuKkF2xpwLZ5nv Q==;
X-CSE-ConnectionGUID: exSuBO03TlKG3xLMCmrJ6w==
X-CSE-MsgGUID: VvXrIyrVQRKE8B0dGm7YHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="94800438"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="94800438"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2026 01:38:45 -0700
X-CSE-ConnectionGUID: WpsQVdzoQgm8yskIWyreww==
X-CSE-MsgGUID: lZbyPQ+jQuSf+0W6icczuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="250240889"
Received: from nitin-super-server.iind.intel.com ([10.190.238.72])
 by fmviesa010.fm.intel.com with ESMTP; 08 Jul 2026 01:38:43 -0700
From: Nitin Gote <nitin.r.gote@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nitin Gote <nitin.r.gote@intel.com>,
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v5 2/2] drm/xe: Keep imported sg BOs off LRU until dma-buf
 attach succeeds
Date: Wed,  8 Jul 2026 14:45:08 +0530
Message-ID: <20260708091512.205482-6-nitin.r.gote@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260708091512.205482-4-nitin.r.gote@intel.com>
References: <20260708091512.205482-4-nitin.r.gote@intel.com>
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

Imported dma-buf BOs are created as ttm_bo_type_sg with bo->base.resv
pointing at the exporter's resv. They are initialized with system
placement, which allocates a ttm_resource and makes the BO visible to
TTM LRU walkers before dma_buf_dynamic_attach() has succeeded.

If attach fails, xe holds no dma-buf reference, but an LRU walker may
already have referenced the BO and locked bo->base.resv (the exporter
resv). If the exporter is then freed, this is a use-after-free.

Use an empty initial placement for imported sg BOs so bo->resource
stays NULL and the BO is never added to an LRU before attach succeeds.

As a result sg BOs now start without a resource, so their first move
has old_mem == NULL. Check ttm_bo_type_sg before the creation path in
xe_bo_move() so imports always use the dma-buf move path, and handle
resource-less sg BOs in xe_evict_flags() before dereferencing
tbo->resource.

Cc: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Assisted-by: GitHub_Copilot:claude-sonnet-4.6
Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 53 ++++++++++++++++++++++++++++----------
 1 file changed, 39 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 85e6d9a0f575..050de0f13232 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -63,6 +63,12 @@ static struct ttm_placement sys_placement = {
 
 static struct ttm_placement purge_placement;
 
+/* Initial placement: keeps imported sg BOs resource-less (off the LRU)
+ * until dma_buf_dynamic_attach() succeeds so they are not visible to LRU
+ * walkers while bo->base.resv still points at the exporter.
+ */
+static struct ttm_placement sg_init_placement;
+
 static const struct ttm_place tt_placement_flags[] = {
 	{
 		.fpfn = 0,
@@ -342,9 +348,14 @@ static void xe_evict_flags(struct ttm_buffer_object *tbo,
 	}
 
 	/*
-	 * For xe, sg bos that are evicted to system just triggers a
-	 * rebind of the sg list upon subsequent validation to XE_PL_TT.
+	 * sg BOs (dma-buf imports) evict to system and may have no
+	 * resource yet, so handle them before dereferencing tbo->resource.
 	 */
+	if (tbo->type == ttm_bo_type_sg) {
+		*placement = sys_placement;
+		return;
+	}
+
 	switch (tbo->resource->mem_type) {
 	case XE_PL_VRAM0:
 	case XE_PL_VRAM1:
@@ -980,6 +991,22 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 		return 0;
 	}
 
+	/*
+	 * sg BOs (dma-buf imports) must always be moved via the dmabuf path,
+	 * regardless of whether they have an existing resource. This check must
+	 * come before the creation-path check below: sg BOs start with no
+	 * resource (sg_init_placement), so their first move to XE_PL_TT has
+	 * old_mem == NULL, which would otherwise incorrectly trigger the
+	 * creation path and call xe_tt_map_sg() instead of xe_bo_move_dmabuf().
+	 */
+	if (ttm_bo->type == ttm_bo_type_sg) {
+		if (new_mem->mem_type == XE_PL_SYSTEM)
+			ret = xe_bo_move_notify(bo, ctx);
+		if (!ret)
+			ret = xe_bo_move_dmabuf(ttm_bo, new_mem);
+		return ret;
+	}
+
 	/* Bo creation path, moving to system or TT. */
 	if ((!old_mem && ttm) && !handle_system_ccs) {
 		if (new_mem->mem_type == XE_PL_TT)
@@ -989,14 +1016,6 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 		goto out;
 	}
 
-	if (ttm_bo->type == ttm_bo_type_sg) {
-		if (new_mem->mem_type == XE_PL_SYSTEM)
-			ret = xe_bo_move_notify(bo, ctx);
-		if (!ret)
-			ret = xe_bo_move_dmabuf(ttm_bo, new_mem);
-		return ret;
-	}
-
 	tt_has_data = ttm && (ttm_tt_is_populated(ttm) || ttm_tt_is_swapped(ttm));
 
 	move_lacks_source = !old_mem || (handle_system_ccs ? (!bo->ccs_cleared) :
@@ -2379,10 +2398,16 @@ struct xe_bo *xe_bo_init_locked(struct xe_device *xe, struct xe_bo *bo,
 		}
 	}
 
-	/* Defer populating type_sg bos */
-	placement = (type == ttm_bo_type_sg ||
-		     bo->flags & XE_BO_FLAG_DEFER_BACKING) ? &sys_placement :
-		&bo->placement;
+	/*
+	 * For sg BOs (dma-buf imports) use sg_init_placement (num_placement=0)
+	 * so that ttm_bo_validate() leaves bo->resource = NULL. The BO is then
+	 * not on any LRU list before dma_buf_dynamic_attach() succeeds, which
+	 * prevents the LRU-walker UAF when attach fails.
+	 * For other BOs that request deferred backing, use sys_placement.
+	 */
+	placement = (type == ttm_bo_type_sg) ? &sg_init_placement :
+		    (bo->flags & XE_BO_FLAG_DEFER_BACKING) ? &sys_placement :
+		    &bo->placement;
 	err = ttm_bo_init_reserved(&xe->ttm, &bo->ttm, type,
 				   placement, alignment,
 				   &ctx, NULL, resv, xe_ttm_bo_destroy);
-- 
2.50.1

