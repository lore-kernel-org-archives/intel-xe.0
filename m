Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B394606A334
	for <intel-xe@archiver.kernel.org>; Fri, 27 Nov 2026 06:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QaUz9vGy
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0694011234C;
	Fri, 27 Nov 2026 06:10:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3398E11228E;
 Fri, 27 Nov 2026 06:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795759808; x=1827295808;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zhHCvhmfNdqEpb9wUIm9t1FgGVdoDyy0xTgfcrFGULc=;
 b=QaUz9vGyBCjJpFFF/aP0T44EO4kl/EPFW8dMN3mnwY+vX7x6RASky7ep
 O5eupnafHToZ/EijgJ2M63/Dm3wPd4UVCDBNS7IKIGLVHxePFPReXEs+D
 Ab1p3u8llc4i/ae5DSqfRB2qZWam3ttCkl7j8lV2ddr4UkAKvLq15CLG6
 0kInDaBMoC+p3pdYZ6UEBn24solUN6UQpDJ0YQlBnFGnQdQJaJ4rpCm3R
 mNi6JZ7NuhwjSNMyD3Pt/mNgPI93nA7u9lNXa7oyAjEFFAxHcUsSNTpiL
 IAFfysOeq/c3mGmqiO0MezhgtLoWDqxLCWhU/nUelDpyFx2GcvVy1Sv4S w==;
X-CSE-ConnectionGUID: QVRGNjhqR96kEFZPiU/XYA==
X-CSE-MsgGUID: 74iyfbzaSG2eGaMrDayW9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4578273"
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="4578273"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 22:10:08 -0800
X-CSE-ConnectionGUID: 2vxcSqqSTFajo/CGx5oeEw==
X-CSE-MsgGUID: hvMrswkPT+26U2RCg+A7wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; d="scan'208";a="14361968"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa013.fm.intel.com with ESMTP; 26 Nov 2026 22:10:05 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, uma.shankar@intel.com,
 chaitanya.kumar.borah@intel.com, jani.nikula@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH v2 14/18] drm/i915/pipelock: Equalize the guardband across a
 pipelock group
Date: Fri, 27 Nov 2026 11:39:20 +0530
Message-Id: <20261127060924.1648295-15-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261127060924.1648295-1-suraj.kandpal@intel.com>
References: <20261127060924.1648295-1-suraj.kandpal@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
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

Pipelock needs the same VRR guardband on all the transcoders in the
group, as the frame sync is sent at the start of the guardband. The
optimized guardband is computed per CRTC though, and can differ
between tiles, for instance when their pipes don't have the same
number of scalers. That would make us give up on syncing the tiles.

Instead, once the group is known, raise the guardband of each tile to
the largest one in its group. The tiles have the same timings, so that
guardband fits all of them. Compute the group before the DP late
config, so that the SDP transmission lines, which are relative to the
guardband, are computed from the final value.

