Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2943ACD5BAC
	for <intel-xe@archiver.kernel.org>; Wed, 20 May 2026 23:59:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D342F10F19F;
	Wed, 20 May 2026 23:59:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="RpURz9q3";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAC8C10F19E;
 Wed, 20 May 2026 23:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=o0fJPbvAKGHOnCDTDq7ULeMlMC+anyrI+jJXLbe2StY=; b=RpURz9q3sgRjFKn1hsogYtdrym
 H5xojogjjCUUsdoJAZ9HXnh+Z5IeVDBynnr0n249xAfRQuQ+hAN22Ps9cKR2hEd57Nh7xhUgch5gQ
 Q7QzNufzNid5uzEm0762RJlV1Pdt6bLgL534Bq9zh3b5bOyXmTigIUPG3hCBOKxBmr4WFC0gG9U3R
 NLKT/QekGZ3t68vI1ShuABbbkpLQEQD0Q96cZ2ZnWlMXhMOgNbwOn80iUALpIvlrOv6v4N+QA9Rd6
 ThSmXXnZFerJyld9O33RYSK52V1lllIcJTKDiNQvBNV3accQqLGKEUDSDkVvIk2Nn3zPL8x4ClFJd
 ej0lkmMw==;
Received: from c-73-157-168-91.hsd1.or.comcast.net ([73.157.168.91]
 helo=localhost.localdomain) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wPqpE-00456i-Vs; Thu, 21 May 2026 01:59:45 +0200
From: John Harrison <John.Harrison@Igalia.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [PATCH 6/9] drm/i915/display: Fix vblank wait timed out with writeback
Date: Wed, 20 May 2026 16:58:17 -0700
Message-ID: <20260520235820.2313192-7-John.Harrison@Igalia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260325110744.1096786-1-suraj.kandpal@intel.com>
References: <20260325110744.1096786-1-suraj.kandpal@intel.com>
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

When running kms_writeback, the following warning pops up:
[  +0.000015] xe 0000:00:02.0: [drm] vblank wait timed out on crtc 0
[  +0.000014] WARNING: drivers/gpu/drm/drm_vblank.c:1320 at drm_crtc_wait_one_vblank+0x179/0x1e0 [drm], CPU#7: kms_writeback/1191

Waiting for vblank to ensure configuration changes have taken effect
is not a relevant concept for writeback connectors. So just skip the
wait when configuring writeback.

Signed-off-by: John Harrison <John.Harrison@Igalia.com>
---
 drivers/gpu/drm/i915/display/intel_crtc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_crtc.c b/drivers/gpu/drm/i915/display/intel_crtc.c
index 03de219f7a64..fe3384f1aaa8 100644
--- a/drivers/gpu/drm/i915/display/intel_crtc.c
+++ b/drivers/gpu/drm/i915/display/intel_crtc.c
@@ -33,6 +33,7 @@
 #include "intel_sprite.h"
 #include "intel_vblank.h"
 #include "intel_vrr.h"
+#include "intel_writeback.h"
 #include "skl_universal_plane.h"
 
 static void assert_vblank_disabled(struct drm_crtc *crtc)
@@ -65,6 +66,9 @@ struct intel_crtc *intel_crtc_for_pipe(struct intel_display *display,
 
 void intel_crtc_wait_for_next_vblank(struct intel_crtc *crtc)
 {
+	if (intel_writeback_transcoder_is_wd(crtc->config->cpu_transcoder))
+		return;
+
 	drm_crtc_wait_one_vblank(&crtc->base);
 }
 
-- 
2.43.0

