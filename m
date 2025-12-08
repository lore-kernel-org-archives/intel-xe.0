Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A93F6D3B7F3
	for <intel-xe@archiver.kernel.org>; Mon,  8 Dec 2025 19:17:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 669A110E47F;
	Mon,  8 Dec 2025 19:17:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="bba6Ni2h";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFC2410E45B
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Dec 2025 19:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+zo8xszJjoGMB7Mo+TfixxS1ddhXt3KpKpDzT5eLCLc=; b=bba6Ni2hp4hXKAEsxyAOYwgB3r
 vFbpHtogR6rShceWOyFWu27aUwlaUflC9nQHqs2iJnwmQMUhjDpLlZy1CCzLCvWVdhYRlVD43NyZr
 CmC242BA4fk08or6VzuiFMy+ePbDINNUt56r11KjuSqwYq5Wn+AyWhtQG00c2sQOD9UW05wumzeG3
 5TQ0uEXtDpZCh8csgsNuYKTB30VX+D5malyihEoKv6G2Zcp30zTXMKeA4e2ysesadYs+EFbWk0ViA
 pkSAYxfjPoqXUFB/P096vXISmxIULyesITPsteCGRTWg8+ZviMctlyUZOsRUON4QhNWLTOV0FBXpx
 gWF8PMyA==;
Received: from [86.33.28.86] (helo=localhost)
 by fanzine2.igalia.com with utf8esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vSgjm-00AC7m-0R; Mon, 08 Dec 2025 20:17:34 +0100
From: Tvrtko Ursulin <tursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v15 07/10] drm/xe: Do not use stolen memory for DPT on IGFX
 and AuxCCS
Date: Mon,  8 Dec 2025 20:17:18 +0100
Message-ID: <20251208191722.7194-8-tursulin@igalia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251208191722.7194-1-tursulin@igalia.com>
References: <20251208191722.7194-1-tursulin@igalia.com>
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

From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

With DPT in stolen memory there are occasional pipe crc IGT failures in
tests such as kms_flip_tiling. Allocate a normal system memory object
instead.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index 89ee68c40329..ce9750da57e7 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -80,6 +80,20 @@ write_dpt_remapped(struct xe_bo *bo, struct iosys_map *map, u32 *dpt_ofs,
 	*dpt_ofs = ALIGN(*dpt_ofs, 4096);
 }
 
+static bool try_dpt_stolen(const struct intel_framebuffer *fb, struct xe_bo *bo)
+{
+	/*
+	 * XXX: DPT in stolen memory on IGFX platforms (at least Alderlake)
+	 * suffers from occasional pipe crc IGT failures in tests such as
+	 * kms_flip_tiling.
+	 */
+	if (intel_fb_is_ccs_modifier(fb->base.modifier) &&
+	    !xe_bo_is_vram(bo) && !xe_bo_is_stolen(bo))
+		return false;
+
+	return true;
+}
+
 static int __xe_pin_fb_vma_dpt(const struct intel_framebuffer *fb,
 			       const struct i915_gtt_view *view,
 			       struct i915_vma *vma,
@@ -89,7 +103,7 @@ static int __xe_pin_fb_vma_dpt(const struct intel_framebuffer *fb,
 	struct xe_tile *tile0 = xe_device_get_root_tile(xe);
 	struct xe_ggtt *ggtt = tile0->mem.ggtt;
 	struct drm_gem_object *obj = intel_fb_bo(&fb->base);
-	struct xe_bo *bo = gem_to_xe_bo(obj), *dpt;
+	struct xe_bo *bo = gem_to_xe_bo(obj), *dpt = ERR_PTR(-EINVAL);
 	u32 dpt_size, size = bo->ttm.base.size;
 
 	if (view->type == I915_GTT_VIEW_NORMAL)
@@ -110,7 +124,7 @@ static int __xe_pin_fb_vma_dpt(const struct intel_framebuffer *fb,
 						   XE_BO_FLAG_GGTT |
 						   XE_BO_FLAG_PAGETABLE,
 						   alignment, false);
-	else
+	else if (try_dpt_stolen(fb, bo))
 		dpt = xe_bo_create_pin_map_at_novm(xe, tile0,
 						   dpt_size,  ~0ull,
 						   ttm_bo_type_kernel,
-- 
2.52.0

