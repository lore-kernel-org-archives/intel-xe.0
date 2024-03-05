Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 125F2C54E41
	for <intel-xe@archiver.kernel.org>; Tue,  5 Mar 2024 17:34:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B32B810E550;
	Tue,  5 Mar 2024 17:34:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T0GFEPVV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6965510E550
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Mar 2024 17:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709660090; x=1741196090;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NlG2e04jEtLcHHn/KaKWnVYN3G0LxuoM4vmefBffSm4=;
 b=T0GFEPVVzL/9BJ5cIEamhvzwgFpagx8iF6JCuZvIptjY9tb72f4M0IAm
 s+8o5x3Q+7AUtD344a1DiIiwxdbVnbZzBgrkkxiBK83jkQj6+6obQx4iH
 KDHYUkV6Js+Iq4KHArYB6TjG4ouj5zhRrjK8o55WoHJXZkRrVfJS2TjoT
 zHUtSaGapMx4pIpNK5bRUXZbWEpdffR/aitPy03G5mgQi1fTwQ4U0l01F
 I2w5HgdNvLbmyTBHtSDjG7KO1iGEmKByZ4QwFC0spXAzlsH/HKiGcITqN
 R+3FJld6cnhpEwZi7YA2zF4a9Nx2NUY4HbtS3XQPsKSpF1SaNybhh+Hvb w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="15658091"
X-IronPort-AV: E=Sophos;i="6.06,206,1705392000"; d="scan'208";a="15658091"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 09:34:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,206,1705392000"; 
   d="scan'208";a="9613813"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 09:34:49 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH] drm/xe: Pipeline evict / restore of pinned BOs during suspend
 / resume
Date: Tue,  5 Mar 2024 09:35:03 -0800
Message-Id: <20240305173503.285223-1-matthew.brost@intel.com>
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

Rather than waiting for each evict / restore of pinned BOs to complete
just wait on migrate exec queue to be idle once during suspend / resume.

Cc: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c       | 8 --------
 drivers/gpu/drm/xe/xe_bo_evict.c | 2 +-
 2 files changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 6603a0ea79c5..b89ac6db68a1 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -816,7 +816,6 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
  * @bo: The buffer object to move.
  *
  * On successful completion, the object memory will be moved to sytem memory.
- * This function blocks until the object has been fully moved.
  *
  * This is needed to for special handling of pinned VRAM object during
  * suspend-resume.
@@ -873,9 +872,6 @@ int xe_bo_evict_pinned(struct xe_bo *bo)
 	if (ret)
 		goto err_res_free;
 
-	dma_resv_wait_timeout(bo->ttm.base.resv, DMA_RESV_USAGE_KERNEL,
-			      false, MAX_SCHEDULE_TIMEOUT);
-
 	return 0;
 
 err_res_free:
@@ -888,7 +884,6 @@ int xe_bo_evict_pinned(struct xe_bo *bo)
  * @bo: The buffer object to move.
  *
  * On successful completion, the object memory will be moved back to VRAM.
- * This function blocks until the object has been fully moved.
  *
  * This is needed to for special handling of pinned VRAM object during
  * suspend-resume.
@@ -930,9 +925,6 @@ int xe_bo_restore_pinned(struct xe_bo *bo)
 	if (ret)
 		goto err_res_free;
 
-	dma_resv_wait_timeout(bo->ttm.base.resv, DMA_RESV_USAGE_KERNEL,
-			      false, MAX_SCHEDULE_TIMEOUT);
-
 	return 0;
 
 err_res_free:
diff --git a/drivers/gpu/drm/xe/xe_bo_evict.c b/drivers/gpu/drm/xe/xe_bo_evict.c
index 7a264a9ca06e..630695088b96 100644
--- a/drivers/gpu/drm/xe/xe_bo_evict.c
+++ b/drivers/gpu/drm/xe/xe_bo_evict.c
@@ -220,7 +220,7 @@ int xe_bo_restore_user(struct xe_device *xe)
 	list_splice_tail(&still_in_list, &xe->pinned.external_vram);
 	spin_unlock(&xe->pinned.lock);
 
-	/* Wait for validate to complete */
+	/* Wait for restore to complete */
 	for_each_tile(tile, xe, id)
 		xe_tile_migrate_wait(tile);
 
-- 
2.34.1

