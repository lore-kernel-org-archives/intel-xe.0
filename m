Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E542ED3A670
	for <intel-xe@archiver.kernel.org>; Tue, 29 Oct 2024 15:00:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE7CF10E681;
	Tue, 29 Oct 2024 15:00:03 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31FB910E67C
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Oct 2024 14:59:50 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH v3 resend 2/8] drm/i915/display: Use async flip when available
 for initial plane config
Date: Tue, 29 Oct 2024 15:59:59 +0100
Message-ID: <20241029150005.68440-3-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241029150005.68440-1-maarten.lankhorst@linux.intel.com>
References: <20241029150005.68440-1-maarten.lankhorst@linux.intel.com>
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

I'm planning to reorder readout in the Xe sequence in such a way that
interrupts will not be available, so just use an async flip.

Since the new FB points to the same pages, it will not tear. It also
has the benefit of perhaps being slightly faster.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/i915/display/skl_universal_plane.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index a0a7ed01415a5..6740c193920ff 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -2902,7 +2902,7 @@ bool skl_fixup_initial_plane_config(struct intel_crtc *crtc,
 		to_intel_plane_state(plane->base.state);
 	enum plane_id plane_id = plane->id;
 	enum pipe pipe = crtc->pipe;
-	u32 base;
+	u32 base, plane_ctl;
 
 	if (!plane_state->uapi.visible)
 		return false;
@@ -2916,7 +2916,16 @@ bool skl_fixup_initial_plane_config(struct intel_crtc *crtc,
 	if (plane_config->base == base)
 		return false;
 
+	/* Perform an async flip to the new surface. */
+	plane_ctl = intel_de_read(i915, PLANE_CTL(pipe, plane_id));
+	plane_ctl |= PLANE_CTL_ASYNC_FLIP;
+
+	intel_de_write(i915, PLANE_CTL(pipe, plane_id), plane_ctl);
 	intel_de_write(i915, PLANE_SURF(pipe, plane_id), base);
 
-	return true;
+	if (intel_de_wait(i915, PLANE_SURFLIVE(pipe, plane_id), ~0U, base, 40) < 0)
+		drm_warn(&i915->drm, "async flip timed out\n");
+
+	/* No need to vblank wait either */
+	return false;
 }
-- 
2.45.2

