Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86CB3CA0EFE
	for <intel-xe@archiver.kernel.org>; Wed, 20 Aug 2025 09:19:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4237C10E6C8;
	Wed, 20 Aug 2025 09:19:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="eCAsuOps";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BA9610E365
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Aug 2025 09:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MiSIN4RoJrkoz/MqDuHFaylT5DpKZHQT9k+X51XcvUU=; b=eCAsuOpsOxe72O2PXW6/kb4vHI
 0p7s0xu7psSN5xsS1PvYicu461mNlKdC3R69rHwqci5qWf/LFA8xaqjg907LFWq2qdRlf/+bwMMch
 dIxuyGRYE3Um1RK/mEkTIcZjjNSQq3wzlVjqDw+/8AUSgCevxpHUd2q/rXM80LUK40v8BXQDzNYXh
 JH6hVtaRo2wPV1UT3voEY52ES3E9UpsnVqqgPXCOI7HOJWsiHrH6G11izoV9HX95GYYFeyV4WUgwa
 OqhKFnydb8uVlwdIuMyNRAUBeqQyYzTEMCeB2liJWAKKn2lXbxbXzPJ7NTK5tIOSRiqg6rNg9YB09
 zTftdZow==;
Received: from [84.66.36.92] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uoeyY-00GhXW-FC
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Aug 2025 11:19:22 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 11/13] drm/xe: Force flush system memory AuxCCS framebuffers
 before scan out
Date: Wed, 20 Aug 2025 10:19:10 +0100
Message-ID: <20250820091913.18588-12-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250820091913.18588-1-tvrtko.ursulin@igalia.com>
References: <20250820091913.18588-1-tvrtko.ursulin@igalia.com>
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
 drivers/gpu/drm/xe/display/xe_fb_pin.c | 12 ++++++++++++
 drivers/gpu/drm/xe/xe_bo_types.h       | 14 +++++++++-----
 2 files changed, 21 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index 658541422f44..dc912864407e 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -380,6 +380,7 @@ static struct i915_vma *__xe_pin_fb_vma(const struct intel_framebuffer *fb,
 	struct i915_vma *vma = kzalloc(sizeof(*vma), GFP_KERNEL);
 	struct drm_gem_object *obj = intel_fb_bo(&fb->base);
 	struct xe_bo *bo = gem_to_xe_bo(obj);
+	bool first_pin;
 	int ret;
 
 	if (!vma)
@@ -411,6 +412,9 @@ static struct i915_vma *__xe_pin_fb_vma(const struct intel_framebuffer *fb,
 	if (ret)
 		goto err;
 
+	first_pin = !bo->display_pin;
+	bo->display_pin = true;
+
 	if (IS_DGFX(xe))
 		ret = xe_bo_migrate(bo, XE_PL_VRAM0);
 	else
@@ -429,6 +433,14 @@ static struct i915_vma *__xe_pin_fb_vma(const struct intel_framebuffer *fb,
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

