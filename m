Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22F5FC3ABD8
	for <intel-xe@archiver.kernel.org>; Wed, 14 May 2025 13:39:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD7A210E649;
	Wed, 14 May 2025 13:39:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="PY+DFUEx";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E17A10E644
 for <intel-xe@lists.freedesktop.org>; Wed, 14 May 2025 13:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OZnMwfqTj3YxvocRBuGz5WXkSmLPYahmv4g3wB+FyA4=; b=PY+DFUExJfDCtWO1264j151JHx
 e3LSGb2XpadUZkg5Armjsvl3ZTwvDo/FxnEn2buSI86WH2xKhpRbZc/bN41M2eMPKLmnMUt8NwwbV
 SKMqdC0a43WQs2spoIgWlQ5h/LbRJvur4RivCsat50T3vdH5mCFgKGfVTCLXiYa6+srjk9y7ZA2Oi
 SJl75bGIZeSw78RUKprNV8sg1AzqGBNLAd1ExdO8sYGQKaq29fVraA2HxyNU1zBZE85eIfK3n+eTW
 B/gASD7LIsd3M3yNkpV8TS47IrTgym9v9kaXJAozd8Enr5U+Ul6nMFkaZxAeDVF7JvM7KlO5MuvJA
 awYLkiUg==;
Received: from [81.79.92.254] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uFCEp-008AbS-31; Wed, 14 May 2025 15:39:20 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Cc: kernel-dev@igalia.com,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH v6 17/19] drm/xe: Force flush system memory AuxCCS
 framebuffers before scan out
Date: Wed, 14 May 2025 14:38:59 +0100
Message-ID: <20250514133904.12131-18-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250514133904.12131-1-tvrtko.ursulin@igalia.com>
References: <20250514133904.12131-1-tvrtko.ursulin@igalia.com>
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
 drivers/gpu/drm/xe/display/xe_fb_pin.c | 13 +++++++++++++
 drivers/gpu/drm/xe/xe_bo_types.h       | 14 +++++++++-----
 2 files changed, 22 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index cf22c9a84db3..55d52ff65c2a 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -332,6 +332,7 @@ static struct i915_vma *__xe_pin_fb_vma(const struct intel_framebuffer *fb,
 	struct i915_vma *vma = kzalloc(sizeof(*vma), GFP_KERNEL);
 	struct drm_gem_object *obj = intel_fb_bo(&fb->base);
 	struct xe_bo *bo = gem_to_xe_bo(obj);
+	bool first_pin;
 	int ret;
 
 	if (!vma)
@@ -363,6 +364,9 @@ static struct i915_vma *__xe_pin_fb_vma(const struct intel_framebuffer *fb,
 	if (ret)
 		goto err;
 
+	first_pin = !bo->display_pin;
+	bo->display_pin = true;
+
 	if (IS_DGFX(xe))
 		ret = xe_bo_migrate(bo, XE_PL_VRAM0);
 	else
@@ -383,6 +387,15 @@ static struct i915_vma *__xe_pin_fb_vma(const struct intel_framebuffer *fb,
 
 	/* Ensure DPT writes are flushed */
 	xe_device_l2_flush(xe);
+
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
index eb5e83c5f233..b54295a6137d 100644
--- a/drivers/gpu/drm/xe/xe_bo_types.h
+++ b/drivers/gpu/drm/xe/xe_bo_types.h
@@ -72,11 +72,6 @@ struct xe_bo {
 	struct llist_node freed;
 	/** @update_index: Update index if PT BO */
 	int update_index;
-	/** @created: Whether the bo has passed initial creation */
-	bool created;
-
-	/** @ccs_cleared */
-	bool ccs_cleared;
 
 	/**
 	 * @cpu_caching: CPU caching mode. Currently only used for userspace
@@ -88,6 +83,15 @@ struct xe_bo {
 	/** @devmem_allocation: SVM device memory allocation */
 	struct drm_gpusvm_devmem devmem_allocation;
 
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

