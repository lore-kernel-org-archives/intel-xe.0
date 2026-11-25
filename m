Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FED8606A31E
	for <intel-xe@archiver.kernel.org>; Wed, 25 Nov 2026 04:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WQQCtZ98
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B65B10E1E2;
	Wed, 25 Nov 2026 04:24:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D48610ED51;
 Wed, 25 Nov 2026 04:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795580678; x=1827116678;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qbZUFKHKY5pPrrn3agI94ilBZZ7EEnpNcJhyEiAvMgU=;
 b=WQQCtZ98kSMRW+hDjcqHE1yXQj3xa/chYJO5gz40NEf1TPVz3BNklmoP
 ERWKeQe3VHLWzbsrbEPU00XV/4G00KcLJ3NBdzAVn04KLqdjx2h3ib5K9
 nnx7znAH9ZqOFQAispVSxDOLZqTFo2209lQfFShw9uAKBnLil6QPUeJeo
 CHgfO7bzXlOyzxuaYW1Cx45yPOHuQ0VXhrbO5Psl1Xr/SKj8d+RqMPshU
 21LI00oYGDDjA2cQzxAuWEVL4sH5M/iH7Eu7wrGtI20M6NYgv+kzCcb8a
 Xqg5ctS3+5xiRYwhOfuj5szaKYDgT0+rtZlVFqIyojAaer3iFzSoxot9B A==;
X-CSE-ConnectionGUID: bk+xaXlTQ/KfxHUnH8lhgA==
X-CSE-MsgGUID: f/AapoHYTuGU4HgxOkx+dg==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4459748"
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="4459748"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 20:24:37 -0800
X-CSE-ConnectionGUID: MYQ6PiXlSB6VoG2HtLS8/w==
X-CSE-MsgGUID: OjSjUfHqSUqrV3dmL4tLOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; d="scan'208";a="12078019"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa009.jf.intel.com with ESMTP; 24 Nov 2026 20:24:35 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: imre.deak@intel.com, ville.syrjala@intel.com, mika.kahola@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>, stable@vger.kernel.org
Subject: [PATCH v2] drm/i915/pps: Reject eDP ports whose PPS is already in use
Date: Wed, 25 Nov 2026 09:54:28 +0530
Message-Id: <20261125042428.13167-1-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261123050422.3130438-1-suraj.kandpal@intel.com>
References: <20261123050422.3130438-1-suraj.kandpal@intel.com>
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

Some VBTs declare an unpopulated eDP port next to the real panel and
assign both the same PPS. The ghost port adopts the VDD bit the real
port turned on, and when its DPCD read fails it clears EDP_FORCE_VDD
underneath the real port. The real port's VDD reference is then never
released, leaking an AUX power domain reference and a runtime PM
wakelock:

  drm_WARN_ON(intel_dp->pps.vdd_wakeref)
  i915 raw-wakerefs=1 wakelocks=1 on cleanup

Reject an eDP port in pps_initial_setup() if another eDP port already
uses its PPS, before touching the PPS, and don't pick a PPS that is in
use when the VBT doesn't say which one to use.

