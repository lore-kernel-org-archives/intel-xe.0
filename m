Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62B56C83F2D
	for <intel-xe@archiver.kernel.org>; Tue, 15 Jul 2025 10:16:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E232110E586;
	Tue, 15 Jul 2025 10:16:54 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F20810E581
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Jul 2025 10:16:53 +0000 (UTC)
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH 3/4] drm/i915/display: Use drm_crtc_vblank_count in
 intel_crtc_get_vblank_counter()
Date: Tue, 15 Jul 2025 12:16:40 +0200
Message-ID: <20250715101636.906092-9-dev@lankhorst.se>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250715101636.906092-6-dev@lankhorst.se>
References: <20250715101636.906092-6-dev@lankhorst.se>
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
section of pipe updates.

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/i915/display/intel_crtc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_crtc.c b/drivers/gpu/drm/i915/display/intel_crtc.c
index dbdc4d9b2a33c..65a57cadfa3bf 100644
--- a/drivers/gpu/drm/i915/display/intel_crtc.c
+++ b/drivers/gpu/drm/i915/display/intel_crtc.c
@@ -85,7 +85,7 @@ u32 intel_crtc_get_vblank_counter(struct intel_crtc *crtc)
 		return 0;
 
 	if (!vblank->max_vblank_count)
-		return (u32)drm_crtc_accurate_vblank_count(&crtc->base);
+		return (u32)drm_crtc_vblank_count(&crtc->base);
 
 	return crtc->base.funcs->get_vblank_counter(&crtc->base);
 }
-- 
2.45.2

