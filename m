Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B9CCCA0EEB
	for <intel-xe@archiver.kernel.org>; Thu, 21 Aug 2025 14:15:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2FF210E9AE;
	Thu, 21 Aug 2025 14:15:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="kHFy3hyw";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC3FB10E9B6
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Aug 2025 14:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SiMGK08nxJrQQwmiZeMUBZQusO/srnNMcUh9G0UQp2w=; b=kHFy3hywRl59UkNdDjVSd6zW19
 hUmQuZTarG5aCVIzDeWo66MoLxq9Vn1ARnW4kxJ47GnOsrLlbMKi0A95uLf8P2e1h/bbocwG1y3a+
 O0mM2jR1O8gvL6/lVkaHYd1+7Zs/WlE2ga9voUmZgS57k4q1L0ng9RAWcFoF4FfOgLFKOxrrhgvaX
 UekmxVLULuC38LkCnnL/0Ck5PCFuWEckhZUfLpVO7bgG4F9i4A0r2bwf96TULk7O9iIhG4Lgky9vp
 RS9lJAVxfqVZka0o9+N4Qu5s03TnHeOIQ8R7LhEMFVE0kCZjxVHLc/M9YZE/DOicc/ouTofBtKvHa
 j44ZAzbw==;
Received: from [84.66.36.92] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1up64P-00HHB6-2A; Thu, 21 Aug 2025 16:15:13 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Cc: kernel-dev@igalia.com,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH v11 12/13] drm/xe: Do not use stolen memory for DPT on IGFX
 and AuxCCS
Date: Thu, 21 Aug 2025 15:14:54 +0100
Message-ID: <20250821141458.72876-13-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250821141458.72876-1-tvrtko.ursulin@igalia.com>
References: <20250821141458.72876-1-tvrtko.ursulin@igalia.com>
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

With DPT in stolen memory there are occasional pipe crc IGT failures in
tests such as kms_flip_tiling. Allocate a normal system memory object
instead.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index dc912864407e..f605c06f3e51 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -183,6 +183,20 @@ static void ggtt_flush_writes(struct xe_ggtt *ggtt)
 	}
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
@@ -192,7 +206,7 @@ static int __xe_pin_fb_vma_dpt(const struct intel_framebuffer *fb,
 	struct xe_tile *tile0 = xe_device_get_root_tile(xe);
 	struct xe_ggtt *ggtt = tile0->mem.ggtt;
 	struct drm_gem_object *obj = intel_fb_bo(&fb->base);
-	struct xe_bo *bo = gem_to_xe_bo(obj), *dpt;
+	struct xe_bo *bo = gem_to_xe_bo(obj), *dpt = ERR_PTR(-EINVAL);
 	u32 dpt_size, size = bo->ttm.base.size;
 
 	if (view->type == I915_GTT_VIEW_NORMAL)
@@ -213,7 +227,7 @@ static int __xe_pin_fb_vma_dpt(const struct intel_framebuffer *fb,
 						      XE_BO_FLAG_GGTT |
 						      XE_BO_FLAG_PAGETABLE,
 						      alignment);
-	else
+	else if (try_dpt_stolen(fb, bo))
 		dpt = xe_bo_create_pin_map_at_aligned(xe, tile0, NULL,
 						      dpt_size,  ~0ull,
 						      ttm_bo_type_kernel,
-- 
2.48.0

