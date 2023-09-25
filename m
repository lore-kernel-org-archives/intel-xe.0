Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44CF2E7D0B1
	for <intel-xe@archiver.kernel.org>; Mon, 25 Sep 2023 22:11:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FDCB10E33B;
	Mon, 25 Sep 2023 22:11:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADE6F10E337
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Sep 2023 22:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695679890; x=1727215890;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Kl45n6vLBbAqrrv1sIE7rdG4rSGqS9CuFBNH18f+F6Q=;
 b=E8E8to5IRL2F8tww5aHE40sL7JaxQIHEqTKJhLTVkWzF/NbUIaDPZjAX
 T8WPVu6weROjHgeR0JRpWXiLyifi07jgtXiiM56X9kN8ZAGBgvzUz3J+5
 ERHoE051yG9IZAx3aIxOzMb7BA1ole9eOK0vREHPr9VIui5uGmYwLuE+u
 Z8QxpL88o8+Mb+mE1/g+hRbgUt5yD8VYb3tskYDnQ/BE35C5+exrxNwFD
 K6Fbw8Wkzdu/ROTA0zd3QVz0Rkr3hjKtZjJp9H4q9dHV/SkXkSz0vaoq8
 /JOsShkVaD4U5EFAEEfLURhbWJ8KJQQoEPe2EdSt7MrZ06lmqksQ+sNUE A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="412333012"
X-IronPort-AV: E=Sophos;i="6.03,176,1694761200"; d="scan'208";a="412333012"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 15:11:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="742087770"
X-IronPort-AV: E=Sophos;i="6.03,176,1694761200"; d="scan'208";a="742087770"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 15:11:12 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 25 Sep 2023 15:10:49 -0700
Message-Id: <20230925221049.2681491-10-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230925221049.2681491-1-lucas.demarchi@intel.com>
References: <20230925221049.2681491-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 9/9] fixup! drm/xe/display: Implement display
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Fix build break due to previous commit. Squash on "Implement display
support" to be moved above the previous commit.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c | 32 ++++++++++++++++++--------
 1 file changed, 23 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index 3422942a9951..b7a04fba3585 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -17,7 +17,10 @@ static void
 write_dpt_rotated(struct xe_bo *bo, struct iosys_map *map, u32 *dpt_ofs, u32 bo_ofs,
 		  u32 width, u32 height, u32 src_stride, u32 dst_stride)
 {
+	struct xe_device *xe = xe_bo_device(bo);
+	struct xe_ggtt *ggtt = xe_device_get_root_tile(xe)->mem.ggtt;
 	u32 column, row;
+
 	/* TODO: Maybe rewrite so we can traverse the bo addresses sequentially,
 	 * by writing dpt/ggtt in a different order?
 	 */
@@ -26,8 +29,10 @@ write_dpt_rotated(struct xe_bo *bo, struct iosys_map *map, u32 *dpt_ofs, u32 bo_
 		u32 src_idx = src_stride * (height - 1) + column + bo_ofs;
 
 		for (row = 0; row < height; row++) {
-			iosys_map_wr(map, *dpt_ofs, u64,
-				     xe_ggtt_pte_encode(bo, src_idx * XE_PAGE_SIZE));
+			u64 pte = ggtt->pt_ops->pte_encode_bo(bo, src_idx * XE_PAGE_SIZE,
+							      XE_CACHE_WB);
+
+			iosys_map_wr(map, *dpt_ofs, u64, pte);
 			*dpt_ofs += 8;
 			src_idx -= src_stride;
 		}
@@ -46,6 +51,7 @@ static int __xe_pin_fb_vma_dpt(struct intel_framebuffer *fb,
 {
 	struct xe_device *xe = to_xe_device(fb->base.dev);
 	struct xe_tile *tile0 = xe_device_get_root_tile(xe);
+	struct xe_ggtt *ggtt = tile0->mem.ggtt;
 	struct xe_bo *bo = intel_fb_obj(&fb->base), *dpt;
 	u32 dpt_size, size = bo->ttm.base.size;
 
@@ -76,9 +82,12 @@ static int __xe_pin_fb_vma_dpt(struct intel_framebuffer *fb,
 	if (view->type == I915_GTT_VIEW_NORMAL) {
 		u32 x;
 
-		for (x = 0; x < size / XE_PAGE_SIZE; x++)
-			iosys_map_wr(&dpt->vmap, x * 8, u64,
-				     xe_ggtt_pte_encode(bo, x * XE_PAGE_SIZE));
+		for (x = 0; x < size / XE_PAGE_SIZE; x++) {
+			u64 pte = ggtt->pt_ops->pte_encode_bo(bo, x * XE_PAGE_SIZE,
+							      XE_CACHE_WB);
+
+			iosys_map_wr(&dpt->vmap, x * 8, u64, pte);
+		}
 	} else {
 		const struct intel_rotation_info *rot_info = &view->rotated;
 		u32 i, dpt_ofs = 0;
@@ -107,8 +116,10 @@ write_ggtt_rotated(struct xe_bo *bo, struct xe_ggtt *ggtt, u32 *ggtt_ofs, u32 bo
 		u32 src_idx = src_stride * (height - 1) + column + bo_ofs;
 
 		for (row = 0; row < height; row++) {
-			xe_ggtt_set_pte(ggtt, *ggtt_ofs,
-					xe_ggtt_pte_encode(bo, src_idx * XE_PAGE_SIZE));
+			u64 pte = ggtt->pt_ops->pte_encode_bo(bo, src_idx * XE_PAGE_SIZE,
+							      XE_CACHE_WB);
+
+			xe_ggtt_set_pte(ggtt, *ggtt_ofs, pte);
 			*ggtt_ofs += XE_PAGE_SIZE;
 			src_idx -= src_stride;
 		}
@@ -150,8 +161,11 @@ static int __xe_pin_fb_vma_ggtt(struct intel_framebuffer *fb,
 		if (ret)
 			goto out_unlock;
 
-		for (x = 0; x < size; x += XE_PAGE_SIZE)
-			xe_ggtt_set_pte(ggtt, vma->node.start + x, xe_ggtt_pte_encode(bo, x));
+		for (x = 0; x < size; x += XE_PAGE_SIZE) {
+			u64 pte = ggtt->pt_ops->pte_encode_bo(bo, x, XE_CACHE_WB);
+
+			xe_ggtt_set_pte(ggtt, vma->node.start + x, pte);
+		}
 	} else {
 		u32 i, ggtt_ofs;
 		const struct intel_rotation_info *rot_info = &view->rotated;
-- 
2.40.1

