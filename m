Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C105CC282EC
	for <intel-xe@archiver.kernel.org>; Tue, 18 Mar 2025 16:22:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77F2D10E4B1;
	Tue, 18 Mar 2025 16:22:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="RwYrFQ7I";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2636F10E4B2
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Mar 2025 16:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=84hAp15U2L2m5U1FxfzK9ldfV4WZIjA1o+1nImYzToQ=; b=RwYrFQ7InPDNZOdVMrz0EOyIvl
 v8BfBdgXv9u07ZMMi+gMlvKdXxoXgXYi07eLyFtBE54MHxVzXQI8AFq9MpM1Rg9N4Ym20/mlXqj31
 Krf+yIdwoZXIikGo8DB+UICwve4x79Ui6J8qkJRKRoMY/cw1xOSzQh3cJiYsmY1BgYyr5jX0qKpbz
 HVVqJ9qAQ2wGvE+ci/WR0p2zI+CoAQNgMANY7dBQ5o83yWsdLAs5SttWNCSXjb5USkYd5vlY6pR3v
 9LiKLb3eLerbKutGFB0T373jVBgwzj4di/1G2VCIa8zLQdOKsNDeqNdxlf2AU1xcbbd9PkDC4VEMl
 1F3YrgEg==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tuZi5-002odO-EQ; Tue, 18 Mar 2025 17:22:33 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Maarten Lankhort <maarten.lankhorst@linux.intel.com>
Subject: [PATCH v3 2/8] drm/xe: Use fb cached min alignment
Date: Tue, 18 Mar 2025 16:22:17 +0000
Message-ID: <20250318162224.78846-3-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250318162224.78846-1-tvrtko.ursulin@igalia.com>
References: <20250318162224.78846-1-tvrtko.ursulin@igalia.com>
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

Instead of just looking at the first plane use the fb cached overall
minimum alignment.

This aligns with how the i915 version of intel_plane_pin_fb works.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Maarten Lankhort <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index d918ae1c8061..1538e2b02f89 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -417,12 +417,9 @@ int intel_plane_pin_fb(struct intel_plane_state *new_plane_state,
 		       const struct intel_plane_state *old_plane_state)
 {
 	struct drm_framebuffer *fb = new_plane_state->hw.fb;
-	struct drm_gem_object *obj = intel_fb_bo(fb);
-	struct xe_bo *bo = gem_to_xe_bo(obj);
-	struct i915_vma *vma;
 	struct intel_framebuffer *intel_fb = to_intel_framebuffer(fb);
-	struct intel_plane *plane = to_intel_plane(new_plane_state->uapi.plane);
-	unsigned int alignment = plane->min_alignment(plane, fb, 0);
+	struct xe_bo *bo = gem_to_xe_bo(intel_fb_bo(fb));
+	struct i915_vma *vma;
 
 	if (reuse_vma(new_plane_state, old_plane_state))
 		return 0;
@@ -430,8 +427,8 @@ int intel_plane_pin_fb(struct intel_plane_state *new_plane_state,
 	/* We reject creating !SCANOUT fb's, so this is weird.. */
 	drm_WARN_ON(bo->ttm.base.dev, !(bo->flags & XE_BO_FLAG_SCANOUT));
 
-	vma = __xe_pin_fb_vma(intel_fb, &new_plane_state->view.gtt, alignment);
-
+	vma = __xe_pin_fb_vma(intel_fb, &new_plane_state->view.gtt,
+			      intel_fb->min_alignment);
 	if (IS_ERR(vma))
 		return PTR_ERR(vma);
 
-- 
2.48.0

