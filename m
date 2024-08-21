Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56E20C52D6F
	for <intel-xe@archiver.kernel.org>; Wed, 21 Aug 2024 20:47:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26BF310E6DA;
	Wed, 21 Aug 2024 20:47:59 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FA2610E6D5
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Aug 2024 20:47:55 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?q?Juha-Pekka=20Heikkil=C3=A4?= <juha-pekka.heikkila@intel.com>
Subject: [PATCH 1/3] drm/xe: Align 64k scanout buffers physically when
 multiple of 64k.
Date: Wed, 21 Aug 2024 22:47:48 +0200
Message-ID: <20240821204750.539075-2-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240821204750.539075-1-maarten.lankhorst@linux.intel.com>
References: <20240821204750.539075-1-maarten.lankhorst@linux.intel.com>
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

For CCS formats on affected platforms, CCS can be used freely, but
display engine requires a multiple of 64k physical pages. No other
changes are needed.

At the BO creation time we don't know if the BO will be used for CCS
or not. If the scanout flag is set, and the BO is a multiple of 64k,
we take the safe route and force the physical alignment of 64k pages.

If the BO is not a multiple of 64k, or the scanout flag was not set
at BO creation, we reject it for usage as CCS in display. The physical
pages are likely not aligned correctly, and this will cause corruption
when used as FB.

This is a slightly different approach from my previous patch. Instead
of requiring a scanout flag at FB creation, we now make all buffers of
the right size physically aligned correctly, so no change from userspace
is needed.

It will be interesting to see if it affects performance in any way.

Inspired by Zbigniews patch.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Co-developed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Juha-Pekka Heikkilä <juha-pekka.heikkila@intel.com>
---
 drivers/gpu/drm/xe/display/intel_fb_bo.c |  6 ++++++
 drivers/gpu/drm/xe/xe_bo.c               | 10 ++++++++++
 drivers/gpu/drm/xe/xe_device_types.h     |  1 +
 drivers/gpu/drm/xe/xe_vm.c               |  4 +++-
 4 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/display/intel_fb_bo.c b/drivers/gpu/drm/xe/display/intel_fb_bo.c
index f835492f73fb4..407367719abe2 100644
--- a/drivers/gpu/drm/xe/display/intel_fb_bo.c
+++ b/drivers/gpu/drm/xe/display/intel_fb_bo.c
@@ -7,6 +7,7 @@
 #include <drm/ttm/ttm_bo.h>
 
 #include "intel_display_types.h"
+#include "intel_fb.h"
 #include "intel_fb_bo.h"
 #include "xe_bo.h"
 
@@ -28,6 +29,11 @@ int intel_fb_bo_framebuffer_init(struct intel_framebuffer *intel_fb,
 	struct xe_device *xe = to_xe_device(bo->ttm.base.dev);
 	int ret;
 
+	if (XE_IOCTL_DBG(xe, intel_fb_is_ccs_modifier(mode_cmd->modifier[0]) &&
+			     (xe->info.vram_flags & XE_VRAM_FLAGS_DISPLAY_NEED64K_CCS) &&
+			     !(bo->flags & XE_BO_FLAG_NEEDS_64K)))
+		return -EINVAL;
+
 	xe_bo_get(bo);
 
 	ret = ttm_bo_reserve(&bo->ttm, true, false, NULL);
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 6ed0e19552159..3a753f4644cb6 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -2017,6 +2017,16 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
 	if (args->flags & DRM_XE_GEM_CREATE_FLAG_SCANOUT)
 		bo_flags |= XE_BO_FLAG_SCANOUT;
 
+	/*
+	 * Lets see what happens if we simply align any buffer that's
+	 * a multiple of 64k to 64k in places where it's not officially
+	 * needed.
+	 */
+	if ((bo_flags & XE_BO_FLAG_VRAM_MASK) &&
+	    !(xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K) &&
+	    !(args->size % SZ_64K))
+		bo_flags |= XE_BO_FLAG_NEEDS_64K;
+
 	bo_flags |= args->placement << (ffs(XE_BO_FLAG_SYSTEM) - 1);
 
 	if (args->flags & DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM) {
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 5ed6f5434f42c..12ddab91a01c0 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -47,6 +47,7 @@ struct xe_pat_ops;
 #define HAS_HECI_CSCFI(xe) ((xe)->info.has_heci_cscfi)
 
 #define XE_VRAM_FLAGS_NEED64K		BIT(0)
+#define XE_VRAM_FLAGS_DISPLAY_NEED64K_CCS	BIT(1)
 
 #define XE_GT0		0
 #define XE_GT1		1
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index d1bfd0b6e9558..bf3af8686167e 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2878,7 +2878,9 @@ static int xe_vm_bind_ioctl_validate_bo(struct xe_device *xe, struct xe_bo *bo,
 		return -EINVAL;
 	}
 
-	if (bo->flags & XE_BO_FLAG_INTERNAL_64K) {
+	if ((bo->flags & XE_BO_FLAG_INTERNAL_64K) &&
+	    !(bo->flags & XE_BO_FLAG_SCANOUT &&
+	      xe->info.vram_flags & XE_VRAM_FLAGS_DISPLAY_NEED64K_CCS)) {
 		if (XE_IOCTL_DBG(xe, obj_offset &
 				 XE_64K_PAGE_MASK) ||
 		    XE_IOCTL_DBG(xe, addr & XE_64K_PAGE_MASK) ||
-- 
2.45.2

