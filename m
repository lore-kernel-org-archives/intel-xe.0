Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95005D0D17E
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jan 2026 10:34:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37A3110E6EA;
	Thu,  8 Jan 2026 10:34:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="ZyTsQXFv";
	dkim-atps=neutral
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0971310E125
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Jan 2026 10:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1767868455;
 bh=FLpLmAicEeA/j546lvLHwDyorACZC9qdNDFFQaucEGE=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=ZyTsQXFvts1BqJ6g0xd2PHjtuXeCq5eV4ZsPvItZpd/vVFGXcqxfDeqJpKr8betCp
 Hnn95N0cLNLnNOzAP1EDaiBNYyDbykQSZQz+9G2/lQnsDmw8GgVn/Q0jCqNTaowRIS
 hnxmO7tL3HqSKRfaGNFzguKsyFw30XQzwUYNXeXlIWYBjLIwlyfJml7YPS+2cWaAfQ
 9Q60P/Rt/J/7MMRveoJs8Un7bVhq8FCD5taYt0OkXFE20NOSAN+p9j15vCGuQRzFyA
 /MyCRrKzDklkI+GNaPIbpTEI04o0Hi5OKoV4mPdeKidUQscp6Z5mkrsiXndFyHfQtR
 EHK38kDkSIv7w==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Subject: [FOR-CI-DO-NOT-REVIEW 04/12] drm/xe/display: Avoid dereferencing
 xe_ggtt_node
Date: Thu,  8 Jan 2026 11:34:07 +0100
Message-ID: <20260108103412.637731-5-dev@lankhorst.se>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260108103412.637731-1-dev@lankhorst.se>
References: <20260108103412.637731-1-dev@lankhorst.se>
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

Start using xe_ggtt_node_addr, and avoid comparing the base offset
as vma->node is dynamically allocated.

Also sneak in a xe_bo_size() for stolen, too small to put as separate commit.

Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h | 4 ++--
 drivers/gpu/drm/xe/display/xe_fb_pin.c            | 4 ++--
 drivers/gpu/drm/xe/display/xe_stolen.c            | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h
index b17e3bab23d58..c4b5adaaa99a3 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h
@@ -8,7 +8,7 @@
 
 #include <uapi/drm/i915_drm.h>
 
-#include "xe_ggtt_types.h"
+#include "xe_ggtt.h"
 
 #include <linux/refcount.h>
 
@@ -30,7 +30,7 @@ struct i915_vma {
 
 static inline u32 i915_ggtt_offset(const struct i915_vma *vma)
 {
-	return vma->node->base.start;
+	return xe_ggtt_node_addr(vma->node);
 }
 
 #endif
diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index a1cd42001f442..d2c4e94180fa3 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -206,7 +206,7 @@ static void write_ggtt_rotated_node(struct xe_ggtt *ggtt, struct xe_ggtt_node *n
 	struct fb_rotate_args *args = data;
 	struct xe_bo *bo = args->bo;
 	const struct intel_rotation_info *rot_info = &args->view->rotated;
-	u32 ggtt_ofs = node->base.start;
+	u32 ggtt_ofs = xe_ggtt_node_addr(node);
 
 	for (u32 i = 0; i < ARRAY_SIZE(rot_info->plane); i++)
 		write_ggtt_rotated(ggtt, &ggtt_ofs, pte_flags, write_pte,
@@ -353,7 +353,7 @@ static void __xe_unpin_fb_vma(struct i915_vma *vma)
 	if (vma->dpt)
 		xe_bo_unpin_map_no_vm(vma->dpt);
 	else if (!xe_ggtt_node_allocated(vma->bo->ggtt_node[tile_id]) ||
-		 vma->bo->ggtt_node[tile_id]->base.start != vma->node->base.start)
+		 vma->bo->ggtt_node[tile_id] != vma->node)
 		xe_ggtt_node_remove(vma->node, false);
 
 	ttm_bo_reserve(&vma->bo->ttm, false, false, NULL);
diff --git a/drivers/gpu/drm/xe/display/xe_stolen.c b/drivers/gpu/drm/xe/display/xe_stolen.c
index 12771709183ad..8dc2f86ec6023 100644
--- a/drivers/gpu/drm/xe/display/xe_stolen.c
+++ b/drivers/gpu/drm/xe/display/xe_stolen.c
@@ -78,7 +78,7 @@ static u64 xe_stolen_node_address(const struct intel_stolen_node *node)
 
 static u64 xe_stolen_node_size(const struct intel_stolen_node *node)
 {
-	return node->bo->ttm.base.size;
+	return xe_bo_size(node->bo);
 }
 
 static struct intel_stolen_node *xe_stolen_node_alloc(struct drm_device *drm)
-- 
2.51.0

