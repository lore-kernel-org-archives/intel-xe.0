Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72B3DFEA80D
	for <intel-xe@archiver.kernel.org>; Wed, 25 Mar 2026 05:00:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 149AD10E78B;
	Wed, 25 Mar 2026 05:00:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VjfXPJvE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 731C010E786;
 Wed, 25 Mar 2026 05:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774414818; x=1805950818;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RsxRheNeI6LNNWDlRC+JX7VfWV0183A0CjcM0WsNEqM=;
 b=VjfXPJvE/jE7GupRnYeEH8ElgNMwNnTlDzkP1ILb2Ia9VHweNp8+dY8m
 /SJAk+EQA9/U8KOPuBwXILJ9ESng8UZpQS9A+iGlG8Bt0wKP5FT2lpR6+
 6iUnzv9KgB3sNRzHx9C/uicUyQCZC0ep/bHHXE8hpCr4DY+YJd3YwujOI
 7zEw5M6lyLQHQa65m3RJZFLBOqCL33vaXm4vf2LoBycR3YQYS+2JfL2Ao
 cTltVrahj5WfjkpJs51RfZm0W5IcAHTqgWuj342xN1xU76G6XFWp1nZ84
 wGf4M0oiHX93ootHf2Fy9wctgPlKCyLv7jHAFqHJD7lmcaZ/q/E7KEE8e Q==;
X-CSE-ConnectionGUID: dFI+D9jtQv2dhcpj2806dA==
X-CSE-MsgGUID: m0IOnXaxQVWX9r3o2yTCmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="86922360"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; d="scan'208";a="86922360"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 22:00:18 -0700
X-CSE-ConnectionGUID: qKEZ5TnYTEePg3k54QVaOQ==
X-CSE-MsgGUID: srn8vrMBTaCMenM3DhfNKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; d="scan'208";a="224580857"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa008.jf.intel.com with ESMTP; 24 Mar 2026 22:00:16 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: sowmiya.s@intel.com, uma.shankar@intel.com, swati2.sharma@intel.com,
 chaitanya.kumar.borah@intel.com, arun.r.murthy@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH v2 20/26] drm/i915/writeback: Configure WD_STRIDE reg
Date: Wed, 25 Mar 2026 10:29:10 +0530
Message-Id: <20260325045916.984243-21-suraj.kandpal@intel.com>
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

Write to the WD_STRIDE register using the appropriate calculation
based on the color mode and hactive.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 .../gpu/drm/i915/display/intel_writeback.c    | 36 +++++++++++++++++++
 .../drm/i915/display/intel_writeback_reg.h    |  1 +
 2 files changed, 37 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_writeback.c b/drivers/gpu/drm/i915/display/intel_writeback.c
index d74e5fce85d6..bbb3c776ecca 100644
--- a/drivers/gpu/drm/i915/display/intel_writeback.c
+++ b/drivers/gpu/drm/i915/display/intel_writeback.c
@@ -230,15 +230,51 @@ static int intel_writeback_atomic_check(struct drm_connector *connector,
 	return 0;
 }
 
+static int
+get_color_mode_bpp(struct intel_display *display, u32 color_format)
+{
+	int bpp = 0;
+
+	switch (color_format) {
+	case DRM_FORMAT_XYUV8888:
+	case DRM_FORMAT_YUYV:
+	case DRM_FORMAT_VYUY:
+	case DRM_FORMAT_XBGR8888:
+	case DRM_FORMAT_XBGR2101010:
+	case DRM_FORMAT_XVYU2101010:
+		bpp = 4;
+		break;
+	default:
+		drm_err(display->drm, "Unsupported format for writeback\n");
+		break;
+	}
+
+	return bpp;
+}
+
 static void intel_writeback_capture(struct intel_atomic_state *state,
 				    struct intel_connector *connector)
 {
 	struct intel_display *display = to_intel_display(connector);
 	struct intel_writeback_connector *wb_conn =
 		conn_to_intel_writeback_connector(connector);
+	struct drm_connector_state *conn_state =
+		drm_atomic_get_new_connector_state(&state->base, &connector->base);
+	struct intel_crtc *crtc = intel_crtc_for_pipe(display, wb_conn->pipe);
+	struct intel_crtc_state *crtc_state =
+		intel_atomic_get_new_crtc_state(state, crtc);
+	const struct drm_display_mode *adjusted_mode =
+		&crtc_state->hw.adjusted_mode;
+	struct drm_writeback_job *wb_job = conn_state->writeback_job;
 	enum transcoder trans = wb_conn->trans;
 	u32 val = 0;
+	int bpp;
 
+	bpp = get_color_mode_bpp(display, wb_job->fb->format->format);
+	val = DIV_ROUND_UP((adjusted_mode->hdisplay * bpp), 64);
+	intel_de_write(display, WD_STRIDE(trans), WD_STRIDE_VAL(val));
+
+	val = 0;
 	val |= START_TRIGGER_FRAME | WD_FRAME_NUMBER(wb_conn->frame_num);
 	intel_de_rmw(display, WD_TRANS_FUNC_CTL(trans),
 		     START_TRIGGER_FRAME | WD_FRAME_NUMBER_MASK,
diff --git a/drivers/gpu/drm/i915/display/intel_writeback_reg.h b/drivers/gpu/drm/i915/display/intel_writeback_reg.h
index 5e7c6c99d191..f526af0f9aff 100644
--- a/drivers/gpu/drm/i915/display/intel_writeback_reg.h
+++ b/drivers/gpu/drm/i915/display/intel_writeback_reg.h
@@ -60,6 +60,7 @@
 					_WD_STRIDE_0,\
 					_WD_STRIDE_1)
 #define WD_STRIDE_MASK			REG_GENMASK(15, 6)
+#define WD_STRIDE_VAL(val)		REG_FIELD_PREP(WD_STRIDE_MASK, val)
 
 #define _WD_STREAMCAP_CTL0		0x6e590
 #define _WD_STREAMCAP_CTL1		0x6ed90
-- 
2.34.1

