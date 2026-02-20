Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5177FC5516D
	for <intel-xe@archiver.kernel.org>; Fri, 20 Feb 2026 08:37:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAA3C10E7A9;
	Fri, 20 Feb 2026 08:37:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="C2FaaCA+";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7931410E7A5;
 Fri, 20 Feb 2026 08:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1771576631;
 bh=9qqoMUbjBcwxKR8yBHpe7cXBQTo/JSlyvgPiSt85Yf0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=C2FaaCA+cOQRamAgY0SMr46oJP0ef6Y6BLqPDxLESmLRFb296rHl/HWxa23ZmlnHK
 6TtDSGYDHnuZ6L3XQITnEAiYsswagg13EnmsvSxzSGZ8w58uK9nlFkONSuDRyArybz
 FzFAhnTZXaEWldQbw37EG1ITurmHO9aLN2KN+bAsH7stklVqGCNOzp8ApwSn0KPwAs
 XrzbetYZX2/IJb+jS2DhjEEhdVlX//cfuBqGhCjYBb5Nmh4WKcPlyahuXLqbny92tW
 lSBfbjasGU11gFxIXvhR8TIaroD70IMDb4jwu9+1IXdUu4Ya4VtXQ6+uMW3//nFRu/
 69XB+YrVp8pIA==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: linux-rt-devel@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <dev@lankhorst.se>
Subject: [i915-rt v6 03/24] drm/intel/display: Make
 intel_crtc_arm_vblank_event static
Date: Fri, 20 Feb 2026 09:37:01 +0100
Message-ID: <20260220083657.28815-29-dev@lankhorst.se>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260220083657.28815-26-dev@lankhorst.se>
References: <20260220083657.28815-26-dev@lankhorst.se>
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

Only used inside intel_crtc.c now, so no need to export it any more.

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/i915/display/intel_crtc.c | 2 +-
 drivers/gpu/drm/i915/display/intel_crtc.h | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_crtc.c b/drivers/gpu/drm/i915/display/intel_crtc.c
index ed3c6c4ce025e..663011af37e95 100644
--- a/drivers/gpu/drm/i915/display/intel_crtc.c
+++ b/drivers/gpu/drm/i915/display/intel_crtc.c
@@ -638,7 +638,7 @@ static void dbg_vblank_evade(struct intel_crtc *crtc, ktime_t end)
 static void dbg_vblank_evade(struct intel_crtc *crtc, ktime_t end) {}
 #endif
 
-void intel_crtc_arm_vblank_event(struct intel_crtc_state *crtc_state)
+static void intel_crtc_arm_vblank_event(struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
 	unsigned long irqflags;
diff --git a/drivers/gpu/drm/i915/display/intel_crtc.h b/drivers/gpu/drm/i915/display/intel_crtc.h
index 12507b51ee77e..f65cbafe2b42a 100644
--- a/drivers/gpu/drm/i915/display/intel_crtc.h
+++ b/drivers/gpu/drm/i915/display/intel_crtc.h
@@ -33,7 +33,6 @@ int intel_usecs_to_scanlines(const struct drm_display_mode *adjusted_mode,
 			     int usecs);
 int intel_scanlines_to_usecs(const struct drm_display_mode *adjusted_mode,
 			     int scanlines);
-void intel_crtc_arm_vblank_event(struct intel_crtc_state *crtc_state);
 void intel_crtc_prepare_vblank_event(struct intel_crtc_state *crtc_state,
 				     struct drm_pending_vblank_event **event);
 u32 intel_crtc_max_vblank_count(const struct intel_crtc_state *crtc_state);
-- 
2.51.0

