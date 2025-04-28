Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84B06C36005
	for <intel-xe@archiver.kernel.org>; Mon, 28 Apr 2025 06:31:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 482F910E1E3;
	Mon, 28 Apr 2025 06:31:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PituGY/I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A695210E1E3
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Apr 2025 06:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745821908; x=1777357908;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LiYN5Z3qRB3GMPDehQmPioT9sSNAfK9cVe/s8Dv01IE=;
 b=PituGY/IMzjNZse2BD8qlkM6dTrBHkDUS7cUsaqRlzjY5B3Aya7PWcK1
 jbpiPSoR/tI1nLU1x+1+lrncBJ8eS45SZQ5FHqmH3NiAMGfq19GmoaYzZ
 jh8mbeez8bErivCF8WexCYPzvIf0xMtQN4uqlY663QA7D5jjfB8S9aZ4i
 l9D6mEKHhS7ssHxjLAu6EAsMs0FZn49bYKc01HctYHVwWyJ71lj4lbkrA
 HoubxKIwaKlT0EMg8fdb34VcID/9PNrX+mWlKHqfGHWk6YS5K+DqgPttg
 bvwx95ZrWg4HtLhdXOli/2WaKweRmIz/b8CGLXDgQavQsNEQH2mEvh92t g==;
X-CSE-ConnectionGUID: W0Uhns6nQuu2vgBVxVJAQQ==
X-CSE-MsgGUID: hsrL9lSxQvuUX6V1+1Ayfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11416"; a="47412479"
X-IronPort-AV: E=Sophos;i="6.15,245,1739865600"; d="scan'208";a="47412479"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2025 23:31:48 -0700
X-CSE-ConnectionGUID: UW94szCCRpSLVjwCdz+tow==
X-CSE-MsgGUID: 2C4YxgIxRe+lz3GzHJOCeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,245,1739865600"; d="scan'208";a="138598150"
Received: from unknown (HELO tejasupa-desk..) ([10.190.239.37])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2025 23:31:46 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, matthew.brost@intel.com,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH] drm/xe: Fix xe_bo_evict build error
Date: Mon, 28 Apr 2025 12:09:56 +0530
Message-Id: <20250428063956.1729460-1-tejas.upadhyay@intel.com>
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

Fix declarations and usage of xe_bo_evict with force_alloc
to avoid build error.

Fixes: 84a11c519234 ("drm/xe: Drop force_alloc from xe_bo_evict in selftests")
Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c      | 4 +---
 drivers/gpu/drm/xe/xe_bo.h      | 2 +-
 drivers/gpu/drm/xe/xe_dma_buf.c | 2 +-
 3 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 897caa145663..3a84a9d92c48 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -2930,19 +2930,17 @@ int xe_bo_migrate(struct xe_bo *bo, u32 mem_type)
 /**
  * xe_bo_evict - Evict an object to evict placement
  * @bo: The buffer object to migrate.
- * @force_alloc: Set force_alloc in ttm_operation_ctx
  *
  * On successful completion, the object memory will be moved to evict
  * placement. This function blocks until the object has been fully moved.
  *
  * Return: 0 on success. Negative error code on failure.
  */
-int xe_bo_evict(struct xe_bo *bo, bool force_alloc)
+int xe_bo_evict(struct xe_bo *bo)
 {
 	struct ttm_operation_ctx ctx = {
 		.interruptible = false,
 		.no_wait_gpu = false,
-		.force_alloc = force_alloc,
 		.gfp_retry_mayfail = true,
 	};
 	struct ttm_placement placement;
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 8bc449c78cc7..02ada1fb8a23 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -274,7 +274,7 @@ uint64_t vram_region_gpu_offset(struct ttm_resource *res);
 bool xe_bo_can_migrate(struct xe_bo *bo, u32 mem_type);
 
 int xe_bo_migrate(struct xe_bo *bo, u32 mem_type);
-int xe_bo_evict(struct xe_bo *bo, bool force_alloc);
+int xe_bo_evict(struct xe_bo *bo);
 
 int xe_bo_evict_pinned(struct xe_bo *bo);
 int xe_bo_notifier_prepare_pinned(struct xe_bo *bo);
diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
index f7a20264ea33..346f857f3837 100644
--- a/drivers/gpu/drm/xe/xe_dma_buf.c
+++ b/drivers/gpu/drm/xe/xe_dma_buf.c
@@ -233,7 +233,7 @@ static void xe_dma_buf_move_notify(struct dma_buf_attachment *attach)
 	struct drm_gem_object *obj = attach->importer_priv;
 	struct xe_bo *bo = gem_to_xe_bo(obj);
 
-	XE_WARN_ON(xe_bo_evict(bo, false));
+	XE_WARN_ON(xe_bo_evict(bo));
 }
 
 static const struct dma_buf_attach_ops xe_dma_buf_attach_ops = {
-- 
2.34.1

