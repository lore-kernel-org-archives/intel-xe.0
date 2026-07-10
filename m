Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 922BFC44508
	for <intel-xe@archiver.kernel.org>; Fri, 10 Jul 2026 11:14:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01FFF10F84B;
	Fri, 10 Jul 2026 11:14:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="dDH4LNWI";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C115F10F87A;
 Fri, 10 Jul 2026 11:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1783682096;
 bh=puNEFq/vgUL5AClDAG8HJvqijCJH00dnnk6QrChIzrw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dDH4LNWI/DLSqOazCxCu+qO54jIzYRnd70Deq/FKbFZk/vZCQIk/yIR3xsws7zOny
 vzeaGYFBT5ZhaAZfXkV8Ww3j7UKYJ+ruEQ8SuJwN2tfsoIUDx8qITlLFzcm+8Q3D2f
 NSvPSgxc0smi5NQrsQZOV/8V0wdr7uZIOBsTirWR2OHgm5h9XTu6rVWXI0jVFVsE5Y
 hlEPQ4HQeITgxd4uQXvOrlAIBPj6GzjGnT6Cxtn4oFQQRemHHdT3vgpwNltWoP/tg5
 +O7oi10RjsvfWvgS+3jw/4087z8EpM5ytBbePaP/Pk/ydPq/CmcmVJsti+NbUFBvWg
 Jw6f8/VcmqFFg==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>, Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH v2 02/11] drm/i915/fbdev: Extract bios_fb_ok()
Date: Fri, 10 Jul 2026 13:15:29 +0200
Message-ID: <20260710111539.1274555-3-dev@lankhorst.se>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260710111539.1274555-1-dev@lankhorst.se>
References: <20260710111539.1274555-1-dev@lankhorst.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Pull the "is the BIOS FB OK?" checks to a helper function. We'll
add other relevant checks there later.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Link: https://patch.msgid.link/20260511214122.8468-3-ville.syrjala@linux.intel.com
Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/i915/display/intel_fbdev.c | 26 +++++++++++++++-------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
index c8d4e3a5ce6b1..bc267776106e8 100644
--- a/drivers/gpu/drm/i915/display/intel_fbdev.c
+++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
@@ -262,6 +262,23 @@ __intel_fbdev_fb_alloc(struct intel_display *display,
 
 }
 
+static bool bios_fb_ok(const struct intel_framebuffer *fb,
+		       const struct drm_fb_helper_surface_size *sizes)
+{
+	struct intel_display *display = to_intel_display(fb->base.dev);
+	int width = fb->base.width;
+	int height = fb->base.height;
+
+	if (sizes->fb_width > width || sizes->fb_height > height) {
+		drm_dbg_kms(display->drm,
+			    "BIOS fb too small (%dx%d), we require (%dx%d), releasing it\n",
+			    width, height, sizes->fb_width, sizes->fb_height);
+		return false;
+	}
+
+	return true;
+}
+
 int intel_fbdev_driver_fbdev_probe(struct drm_fb_helper *helper,
 				   struct drm_fb_helper_surface_size *sizes)
 {
@@ -279,14 +296,7 @@ int intel_fbdev_driver_fbdev_probe(struct drm_fb_helper *helper,
 
 	ifbdev->fb = NULL;
 
-	if (fb &&
-	    (sizes->fb_width > fb->base.width ||
-	     sizes->fb_height > fb->base.height)) {
-		drm_dbg_kms(display->drm,
-			    "BIOS fb too small (%dx%d), we require (%dx%d),"
-			    " releasing it\n",
-			    fb->base.width, fb->base.height,
-			    sizes->fb_width, sizes->fb_height);
+	if (fb && !bios_fb_ok(fb, sizes)) {
 		drm_framebuffer_put(&fb->base);
 		fb = NULL;
 	}
-- 
2.53.0

