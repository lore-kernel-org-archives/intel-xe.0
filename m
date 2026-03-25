Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8B0DFEA803
	for <intel-xe@archiver.kernel.org>; Wed, 25 Mar 2026 05:00:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E4AD10E788;
	Wed, 25 Mar 2026 05:00:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XTEIhRr1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8762010E77D;
 Wed, 25 Mar 2026 05:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774414811; x=1805950811;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3MptqPIxZMIxLhgUR1NMD7yDKHYTmDcNOCecRnvp2B8=;
 b=XTEIhRr1wWlsnse5nQ/LDwA3/FSxvSfJs+lsRPly+hnlCP3CbR7Os5rc
 TppYjzU6sS9btTEM8xypAPAgi/Xhb3UcC10Sd7CTjpSpo9yxPtX3S+fxA
 mar2vT/hwEQObYNzc4Vvoc22t9LWTj8LlUz/r0WA34f+Zom5KK/A0wiPp
 Ztx7TGV5dKPf3u4idOcB05ijQ/5umjVgrjff9S2r3fec45tuklwY91rM9
 oZgLRQe1g61XwQzAGgdRLxGICa/xhohc0cmMR8Bq6IKUXvpW7I9WQlLEJ
 SYYDRabMLNiXI5eMKbGYzTzU6CXsH5sZ9/TupfFd2IZDBvYPV5dEJBYGd A==;
X-CSE-ConnectionGUID: t7oVJGYQT3SAHtSlO7w1Rw==
X-CSE-MsgGUID: DsN9AYO3Q9CEufvhXJdaEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="86922345"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; d="scan'208";a="86922345"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 22:00:10 -0700
X-CSE-ConnectionGUID: WW4mXwSnQTKXPgZ72RorTg==
X-CSE-MsgGUID: yYPJb/syQ4eO+TcbUyCx6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; d="scan'208";a="224580760"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa008.jf.intel.com with ESMTP; 24 Mar 2026 22:00:07 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: sowmiya.s@intel.com, uma.shankar@intel.com, swati2.sharma@intel.com,
 chaitanya.kumar.borah@intel.com, arun.r.murthy@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH v2 17/26] drm/i915/writeback: Add the enable sequence from
 writeback
Date: Wed, 25 Mar 2026 10:29:07 +0530
Message-Id: <20260325045916.984243-18-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260325045916.984243-1-suraj.kandpal@intel.com>
References: <20260325045916.984243-1-suraj.kandpal@intel.com>
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

Add enable sequence for writeback, use encoder->enable hook to
enable the transcoder.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 .../gpu/drm/i915/display/intel_writeback.c    | 103 ++++++++++++++++++
 1 file changed, 103 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_writeback.c b/drivers/gpu/drm/i915/display/intel_writeback.c
index 722253e7341c..7221da6f3d1e 100644
--- a/drivers/gpu/drm/i915/display/intel_writeback.c
+++ b/drivers/gpu/drm/i915/display/intel_writeback.c
@@ -16,8 +16,10 @@
 
 #include "intel_atomic.h"
 #include "intel_connector.h"
+#include "intel_crtc.h"
 #include "intel_de.h"
 #include "intel_display_driver.h"
+#include "intel_display_regs.h"
 #include "intel_display_types.h"
 #include "intel_display_utils.h"
 #include "intel_fb_pin.h"
@@ -29,6 +31,7 @@ struct intel_writeback_connector {
 	struct intel_encoder encoder;
 	struct intel_writeback_job *job;
 	enum transcoder trans;
+	enum pipe pipe;
 	int frame_num;
 };
 
@@ -47,6 +50,12 @@ static const u32 writeback_formats[] = {
 	DRM_FORMAT_XBGR2101010,
 };
 
