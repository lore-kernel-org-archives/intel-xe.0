Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C839D185F4
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jan 2026 13:08:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7618010E70D;
	Thu,  8 Jan 2026 13:08:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Z3rvJPXQ";
	dkim-atps=neutral
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EDED10E6EE
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Jan 2026 11:14:49 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-b7cee045187so317086766b.0
 for <intel-xe@lists.freedesktop.org>; Thu, 08 Jan 2026 03:14:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767870888; x=1768475688; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sKWgs5dpdsKH6FgeBZzq94nwZdAGzGB7JCxbwQEsmoY=;
 b=Z3rvJPXQ0Rk6VAQhrHwSBikUNjH3rGzeXmJTrNiF+1hZa5Ar65zCs3RbcqCr1gt4WM
 ZUC8zxEa+zIZXEdXcgkNv41BdQGlhFiM/PO7nHbS1x13gtJhvFVRC/C0TOSYnDMSp/MS
 +6sRSjQPbVJTroyWx+nM8f5NdDdJXA58v7Bl4P4a8cEQCPW73bRk47vxRxt2EhieCC2r
 HdKz1t/FAkIve7SoyhYz5BI9zhROONUKIvYyTzgtmhk4S37KfOYMT/w+mP1r1Sx4z276
 qiH4ZQAcOakUiPsZxc8tTB8j5zJQb7tdUhUyU0LwxVqBdqrXL8+v1f035qUpe9uoTUrn
 SPEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767870888; x=1768475688;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sKWgs5dpdsKH6FgeBZzq94nwZdAGzGB7JCxbwQEsmoY=;
 b=vAgDyT02HEM7b88Dmmttf5BuFCEofrr7BSi/ioUpzvyg5jnPf4KYA8frVApsl6aeWP
 JFjlGMqrLDc/vijY2SxPfJVney3/S9dltZ/h4s3fudnADE/NsPsztv0JCkIzkncqNih9
 BCodoxhp+bybjC1gBHTTiwa2F5OL3OUFI2XHhwJmLyTmjCZN5KoOCKUVDeSZVvTtzuZ+
 40KS6yreJQhzYAeKgZ0IFj+iLOAO0/F6yQH5DcjFaffbyWG67tL8ySYv5ZibzJjJ03wI
 3+pWieyv8q1CoAtMtmPSUNGXc+aH8txK9OopYi+VGGT+517G0tne2buKKYQWXL42grXJ
 uzLQ==
X-Gm-Message-State: AOJu0YzqQyUHqYLmLwa6h/OmFY2dD9rtotqj6gytWiFrMchCntoQwuQr
 uAUy++LL1bG5TlHZ8uySNUppDa7lLoNdkD08dKIzkLo4EqFVaFYdgK3fPxAHkq3w
X-Gm-Gg: AY/fxX68FaKNR7+EoSHr2TbbAnwrwA9PxRprVOs2RJJ+iKagiqL7Hef2sBan4MEsRES
 9pdrHgESPlIvOVfuLJF13J8t8x/WbnQ5RmNBBgQx5aR9uy2yxBB4nUVhBYIJVw/z/cSmaxGK0rw
 cR76KmPaCiJCXJJOkvglmshX72r4o15EdCH1CwHiG4HooT98BdukXp039eJMCpbP+HxuUVSZpDj
 avrPGYSW42Z8MM1eHBT65SMlLcQMDtro6xbtnzV9HnY4L3WlC1tka+zHudqWCGIoQ8UH25PHvX1
 +IDe0rbn/MGIO3r5PlsDcHrFAsUikz4Q0qPGgFvatuqsLaP1AS+O8+0+Kmye8RyZOFDG1jrUNCm
 X7XC0V2zg/W/H5HA9u8FxCgr3F+4NDfM1ajngvvbNTMeiGfyvEEMmUprQrBdOCipPKzWZk3k1QK
 zk8tKONy6aiVm8fCiZp/g+sY2ZgVQaxxURFLje8sE2zoQiG33uPg049ghYpw==
X-Google-Smtp-Source: AGHT+IEEQdScJUI+y/w411MeGdHdGWQWK5K/5xt1RDN2pUdRUo096NsBq3GlzFyCpuIme5CiiTT2Bw==
X-Received: by 2002:a17:907:9550:b0:b7f:fa5d:53d with SMTP id
 a640c23a62f3a-b8429b96f7dmr706187366b.30.1767870887507; 
 Thu, 08 Jan 2026 03:14:47 -0800 (PST)
