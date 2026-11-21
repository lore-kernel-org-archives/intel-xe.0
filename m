Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 133F7606A320
	for <intel-xe@archiver.kernel.org>; Sat, 21 Nov 2026 18:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EVLHNtVB
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBA5410E92B;
	Sat, 21 Nov 2026 18:24:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2325310E9DE
 for <intel-xe@lists.freedesktop.org>; Sat, 21 Nov 2026 18:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795285422; x=1826821422;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3FcvIm1+e6ihdmmBdpthLnLBlZ8XlrLsOVbt4+Mbcvo=;
 b=EVLHNtVBM59D39L8sfs8A5533YZ9wo8mG5b8RWNX0qgsXRelRIj0lgev
 8vpvLOfQ+a7j3vRGjUQuu/Jd/werItAQCxN2OGrRXEIhnfV4s2aaOq074
 l9tiK1WrKGqGMlSkBWigd+BtInA37YrT90eqP7xb9GW3XDnrG4fIdV9aX
 4uY1mYo0Sjsh3t4W9xDykZSqRqG3kL9QL4fYbBo+y1/kIAH3os9Vy5hrr
 VauZj4D6Rwydt8/t4VPfZyrxdDXtW5XBkG+qB4x1/QLwbDWRh7pPP9Yo3
 K8qu9lOKI516dzPojw+0ml9Dqj65TiVONbtlMn1dRXXb6MFrGWUGB9tgd Q==;
X-CSE-ConnectionGUID: hHNfaoUCTpWGjqzb4gweFQ==
X-CSE-MsgGUID: wPUGHQ4HSNmagMcED2aYsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11973"; a="4034069"
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; 
   d="scan'208";a="4034069"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2026 10:23:21 -0800
X-CSE-ConnectionGUID: ccDw0/ulSDOt1ANZTcb3fg==
X-CSE-MsgGUID: zhNu8gTcRIGVttZdQtPGwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; d="scan'208";a="10934439"
Received: from dut4463arlhx.fm.intel.com ([10.105.10.189])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2026 10:23:20 -0800
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: rodrigo.vivi@intel.com, riana.tauro@intel.com, anoop.c.vijay@intel.com,
 matthew.d.roper@intel.com, fei.yang@intel.com,
 intel-xe@lists.freedesktop.org, Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 13/17] drm/xe: Fall back to CPU copies when the tile cannot
 blit
Date: Sat, 21 Nov 2026 18:23:29 +0000
Message-ID: <20261121182317.48981-32-stuart.summers@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261121182317.48981-19-stuart.summers@intel.com>
References: <20261121182317.48981-19-stuart.summers@intel.com>
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
index 353ac1e9a9d6..8a8a034d1edb 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1277,6 +1277,19 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
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
@@ -1578,17 +1591,18 @@ int xe_bo_notifier_unprepare_pinned(struct xe_bo *bo)
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
@@ -1717,6 +1731,7 @@ int xe_bo_restore_pinned(struct xe_bo *bo)
 	};
 	struct xe_device *xe = ttm_to_xe_device(bo->ttm.bdev);
 	struct xe_bo *backup = bo->backup_obj;
+	struct xe_migrate *migrate;
 	bool unmap = false;
 	int ret;
 
@@ -1731,14 +1746,14 @@ int xe_bo_restore_pinned(struct xe_bo *bo)
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
index 8fc3e5d500a2..7e845cbaa082 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -2155,6 +2155,22 @@ void xe_migrate_wait(struct xe_migrate *m)
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
index 2e0f8fe7024b..7b2e016628b9 100644
--- a/drivers/gpu/drm/xe/xe_migrate.h
+++ b/drivers/gpu/drm/xe/xe_migrate.h
@@ -93,6 +93,8 @@ struct xe_vm *xe_migrate_get_vm(struct xe_migrate *m);
 
 void xe_migrate_wait(struct xe_migrate *m);
 
+bool xe_migrate_can_blit(struct xe_migrate *m);
+
 #if IS_ENABLED(CONFIG_DRM_XE_DEBUG_MEM)
 int xe_migrate_debug_ccs_overlap(struct xe_migrate *m,
 				 struct xe_bo *scratch_bo,
-- 
2.43.0

