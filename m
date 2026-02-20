Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFB41C5516D
	for <intel-xe@archiver.kernel.org>; Fri, 20 Feb 2026 08:37:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 520FD10E7C0;
	Fri, 20 Feb 2026 08:37:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="V0O01D/A";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9914510E7B7;
 Fri, 20 Feb 2026 08:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1771576645;
 bh=exUvLgPm2x9wuI/aDrTue0KanKuqh/I0IRpyx2LbQuQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=V0O01D/AJsu8hM4gFkyOBO3rBNw5iX5m8nGUsrmNCu/l3NjS/P9a62+B6pVYdosm4
 o8HMi9VWlwsk81TNsUnm+OAyLdoVC3a2zLkB5K0D8cdo2PzRp4n2AJqcw6Pr9fw4Fv
 t4NwEV45Nt5I4+kkKV7jrLx9Z8eV6gCGg5DUajb/oNOQKJo//gvtpawDOOKZ9kJDdG
 Ns0tBmcG9wKAltMEw3lnc1C8c6sV2Zks7aPkc1aJfsAuvWOpdb8uKaYZm5baaFSRIb
 2wJIZzGZS3kyBFsq8YwbcKKjyx+cS3YxIgH+5LI4B3qykIc+Q18/g81GxxL4xDWAvL
 jNLpLN9h0r/nA==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: linux-rt-devel@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <dev@lankhorst.se>, Uma Shankar <uma.shankar@intel.com>
Subject: [i915-rt v6 11/24] drm/i915/display: Make icl_dsi_frame_update use
 _fw too
Date: Fri, 20 Feb 2026 09:37:09 +0100
Message-ID: <20260220083657.28815-37-dev@lankhorst.se>
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

Don't use the dmc lock inside the vblank critical section,
not even as last call.

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/icl_dsi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/icl_dsi.c b/drivers/gpu/drm/i915/display/icl_dsi.c
index 7cf511a6c0f95..52e1d45c63162 100644
--- a/drivers/gpu/drm/i915/display/icl_dsi.c
+++ b/drivers/gpu/drm/i915/display/icl_dsi.c
@@ -242,8 +242,8 @@ void icl_dsi_frame_update(struct intel_crtc_state *crtc_state)
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

