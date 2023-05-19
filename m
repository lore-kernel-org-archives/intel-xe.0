Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85691C77B7A
	for <intel-xe@archiver.kernel.org>; Fri, 19 May 2023 23:19:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6F5310E62C;
	Fri, 19 May 2023 23:19:07 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53FF410E628
 for <intel-xe@lists.freedesktop.org>; Fri, 19 May 2023 23:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684538329; x=1716074329;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4sABcgcP9c4/yg5ar413NJTNtohuxDN8Y/S2G6PM4T4=;
 b=OyeNd5zEWbaMY75H82A7dCRB6GBp95RWORnCnDYlExYx+JUfIaecPESl
 /XzdK5yKh//QX7PvtrbLWV7Vvngd/P9qTr5wymXw6aktdd4eoBVFqY+Kx
 nSgL/CJBq9ERQpbeynB6hsiFs8CD9S1/PDJ/7yO2LjpD8rjgXfbgqsPbk
 qEYv5vrMUewUUWKKBNCV3VWK62gKQ+HFK4UpDmhCiwdi/BDRfVx3pO+5H
 WXk3GajFL5XULU7SLDGnhlDxyPeuAN9eU/pyvn+QSitGNiUYtIl+CX2/m
 HBcUMJ9eNSy/QLqkJZQAzGfPyWrOAHyZfgXNhAQSqjjaz4ZvIf2rBZp7k A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10715"; a="352526348"
X-IronPort-AV: E=Sophos;i="6.00,178,1681196400"; d="scan'208";a="352526348"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2023 16:18:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10715"; a="696888704"
X-IronPort-AV: E=Sophos;i="6.00,178,1681196400"; d="scan'208";a="696888704"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2023 16:18:40 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 19 May 2023 16:18:05 -0700
Message-Id: <20230519231827.3572452-9-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230519231827.3572452-1-matthew.d.roper@intel.com>
References: <20230519231827.3572452-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 08/30] fixup! drm/xe/display: Implement
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

---
 drivers/gpu/drm/xe/display/xe_fb_pin.c        | 6 +++---
 drivers/gpu/drm/xe/display/xe_plane_initial.c | 5 +++--
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index c7c4df18e439..27e4d29aa73d 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -123,7 +123,7 @@ static int __xe_pin_fb_vma_ggtt(struct intel_framebuffer *fb,
 {
 	struct xe_bo *bo = intel_fb_obj(&fb->base);
 	struct xe_device *xe = to_xe_device(fb->base.dev);
-	struct xe_ggtt *ggtt = to_gt(xe)->mem.ggtt;
+	struct xe_ggtt *ggtt = xe_device_get_root_tile(xe)->mem.ggtt;
 	u32 align;
 	int ret;
 
@@ -173,7 +173,7 @@ static int __xe_pin_fb_vma_ggtt(struct intel_framebuffer *fb,
 					   rot_info->plane[i].dst_stride);
 	}
 
-	xe_ggtt_invalidate(to_gt(xe));
+	xe_ggtt_invalidate(ggtt);
 
 out:
 	mutex_unlock(&ggtt->lock);
@@ -238,7 +238,7 @@ static struct i915_vma *__xe_pin_fb_vma(struct intel_framebuffer *fb,
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
2.40.0

