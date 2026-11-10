Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A4B5606A320
	for <intel-xe@archiver.kernel.org>; Tue, 10 Nov 2026 23:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QpwM2gcY
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2C8A10F54C;
	Tue, 10 Nov 2026 23:15:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 868BB10E9AE
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Nov 2026 23:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794352506; x=1825888506;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LGZLwyU04Qo33s/ZqAbfeLbAHyVKpeMnWjsrhLDCzGY=;
 b=QpwM2gcYbXjK5a9PUXsUg5wk5Ssl44l5RurqWul6Xz94AFVBgtJowi33
 w9CnflDB3+2gFOnQz6uojoTSG0RURLRv2tUlaBoZlptPsy/C+ok2PvMoa
 oWjWUznYddBSfP/JDwbs6QoYrkP6zc7qnzvV3JMiiesx7DujdUVjh7B6I
 bcS5OnYNfWbb7oGsjD94jdqqknLOB8SfrX0d6ysK9jUPyOUxeYd0dkwpR
 m1zrUA6oBesN6tdP7qDgwDfdbTxuiCxvzVM4Aa5CVQ2oR9UbyFA5HzDI+
 NX5Jaqvr1DgzQ2jESUV10qXpi2itw8rcIG/Uua+NqZaKZgO0nGQQ6EhaB Q==;
X-CSE-ConnectionGUID: xgyOgMwQRXCh295K71UJBA==
X-CSE-MsgGUID: /KqwfGI4Q1mhHzHMaCa5tA==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3120831"
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="3120831"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 15:14:51 -0800
X-CSE-ConnectionGUID: h9+1DsTHQfalOMYx1nZfNA==
X-CSE-MsgGUID: i1FMav6IRZuvNjRj2GerzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="8133972"
Received: from dut4463arlhx.fm.intel.com ([10.105.9.57])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 15:14:51 -0800
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, matthew.d.roper@intel.com, fei.yang@intel.com,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 09/11] drm/xe: Fall back to CPU copies when the tile cannot
 blit
Date: Tue, 10 Nov 2026 23:14:51 +0000
Message-ID: <20261110231442.218721-22-stuart.summers@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110231442.218721-13-stuart.summers@intel.com>
References: <20261110231442.218721-13-stuart.summers@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

xe_migrate_copy() and xe_migrate_clear() emit blitter commands, and the
copy engine they need lives on the primary GT.  A tile without one can
still run the migration context for page table updates, but it has no way
to move data.

On an integrated device this never comes up, since every move either ends
in ttm_bo_move_null() or needs no clear.  With VRAM it does, so let
xe_bo_move() hand the work to ttm_bo_move_memcpy(), which reaches VRAM
through the BAR mapping xe already sets up in xe_ttm_io_mem_reserve(),
and which covers the clear case by way of an unpopulated source.  The
pinned save and restore paths grow the same check, falling back to the
vmap and memcpy branch they already have.

Reads come back over PCIe uncached and are correspondingly slow, so this
is only meant to keep a media only device working, not to perform.

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c      | 43 ++++++++++++++++++++++-----------
 drivers/gpu/drm/xe/xe_migrate.c | 16 ++++++++++++
 drivers/gpu/drm/xe/xe_migrate.h |  2 ++
 3 files changed, 47 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 42a6aa1a2e4a..49a3d4df77f6 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1275,6 +1275,19 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 		xe_pm_runtime_get_noresume(xe);
 	}
 