Bspec: 73521
Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
v1 -> v2:
- Check hw.enable before using cpu_transcoder (Sashiko)
- Use transcoder_mask and intel_vrr_set_guardband() (Jani)

 drivers/gpu/drm/i915/display/intel_ddi.c      | 12 +++-----
 drivers/gpu/drm/i915/display/intel_pipelock.c | 30 +++++++++++++++++--
 drivers/gpu/drm/i915/display/intel_pipelock.h |  5 +++-
 3 files changed, 36 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index cbfb61737ff0..44816b701434 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -4716,13 +4716,6 @@ static int intel_ddi_compute_config_late(struct intel_atomic_state *state,
 	struct intel_display *display = to_intel_display(encoder);
 	struct drm_connector *connector = conn_state->connector;
 	u16 port_sync_transcoder_mask = 0;
-	int ret = 0;
-
-	if (intel_crtc_has_dp_encoder(crtc_state))
-		ret = intel_dp_compute_config_late(encoder, crtc_state, conn_state);
-
-	if (ret)
-		return ret;
 
 	drm_dbg_kms(display->drm, "[ENCODER:%d:%s] [CRTC:%d:%s]\n",
 		    encoder->base.base.id, encoder->base.name,
@@ -4749,7 +4742,10 @@ static int intel_ddi_compute_config_late(struct intel_atomic_state *state,
 	}
 
 	if (HAS_PIPELOCK(display))
-		intel_pipelock_compute_config(crtc_state);
+		intel_pipelock_compute_config(state, crtc_state, port_sync_transcoder_mask);
+
+	if (intel_crtc_has_dp_encoder(crtc_state))
+		return intel_dp_compute_config_late(encoder, crtc_state, conn_state);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/i915/display/intel_pipelock.c b/drivers/gpu/drm/i915/display/intel_pipelock.c
index 9e70683f75a6..54bd3f73bb72 100644
--- a/drivers/gpu/drm/i915/display/intel_pipelock.c
+++ b/drivers/gpu/drm/i915/display/intel_pipelock.c
@@ -8,6 +8,7 @@
 #include <drm/display/drm_dp_helper.h>
 #include <drm/drm_print.h>
 
+#include "intel_display.h"
 #include "intel_display_core.h"
 #include "intel_display_types.h"
 #include "intel_dp.h"
@@ -138,14 +139,39 @@ bool intel_pipelock_compatible(const struct intel_crtc_state *crtc_state1,
 		crtc_state1->vrr.vmin == crtc_state2->vrr.vmin &&
 		crtc_state1->vrr.vmax == crtc_state2->vrr.vmax &&
 		crtc_state1->vrr.flipline == crtc_state2->vrr.flipline &&
-		crtc_state1->vrr.guardband == crtc_state2->vrr.guardband &&
 		crtc_state1->infoframes.enable == crtc_state2->infoframes.enable &&
 		intel_dpll_compare_hw_state(display, &crtc_state1->dpll_hw_state,
 					    &crtc_state2->dpll_hw_state);
 }
 
-void intel_pipelock_compute_config(struct intel_crtc_state *crtc_state)
+static int pipelock_group_guardband(struct intel_atomic_state *state, u16 transcoder_mask)
 {
+	const struct intel_crtc_state *crtc_state;
+	struct intel_crtc *crtc;
+	int guardband = 0;
+
+	for_each_new_intel_crtc_in_state(state, crtc, crtc_state) {
+		if (crtc_state->hw.enable &&
+		    transcoder_mask & BIT(crtc_state->cpu_transcoder))
+			guardband = max_t(int, guardband, crtc_state->vrr.guardband);
+	}
+
+	return guardband;
+}
+
+void intel_pipelock_compute_config(struct intel_atomic_state *state,
+				   struct intel_crtc_state *crtc_state,
+				   u16 transcoder_mask)
+{
+	int guardband;
+
+	if (!transcoder_mask)
+		return;
+
+	guardband = pipelock_group_guardband(state, transcoder_mask);
+	if (guardband != crtc_state->vrr.guardband)
+		intel_vrr_set_guardband(crtc_state, guardband);
+
 	if (crtc_state->sync_primary_transcoder == INVALID_TRANSCODER)
 		return;
 
diff --git a/drivers/gpu/drm/i915/display/intel_pipelock.h b/drivers/gpu/drm/i915/display/intel_pipelock.h
index b75efa71a831..76a435d9809b 100644
--- a/drivers/gpu/drm/i915/display/intel_pipelock.h
+++ b/drivers/gpu/drm/i915/display/intel_pipelock.h
@@ -8,6 +8,7 @@
 
 #include <linux/types.h>
 
+struct intel_atomic_state;
 struct intel_connector;
 struct intel_crtc_state;
 
@@ -16,6 +17,8 @@ bool intel_pipelock_possible(const struct intel_crtc_state *crtc_state,
 			     struct intel_connector *connector);
 bool intel_pipelock_compatible(const struct intel_crtc_state *crtc_state1,
 			       const struct intel_crtc_state *crtc_state2);
-void intel_pipelock_compute_config(struct intel_crtc_state *crtc_state);
+void intel_pipelock_compute_config(struct intel_atomic_state *state,
+				   struct intel_crtc_state *crtc_state,
+				   u16 transcoder_mask);
 
 #endif /* __INTEL_PIPELOCK_H__ */
-- 
2.34.1

