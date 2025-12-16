Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2DA2D5CC94
	for <intel-xe@archiver.kernel.org>; Tue, 16 Dec 2025 09:22:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C634A10E817;
	Tue, 16 Dec 2025 09:22:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="lDAEp4X7";
	dkim-atps=neutral
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C781E10E77B;
 Tue, 16 Dec 2025 09:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1765876955;
 bh=4eZA4vQcAGDaA2XtZ/pzJMwTCFwPUJ2QS96uCj634kI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lDAEp4X7pKu6vTmPTPbKiKChTkItx+WTGnwE6yVFtPgimDKAlSAA2GS2X2EbbXw1F
 uXYKy8xXRyVDCK2GJUEqUmAKd6WzXuTbvgKWBSC3rMjyuDm2xwyTTe8UuyMIpa7Udm
 9UhP6P1MHJIni0d16OXV5NNnEfnLEIg/Nb+9pI/Iv7LMahdLv0gb019J4MfCP/GdCV
 FyXQAKWmLMmhXakKVT+/rEO3x1LpcbhFgwkTS4FY2keHLjARvlcCb7PPrh7eJT5r5Y
 3TdOcn9Mitwoi56DdhMSAHCkup5rM2Jyjjj7qQHjxUd5RfnqO73yeinip+LktEBMMY
 XNr7IijBPbTPg==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
Subject: [i915-rt v2 08/16] drm/i915/display: Make icl_dsi_frame_update use
 _fw too
Date: Tue, 16 Dec 2025 10:22:35 +0100
Message-ID: <20251216092226.1777909-26-dev@lankhorst.se>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251216092226.1777909-18-dev@lankhorst.se>
References: <20251216092226.1777909-18-dev@lankhorst.se>
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

Don't use the dmc lock inside the vblank critical section,
not even as last call.

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/i915/display/icl_dsi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/icl_dsi.c b/drivers/gpu/drm/i915/display/icl_dsi.c
index dac781f546617..adcd74f855f41 100644
--- a/drivers/gpu/drm/i915/display/icl_dsi.c
+++ b/drivers/gpu/drm/i915/display/icl_dsi.c
@@ -243,8 +243,8 @@ void icl_dsi_frame_update(struct intel_crtc_state *crtc_state)
 	else
 		return;
 
-	intel_de_rmw(display, DSI_CMD_FRMCTL(port), 0,
-		     DSI_FRAME_UPDATE_REQUEST);
+	intel_de_rmw_fw(display, DSI_CMD_FRMCTL(port), 0,
+			DSI_FRAME_UPDATE_REQUEST);
 }
 
 static void dsi_program_swing_and_deemphasis(struct intel_encoder *encoder)
-- 
2.51.0

