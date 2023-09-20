Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C90E5CE79D1
	for <intel-xe@archiver.kernel.org>; Wed, 20 Sep 2023 14:03:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93F6A10E4B4;
	Wed, 20 Sep 2023 14:03:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A06EA10E4B4
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Sep 2023 14:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695218631; x=1726754631;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yRQ/iSR2R5QFpNi4Ct4piX8CDArc/ADJstlArBVxOdQ=;
 b=bLLhRlLYOQN8B2/Lw7YoTSEz3I/yQTYzFNao+gdStJ/NKuzZG/3O0x7L
 dc6uW549O/Ov1g/iicLN7kNIzfWBBF3JRVaHm4jvunxEjrvv+gyeKH+aE
 IDyQ4Eku4O67blh0AJBI/FAzz4bRfShGRxvXT/Wd5N/Wx68FN4DUPb7oy
 okFrJCiiNDazIpFKHP+WR2ADa1kGIal7ji6U2Rqbv3OYm00FlBGLWhJrb
 Rv/gJe9uxf0fqqxPHEe2qBXy7XMIk3LRLcGWld9kzO8Xz1F4zFxWTcTbN
 ylcNUW0lydT72VMfsXhNvN5uwynvN1T7ic/t49X95PEVhasn5FkyTOULn g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="360486883"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="360486883"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 07:03:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="781700028"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="781700028"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.153])
 by orsmga001.jf.intel.com with SMTP; 20 Sep 2023 07:03:40 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 20 Sep 2023 17:03:39 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 20 Sep 2023 17:03:37 +0300
Message-ID: <20230920140339.28322-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/3] drm/i915: Use vblank worker to unpin old
 legacy cursor fb safely
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

The cursor hardware only does sync updates, and thus the hardware
will be scanning out from the old fb until the next start of vblank.
So in order to make the legacy cursor fastpath actually safe we
should not unpin the old fb until we're sure the hardware has
ceased accessing it. The simplest approach is to just use a vblank
work here to do the delayed unpin.

Not 100% sure it's a good idea to put this onto the same high
priority vblank worker as eg. our timing critical gamma updates.
But let's keep it simple for now, and it we later discover that
this is causing problems we can think about adding a lower
priority worker for such things.

v2: wait for cursor unpins before turning off the vblank irq

Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_cursor.c   | 36 +++++++++++++++++--
 drivers/gpu/drm/i915/display/intel_cursor.h   |  2 ++
 drivers/gpu/drm/i915/display/intel_display.c  |  3 ++
 .../drm/i915/display/intel_display_types.h    |  4 +++
 4 files changed, 43 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cursor.c b/drivers/gpu/drm/i915/display/intel_cursor.c
index 8ed8a623fa98..afe1d0fa0537 100644
--- a/drivers/gpu/drm/i915/display/intel_cursor.c
+++ b/drivers/gpu/drm/i915/display/intel_cursor.c
@@ -605,6 +605,26 @@ static bool intel_cursor_format_mod_supported(struct drm_plane *_plane,
 	return format == DRM_FORMAT_ARGB8888;
 }
 
+static void intel_cursor_unpin_work(struct kthread_work *base)
+{
+	struct drm_vblank_work *work = to_drm_vblank_work(base);
+	struct intel_plane_state *plane_state =
+		container_of(work, typeof(*plane_state), unpin_work);
+	struct intel_plane *plane = to_intel_plane(plane_state->uapi.plane);
+
+	intel_plane_unpin_fb(plane_state);
+	intel_plane_destroy_state(&plane->base, &plane_state->uapi);
+
+	if (atomic_dec_and_test(&plane->cursor.pending_unpins))
+		wake_up_var(&plane->cursor.pending_unpins);
+}
+
+void intel_cursor_wait_unpin_works(struct intel_plane *plane)
+{
+	wait_var_event(&plane->cursor.pending_unpins,
+		       !atomic_read(&plane->cursor.pending_unpins));
+}
+
 static int
 intel_legacy_cursor_update(struct drm_plane *_plane,
 			   struct drm_crtc *_crtc,
@@ -732,14 +752,26 @@ intel_legacy_cursor_update(struct drm_plane *_plane,
 
 	local_irq_enable();
 
-	intel_plane_unpin_fb(old_plane_state);
+	if (old_plane_state->hw.fb != new_plane_state->hw.fb) {
+		drm_vblank_work_init(&old_plane_state->unpin_work, &crtc->base,
+				     intel_cursor_unpin_work);
+
+		atomic_inc(&plane->cursor.pending_unpins);
+		drm_vblank_work_schedule(&old_plane_state->unpin_work,
+					 drm_crtc_accurate_vblank_count(&crtc->base) + 1,
+					 false);
+
+		old_plane_state = NULL;
+	} else {
+		intel_plane_unpin_fb(old_plane_state);
+	}
 
 out_free:
 	if (new_crtc_state)
 		intel_crtc_destroy_state(&crtc->base, &new_crtc_state->uapi);
 	if (ret)
 		intel_plane_destroy_state(&plane->base, &new_plane_state->uapi);
-	else
+	else if (old_plane_state)
 		intel_plane_destroy_state(&plane->base, &old_plane_state->uapi);
 	return ret;
 
diff --git a/drivers/gpu/drm/i915/display/intel_cursor.h b/drivers/gpu/drm/i915/display/intel_cursor.h
index ce333bf4c2d5..e778aff77129 100644
--- a/drivers/gpu/drm/i915/display/intel_cursor.h
+++ b/drivers/gpu/drm/i915/display/intel_cursor.h
@@ -14,4 +14,6 @@ struct intel_plane *
 intel_cursor_plane_create(struct drm_i915_private *dev_priv,
 			  enum pipe pipe);
 
+void intel_cursor_wait_unpin_works(struct intel_plane *plane);
+
 #endif
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index b2e16cb8d026..f5a45722636b 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -65,6 +65,7 @@
 #include "intel_crt.h"
 #include "intel_crtc.h"
 #include "intel_crtc_state_dump.h"
+#include "intel_cursor.h"
 #include "intel_ddi.h"
 #include "intel_de.h"
 #include "intel_display_driver.h"
@@ -6669,6 +6670,8 @@ static void intel_commit_modeset_disables(struct intel_atomic_state *state)
 
 		intel_pre_plane_update(state, crtc);
 		intel_crtc_disable_planes(state, crtc);
+
+		intel_cursor_wait_unpin_works(to_intel_plane(crtc->base.cursor));
 	}
 
 	/* Only disable port sync and MST slaves */
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index c0931d89d0dd..bf17ae833ff1 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -710,6 +710,9 @@ struct intel_plane_state {
 
 	struct intel_fb_view view;
 
+	/* for legacy cursor fb unpin */
+	struct drm_vblank_work unpin_work;
+
 	/* Plane pxp decryption state */
 	bool decrypt;
 
@@ -1523,6 +1526,7 @@ struct intel_plane {
 
 	struct {
 		u32 base, cntl, size;
+		atomic_t pending_unpins;
 	} cursor;
 
 	struct intel_fbc *fbc;
-- 
2.41.0

