Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB365D59F5E
	for <intel-xe@archiver.kernel.org>; Wed,  6 Nov 2024 18:34:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99C5710E760;
	Wed,  6 Nov 2024 18:34:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WsFIq/4q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF72810E760
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Nov 2024 18:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730918089; x=1762454089;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lsTf1QdVuMUTFb/SJNxcjeN6IG+ocTuk6o21+Mum2TA=;
 b=WsFIq/4q78wtP2MvD+aD5xP2xj+8F+/SrVhkjXN8OCaIyYFRj2Ho2YN1
 xWKcpANlDNVfeCutCSd0Zm3YJtnmdkUWl5UmHP4mE6WvKRyD26vFOo0A8
 mYLwOyphkm2+GWaMveSjp6L2GA8MzII+jL+dbcukUVD+wNmZfvxxn4fcW
 70zgtLyBgy07JZ5B3L4EdJignaY33CQp1oriE36xAnFMUWKo2fqzl7lYN
 Pgta1W+aBMzi+btJShPojwmW567Tv3T5cKCtEUg0Jda5j55vqNeq3vH+c
 o0yNxipTthfoOtNawhAapsr0qZnv8yFT1azbZ84dzi5LZMNv3rJTGfHP6 A==;
X-CSE-ConnectionGUID: kshdX5ydTxWrCqMllNg9KQ==
X-CSE-MsgGUID: X0VkDej1QS2WbRi384xd0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30591593"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30591593"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2024 10:34:46 -0800
X-CSE-ConnectionGUID: 6SKWtQ00TjegdUnTHwsOGw==
X-CSE-MsgGUID: oea1ucapQNaW8G/paj7Vng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,263,1725346800"; d="scan'208";a="84789665"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2024 10:34:46 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: lucas.demarchi@intel.com,
	matthew.auld@intel.com
Subject: [PATCH v3 1/2] drm/xe: improve hibernation on igpu
Date: Wed,  6 Nov 2024 10:35:13 -0800
Message-Id: <20241106183514.4174086-1-matthew.brost@intel.com>
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

From: Matthew Auld <matthew.auld@intel.com>

The GGTT looks to be stored inside stolen memory on igpu which is not
treated as normal RAM.  The core kernel skips this memory range when
creating the hibernation image, therefore when coming back from
hibernation the GGTT programming is lost. This seems to cause issues
with broken resume where GuC FW fails to load:

[drm] *ERROR* GT0: load failed: status = 0x400000A0, time = 10ms, freq = 1250MHz (req 1300MHz), done = -1
[drm] *ERROR* GT0: load failed: status: Reset = 0, BootROM = 0x50, UKernel = 0x00, MIA = 0x00, Auth = 0x01
[drm] *ERROR* GT0: firmware signature verification failed
[drm] *ERROR* CRITICAL: Xe has declared device 0000:00:02.0 as wedged.

Current GGTT users are kernel internal and tracked as pinned, so it
should be possible to hook into the existing save/restore logic that we
use for dgpu, where the actual evict is skipped but on restore we
importantly restore the GGTT programming.  This has been confirmed to
fix hibernation on at least ADL and MTL, though likely all igpu
platforms are affected.

This also means we have a hole in our testing, where the existing s4
tests only really test the driver hooks, and don't go as far as actually
rebooting and restoring from the hibernation image and in turn powering
down RAM (and therefore losing the contents of stolen).

v2 (Brost)
 - Remove extra newline and drop unnecessary parentheses.

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3275
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: <stable@vger.kernel.org> # v6.8+
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c       | 37 ++++++++++++++------------------
 drivers/gpu/drm/xe/xe_bo_evict.c |  6 ------
 2 files changed, 16 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 8286cbc23721..549866da5cd1 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -952,7 +952,10 @@ int xe_bo_restore_pinned(struct xe_bo *bo)
 	if (WARN_ON(!xe_bo_is_pinned(bo)))
 		return -EINVAL;
 
-	if (WARN_ON(xe_bo_is_vram(bo) || !bo->ttm.ttm))
+	if (WARN_ON(xe_bo_is_vram(bo)))
+		return -EINVAL;
+
+	if (WARN_ON(!bo->ttm.ttm && !xe_bo_is_stolen(bo)))
 		return -EINVAL;
 
 	if (!mem_type_is_vram(place->mem_type))
