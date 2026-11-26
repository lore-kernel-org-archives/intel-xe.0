Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED0CD606A31C
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 06:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=k6dtnS9Q
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A723A10FE88;
	Thu, 26 Nov 2026 06:35:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C97910FCF9;
 Thu, 26 Nov 2026 06:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795674929; x=1827210929;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=md660OA7ltvodYP/bbsPrGiB7H8q48XjeFG5+YSTwF4=;
 b=k6dtnS9QAPHjjqgSm2kNc3TG1BA6hUDK6ej8BpzdylcRCYw3HaVc1WlY
 8Gi0E3ZBxPLEwn4lh1WXnczFwtH39XlEKz0dm84SKVM2fl5rX9tfmivez
 TYE88TW4cgU6/RNEy3Yi/I3FHcdf0Lpn92FlkWivBhbUrYKYMod/2ynnT
 dsO4wYcVTAgbGOZwDmQ+aScDupYJYbkRsM/BSl4gbLjXrcA9mbgDM1hDg
 IIjUkJB8xmWQS9uMGSvnLkiu8UuwTxXorQi/hV0+oN4W5O6kdXJ1CwCJW
 uhYKyKi22rDfkMMKflEFaKdXYWVgl0FfRkU52JKZbmOnpb2w233Ef+ieS Q==;
X-CSE-ConnectionGUID: 0s81sk+iSCG1cn1IHAZ6cA==
X-CSE-MsgGUID: Q2OlY30QQ9OsWIRAAOoiLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4462674"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4462674"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 22:35:29 -0800
X-CSE-ConnectionGUID: wlyC7l9zQ8GwMaRjzTTnMg==
X-CSE-MsgGUID: 9yR/EO1AQCqYYv/XY4kbOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; d="scan'208";a="12346786"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa002.fm.intel.com with ESMTP; 25 Nov 2026 22:35:27 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, uma.shankar@intel.com,
 chaitanya.kumar.borah@intel.com, Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 11/15] drm/i915/pipelock: Equalize the guardband across a
 pipelock group
Date: Thu, 26 Nov 2026 12:04:55 +0530
Message-Id: <20261126063459.863698-12-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261126063459.863698-1-suraj.kandpal@intel.com>
References: <20261126063459.863698-1-suraj.kandpal@intel.com>
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
 drivers/gpu/drm/i915/display/intel_ddi.c      | 12 +++-----
 drivers/gpu/drm/i915/display/intel_pipelock.c | 29 +++++++++++++++++--
 drivers/gpu/drm/i915/display/intel_pipelock.h |  5 +++-
 3 files changed, 35 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index f6352e9ece6e..31b03bbd43c4 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -4716,13 +4716,6 @@ static int intel_ddi_compute_config_late(struct intel_atomic_state *state,
 	struct intel_display *display = to_intel_display(encoder);
 	struct drm_connector *connector = conn_state->connector;
 	u16 port_sync_transcoders = 0;
-	int ret = 0;
-
-	if (intel_crtc_has_dp_encoder(crtc_state))
-		ret = intel_dp_compute_config_late(encoder, crtc_state, conn_state);
-
-	if (ret)
-		return ret;
 
 	drm_dbg_kms(display->drm, "[ENCODER:%d:%s] [CRTC:%d:%s]\n",
 		    encoder->base.base.id, encoder->base.name,
@@ -4748,7 +4741,10 @@ static int intel_ddi_compute_config_late(struct intel_atomic_state *state,
 	}
 
 	if (HAS_PIPELOCK(display))
-		intel_pipelock_compute_config(crtc_state);
+		intel_pipelock_compute_config(state, crtc_state, port_sync_transcoders);
+
+	if (intel_crtc_has_dp_encoder(crtc_state))
+		return intel_dp_compute_config_late(encoder, crtc_state, conn_state);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/i915/display/intel_pipelock.c b/drivers/gpu/drm/i915/display/intel_pipelock.c
index 23b6db074385..276a7bfa7c4b 100644
--- a/drivers/gpu/drm/i915/display/intel_pipelock.c
+++ b/drivers/gpu/drm/i915/display/intel_pipelock.c
@@ -8,6 +8,7 @@
 #include <drm/display/drm_dp_helper.h>
 #include <drm/drm_print.h>
 
+#include "intel_display.h"
 #include "intel_display_core.h"
 #include "intel_display_types.h"
 #include "intel_dp.h"
@@ -92,14 +93,38 @@ bool intel_pipelock_compatible(const struct intel_crtc_state *crtc_state1,
 		crtc_state1->vrr.vmin == crtc_state2->vrr.vmin &&
 		crtc_state1->vrr.vmax == crtc_state2->vrr.vmax &&
 		crtc_state1->vrr.flipline == crtc_state2->vrr.flipline &&
-		crtc_state1->vrr.guardband == crtc_state2->vrr.guardband &&
 		crtc_state1->infoframes.enable == crtc_state2->infoframes.enable &&
 		intel_dpll_compare_hw_state(display, &crtc_state1->dpll_hw_state,
 					    &crtc_state2->dpll_hw_state);
 }
 
-void intel_pipelock_compute_config(struct intel_crtc_state *crtc_state)
+static int pipelock_group_guardband(struct intel_atomic_state *state, u16 transcoders)
 {
+	const struct intel_crtc_state *crtc_state;
+	struct intel_crtc *crtc;
+	int guardband = 0;
+
+	for_each_new_intel_crtc_in_state(state, crtc, crtc_state) {
+		if (transcoders & BIT(crtc_state->cpu_transcoder))
+			guardband = max_t(int, guardband, crtc_state->vrr.guardband);
+	}
+
+	return guardband;
+}
+
+void intel_pipelock_compute_config(struct intel_atomic_state *state,
+				   struct intel_crtc_state *crtc_state,
+				   u16 transcoders)
+{
+	int guardband;
+
+	if (!transcoders)
+		return;
+
+	guardband = pipelock_group_guardband(state, transcoders);
+	if (guardband != crtc_state->vrr.guardband)
+		intel_vrr_guardband_val(crtc_state, guardband);
+
 	if (crtc_state->sync_primary_transcoder == INVALID_TRANSCODER)
 		return;
 
diff --git a/drivers/gpu/drm/i915/display/intel_pipelock.h b/drivers/gpu/drm/i915/display/intel_pipelock.h
index b75efa71a831..7c93448cab3b 100644
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
+				   u16 transcoders);
 
 #endif /* __INTEL_PIPELOCK_H__ */
-- 
2.34.1

