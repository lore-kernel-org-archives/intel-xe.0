Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73CA3606A32A
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 05:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OzE3ehBS
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 250B5112176;
	Fri, 20 Nov 2026 05:47:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93DB810FFC2
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Nov 2026 05:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795153657; x=1826689657;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3FcvIm1+e6ihdmmBdpthLnLBlZ8XlrLsOVbt4+Mbcvo=;
 b=OzE3ehBSbZ8Op/szT82vqEXlgdi8KuFRAcGPFHimAb01kHPAG3RlHvfQ
 k/5jFkvzOhzcRYKO7n5L3MEAAUXnLyuHmEoBYUUD/jM4PDMZL64ksLQWs
 gA9lKGMh12A2Rl6MakGEXXiTtsDopw/+jNo7iACu26UqAxCRm4B7pF8M9
 SninnQyXusEtW7Sn1mFPQ9fH6iDk6LOUs3pSA/NpSHBFw8NtkzYghRwMh
 Bms/rzYJsjjDoO7ECaKKMMZSUEr9TYUWIjJjuh4Qtur1fk8qQye7EqUnG
 KqQStkQmaHcHN0mvLqIy+IWAsqA09yBgrC1lGFBAfonTCcg4u+aeGhiVY A==;
X-CSE-ConnectionGUID: tT2pI5f7QY+41F1NmjBTDA==
X-CSE-MsgGUID: i6ruAGJLT7e32xH9tve5jw==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="4018534"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="4018534"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 21:47:17 -0800
X-CSE-ConnectionGUID: IIhfqwFdR5uK4aF5u+IyPQ==
X-CSE-MsgGUID: TTnk0pS8SlaCa4t2gYcyhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; d="scan'208";a="10617162"
Received: from dut4463arlhx.fm.intel.com ([10.105.10.189])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 21:47:17 -0800
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: rodrigo.vivi@intel.com, riana.tauro@intel.com, anoop.c.vijay@intel.com,
 matthew.d.roper@intel.com, fei.yang@intel.com,
 intel-xe@lists.freedesktop.org, Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 13/16] drm/xe: Fall back to CPU copies when the tile cannot
 blit
Date: Fri, 20 Nov 2026 05:47:24 +0000
Message-ID: <20261120054712.377573-31-stuart.summers@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261120054712.377573-18-stuart.summers@intel.com>
References: <20261120054712.377573-18-stuart.summers@intel.com>
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