@@ -1774,6 +1777,7 @@ int xe_bo_pin_external(struct xe_bo *bo)
 
 int xe_bo_pin(struct xe_bo *bo)
 {
+	struct ttm_place *place = &bo->placements[0];
 	struct xe_device *xe = xe_bo_device(bo);
 	int err;
 
@@ -1804,8 +1808,6 @@ int xe_bo_pin(struct xe_bo *bo)
 	 */
 	if (IS_DGFX(xe) && !(IS_ENABLED(CONFIG_DRM_XE_DEBUG) &&
 	    bo->flags & XE_BO_FLAG_INTERNAL_TEST)) {
-		struct ttm_place *place = &(bo->placements[0]);
-
 		if (mem_type_is_vram(place->mem_type)) {
 			xe_assert(xe, place->flags & TTM_PL_FLAG_CONTIGUOUS);
 
@@ -1813,13 +1815,12 @@ int xe_bo_pin(struct xe_bo *bo)
 				       vram_region_gpu_offset(bo->ttm.resource)) >> PAGE_SHIFT;
 			place->lpfn = place->fpfn + (bo->size >> PAGE_SHIFT);
 		}
+	}
 
-		if (mem_type_is_vram(place->mem_type) ||
-		    bo->flags & XE_BO_FLAG_GGTT) {
-			spin_lock(&xe->pinned.lock);
-			list_add_tail(&bo->pinned_link, &xe->pinned.kernel_bo_present);
-			spin_unlock(&xe->pinned.lock);
-		}
+	if (mem_type_is_vram(place->mem_type) || bo->flags & XE_BO_FLAG_GGTT) {
+		spin_lock(&xe->pinned.lock);
+		list_add_tail(&bo->pinned_link, &xe->pinned.kernel_bo_present);
+		spin_unlock(&xe->pinned.lock);
 	}
 
 	ttm_bo_pin(&bo->ttm);
@@ -1867,24 +1868,18 @@ void xe_bo_unpin_external(struct xe_bo *bo)
 
 void xe_bo_unpin(struct xe_bo *bo)
 {
+	struct ttm_place *place = &bo->placements[0];
 	struct xe_device *xe = xe_bo_device(bo);
 
 	xe_assert(xe, !bo->ttm.base.import_attach);
 	xe_assert(xe, xe_bo_is_pinned(bo));
 
-	if (IS_DGFX(xe) && !(IS_ENABLED(CONFIG_DRM_XE_DEBUG) &&
-	    bo->flags & XE_BO_FLAG_INTERNAL_TEST)) {
-		struct ttm_place *place = &(bo->placements[0]);
-
-		if (mem_type_is_vram(place->mem_type) ||
-		    bo->flags & XE_BO_FLAG_GGTT) {
-			spin_lock(&xe->pinned.lock);
-			xe_assert(xe, !list_empty(&bo->pinned_link));
-			list_del_init(&bo->pinned_link);
-			spin_unlock(&xe->pinned.lock);
-		}
+	if (mem_type_is_vram(place->mem_type) || bo->flags & XE_BO_FLAG_GGTT) {
+		spin_lock(&xe->pinned.lock);
+		xe_assert(xe, !list_empty(&bo->pinned_link));
+		list_del_init(&bo->pinned_link);
+		spin_unlock(&xe->pinned.lock);
 	}
-
 	ttm_bo_unpin(&bo->ttm);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_bo_evict.c b/drivers/gpu/drm/xe/xe_bo_evict.c
index 32043e1e5a86..b01bc20eb90b 100644
--- a/drivers/gpu/drm/xe/xe_bo_evict.c
+++ b/drivers/gpu/drm/xe/xe_bo_evict.c
@@ -34,9 +34,6 @@ int xe_bo_evict_all(struct xe_device *xe)
 	u8 id;
 	int ret;
 
-	if (!IS_DGFX(xe))
-		return 0;
-
 	/* User memory */
 	for (mem_type = XE_PL_VRAM0; mem_type <= XE_PL_VRAM1; ++mem_type) {
 		struct ttm_resource_manager *man =
@@ -125,9 +122,6 @@ int xe_bo_restore_kernel(struct xe_device *xe)
 	struct xe_bo *bo;
 	int ret;
 
-	if (!IS_DGFX(xe))
-		return 0;
-
 	spin_lock(&xe->pinned.lock);
 	for (;;) {
 		bo = list_first_entry_or_null(&xe->pinned.evicted,
-- 
2.34.1