+	/*
+	 * A tile with no copy engine cannot blit, so move the data with the
+	 * CPU instead.  For VRAM that means going over the PCIe BAR, which is
+	 * slow, but a device with no graphics IP offers no alternative.
+	 * ttm_bo_move_memcpy() covers the clear case too, by way of an
+	 * unpopulated source.
+	 */
+	if (!xe_migrate_can_blit(migrate)) {
+		ret = ttm_bo_move_memcpy(ttm_bo, ctx, new_mem);
+		xe_pm_runtime_put(xe);
+		goto out;
+	}
+
 	/*
 	 * Attach CCS BBs before submitting the copy job below so a VF
 	 * migration racing the copy sees valid, up to date attach state.
@@ -1576,17 +1589,18 @@ int xe_bo_notifier_unprepare_pinned(struct xe_bo *bo)
 static int xe_bo_evict_pinned_copy(struct xe_bo *bo, struct xe_bo *backup)
 {
 	struct xe_device *xe = xe_bo_device(bo);
+	struct xe_migrate *migrate;
 	bool unmap = false;
 	int ret = 0;
 
-	if (xe_bo_is_user(bo) || (bo->flags & XE_BO_FLAG_PINNED_LATE_RESTORE)) {
-		struct xe_migrate *migrate;
-		struct dma_fence *fence;
+	if (bo->tile)
+		migrate = bo->tile->migrate;
+	else
+		migrate = mem_type_to_migrate(xe, bo->ttm.resource->mem_type);
 
-		if (bo->tile)
-			migrate = bo->tile->migrate;
-		else
-			migrate = mem_type_to_migrate(xe, bo->ttm.resource->mem_type);
+	if ((xe_bo_is_user(bo) || (bo->flags & XE_BO_FLAG_PINNED_LATE_RESTORE)) &&
+	    xe_migrate_can_blit(migrate)) {
+		struct dma_fence *fence;
 
 		xe_assert(xe, bo->ttm.base.resv == backup->ttm.base.resv);
 		ret = dma_resv_reserve_fences(bo->ttm.base.resv, 1);
@@ -1715,6 +1729,7 @@ int xe_bo_restore_pinned(struct xe_bo *bo)
 	};
 	struct xe_device *xe = ttm_to_xe_device(bo->ttm.bdev);
 	struct xe_bo *backup = bo->backup_obj;
+	struct xe_migrate *migrate;
 	bool unmap = false;
 	int ret;
 
@@ -1729,14 +1744,14 @@ int xe_bo_restore_pinned(struct xe_bo *bo)
 			goto out_unlock_bo;
 	}
 
-	if (xe_bo_is_user(bo) || (bo->flags & XE_BO_FLAG_PINNED_LATE_RESTORE)) {
-		struct xe_migrate *migrate;
-		struct dma_fence *fence;
+	if (bo->tile)
+		migrate = bo->tile->migrate;
+	else
+		migrate = mem_type_to_migrate(xe, bo->ttm.resource->mem_type);
 
-		if (bo->tile)
-			migrate = bo->tile->migrate;
-		else
-			migrate = mem_type_to_migrate(xe, bo->ttm.resource->mem_type);
+	if ((xe_bo_is_user(bo) || (bo->flags & XE_BO_FLAG_PINNED_LATE_RESTORE)) &&
+	    xe_migrate_can_blit(migrate)) {
+		struct dma_fence *fence;
 
 		ret = dma_resv_reserve_fences(bo->ttm.base.resv, 1);
 		if (ret)
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 754592c5cf88..c06f43fc9e4f 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -2093,6 +2093,22 @@ void xe_migrate_wait(struct xe_migrate *m)
 		dma_fence_wait(m->fence, false);
 }
 
+/**
+ * xe_migrate_can_blit() - Whether a migration context can issue blits
+ * @m: The migration context
+ *
+ * xe_migrate_copy() and xe_migrate_clear() emit blitter commands, which only
+ * the copy engine understands, and the copy engine lives on the primary GT.
+ * A tile without one can still update page tables, so its migration context
+ * is usable, but callers that want to move data have to do it themselves.
+ *
+ * Return: true if blit based copy and clear are available on @m.
+ */
+bool xe_migrate_can_blit(struct xe_migrate *m)
+{
+	return m->tile->primary_gt;
+}
+
 static u32 pte_update_cmd_size(u64 size)
 {
 	u32 num_dword;
diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
index 2e8be10fdb71..4230efcaffc6 100644
--- a/drivers/gpu/drm/xe/xe_migrate.h
+++ b/drivers/gpu/drm/xe/xe_migrate.h
@@ -91,6 +91,8 @@ struct xe_vm *xe_migrate_get_vm(struct xe_migrate *m);
 
 void xe_migrate_wait(struct xe_migrate *m);
 
+bool xe_migrate_can_blit(struct xe_migrate *m);
+
 #if IS_ENABLED(CONFIG_DRM_XE_DEBUG_MEM)
 int xe_migrate_debug_ccs_overlap(struct xe_migrate *m,
 				 struct xe_bo *scratch_bo,
-- 
2.43.0

