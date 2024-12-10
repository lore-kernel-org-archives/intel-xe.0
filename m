Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4AD2E77183
	for <intel-xe@archiver.kernel.org>; Tue, 10 Dec 2024 08:30:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E25E10E824;
	Tue, 10 Dec 2024 08:30:45 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F4E110E80A
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Dec 2024 08:30:42 +0000 (UTC)
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Vinod Govindapillai <vinod.govindapillai@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 02/11] drm/xe: Remove double pageflip
Date: Tue, 10 Dec 2024 09:31:02 +0100
Message-ID: <20241210083111.230484-3-dev@lankhorst.se>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241210083111.230484-1-dev@lankhorst.se>
References: <20241210083111.230484-1-dev@lankhorst.se>
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

This is already handled below by fixup_initial_plane_config.

Fixes: a8153627520a ("drm/i915: Try to relocate the BIOS fb to the start of ggtt")
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Reviewed-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/display/xe_plane_initial.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_plane_initial.c b/drivers/gpu/drm/xe/display/xe_plane_initial.c
index a22e7adfb09d9..41103571b870b 100644
--- a/drivers/gpu/drm/xe/display/xe_plane_initial.c
+++ b/drivers/gpu/drm/xe/display/xe_plane_initial.c
@@ -211,8 +211,6 @@ intel_find_initial_plane_obj(struct intel_crtc *crtc,
 		to_intel_plane(crtc->base.primary);
 	struct intel_plane_state *plane_state =
 		to_intel_plane_state(plane->base.state);
-	struct intel_crtc_state *crtc_state =
-		to_intel_crtc_state(crtc->base.state);
 	struct drm_framebuffer *fb;
 	struct i915_vma *vma;
 
@@ -258,14 +256,6 @@ intel_find_initial_plane_obj(struct intel_crtc *crtc,
 	atomic_or(plane->frontbuffer_bit, &to_intel_frontbuffer(fb)->bits);
 
 	plane_config->vma = vma;
-
-	/*
-	 * Flip to the newly created mapping ASAP, so we can re-use the
-	 * first part of GGTT for WOPCM, prevent flickering, and prevent
-	 * the lookup of sysmem scratch pages.
-	 */
-	plane->check_plane(crtc_state, plane_state);
-	plane->async_flip(NULL, plane, crtc_state, plane_state, true);
 	return;
 
 nofb:
-- 
2.45.2