Fixes: ba21bb24810f ("drm/i915: Reject unusable power sequencers")
Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/17232
Cc: stable@vger.kernel.org # v7.0+
Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
v1->v2:
-Reject the port in pps_initial_setup() based on pps_idx instead of
tracking VDD ownership (Ville)

 drivers/gpu/drm/i915/display/intel_dp.c  | 12 ++++-
 drivers/gpu/drm/i915/display/intel_pps.c | 57 ++++++++++++++++++------
 drivers/gpu/drm/i915/display/intel_pps.h |  2 +-
 3 files changed, 56 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index ef164a797618..1bd5e4c6bf5f 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -7238,6 +7238,7 @@ static bool intel_edp_init_connector(struct intel_dp *intel_dp,
 	struct intel_encoder *encoder = &dp_to_dig_port(intel_dp)->base;
 	bool has_dpcd;
 	const struct drm_edid *drm_edid;
+	int ret;
 
 	if (!intel_dp_is_edp(intel_dp))
 		return true;
@@ -7260,7 +7261,15 @@ static bool intel_edp_init_connector(struct intel_dp *intel_dp,
 	intel_bios_init_panel_early(display, &connector->panel,
 				    encoder->devdata);
 
-	if (!intel_pps_init(intel_dp)) {
+	ret = intel_pps_init(intel_dp);
+	if (ret == -EBUSY) {
+		drm_info(display->drm,
+			 "[ENCODER:%d:%s] PPS already in use, disabling eDP\n",
+			 encoder->base.base.id, encoder->base.name);
+		goto out_fini_panel;
+	}
+
+	if (ret) {
 		drm_info(display->drm,
 			 "[ENCODER:%d:%s] unusable PPS, disabling eDP\n",
 			 encoder->base.base.id, encoder->base.name);
@@ -7391,6 +7400,7 @@ static bool intel_edp_init_connector(struct intel_dp *intel_dp,
 
 out_vdd_off:
 	intel_pps_vdd_off_sync(intel_dp);
+out_fini_panel:
 	intel_bios_fini_panel(&connector->panel);
 
 	return false;
diff --git a/drivers/gpu/drm/i915/display/intel_pps.c b/drivers/gpu/drm/i915/display/intel_pps.c
index 442b00491a88..cb240b7d4acf 100644
--- a/drivers/gpu/drm/i915/display/intel_pps.c
+++ b/drivers/gpu/drm/i915/display/intel_pps.c
@@ -384,12 +384,34 @@ static bool intel_pps_is_valid(struct intel_dp *intel_dp)
 	return true;
 }
 
+static bool pps_in_use(struct intel_dp *intel_dp, int pps_idx)
+{
+	struct intel_display *display = to_intel_display(intel_dp);
+	struct intel_encoder *encoder;
+
+	for_each_intel_dp(display->drm, encoder) {
+		struct intel_dp *dp = enc_to_intel_dp(encoder);
+
+		if (dp == intel_dp || encoder->type != INTEL_OUTPUT_EDP)
+			continue;
+
+		if (dp->pps.pps_idx == pps_idx)
+			return true;
+	}
+
+	return false;
+}
+
 static int
-bxt_initial_pps_idx(struct intel_display *display, pps_check check)
+bxt_initial_pps_idx(struct intel_dp *intel_dp, pps_check check)
 {
+	struct intel_display *display = to_intel_display(intel_dp);
 	int pps_idx, pps_num = intel_num_pps(display);
 
 	for (pps_idx = 0; pps_idx < pps_num; pps_idx++) {
+		if (pps_in_use(intel_dp, pps_idx))
+			continue;
+
 		if (check(display, pps_idx))
 			return pps_idx;
 	}
@@ -397,7 +419,7 @@ bxt_initial_pps_idx(struct intel_display *display, pps_check check)
 	return -1;
 }
 
-static bool
+static int
 pps_initial_setup(struct intel_dp *intel_dp)
 {
 	struct intel_display *display = to_intel_display(intel_dp);
@@ -408,7 +430,7 @@ pps_initial_setup(struct intel_dp *intel_dp)
 
 	if (display->platform.valleyview || display->platform.cherryview) {
 		vlv_initial_power_sequencer_setup(intel_dp);
-		return true;
+		return 0;
 	}
 
 	/* first ask the VBT */
@@ -422,13 +444,15 @@ pps_initial_setup(struct intel_dp *intel_dp)
 
 	/* VBT wasn't parsed yet? pick one where the panel is on */
 	if (intel_dp->pps.pps_idx < 0)
-		intel_dp->pps.pps_idx = bxt_initial_pps_idx(display, pps_has_pp_on);
+		intel_dp->pps.pps_idx = bxt_initial_pps_idx(intel_dp, pps_has_pp_on);
 	/* didn't find one? pick one where vdd is on */
 	if (intel_dp->pps.pps_idx < 0)
-		intel_dp->pps.pps_idx = bxt_initial_pps_idx(display, pps_has_vdd_on);
+		intel_dp->pps.pps_idx = bxt_initial_pps_idx(intel_dp, pps_has_vdd_on);
 	/* didn't find one? pick any */
 	if (intel_dp->pps.pps_idx < 0) {
-		intel_dp->pps.pps_idx = bxt_initial_pps_idx(display, pps_any);
+		intel_dp->pps.pps_idx = bxt_initial_pps_idx(intel_dp, pps_any);
+		if (intel_dp->pps.pps_idx < 0)
+			return -EBUSY;
 
 		drm_dbg_kms(display->drm,
 			    "[ENCODER:%d:%s] no initial power sequencer, assuming %s\n",
@@ -441,7 +465,13 @@ pps_initial_setup(struct intel_dp *intel_dp)
 			    pps_name(intel_dp));
 	}
 
-	return intel_pps_is_valid(intel_dp);
+	if (pps_in_use(intel_dp, intel_dp->pps.pps_idx))
+		return -EBUSY;
+
+	if (!intel_pps_is_valid(intel_dp))
+		return -ENODEV;
+
+	return 0;
 }
 
 void vlv_pps_reset_all(struct intel_display *display)
@@ -1705,9 +1735,9 @@ void intel_pps_encoder_reset(struct intel_dp *intel_dp)
 	}
 }
 
-bool intel_pps_init(struct intel_dp *intel_dp)
+int intel_pps_init(struct intel_dp *intel_dp)
 {
-	bool ret;
+	int ret;
 
 	intel_dp->pps.initializing = true;
 	INIT_DELAYED_WORK(&intel_dp->pps.panel_vdd_work, edp_panel_vdd_work);
@@ -1716,10 +1746,11 @@ bool intel_pps_init(struct intel_dp *intel_dp)
 
 	with_intel_pps_lock(intel_dp) {
 		ret = pps_initial_setup(intel_dp);
-
-		pps_init_delays(intel_dp);
-		pps_init_registers(intel_dp, false);
-		pps_vdd_init(intel_dp);
+		if (ret != -EBUSY) {
+			pps_init_delays(intel_dp);
+			pps_init_registers(intel_dp, false);
+			pps_vdd_init(intel_dp);
+		}
 	}
 
 	return ret;
diff --git a/drivers/gpu/drm/i915/display/intel_pps.h b/drivers/gpu/drm/i915/display/intel_pps.h
index f7c96d75be45..b1e04fc744bb 100644
--- a/drivers/gpu/drm/i915/display/intel_pps.h
+++ b/drivers/gpu/drm/i915/display/intel_pps.h
@@ -43,7 +43,7 @@ void intel_pps_vdd_off_sync(struct intel_dp *intel_dp);
 bool intel_pps_have_panel_power_or_vdd(struct intel_dp *intel_dp);
 void intel_pps_wait_power_cycle(struct intel_dp *intel_dp);
 
-bool intel_pps_init(struct intel_dp *intel_dp);
+int intel_pps_init(struct intel_dp *intel_dp);
 void intel_pps_init_late(struct intel_dp *intel_dp);
 void intel_pps_encoder_reset(struct intel_dp *intel_dp);
 
-- 
2.34.1

