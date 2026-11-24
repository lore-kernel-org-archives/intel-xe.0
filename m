Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE985606A31E
	for <intel-xe@archiver.kernel.org>; Tue, 24 Nov 2026 16:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jaJWYZvc
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B403A10E245;
	Tue, 24 Nov 2026 16:08:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB3AC10F62E;
 Tue, 24 Nov 2026 16:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795536500; x=1827072500;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=oOdH3ItgNNrk2Rhl3x9bqOWxPMbQB1zYHZAVkQxlc2s=;
 b=jaJWYZvcJkVjJKKpxVhcLaSfYBYQC6FtXWf4tbGCo9Q8+UrViPXulBcR
 u44C5Yr3zFTkc+jbruRBpNC9f3C3y6etz5taMhi6ulPZWaATzBakXGiuo
 5d/MZWc1RnB5NHZKsH5HTsPQc3P6JFTIUeooH4OLFW3yevETKQ0ELbOi9
 Dj1PL+Vnr5kvSAukm3CarcTkq/NH1Mg+i/96OryS3btapRCoBX1wyPcqJ
 vYn6Y7ZwyOuqU8ZR1jCkANpKmtI57S0aKutSNOxnnOEIL/jrE6265XhmI
 ZJsxfIb/HF7yL/5zqKdsmY1iVmpx2yx4QEpIPK/DsCZv4JaI5QUJQs6Oz Q==;
X-CSE-ConnectionGUID: BpxKii/9RduJUrmPiiexWQ==
X-CSE-MsgGUID: RB6bgjN4ShOrezyhdRquSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4472566"
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="4472566"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 07:50:01 -0800
X-CSE-ConnectionGUID: vM5se/9FRI22/vCt7WJrtw==
X-CSE-MsgGUID: zDiHKEOTSNyewwhdhNhBIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; d="scan'208";a="11697491"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.215])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 07:50:00 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH] drm/i915/backlight: move struct intel_panel_bl_funcs to
 intel_backlight.h
Date: Tue, 24 Nov 2026 17:49:55 +0200
Message-ID: <20261124154955.1573704-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

struct intel_panel_bl_funcs is only needed in a handful of files. Move
it away from the big intel_display_types.h header.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_backlight.h       | 11 +++++++++++
 drivers/gpu/drm/i915/display/intel_display_types.h   | 12 +-----------
 .../gpu/drm/i915/display/intel_dsi_dcs_backlight.c   |  1 +
 3 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_backlight.h b/drivers/gpu/drm/i915/display/intel_backlight.h
index 339643f63897..2cf9c2a99d06 100644
--- a/drivers/gpu/drm/i915/display/intel_backlight.h
+++ b/drivers/gpu/drm/i915/display/intel_backlight.h
@@ -16,6 +16,17 @@ struct intel_encoder;
 struct intel_panel;
 enum pipe;
 
+struct intel_panel_bl_funcs {
+	/* Connector and platform specific backlight functions */
+	int (*setup)(struct intel_connector *connector, enum pipe pipe);
+	u32 (*get)(struct intel_connector *connector, enum pipe pipe);
+	void (*set)(const struct drm_connector_state *conn_state, u32 level);
+	void (*disable)(const struct drm_connector_state *conn_state, u32 level);
+	void (*enable)(const struct intel_crtc_state *crtc_state,
+		       const struct drm_connector_state *conn_state, u32 level);
+	u32 (*hz_to_pwm)(struct intel_connector *connector, u32 hz);
+};
+
 void intel_backlight_init_funcs(struct intel_panel *panel);
 int intel_backlight_setup(struct intel_connector *connector, enum pipe pipe);
 void intel_backlight_destroy(struct intel_panel *panel);
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 90a5d29169c6..514ca067e139 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -63,6 +63,7 @@ struct intel_dp_link_training;
 struct intel_fbc;
 struct intel_global_objs_state;
 struct intel_hdcp_shim;
+struct intel_panel_bl_funcs;
 struct intel_panic;
 struct intel_tc_port;
 
@@ -305,17 +306,6 @@ struct intel_encoder {
 	const struct intel_bios_encoder_data *devdata;
 };
 
-struct intel_panel_bl_funcs {
-	/* Connector and platform specific backlight functions */
-	int (*setup)(struct intel_connector *connector, enum pipe pipe);
-	u32 (*get)(struct intel_connector *connector, enum pipe pipe);
-	void (*set)(const struct drm_connector_state *conn_state, u32 level);
-	void (*disable)(const struct drm_connector_state *conn_state, u32 level);
-	void (*enable)(const struct intel_crtc_state *crtc_state,
-		       const struct drm_connector_state *conn_state, u32 level);
-	u32 (*hz_to_pwm)(struct intel_connector *connector, u32 hz);
-};
-
 /* in 100us units */
 struct intel_pps_delays {
 	u16 power_up;      /* eDP: T1+T3,   LVDS: T1+T2 */
diff --git a/drivers/gpu/drm/i915/display/intel_dsi_dcs_backlight.c b/drivers/gpu/drm/i915/display/intel_dsi_dcs_backlight.c
index b3c453bf7d5c..14fefd77cecd 100644
--- a/drivers/gpu/drm/i915/display/intel_dsi_dcs_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_dsi_dcs_backlight.c
@@ -27,6 +27,7 @@
 #include <drm/drm_print.h>
 #include <video/mipi_display.h>
 
+#include "intel_backlight.h"
 #include "intel_display_core.h"
 #include "intel_display_types.h"
 #include "intel_dsi.h"
-- 
2.47.3

