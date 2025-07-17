Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34891C83F3B
	for <intel-xe@archiver.kernel.org>; Thu, 17 Jul 2025 21:52:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBE0E10E8AD;
	Thu, 17 Jul 2025 21:52:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="cdfvUjoY";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D703510E8B2
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Jul 2025 21:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9lhYhMxKg/BZfAxb/mzQbrPjtJua7nnIn9lpwgiroQU=; b=cdfvUjoYO8RNQ2wUpNn17Ep65Z
 5BYRCWw9x4cOezG0Bf9IgmlLaN4omb4WcHpYEVf3KlIEz7fh0AuVDZ+FqY4vZInMgXVQiT2Nl+/uv
 CG2c/xNeNcRWdjYLkNnO9XCfupy2aFEgCEg/txXYPz6U6qdvFMWeD96cwb9Qyy3NmQNZYlwPIw+Fa
 EpCoP9tCrzuVDZoxtqSm9acUODlFJ1aYym0R3HKVOFvLl2G+9qVKMbfDBNLmskvB8WXfu1rDufJ3P
 XotN86NA+sFoHNcOtiBLYMgoiQ2VJED186623zUGsd/RlOaSrZ7Uz+KBoP1yFpF8Li03xobpikbLC
 6fPB7NyA==;
Received: from [84.66.36.92] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1ucWWw-000Jrw-69
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Jul 2025 23:52:42 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 17/17] always flush
Date: Thu, 17 Jul 2025 22:52:27 +0100
Message-ID: <20250717215229.88140-18-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250717215229.88140-1-tvrtko.ursulin@igalia.com>
References: <20250717215229.88140-1-tvrtko.ursulin@igalia.com>
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

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index 58e3cf5151bd..9d539238e786 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -381,7 +381,6 @@ static struct i915_vma *__xe_pin_fb_vma(const struct intel_framebuffer *fb,
 	struct i915_vma *vma = kzalloc(sizeof(*vma), GFP_KERNEL);
 	struct drm_gem_object *obj = intel_fb_bo(&fb->base);
 	struct xe_bo *bo = gem_to_xe_bo(obj);
-	bool first_pin;
 	int ret;
 
 	if (!vma)
@@ -413,7 +412,6 @@ static struct i915_vma *__xe_pin_fb_vma(const struct intel_framebuffer *fb,
 	if (ret)
 		goto err;
 
-	first_pin = !bo->display_pin;
 	bo->display_pin = true;
 
 	if (IS_DGFX(xe))
@@ -438,9 +436,8 @@ static struct i915_vma *__xe_pin_fb_vma(const struct intel_framebuffer *fb,
 	 * Force flush frame buffer data for non-coherent display access when
 	 * AuxCCS formats are used.
 	 */
-	if (first_pin && !xe_bo_is_vram(bo) && !xe_bo_is_stolen(bo) &&
-	    intel_fb_is_ccs_modifier(fb->base.modifier))
-		drm_clflush_sg(xe_bo_sg(bo));
+	if (!xe_bo_is_vram(bo) && !xe_bo_is_stolen(bo))
+	    drm_clflush_sg(xe_bo_sg(bo));
 
 	return vma;
 
-- 
2.48.0

