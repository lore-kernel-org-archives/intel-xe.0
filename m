Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B982CA5FD7
	for <intel-xe@archiver.kernel.org>; Wed, 21 Jan 2026 13:53:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D9A810E7DD;
	Wed, 21 Jan 2026 13:53:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="Jt9h/UpW";
	dkim-atps=neutral
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16DBE10E7DB;
 Wed, 21 Jan 2026 13:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1769003618;
 bh=GQ+pvTVeYh2WxTxMyowpW3CgubZWqe3zxHAkT3hSPOg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Jt9h/UpW8KSHN3XLGC0yhGnqsGIXFi8E9MYCSR5T08cPvbZqGKFNfyV7hlRDVaq2k
 qXtCmigzC8XAsZSSVF6gsmPK3J+u0rRny1dYi8cnGOz17s0qkey/8kuQkgmpKOVl6w
 kIsO32J0B+NjwgpML+9lgAk41y5m0MdeT2OaEHnBSW1QM29mrMNJACOnU/dzRzKULD
 zJQ5xgtKvaO+QrJ7PAFGvXU/6NdbuePCcM0+U9Qc4rpC+SYL8cnwVmmhr7AmtLWkSX
 uPoNo8u0DEV0aVrxgBEqdkIkVUR25LDxHaMqZXprrAppKSt5/TFmsv0/GHbTdFNwOQ
 Ko1WteEYXknLQ==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>
Subject: [i915-rt v5 08/21] drm/i915/display: Make icl_dsi_frame_update use
 _fw too
Date: Wed, 21 Jan 2026 14:53:04 +0100
Message-ID: <20260121135318.651622-9-dev@lankhorst.se>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260121135318.651622-1-dev@lankhorst.se>
References: <20260121135318.651622-1-dev@lankhorst.se>
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
index c8e0333706c1e..1df2f347a13be 100644
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

