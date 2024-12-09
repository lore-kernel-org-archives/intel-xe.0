Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 031ECE7717D
	for <intel-xe@archiver.kernel.org>; Mon,  9 Dec 2024 08:10:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A689B10E4AD;
	Mon,  9 Dec 2024 08:10:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MHQldLZ7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 984F010E4AD
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Dec 2024 08:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733731841; x=1765267841;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gPTm9Yj8JEjuznbg0RRjX2izoKzDzdEzLDfw/OVzZKU=;
 b=MHQldLZ7AYFMm5c/jfa696aLfo+didwOIj5KQySl5N8lRdJLMuX+pd8n
 DKM43YVBdFl/+eZnyQdyT/tnc9GDbE7KfQmpp276TcMHx3DfW6t7R37Hc
 PRAq876ULW5ygRRrZ8+0fia0UxvfbU5QZVlLmjXkyN6HCPmHmY791f8T+
 Eoo8oHex2cbtvmEDPCRRjdQi347zuj77D6vqCUt/ChjOZISemsAmb6EVV
 fEaDhGSsW1+Q/dT2kKam1ll0B/QaXfB7OgLgxv+QwkKoNDJG90I9qCjQv
 RAev7xSix35EgFWEMdJcgAu6dejA7vifWVJw7iXKgToj5AtNFmdVXGqYh g==;
X-CSE-ConnectionGUID: HBNeCShdSUacaYX5+Dq2mg==
X-CSE-MsgGUID: yokV9ExQRASA5holkUrQaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="33359758"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; d="scan'208";a="33359758"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 00:10:40 -0800
X-CSE-ConnectionGUID: 5BrQBArQSUOEfmzXVNyFUw==
X-CSE-MsgGUID: JlA/LMngTBWD+MbbN0QEFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="100031581"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by orviesa003.jf.intel.com with ESMTP; 09 Dec 2024 00:10:39 -0800
From: Animesh Manna <animesh.manna@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jouni.hogander@intel.com, jani.nikula@intel.com, jeevan.b@intel.com,
 Animesh Manna <animesh.manna@intel.com>
Subject: [PATCH v2 1/2] drm/i915/lobf: Add lobf enablement in post plane update
Date: Mon,  9 Dec 2024 13:20:37 +0530
Message-Id: <20241209075038.3976877-2-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20241209075038.3976877-1-animesh.manna@intel.com>
References: <20241209075038.3976877-1-animesh.manna@intel.com>
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

Enablement of LOBF is added in post plane update whenever
has_lobf flag is set. As LOBF can be enabled in non-psr
case as well so adding in post plane update. There is no
change of configuring alpm with psr path.

v1: Initial version.
v2: Use encoder-mask to find the associated encoder from
crtc-state. [Jani]

Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 drivers/gpu/drm/i915/display/intel_alpm.c    | 25 ++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_alpm.h    |  4 ++++
 drivers/gpu/drm/i915/display/intel_display.c |  3 +++
 3 files changed, 32 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/i915/display/intel_alpm.c
index 55f3ae1e68c9..75063342a100 100644
--- a/drivers/gpu/drm/i915/display/intel_alpm.c
+++ b/drivers/gpu/drm/i915/display/intel_alpm.c
@@ -367,6 +367,31 @@ void intel_alpm_configure(struct intel_dp *intel_dp,
 	lnl_alpm_configure(intel_dp, crtc_state);
 }
 
+void intel_alpm_post_plane_update(struct intel_atomic_state *state,
+				  struct intel_crtc *crtc)
+{
+	struct intel_display *display = to_intel_display(state);
+	const struct intel_crtc_state *crtc_state =
+		intel_atomic_get_new_crtc_state(state, crtc);
+	struct intel_encoder *encoder;
+
+	if (!crtc_state->has_lobf)
+		return;
+
+	for_each_intel_encoder_mask(display->drm, encoder,
+				    crtc_state->uapi.encoder_mask) {
+		struct intel_dp *intel_dp;
+
+		if (!intel_encoder_is_dp(encoder))
+			continue;
+
+		intel_dp = enc_to_intel_dp(encoder);
+
+		if (intel_dp_is_edp(intel_dp))
+			intel_alpm_configure(intel_dp, crtc_state);
+	}
+}
+
 static int i915_edp_lobf_info_show(struct seq_file *m, void *data)
 {
 	struct intel_connector *connector = m->private;
diff --git a/drivers/gpu/drm/i915/display/intel_alpm.h b/drivers/gpu/drm/i915/display/intel_alpm.h
index 8c409b10dce6..2f862b0476a8 100644
--- a/drivers/gpu/drm/i915/display/intel_alpm.h
+++ b/drivers/gpu/drm/i915/display/intel_alpm.h
@@ -12,6 +12,8 @@ struct intel_dp;
 struct intel_crtc_state;
 struct drm_connector_state;
 struct intel_connector;
+struct intel_atomic_state;
+struct intel_crtc;
 
 void intel_alpm_init_dpcd(struct intel_dp *intel_dp);
 bool intel_alpm_compute_params(struct intel_dp *intel_dp,
@@ -21,6 +23,8 @@ void intel_alpm_lobf_compute_config(struct intel_dp *intel_dp,
 				    struct drm_connector_state *conn_state);
 void intel_alpm_configure(struct intel_dp *intel_dp,
 			  const struct intel_crtc_state *crtc_state);
+void intel_alpm_post_plane_update(struct intel_atomic_state *state,
+				  struct intel_crtc *crtc);
 void intel_alpm_lobf_debugfs_add(struct intel_connector *connector);
 bool intel_alpm_aux_wake_supported(struct intel_dp *intel_dp);
 bool intel_alpm_aux_less_wake_supported(struct intel_dp *intel_dp);
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 4805bf682d43..ffd96b187e5e 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -55,6 +55,7 @@
 #include "i9xx_plane.h"
 #include "i9xx_plane_regs.h"
 #include "i9xx_wm.h"
+#include "intel_alpm.h"
 #include "intel_atomic.h"
 #include "intel_atomic_plane.h"
 #include "intel_audio.h"
@@ -1190,6 +1191,8 @@ static void intel_post_plane_update(struct intel_atomic_state *state,
 
 	intel_psr_post_plane_update(state, crtc);
 
+	intel_alpm_post_plane_update(state, crtc);
+
 	intel_frontbuffer_flip(dev_priv, new_crtc_state->fb_bits);
 
 	if (new_crtc_state->update_wm_post && new_crtc_state->hw.active)
-- 
2.29.0

