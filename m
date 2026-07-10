Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53D53C44507
	for <intel-xe@archiver.kernel.org>; Fri, 10 Jul 2026 11:15:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A81A910F85E;
	Fri, 10 Jul 2026 11:15:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="KIaZOjVv";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D83C10F88F;
 Fri, 10 Jul 2026 11:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1783682096;
 bh=JSQ3dM1fhSFoNnLU1RcdnlEKoQsQDbdPfsKNJ5u2etM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KIaZOjVvTZXXhm9T0vOCDTIbtLVTpNyBpb2G7uVoyiPLN8cnsB8THFxgDWS5IC4gb
 OrtSEm24zWBsxX7LvVusP+zAMnnGUZSPzXPH04MArwJ3E9UaOO2/FLmYASGMo3vS2P
 E3ikCjEQAv0iU1ZsQ8pzaNskSNjSVPvIgTXzHW2pdAkwCu2umx3/YiWmung09dvA1z
 r35/jwkZtgm1skUKkX5IdRzYs0Bx8KQWs1NwkOQJNKroR9m0U9icbqI9Lg5FXdVrBU
 FlwBmRlO1Deu5Jz7Ou2QUn7XAKuEF+BRkboqfM0AYwKCUBnHp4RjwQgcjbT3kDwJ1f
 bPB9jYFgfje1w==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>, Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH v2 01/11] drm/i915: Disable the plane if initial plane config
 readout failed
Date: Fri, 10 Jul 2026 13:15:28 +0200
Message-ID: <20260710111539.1274555-2-dev@lankhorst.se>
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

Properly turn off the plane if it is enabled but
.get_initial_plane_config() failed for whatever reason.

The hardware does (or at least did) perform some kind of automagic
plane disable when the pipe gets disabled, but we don't rely on that
anywhere else either. Also the GGTT/actual memory may get clobbered
afterwards, so leaving the plane enabled here could result in visual
corruption/GTT faults/etc.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Link: https://patch.msgid.link/20260511214122.8468-2-ville.syrjala@linux.intel.com
Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/i915/display/intel_initial_plane.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_initial_plane.c b/drivers/gpu/drm/i915/display/intel_initial_plane.c
index e414b5d1085c0..7427f41e4d7e1 100644
--- a/drivers/gpu/drm/i915/display/intel_initial_plane.c
+++ b/drivers/gpu/drm/i915/display/intel_initial_plane.c
@@ -128,11 +128,10 @@ intel_find_initial_plane_obj(struct intel_crtc *crtc,
 
 	/*
 	 * TODO:
-	 *   Disable planes if get_initial_plane_config() failed.
 	 *   Make sure things work if the surface base is not page aligned.
 	 */
 	if (!plane_config->fb)
-		return;
+		goto nofb;
 
 	if (intel_alloc_initial_plane_obj(display, plane_config)) {
 		fb = plane_config->fb;
@@ -184,7 +183,8 @@ intel_find_initial_plane_obj(struct intel_crtc *crtc,
 	 * simplest solution is to just disable the primary plane now and
 	 * pretend the BIOS never had it enabled.
 	 */
-	intel_plane_disable_noatomic(crtc, plane);
+	if (plane_state->uapi.visible)
+		intel_plane_disable_noatomic(crtc, plane);
 }
 
 static void plane_config_fini(struct intel_display *display,
-- 
2.53.0

