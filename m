Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBBEBCA0FF9
	for <intel-xe@archiver.kernel.org>; Fri, 29 Aug 2025 13:17:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7423810EBB2;
	Fri, 29 Aug 2025 13:17:09 +0000 (UTC)
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEB5510E0C9;
 Fri, 29 Aug 2025 13:17:07 +0000 (UTC)
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH] drm/i915/display: Make intel_crtc_get_vblank_counter safe on
 PREEMPT_RT
Date: Fri, 29 Aug 2025 15:17:02 +0200
Message-ID: <20250829131701.15607-2-dev@lankhorst.se>
X-Mailer: git-send-email 2.50.0
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

drm_crtc_accurate_vblank_count takes a spinlock, which we should avoid
in tracepoints and debug functions.

This also prevents taking the spinlock 2x during the critical
section of pipe updates for DSI updates.

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/i915/display/intel_crtc.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_crtc.c b/drivers/gpu/drm/i915/display/intel_crtc.c
index a187db6df2d36..cee00aa2c79de 100644
--- a/drivers/gpu/drm/i915/display/intel_crtc.c
+++ b/drivers/gpu/drm/i915/display/intel_crtc.c
@@ -84,8 +84,12 @@ u32 intel_crtc_get_vblank_counter(struct intel_crtc *crtc)
 	if (!crtc->active)
 		return 0;
 
-	if (!vblank->max_vblank_count)
-		return (u32)drm_crtc_accurate_vblank_count(&crtc->base);
+	if (!vblank->max_vblank_count) {
+		if (!IS_ENABLED(CONFIG_PREEMPT_RT))
+			return (u32)drm_crtc_accurate_vblank_count(&crtc->base);
+		else
+			return (u32)drm_crtc_vblank_count(&crtc->base);
+	}
 
 	return crtc->base.funcs->get_vblank_counter(&crtc->base);
 }
-- 
2.50.0