Received: from JTOLLET-M-FKW7.cisco.com
 ([2001:420:44f5:1250:8dec:f0e8:213b:6bde])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b842a4d3229sm766484666b.37.2026.01.08.03.14.47
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 08 Jan 2026 03:14:47 -0800 (PST)
From: Jerome Tollet <jerome.tollet@gmail.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, jani.nikula@linux.intel.com,
 rodrigo.vivi@intel.com, ankit.k.nautiyal@intel.com,
 Jerome Tollet <jerome.tollet@gmail.com>
Subject: [PATCH 1/2] drm/i915/hdmi: Poll for 200 msec for TMDS_Scrambler_Status
Date: Thu,  8 Jan 2026 12:14:46 +0100
Message-ID: <20260108111446.1954-1-jerome.tollet@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 08 Jan 2026 13:08:00 +0000
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

As per HDMI 2.0 specification, after scrambled video transmission begins,
the source must poll the TMDS_Scrambler_Status bit until it reads 1 or
until a timeout of 200 ms.

Add a polling step after enabling the HDMI port to verify scrambling
status, following the spec requirement.

Without the wait for the scrambling bit to set, some HDMI 2.0 monitors fail
to decode the signal at 4K@60Hz (594 MHz) when SCDC scrambling is not yet
fully configured by the sink.

v2:
 - Instead of the fixed delay, poll for TMDS scramble status for 200 msec
   as per the HDMI spec. (Ankit)

Reported-by: Jerome Tollet <jerome.tollet@gmail.com>
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6868
Link: https://lore.kernel.org/dri-devel/20251230091037.5603-1-jerome.tollet@gmail.com/
Signed-off-by: Jerome Tollet <jerome.tollet@gmail.com>
Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_ddi.c  |  2 ++
 drivers/gpu/drm/i915/display/intel_hdmi.c | 25 +++++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_hdmi.h |  2 ++
 3 files changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index cb91d07cdaa6..c708b713f0e8 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -3506,6 +3506,8 @@ static void intel_ddi_enable_hdmi(struct intel_atomic_state *state,
 	}

 	intel_ddi_buf_enable(encoder, buf_ctl);
+
+	intel_hdmi_poll_for_scrambling_enable(crtc_state, connector);
 }

 static void intel_ddi_enable(struct intel_atomic_state *state,
diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index 055e68810d0d..958d939ae6ee 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -2694,6 +2694,31 @@ intel_hdmi_add_properties(struct intel_hdmi *intel_hdmi, struct drm_connector *_
 	drm_connector_attach_max_bpc_property(&connector->base, 8, 12);
 }

+/*
+ * As Per HDMI 2.0 spec: after scrambled video transmission begins,
+ * poll TMDS_Scrambler_Status until it reads 1, for up to 200 ms.
+ */
+void
+intel_hdmi_poll_for_scrambling_enable(const struct intel_crtc_state *crtc_state,
+				      struct drm_connector *_connector)
+{
+	struct intel_connector *connector = to_intel_connector(_connector);
+	struct intel_display *display = to_intel_display(crtc_state);
+	bool scrambling_enabled = false;
+	int ret;
+
+	if (!crtc_state->hdmi_scrambling)
+		return;
+
+	/* Poll for a max of 200 msec as per HDMI spec */
+	ret = poll_timeout_us(scrambling_enabled = drm_scdc_get_scrambling_status(&connector->base),
+			      scrambling_enabled, 1000, 200 * 1000, false);
+	if (ret)
+		drm_dbg_kms(display->drm,
+			    "[CONNECTOR:%d:%s] Timed out waiting for scrambling enable\n",
+			    connector->base.base.id, connector->base.name);
+}
+
 /*
  * intel_hdmi_handle_sink_scrambling: handle sink scrambling/clock ratio setup
  * @encoder: intel_encoder
diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.h b/drivers/gpu/drm/i915/display/intel_hdmi.h
index be2fad57e4ad..0fa3661568e8 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.h
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.h
@@ -70,5 +70,7 @@ void hsw_read_infoframe(struct intel_encoder *encoder,
 			const struct intel_crtc_state *crtc_state,
 			unsigned int type,
 			void *frame, ssize_t len);
+void intel_hdmi_poll_for_scrambling_enable(const struct intel_crtc_state *crtc_state,
+					   struct drm_connector *_connector);

 #endif /* __INTEL_HDMI_H__ */
--
2.45.2
