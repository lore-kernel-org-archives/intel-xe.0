Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34196606A31E
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 06:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EGzlVBU4
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E18EC10FE26;
	Thu, 26 Nov 2026 06:35:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DAD010FC6C;
 Thu, 26 Nov 2026 06:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795674923; x=1827210923;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6gRRsjFAOVWz4PTMzN8eFmQX5V2cVGjquv/gFG40RSE=;
 b=EGzlVBU4XJClLxwLy+XZa3knuXc2enob0yRVYxL4p4d0MaYw7Y2MWyHC
 WwoEFZWwwfxotGx8xW7rr91veOxqx74LsNai4jHVa4GrNwy5LQnQSfEdu
 WrAzPJuifwtB97myD29zp6eLWUcwP0GYxBOB9miSWXfRdYf7voIU2k+0z
 zA9KH36RtES/rk8m7pVHJfuyMJgphqLvhqchc+H5r4zj1+OOthuMZeBi1
 vqNwLM5pFrTYV2zM55Vrxr0+Fl93ybc0e/esSIjVNBOL5fOHsHmcvoauC
 4f42dW2IYqfqRY8b4IyRZJp0o3NQqIWIK77/cXr/lJbThXgM319HfgevF g==;
X-CSE-ConnectionGUID: tjAgRw56TXq0//Mk62wO2A==
X-CSE-MsgGUID: 7+3c2fPpT6aZFqChaPC44w==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4462666"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4462666"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 22:35:22 -0800
X-CSE-ConnectionGUID: nwiGgoiFT6aPDuTxEaXcmQ==
X-CSE-MsgGUID: mqTw0VIvQMWDcDZNY4x+oQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; d="scan'208";a="12346773"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa002.fm.intel.com with ESMTP; 25 Nov 2026 22:35:20 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, uma.shankar@intel.com,
 chaitanya.kumar.borah@intel.com, Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 08/15] drm/i915/pipelock: Keep SSC,
 PSR and CMRR off on pipelock tiles
Date: Thu, 26 Nov 2026 12:04:52 +0530
Message-Id: <20261126063459.863698-9-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261126063459.863698-1-suraj.kandpal@intel.com>
References: <20261126063459.863698-1-suraj.kandpal@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=a
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

A few features can't be used on a pipelocked transcoder:

- SSC, as every port has its own PLL and the PLLs have to match
- PSR and panel replay, which pipelock doesn't support
- CMRR and DC balance, which mess with the vtotal before the
  secondary has locked

The PLL and these features are computed before we know which tiles end
up in a sync group, so keep them off for any DP SST tile on platforms
with pipelock. Tiled monitors don't use them in practice anyway.
Add intel_pipelock.[ch] for the pipelock specific code, starting with
the check for such connectors.

Bspec: 73521
Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/Makefile                 |  1 +
 drivers/gpu/drm/i915/display/intel_lt_phy.c   |  4 ++++
 drivers/gpu/drm/i915/display/intel_pipelock.c | 17 +++++++++++++++++
 drivers/gpu/drm/i915/display/intel_pipelock.h | 15 +++++++++++++++
 drivers/gpu/drm/i915/display/intel_psr.c      |  7 +++++++
 drivers/gpu/drm/i915/display/intel_vrr.c      |  8 ++++++--
 drivers/gpu/drm/xe/Makefile                   |  1 +
 7 files changed, 51 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_pipelock.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_pipelock.h

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index ba7eecfffdca..a61642c3e71b 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -305,6 +305,7 @@ i915-y += \
 	display/intel_pch.o \
 	display/intel_pch_display.o \
 	display/intel_pch_refclk.o \
+	display/intel_pipelock.o \
 	display/intel_plane.o \
 	display/intel_pmdemand.o \
 	display/intel_psr.o \
diff --git a/drivers/gpu/drm/i915/display/intel_lt_phy.c b/drivers/gpu/drm/i915/display/intel_lt_phy.c
index 86492651b01d..35fa701eb9be 100644
--- a/drivers/gpu/drm/i915/display/intel_lt_phy.c
+++ b/drivers/gpu/drm/i915/display/intel_lt_phy.c
@@ -20,6 +20,7 @@
 #include "intel_lt_phy.h"
 #include "intel_lt_phy_regs.h"
 #include "intel_panel.h"
+#include "intel_pipelock.h"
 #include "intel_psr.h"
 #include "intel_tc.h"
 
@@ -1338,6 +1339,9 @@ intel_lt_phy_pll_is_ssc_enabled(struct intel_crtc_state *crtc_state,
 		if (intel_panel_use_ssc(display)) {
 			struct intel_dp *intel_dp = enc_to_intel_dp(encoder);
 
+			if (intel_pipelock_connector_possible(intel_dp->attached_connector))
+				return false;
+
 			return (intel_dp->dpcd[DP_MAX_DOWNSPREAD] & DP_MAX_DOWNSPREAD_0_5);
 		}
 	}
