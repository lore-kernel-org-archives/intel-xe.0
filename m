Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B1C2C7EE45
	for <intel-xe@archiver.kernel.org>; Tue, 30 May 2023 21:16:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02AA810E43D;
	Tue, 30 May 2023 21:16:21 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7970010E436
 for <intel-xe@lists.freedesktop.org>; Tue, 30 May 2023 21:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685481367; x=1717017367;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2wlOd/1U0YpCzHILQVdXxyBbmPM1K01CZ5lLmegYrkc=;
 b=nQlEPRVekTXvVUOfPvEQkyBfPvbbKDRWB3LcVrCVzA40LIokVWjAjyKU
 pJJoYFv1WZxFNGGS0yrDwhs9vf9HyQytYrEb1XHVK46GVSHYpdy8nMc1y
 PSAswxcfzUdfZPJNJFaJ/TsXIo0NiSzNrPTHRciI1ql1c6pzjGCbxmaX6
 qkPtxRmSkcNhyHXlA/05E6nNb1dc+VyeCWHZPAkFEk4akqB2LUTtNo15O
 d26oQ3g1zl12XH99BMZ0lUdHglEG6v3ldsjb93twKWWnkKyVyEXYfGmAI
 EF/e2COkufR6+oh8kt9TaXFW/e2LPKsyBs/E+oXqjvSNGCRNCdsrGqgU9 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="383311940"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; d="scan'208";a="383311940"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 14:16:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="684139401"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; d="scan'208";a="684139401"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 14:16:06 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 30 May 2023 14:15:27 -0700
Message-Id: <20230530211549.2632538-10-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230530211549.2632538-1-matthew.d.roper@intel.com>
References: <20230530211549.2632538-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 09/31] fixup! drm/xe/display: Implement
 display support
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c        | 10 +++++-----
 drivers/gpu/drm/xe/display/xe_plane_initial.c |  5 +++--
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index 747fbb06cd83..3e863461fe79 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -123,14 +123,14 @@ static int __xe_pin_fb_vma_ggtt(struct intel_framebuffer *fb,
 {
 	struct xe_bo *bo = intel_fb_obj(&fb->base);
 	struct xe_device *xe = to_xe_device(fb->base.dev);
-	struct xe_ggtt *ggtt = to_gt(xe)->mem.ggtt;
+	struct xe_ggtt *ggtt = xe_device_get_root_tile(xe)->mem.ggtt;
 	u32 align;
 	int ret;
 
 	/* TODO: Consider sharing framebuffer mapping?
 	 * embed i915_vma inside intel_framebuffer
 	 */
-	xe_device_mem_access_get(gt_to_xe(ggtt->gt));
+	xe_device_mem_access_get(tile_to_xe(ggtt->tile));
 	ret = mutex_lock_interruptible(&ggtt->lock);
 	if (ret)
 		goto out;
@@ -174,11 +174,11 @@ static int __xe_pin_fb_vma_ggtt(struct intel_framebuffer *fb,
 					   rot_info->plane[i].dst_stride);
 	}
 
-	xe_ggtt_invalidate(to_gt(xe));
+	xe_ggtt_invalidate(ggtt);
 out_unlock:
 	mutex_unlock(&ggtt->lock);
 out:
-	xe_device_mem_access_put(gt_to_xe(ggtt->gt));
+	xe_device_mem_access_put(tile_to_xe(ggtt->tile));
 	return ret;
 }
 
@@ -240,7 +240,7 @@ static struct i915_vma *__xe_pin_fb_vma(struct intel_framebuffer *fb,
 static void __xe_unpin_fb_vma(struct i915_vma *vma)
 {
 	struct xe_device *xe = to_xe_device(vma->bo->ttm.base.dev);
-	struct xe_ggtt *ggtt = to_gt(xe)->mem.ggtt;
+	struct xe_ggtt *ggtt = xe_device_get_root_tile(xe)->mem.ggtt;
 
 	if (vma->dpt)
 		xe_bo_unpin_map_no_vm(vma->dpt);
diff --git a/drivers/gpu/drm/xe/display/xe_plane_initial.c b/drivers/gpu/drm/xe/display/xe_plane_initial.c
index 34ae461865a7..41540b27775c 100644
--- a/drivers/gpu/drm/xe/display/xe_plane_initial.c
+++ b/drivers/gpu/drm/xe/display/xe_plane_initial.c
@@ -52,6 +52,7 @@ initial_plane_bo(struct xe_device *xe,
 		 struct intel_initial_plane_config *plane_config)
 {
 	struct xe_gt *gt0 = xe_device_get_gt(xe, 0);
+	struct xe_tile *tile0 = xe_device_get_root_tile(xe);
 	struct xe_bo *bo;
 	resource_size_t phys_base;
 	u32 base, size, flags;
@@ -64,7 +65,7 @@ initial_plane_bo(struct xe_device *xe,
 
 	base = round_down(plane_config->base, page_size);
 	if (IS_DGFX(xe)) {
-		u64 __iomem *gte = gt0->mem.ggtt->gsm;
+		u64 __iomem *gte = tile0->mem.ggtt->gsm;
 		u64 pte;
 
 		gte += base / XE_PAGE_SIZE;
@@ -115,7 +116,7 @@ initial_plane_bo(struct xe_device *xe,
 			page_size);
 	size -= base;
 
-	bo = xe_bo_create_pin_map_at(xe, gt0, NULL, size, phys_base,
+	bo = xe_bo_create_pin_map_at(xe, &tile0->primary_gt, NULL, size, phys_base,
 				     ttm_bo_type_kernel, flags);
 	if (IS_ERR(bo)) {
 		drm_dbg(&xe->drm,
-- 
2.40.1

