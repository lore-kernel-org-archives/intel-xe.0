Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F8DFCAC5A7
	for <intel-xe@archiver.kernel.org>; Tue, 23 Sep 2025 10:08:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E438410E5DB;
	Tue, 23 Sep 2025 10:08:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="fHLjClNh";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35FD910E5DB
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Sep 2025 10:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=A1JupZDskVvNWtM+Go8GigVSEmYLqKgYlZjFdYLWvCU=; b=fHLjClNhCbviFpbJfGz2pXxuD1
 E1jB5Lxyzcc/a+orjjZDhe8FEmuU+zwEoy55NGqRiISu8gCcX2pFnCM7kU6sEpqeDSlsj/PoG5lmb
 zH1OkhDPCXdZE0gUAOf0L2zbD2JKxDucKctEVJtLPjAJbJYVdAARB9rvO1XQU9cX9X0Vg01ojZoPN
 xYpvG47pKO3pNABmeYjqALFYEU7MXbICGBpqbj+B+oof5V1IC1hYKmnHNpPmIV0r3anRcDo96SuG2
 5VX3AFECGOmI+QwCiZboej0umEpYlMEPm65J7y3IOE2fY99s3yXDOIcmaqeIIesnaBBVuAojF92k+
 e8dPclJg==;
Received: from [84.66.36.92] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1v0zwc-00GDFk-GU; Tue, 23 Sep 2025 12:08:22 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Cc: kernel-dev@igalia.com,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH v12 11/13] drm/xe: Force flush system memory AuxCCS
 framebuffers before scan out
Date: Tue, 23 Sep 2025 11:08:04 +0100
Message-ID: <20250923100812.88257-12-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250923100812.88257-1-tvrtko.ursulin@igalia.com>
References: <20250923100812.88257-1-tvrtko.ursulin@igalia.com>
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
 drivers/gpu/drm/xe/display/xe_fb_pin.c | 14 +++++++++++++-
 drivers/gpu/drm/xe/xe_bo_types.h       | 14 +++++++++-----
 2 files changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index d8aa23b8cf14..f247c0da6b9e 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -382,6 +382,7 @@ static struct i915_vma *__xe_pin_fb_vma(const struct intel_framebuffer *fb,
 	struct xe_bo *bo = gem_to_xe_bo(obj);
 	struct xe_validation_ctx ctx;
 	struct drm_exec exec;
+	bool first_pin;
 	int ret = 0;
 
 	if (!vma)
@@ -422,8 +423,11 @@ static struct i915_vma *__xe_pin_fb_vma(const struct intel_framebuffer *fb,
 			ret = xe_bo_validate(bo, NULL, true, &exec);
 		drm_exec_retry_on_contention(&exec);
 		xe_validation_retry_on_oom(&ctx, &ret);
-		if (!ret)
+		if (!ret) {
 			ttm_bo_pin(&bo->ttm);
+			first_pin = !bo->display_pin;
+			bo->display_pin = true;
+		}
 	}
 	if (ret)
 		goto err;
@@ -436,6 +440,14 @@ static struct i915_vma *__xe_pin_fb_vma(const struct intel_framebuffer *fb,
 	if (ret)
 		goto err_unpin;
 
+	/*
+	 * Force flush frame buffer data for non-coherent display access when
+	 * AuxCCS formats are used.
+	 */
+	if (first_pin && !xe_bo_is_vram(bo) && !xe_bo_is_stolen(bo) &&
+	    intel_fb_is_ccs_modifier(fb->base.modifier))
+		drm_clflush_sg(xe_bo_sg(bo));
+
 	return vma;
 
 err_unpin:
diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
index d4fe3c8dca5b..8119d8d6d174 100644
--- a/drivers/gpu/drm/xe/xe_bo_types.h
+++ b/drivers/gpu/drm/xe/xe_bo_types.h
@@ -81,11 +81,6 @@ struct xe_bo {
 	struct llist_node freed;
 	/** @update_index: Update index if PT BO */
 	int update_index;
-	/** @created: Whether the bo has passed initial creation */
-	bool created;
-
-	/** @ccs_cleared: true means that CCS region of BO is already cleared */
-	bool ccs_cleared;
 
 	/** @bb_ccs: BB instructions of CCS read/write. Valid only for VF */
 	struct xe_bb *bb_ccs[XE_SRIOV_VF_CCS_CTX_COUNT];
@@ -100,6 +95,15 @@ struct xe_bo {
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