diff --git a/drivers/gpu/drm/i915/display/intel_pipelock.c b/drivers/gpu/drm/i915/display/intel_pipelock.c
new file mode 100644
index 000000000000..67c643b6626c
--- /dev/null
+++ b/drivers/gpu/drm/i915/display/intel_pipelock.c
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#include "intel_display_core.h"
+#include "intel_display_types.h"
+#include "intel_pipelock.h"
+
+bool intel_pipelock_connector_possible(const struct intel_connector *connector)
+{
+	struct intel_display *display = to_intel_display(connector);
+
+	return HAS_PIPELOCK(display) && connector->base.has_tile &&
+		connector->base.connector_type == DRM_MODE_CONNECTOR_DisplayPort &&
+		!connector->mst.dp;
+}
diff --git a/drivers/gpu/drm/i915/display/intel_pipelock.h b/drivers/gpu/drm/i915/display/intel_pipelock.h
new file mode 100644
index 000000000000..b08b10f8da34
--- /dev/null
+++ b/drivers/gpu/drm/i915/display/intel_pipelock.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef __INTEL_PIPELOCK_H__
+#define __INTEL_PIPELOCK_H__
+
+#include <linux/types.h>
+
+struct intel_connector;
+
+bool intel_pipelock_connector_possible(const struct intel_connector *connector);
+
+#endif /* __INTEL_PIPELOCK_H__ */
diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index 438cb1502c26..a0e65b24b65a 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -51,6 +51,7 @@
 #include "intel_dsb.h"
 #include "intel_frontbuffer.h"
 #include "intel_hdmi.h"
+#include "intel_pipelock.h"
 #include "intel_psr.h"
 #include "intel_psr_regs.h"
 #include "intel_quirks.h"
@@ -1897,6 +1898,12 @@ void intel_psr_compute_config(struct intel_dp *intel_dp,
 		return;
 	}
 
+	if (intel_pipelock_connector_possible(connector)) {
+		drm_dbg_kms(display->drm,
+			    "PSR condition failed: Tiled display with pipelock\n");
+		return;
+	}
+
 	/* Only used for state verification. */
 	crtc_state->panel_replay_dsc_support = connector->dp.panel_replay_caps.dsc_support;
 	crtc_state->has_panel_replay = _panel_replay_compute_config(crtc_state, conn_state);
diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
index e59345bd1d33..47603c141298 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.c
+++ b/drivers/gpu/drm/i915/display/intel_vrr.c
@@ -25,6 +25,7 @@
 #include "intel_dmc.h"
 #include "intel_dmc_regs.h"
 #include "intel_dp.h"
+#include "intel_pipelock.h"
 #include "intel_psr.h"
 #include "intel_vrr.h"
 #include "intel_vrr_regs.h"
@@ -483,6 +484,7 @@ intel_vrr_compute_config(struct intel_crtc_state *crtc_state,
 	struct intel_connector *connector =
 		to_intel_connector(conn_state->connector);
 	struct drm_display_mode *adjusted_mode = &crtc_state->hw.adjusted_mode;
+	bool pipelock = intel_pipelock_connector_possible(connector);
 	int vmin, vmax;
 
 	if (!HAS_VRR(display))
@@ -523,7 +525,8 @@ intel_vrr_compute_config(struct intel_crtc_state *crtc_state,
 		 * the fixed refresh rate path. It is generic across transcoders
 		 * and gated on platform support and a valid debugfs ratio.
 		 */
-		intel_vrr_cmrr_compute_config(crtc_state);
+		if (!pipelock)
+			intel_vrr_cmrr_compute_config(crtc_state);
 		intel_vrr_compute_fixed_rr_timings(crtc_state);
 	}
 
@@ -536,7 +539,8 @@ intel_vrr_compute_config(struct intel_crtc_state *crtc_state,
 			 crtc_state->hw.adjusted_mode.crtc_vsync_end);
 	}
 
-	intel_vrr_dc_balance_compute_config(crtc_state);
+	if (!pipelock)
+		intel_vrr_dc_balance_compute_config(crtc_state);
 }
 
 static int
diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 52f0d5dd5468..15154987d6a0 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -329,6 +329,7 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
 	i915-display/intel_parent.o \
 	i915-display/intel_pch.o \
 	i915-display/intel_pfit.o \
+	i915-display/intel_pipelock.o \
 	i915-display/intel_plane.o \
 	i915-display/intel_pmdemand.o \
 	i915-display/intel_pps.o \
-- 
2.34.1

