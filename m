Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E505CCA0EF2
	for <intel-xe@archiver.kernel.org>; Mon, 18 Aug 2025 14:07:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FABB10E460;
	Mon, 18 Aug 2025 14:07:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="HklYdzno";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA11A10E456
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Aug 2025 14:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NlC3y8Ca4UvEvHgK/Bs8+0VGPJ4LsWoMkhDge9y+la8=; b=HklYdznoygwy3yAuhNE5lETwLM
 tFqP282UtUB/B49zdwR5y2gUopDI5wkAB981Uzk4yrMvRY8CMIKmOq/paHQsBLv/EsXjdUwg+R6I1
 gJEQ9m+JBD2SLhrNOSIimT5g8MthOf4qIouFjT6ilJOHfttamLsdOgA5CWPiWXwsVpnQGtn1ZcMbc
 KUxjeVWD+OpGSDJAGIgzM+8l72u+yXKlBoNvMYa9JMZkZZI7Ioze6/FgRxQsrzgoABSqXNg14WMul
 Lviq2xT2PfSoX3W7laFQDKS/QJErfyiWk638K7fkj01pDdzQIBjtod+qOpg2TYgpxLiDGApHjWjQ8
 Y6OiiXYQ==;
Received: from [84.66.36.92] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uo0Vq-00Fs0n-3Y
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Aug 2025 16:07:02 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 11/14] drm/xe: Force flush system memory AuxCCS data before scan
 out
Date: Mon, 18 Aug 2025 15:06:47 +0100
Message-ID: <20250818140653.86787-12-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250818140653.86787-1-tvrtko.ursulin@igalia.com>
References: <20250818140653.86787-1-tvrtko.ursulin@igalia.com>
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

Even though frame buffer objects are created as write-combined, in
practice, on top of all the ring buffer flushing, an additional clflush
seems to be needed before display engine can coherently scan out the
AuxCCS compressed data without transient artifacts.

If for comparison we look at how i915 handles things (where AuxCCS works
fine), as it happens it has this same clflush before a frame buffer is
pinned for display for the first time, courtesy the dynamic tracking of
the buffer cache mode and setting the latter to uncached before handing
to display.

Since xe considers the buffer object caching mode as static we can
implement the same approach by adding a flag telling us if the buffer
was ever pinned for display and flush on the first pin. Subsequent re-pins
will not repeat the clflush but so far I have not observed any glitching
after the first pin.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c | 53 ++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_bo_types.h       | 14 ++++---
 2 files changed, 62 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index 658541422f44..bf600cad0284 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -371,6 +371,46 @@ static int __xe_pin_fb_vma_ggtt(const struct intel_framebuffer *fb,
 	return ret;
 }
 
+static void xe_bo_clflush_auxccs(struct xe_bo *bo,
+				 const struct i915_gtt_view *view)
+{
+	const struct intel_remapped_info *remap_info = &view->remapped;
+	unsigned int i;
+
+	if (!IS_ENABLED(CONFIG_X86))
+		return;
+
+	if (!static_cpu_has(X86_FEATURE_CLFLUSH))
+		return;
+
+	for (i = 0; i < ARRAY_SIZE(remap_info->plane); i++) {
+		const struct intel_remapped_plane_info *plane =
+						&remap_info->plane[i];
+		const int size = boot_cpu_data.x86_clflush_size;
+		struct sg_table *st = xe_bo_sg(bo);
+		struct sg_page_iter sg_iter;
+
+		if (!plane->width && !plane->height && !plane->linear)
+			continue;
+
+		if (!plane->linear)
+			continue;
+
+		mb();
+		for_each_sgtable_page(st, &sg_iter, plane->offset) {
+			struct page *page = sg_page_iter_page(&sg_iter);
+			uint8_t *page_virtual;
+			unsigned int j;
+
+			page_virtual = kmap_local_page(page);
+			for (j = 0; j < PAGE_SIZE; j += size)
+				clflushopt(page_virtual + j);
+			kunmap_local(page_virtual);
+		}
+		mb();
+	}
+}
+
 static struct i915_vma *__xe_pin_fb_vma(const struct intel_framebuffer *fb,
 					const struct i915_gtt_view *view,
 					unsigned int alignment)
@@ -380,6 +420,7 @@ static struct i915_vma *__xe_pin_fb_vma(const struct intel_framebuffer *fb,
 	struct i915_vma *vma = kzalloc(sizeof(*vma), GFP_KERNEL);
 	struct drm_gem_object *obj = intel_fb_bo(&fb->base);
 	struct xe_bo *bo = gem_to_xe_bo(obj);
+	bool first_pin;
 	int ret;
 
 	if (!vma)
@@ -411,6 +452,9 @@ static struct i915_vma *__xe_pin_fb_vma(const struct intel_framebuffer *fb,
 	if (ret)
 		goto err;
 
+	first_pin = !bo->display_pin;
+	bo->display_pin = true;
+
 	if (IS_DGFX(xe))
 		ret = xe_bo_migrate(bo, XE_PL_VRAM0);
 	else
@@ -429,6 +473,15 @@ static struct i915_vma *__xe_pin_fb_vma(const struct intel_framebuffer *fb,
 	if (ret)
 		goto err_unpin;
 
+	/*
+	 * Force flush AuxCCS data for non-coherent display access.
+	 */
+	if (first_pin &&
+	    !xe_bo_is_vram(bo) && !xe_bo_is_stolen(bo) &&
+	    intel_fb_is_ccs_modifier(fb->base.modifier) &&
+	    view->type == I915_GTT_VIEW_REMAPPED)
+		xe_bo_clflush_auxccs(bo, view);
+
 	return vma;
 
 err_unpin:
diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
index cf604adc13a3..d5096f7f6f9a 100644
--- a/drivers/gpu/drm/xe/xe_bo_types.h
+++ b/drivers/gpu/drm/xe/xe_bo_types.h
@@ -71,11 +71,6 @@ struct xe_bo {
 	struct llist_node freed;
 	/** @update_index: Update index if PT BO */
 	int update_index;
-	/** @created: Whether the bo has passed initial creation */
-	bool created;
-
-	/** @ccs_cleared */
-	bool ccs_cleared;
 
 	/** @bb_ccs_rw: BB instructions of CCS read/write. Valid only for VF */
 	struct xe_bb *bb_ccs[XE_SRIOV_VF_CCS_CTX_COUNT];
@@ -90,6 +85,15 @@ struct xe_bo {
 	/** @devmem_allocation: SVM device memory allocation */
 	struct drm_pagemap_devmem devmem_allocation;
 
+	/** @created: Whether the bo has passed initial creation */
+	bool created : 1;
+
+	/** @ccs_cleared */
+	bool ccs_cleared : 1;
+
+	/** @display_pin: Was it ever pinned to display */
+	bool display_pin : 1;
+
 	/** @vram_userfault_link: Link into @mem_access.vram_userfault.list */
 		struct list_head vram_userfault_link;
 
-- 
2.48.0

