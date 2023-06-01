Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C60BEC7EE23
	for <intel-xe@archiver.kernel.org>; Thu,  1 Jun 2023 20:30:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8563310E5CA;
	Thu,  1 Jun 2023 20:30:35 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D441110E5C2
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Jun 2023 20:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685651431; x=1717187431;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2wlOd/1U0YpCzHILQVdXxyBbmPM1K01CZ5lLmegYrkc=;
 b=SQUoKi0cBT5FzEiEXu+JwWhIeOSCaMQnFlAU96l1f6NKyZ4d/+vNVY5v
 3MLQ3XVPGgzKZwxDpgRV5cArdCv67Wx8HQt3TboLC7HarOJZuD/q/650r
 /UyuQgUk5ZoRv1YKKaA3uE4ZNXm8rnvSYrieg1HQk0zNJPYQMRqTeJhl+
 dm0M6tfbwczDlHmFEnX2MMB410HNNQJsnhSjHCmY2OOQODtr4QYVT0THD
 KD4bCRBbPtZv1wM28HSEe9PWHwbJQH0MWhuitQTHtCL3h6GJ2PjIbTanQ
 F3nwlcHfG9CCbQ3HFckdtHyW6HukF8dsYZdT7Erke5iFMTq8z2RTzlHDG w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="358102511"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="358102511"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 13:30:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="740493234"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="740493234"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.147])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 13:30:31 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  1 Jun 2023 13:30:03 -0700
Message-Id: <20230601203025.615494-10-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230601203025.615494-1-matthew.d.roper@intel.com>
References: <20230601203025.615494-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [CI 09/31] fixup! drm/xe/display: Implement display
 support
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
Cc: matthew.d.roper@intel.com
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

