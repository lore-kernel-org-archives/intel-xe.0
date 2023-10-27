Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C60FEC25B72
	for <intel-xe@archiver.kernel.org>; Fri, 27 Oct 2023 11:35:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D4F110E981;
	Fri, 27 Oct 2023 11:35:37 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se
 [IPv6:2a02:2308:0:7ec:e79c:4e97:b6c4:f0ae])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6963610E97E
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Oct 2023 11:35:31 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 27 Oct 2023 13:34:51 +0200
Message-Id: <20231027113453.117020-8-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231027113453.117020-1-maarten.lankhorst@linux.intel.com>
References: <20231027113453.117020-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 7/9] drm/i915/display: Use
 i915_gem_object_get_dma_address to get dma address
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

Works better for xe like that. obj is no longer const.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_cursor.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cursor.c b/drivers/gpu/drm/i915/display/intel_cursor.c
index b342fad180ca..0d21c34f7499 100644
--- a/drivers/gpu/drm/i915/display/intel_cursor.c
+++ b/drivers/gpu/drm/i915/display/intel_cursor.c
@@ -23,6 +23,8 @@
 #include "intel_psr.h"
 #include "skl_watermark.h"
 
+#include "gem/i915_gem_object.h"
+
 /* Cursor formats */
 static const u32 intel_cursor_formats[] = {
 	DRM_FORMAT_ARGB8888,
@@ -33,11 +35,11 @@ static u32 intel_cursor_base(const struct intel_plane_state *plane_state)
 	struct drm_i915_private *dev_priv =
 		to_i915(plane_state->uapi.plane->dev);
 	const struct drm_framebuffer *fb = plane_state->hw.fb;
-	const struct drm_i915_gem_object *obj = intel_fb_obj(fb);
+	struct drm_i915_gem_object *obj = intel_fb_obj(fb);
 	u32 base;
 
 	if (DISPLAY_INFO(dev_priv)->cursor_needs_physical)
-		base = sg_dma_address(obj->mm.pages->sgl);
+		base = i915_gem_object_get_dma_address(obj, 0);
 	else
 		base = intel_plane_ggtt_offset(plane_state);
 
-- 
2.40.1

