Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93C86C02180
	for <intel-xe@archiver.kernel.org>; Wed, 15 Jan 2025 15:24:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43EE310E745;
	Wed, 15 Jan 2025 15:24:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="VGdbMy7J";
	dkim-atps=neutral
Received: from mail-io1-xd4a.google.com (mail-io1-xd4a.google.com
 [IPv6:2607:f8b0:4864:20::d4a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03DC010E475
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Jan 2025 19:06:02 +0000 (UTC)
Received: by mail-io1-xd4a.google.com with SMTP id
 ca18e2360f4ac-844d5c4a27fso987728739f.0
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Jan 2025 11:06:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1736881562; x=1737486362;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=HkXEGKaHS4Wap2DZ8mnEQl68mT1GrP1ybYkz9IG2DCI=;
 b=VGdbMy7J36fvRHr+fqEtXXDxjkvkwmMprA7OGhmWfREoROrBUmQNvLnnFhSq0d6/Wt
 54VcD945Emmnlngczn+TTd3D4Pb5z64OD3ywfsA+1omi68la/hLEJV62mHZ9LK634Nqr
 Nn5ibqYoqGISxUPDlpGIEBWbu7Ph6RqoHDeka9d4EluOaRAZoGBtUIl9HTuJHNLIYZkZ
 vt01CZsS0gULpSr8Tu4a20GOwqOOlkH2AhTgB/s3S5qeqhZW9jV8WQI0z+spkpujU2hq
 M1qT2a9ctStLNtv6TKwMEjH3s7NDpq8hbQGVHrhvvKvpDoh6F1RFv130GyHsN4FYNTdC
 CXWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736881562; x=1737486362;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HkXEGKaHS4Wap2DZ8mnEQl68mT1GrP1ybYkz9IG2DCI=;
 b=a+Y2PlC7W48K4ZZy4jq+G8MaIAvDfyj9wypain6tHEJ+Zls4AsTZuTWH7LeEdrMHLc
 XEjJVQgOC0UlEJbaATBLUvAcl/0LoiSySJuVMsEQncAXNWu/y9o13h0HwL/L1fjucPdP
 n6LKWv9V9TvR0GE0DnYFaPKD7T+wEckkqfgO0Ltp21bSiAxDyLeyGzKrGt/3UA4SoOc3
 MPDMgOKLPwjvSoSRG/eX1Mlljhn30G8bVhKjqtoUaJFbUEPanCAgYMioV1B7BLv5KXM9
 iwslV63RupRWojiI8QEAjLrud5r068GOuLtaqsia/HHNKQjNOeQVTM9B9tp4YYBkeH4t
 PDKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqP3oVSHlkXK/mbASU1YQIkwtM16OVjQiAccJ39tnlnKHx0nAr8K6vQad+B3KMnr/o0PS7DWre7g==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwviGbGyQdJmstzViZ3BAYdKyBzIHalBrUrL825eywwyya3yUmy
 G2zS54cMGKdGOaMDFBSXr+rv9BhX3HnTZSgJjSghZ/Oyx0Hrv2BzdC4mvcUm6mCkP+KR19yM0aj
 W8nvW9Q==
X-Google-Smtp-Source: AGHT+IGsJrvqYTmQtcrvuuvJ/hwbkz3SgyMuWS0FYMxwQMuh4GEdylWBFKZU6jZSnevp4MEMxg8IfOTNclDW
X-Received: from ior15.prod.google.com ([2002:a05:6602:a00f:b0:83b:744f:7224])
 (user=jdenose job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6602:3a09:b0:83a:b500:3513
 with SMTP id ca18e2360f4ac-84ce00a3e64mr2584711439f.8.1736881562194; Tue, 14
 Jan 2025 11:06:02 -0800 (PST)
Date: Tue, 14 Jan 2025 19:05:55 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.48.0.rc2.279.g1de40edade-goog
Message-ID: <20250114190554.1.Ia17111747d0450169dbe902e5d7ef25912a9338e@changeid>
Subject: [PATCH] drm/i915/display: Add skip link check quirk
From: Jonathan Denose <jdenose@google.com>
To: LKML <linux-kernel@vger.kernel.ogr>
Cc: intel-gfx@lists.freedesktop.org, jani.nikula@linux.intel.com, 
 rodrigo.vivi@intel.com, Jonathan Denose <jdenose@google.com>, 
 David Airlie <airlied@gmail.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Simona Vetter <simona@ffwll.ch>, Tvrtko Ursulin <tursulin@ursulin.net>,
 dri-devel@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 15 Jan 2025 15:24:15 +0000
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

The display on the Advantech UTC124G3PWWW0E-ES worked fine until commit
"drm/i915/dp: Recheck link state after modeset" was introduced. After
this commit the display flickers intermittently as the driver code
initiates the delayed link recheck in an infinite loop.

To resolve this issue for the Advantech device, add a quirk to skip over
the delayed link recheck.

Signed-off-by: Jonathan Denose <jdenose@google.com>
---

 drivers/gpu/drm/i915/display/intel_dp_link_training.c | 4 +++-
 drivers/gpu/drm/i915/display/intel_quirks.c           | 8 ++++++++
 drivers/gpu/drm/i915/display/intel_quirks.h           | 1 +
 3 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
index 397cc4ebae526..7804ad38b00cd 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
@@ -32,6 +32,7 @@
 #include "intel_encoder.h"
 #include "intel_hotplug.h"
 #include "intel_panel.h"
+#include "intel_quirks.h"
 
 #define LT_MSG_PREFIX			"[CONNECTOR:%d:%s][ENCODER:%d:%s][%s] "
 #define LT_MSG_ARGS(_intel_dp, _dp_phy)	(_intel_dp)->attached_connector->base.base.id, \
@@ -1622,7 +1623,8 @@ void intel_dp_start_link_train(struct intel_atomic_state *state,
 		lt_dbg(intel_dp, DP_PHY_DPRX, "Forcing link training failure\n");
 	} else if (passed) {
 		intel_dp->link.seq_train_failures = 0;
-		intel_encoder_link_check_queue_work(encoder, 2000);
+		if (!intel_has_quirk(display, QUIRK_SKIP_LINK_CHECK))
+			intel_encoder_link_check_queue_work(encoder, 2000);
 		return;
 	}
 
diff --git a/drivers/gpu/drm/i915/display/intel_quirks.c b/drivers/gpu/drm/i915/display/intel_quirks.c
index 28f497ae785bb..d472a5f21f8b9 100644
--- a/drivers/gpu/drm/i915/display/intel_quirks.c
+++ b/drivers/gpu/drm/i915/display/intel_quirks.c
@@ -78,6 +78,12 @@ static void quirk_fw_sync_len(struct intel_dp *intel_dp)
 	drm_info(display->drm, "Applying Fast Wake sync pulse count quirk\n");
 }
 
+static void quirk_skip_link_check(struct intel_display *display)
+{
+	intel_set_quirk(display, QUIRK_SKIP_LINK_CHECK);
+	drm_info(display->drm, "Applying skip link check quirk\n");
+}
+
 struct intel_quirk {
 	int device;
 	int subsystem_vendor;
@@ -229,6 +235,8 @@ static struct intel_quirk intel_quirks[] = {
 	{ 0x3184, 0x1019, 0xa94d, quirk_increase_ddi_disabled_time },
 	/* HP Notebook - 14-r206nv */
 	{ 0x0f31, 0x103c, 0x220f, quirk_invert_brightness },
+	/* Advantech UTC124G3PWWW0E-ES */
+	{0x5a85, 0x8086, 0x2212, quirk_skip_link_check},
 };
 
 static const struct intel_dpcd_quirk intel_dpcd_quirks[] = {
diff --git a/drivers/gpu/drm/i915/display/intel_quirks.h b/drivers/gpu/drm/i915/display/intel_quirks.h
index cafdebda75354..9e8f2816a4fba 100644
--- a/drivers/gpu/drm/i915/display/intel_quirks.h
+++ b/drivers/gpu/drm/i915/display/intel_quirks.h
@@ -20,6 +20,7 @@ enum intel_quirk_id {
 	QUIRK_LVDS_SSC_DISABLE,
 	QUIRK_NO_PPS_BACKLIGHT_POWER_HOOK,
 	QUIRK_FW_SYNC_LEN,
+	QUIRK_SKIP_LINK_CHECK,
 };
 
 void intel_init_quirks(struct intel_display *display);
-- 
2.48.0.rc2.279.g1de40edade-goog

