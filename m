Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0F49EB64DD
	for <intel-xe@archiver.kernel.org>; Mon, 14 Aug 2023 08:37:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C755510E15C;
	Mon, 14 Aug 2023 08:37:54 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se
 [IPv6:2a02:2308:0:7ec:e79c:4e97:b6c4:f0ae])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 537DE10E14B
 for <intel-xe@lists.freedesktop.org>; Mon, 14 Aug 2023 08:37:53 +0000 (UTC)
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Date: Mon, 14 Aug 2023 10:37:44 +0200
Message-Id: <20230814083744.4408-2-dev@lankhorst.se>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230814083744.4408-1-dev@lankhorst.se>
References: <20230814083744.4408-1-dev@lankhorst.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/2] drm/xe: Implement xe DPT slightly
 differently.
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

From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

Just create a dummy to make DPT work.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 .../drm/i915/display/skl_universal_plane.c    |  3 +-
 drivers/gpu/drm/xe/Makefile                   |  1 +
 drivers/gpu/drm/xe/display/xe_dpt.c           | 46 +++++++++++++++++++
 3 files changed, 49 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/xe/display/xe_dpt.c

diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index c28f4198aa15..9469ec5a0417 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -1010,7 +1010,8 @@ static u32 skl_surf_address(const struct intel_plane_state *plane_state,
 		 * The DPT object contains only one vma, so the VMA's offset
 		 * within the DPT is always 0.
 		 */
-		drm_WARN_ON(&i915->drm, plane_state->dpt_vma->node.start);
+		if (plane_state->dpt_vma)
+			drm_WARN_ON(&i915->drm, plane_state->dpt_vma->node.start);
 		drm_WARN_ON(&i915->drm, offset & 0x1fffff);
 		return offset >> 9;
 	} else {
diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 6d9196ab275c..33bfe33632db 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -141,6 +141,7 @@ $(obj)/i915-display/%.o: $(srctree)/drivers/gpu/drm/i915/display/%.c FORCE
 # Display code specific to xe
 xe-$(CONFIG_DRM_XE_DISPLAY) += \
 	xe_display.o \
+	display/xe_dpt.o \
 	display/xe_fb_pin.o \
 	display/xe_hdcp_gsc.o \
 	display/xe_plane_initial.o \
diff --git a/drivers/gpu/drm/xe/display/xe_dpt.c b/drivers/gpu/drm/xe/display/xe_dpt.c
new file mode 100644
index 000000000000..0695886045e3
--- /dev/null
+++ b/drivers/gpu/drm/xe/display/xe_dpt.c
@@ -0,0 +1,46 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include "intel_dpt.h"
+
+#include "i915_reg.h"
+
+#include "intel_de.h"
+#include "intel_display.h"
+#include "intel_display_types.h"
+
+void intel_dpt_destroy(struct i915_address_space *vm)
+{
+}
+
+struct i915_address_space *
+intel_dpt_create(struct intel_framebuffer *fb)
+{
+	return NULL;
+}
+
+void intel_dpt_configure(struct intel_crtc *crtc)
+{
+	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+
+	if (DISPLAY_VER(i915) == 14) {
+		enum pipe pipe = crtc->pipe;
+		enum plane_id plane_id;
+
+		for_each_plane_id_on_crtc(crtc, plane_id) {
+			if (plane_id == PLANE_CURSOR)
+				continue;
+
+			intel_de_rmw(i915, PLANE_CHICKEN(pipe, plane_id),
+				     PLANE_CHICKEN_DISABLE_DPT,
+				     i915->params.enable_dpt ? 0 : PLANE_CHICKEN_DISABLE_DPT);
+		}
+	} else if (DISPLAY_VER(i915) == 13) {
+		intel_de_rmw(i915, CHICKEN_MISC_2,
+			     CHICKEN_MISC_DISABLE_DPT,
+			     i915->params.enable_dpt ? 0 : CHICKEN_MISC_DISABLE_DPT);
+	}
+}
+
-- 
2.39.2