+static struct intel_writeback_connector
+*enc_to_intel_writeback_connector(struct intel_encoder *encoder)
+{
+	return container_of(encoder, struct intel_writeback_connector, encoder);
+}
+
 static int intel_writeback_connector_init(struct intel_connector *connector)
 {
 	struct intel_digital_connector_state *conn_state;
@@ -214,6 +223,99 @@ static int intel_writeback_atomic_check(struct drm_connector *connector,
 	return 0;
 }
 
+static void intel_writeback_enable_encoder(struct intel_atomic_state *state,
+					   struct intel_encoder *encoder,
+					   const struct intel_crtc_state *crtc_state,
+					   const struct drm_connector_state *conn_state)
+{
+	struct intel_display *display = to_intel_display(crtc_state);
+	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
+	struct intel_writeback_connector *wb_conn =
+		enc_to_intel_writeback_connector(encoder);
+	struct intel_writeback_job *job = wb_conn->job;
+	const struct drm_display_mode *adjusted_mode = &crtc_state->hw.adjusted_mode;
+	enum transcoder trans = crtc_state->cpu_transcoder;
+	struct intel_crtc *pipe_crtc;
+	struct drm_framebuffer *fb;
+	u32 val = 0, hactive, vactive;
+	int i = 0;
+
+	if (!conn_state->writeback_job)
+		return;
+
+	wb_conn->trans = trans;
+	wb_conn->pipe = crtc->pipe;
+	fb = job->fb;
+	hactive = adjusted_mode->hdisplay;
+	vactive = adjusted_mode->vdisplay;
+
+	/* Configure WD_STRIDE, WD_SURF and WD_TAIL_CFG */
+	/* Enable Planes, Pipes and Transcoder */
+	/* TRANSCODER TIMINGS and other transcoder setting*/
+	/* minimum hactive as per bspec: 64 pixels */
+	if (hactive < 64)
+		drm_err(display->drm, "hactive is less then 64 pixels\n");
+
+	intel_de_write(display, TRANS_HTOTAL(display, trans), HACTIVE(hactive - 1));
+	intel_de_write(display, TRANS_VTOTAL(display, trans), VACTIVE(vactive - 1));
+
+	val = 0;
+	/* 2f) Configure and enable TRANS_WD_FUNC_CTL */
+	switch (crtc->pipe) {
+	default:
+		fallthrough;
+	case PIPE_A:
+		val |= WD_INPUT_PIPE_A;
+		break;
+	case PIPE_B:
+		val |= WD_INPUT_PIPE_B;
+		break;
+	case PIPE_C:
+		val |= WD_INPUT_PIPE_C;
+		break;
+	case PIPE_D:
+		val |= WD_INPUT_PIPE_D;
+		break;
+	}
+
+	switch (fb->format->format) {
+	default:
+		fallthrough;
+	case DRM_FORMAT_YUYV:
+		val |= WD_PIX_FMT_YUYV;
+		break;
+	case DRM_FORMAT_XYUV8888:
+		val |= WD_PIX_FMT_XYUV8888;
+		break;
+	case DRM_FORMAT_XBGR8888:
+		val |= WD_PIX_FMT_XBGR8888;
+		break;
+	case DRM_FORMAT_XBGR2101010:
+		val |= WD_PIX_FMT_XBGR2101010;
+		break;
+	}
+
+	val |= TRANS_WD_FUNC_ENABLE | WD_TRIGGERED_CAP_MODE_ENABLE |
+		WD_DISABLE_POINTERS;
+	intel_de_write(display, WD_TRANS_FUNC_CTL(trans), val);
+
+	if (DISPLAY_VER(display) >= 13)
+		intel_de_rmw(display, PIPE_CHICKEN(crtc->pipe),
+			     UNDERRUN_RECOVERY_DISABLE_ADLP,
+			     UNDERRUN_RECOVERY_DISABLE_ADLP);
+
+	/*  Configure and enable TRANS_CONF */
+	intel_de_write(display, TRANSCONF_WD(trans), WD_TRANS_ENABLE);
+	intel_de_posting_read(display, TRANSCONF_WD(trans));
+
+	for_each_pipe_crtc_modeset_enable(display, pipe_crtc, crtc_state, i) {
+		const struct intel_crtc_state *pipe_crtc_state =
+			intel_atomic_get_new_crtc_state(state, pipe_crtc);
+
+		intel_crtc_vblank_on(pipe_crtc_state);
+	}
+}
+
 static const struct drm_encoder_funcs drm_writeback_encoder_funcs = {
 	.destroy = drm_encoder_cleanup,
 };
@@ -334,6 +436,7 @@ int intel_writeback_init(struct intel_display *display)
 	encoder->get_config = intel_writeback_get_config;
 	encoder->get_hw_state = intel_writeback_get_hw_state;
 	encoder->compute_config = intel_writeback_compute_config;
+	encoder->enable = intel_writeback_enable_encoder;
 
 	connector = &writeback_conn->connector;
 	ret = intel_writeback_connector_alloc(connector);
-- 
2.34.1

