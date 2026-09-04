Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB837C79F87
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 12:32:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 591AC10FABA;
	Fri,  4 Sep 2026 12:32:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JTeM/j0O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B82510FA48;
 Fri,  4 Sep 2026 12:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788525126; x=1820061126;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sRFYmKB4mx3KLLYy349KCvyrQ2Bf7liwIyzp/SytF7w=;
 b=JTeM/j0O+L8uCwv7jbmuQ3o29QTYCFHVt13NTQyQ+OKjEjgQdCg4A/5p
 VMnLcRf9VVNMX8M08phoC/p8Zr5uowzmBLuhZRVTwow+0QshXvhjRkug6
 wkhF4HKp1a+5zLlbJQFKsSDL9VxK87/p17YcY29SDErshdHRX1isGBo9S
 mrDMHAc2GdFiZvEXGg+oFVw0IAnvcgk+c2XEsJXF0B+YNHqiN3f0UPP/M
 2/lrBIwZ0vxTlxMObFt3OO12rD+9RRDEFFZy5xvk26PoXSJCoqrcUJpCn
 zSxKo+DKDcTfAxZyHdiFbltgkqwqyqhYS867CT9wTncSwEPnQdiZj07T2 w==;
X-CSE-ConnectionGUID: g9OHjAHyROOfqgktHlROzw==
X-CSE-MsgGUID: NFFMEP9hS3a2ltNXR8Yhlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="92896596"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="92896596"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 05:32:06 -0700
X-CSE-ConnectionGUID: oWOL7EYqSamL3kuDunoo4A==
X-CSE-MsgGUID: 4lauKTgQTAOzvvvSK94GhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="275311633"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by fmviesa005.fm.intel.com with ESMTP; 04 Sep 2026 05:32:04 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH v12 7/8] drm/i915: override Combo's VS/PE when requested
Date: Fri,  4 Sep 2026 14:31:47 +0200
Message-ID: <20260904123148.2165596-8-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260904123148.2165596-1-michal.grzelak@intel.com>
References: <20260904123148.2165596-1-michal.grzelak@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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

Add accessor function for Combo to read requested table from VBT #57.
Parse the requested table and transform data into port's buffer.

Actual data is fully stored in the lowest byte although each entry is 4
bytes wide. Thus convert u32 into u8 and store the data.

For EHL, in cases when eDP encoder uses low vswing, choose 3rd table if
encoder supports HBR3. Otherwise use 2nd table for eDP using low vswing.

In cases when eDP encoder does not use low vswing, choose 2nd table if
encoder supports mode higher or including HBR2. Otherwise use 3rd table
for eDP not using low vswing.

For external DP use 2nd table if encoder supports modes higher than or
including HBR2. Use 1st table if external DP encoder supports modes
lower than HBR2.

For JSL, always use 1st table for external DP. For eDPs not using low
vswing use 1st table as well.

In cases when eDP encoder uses low vswing, choose 1st table if encoder
supports HBR3. When encoder supports HBR2 choose 3rd table. When
encoder supports modes lower than HBR2 choose 2nd table.

There are no changes to intel_ddi_dp_level() since selection of correct
row of intel_ddi_buf_trans_entry is same as when no override request has
been done.

Looking from other OSes, in case when encoder does not support DP we
could theoretically use 1st table. However, as of now, use default
tables.

v11->v12
- don't set vspeo->num_entries per PHY/platform
- check for low vswing eDP for EHL (Sashiko)
- reverse order of indices for JSL (Sashiko)

v10->v11
- initialize local variables at declaration block (Jani)
- branch with 'else` instead of initializing twice (Jani)

v9->v10
- call dedicated VS/PE-O vfunc
- drop deconstifying default tables (Suraj, Jani)
- cache `entries` into const field after data is overwritten (Jani)

v8->v9
- deconstify intel_ddi_buf_trans_entry

v6->v7
- handle VS/PE-O's VBT details in intel_bios_* functions (Jani)
- remove vspeo's cast to (void *) (Jani)
- call encoder->get_buf_trans() once (Jani)
- return NULL from intel_bios_get_* when using default (Jani)
- validate VS/PE-O in intel_bios.c (Jani)
- check devdata->vspeo if VS/PE-O was requested
- inline {jsl,ehl}_combo_get_vspeo_buf_trans()
- remove temporarily LT

v4->v5
- blend index computation with table parsing
- remove enums entirely
- add spaces around operators (Suraj)
- remove spaces after type casting (Suraj)
- remove INTEL_DISPLAY_STATE_WARN (Suraj)

Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
Acked-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_bios.c     | 93 +++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_bios.h     |  6 ++
 .../drm/i915/display/intel_ddi_buf_trans.c    | 42 ++++++++-
 3 files changed, 138 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
index be7554c483ad2..11d2cbb78eabf 100644
--- a/drivers/gpu/drm/i915/display/intel_bios.c
+++ b/drivers/gpu/drm/i915/display/intel_bios.c
@@ -3971,6 +3971,99 @@ intel_bios_get_c10_vspeo(const struct intel_bios_encoder_data *devdata,
 	return vspeo;
 }
 
+const struct intel_ddi_buf_trans *
+intel_bios_get_ehl_combo_vspeo(const struct intel_bios_encoder_data *devdata,
+			       bool has_dp, int port_clock, bool low_vswing_edp)
+{
+	struct intel_display *display = devdata->display;
+	union intel_ddi_buf_trans_entry *entries = devdata->entries;
+	struct intel_ddi_buf_trans *vspeo = devdata->vspeo;
+	const u32 *tables = display->vbt.vspeo.tables;
+	int num_columns = display->vbt.vspeo.num_columns;
+	int num_rows = display->vbt.vspeo.num_rows;
+	size_t offset = 0;
+	int level, idx;
+
+	if (!validate_vspeo(devdata, has_dp))
+		return NULL;
+
+	if (low_vswing_edp)
+		idx = port_clock > 540000 ? 2 : 1;
+	else
+		idx = port_clock > 270000 ? 1 : 0;
+
+	offset += idx * num_rows * num_columns;
+
+	for (level = 0; level < num_rows; level++) {
+		u32 dw2_swing_sel = tables[offset];
+		u32 dw7_n_scalar = tables[offset + 1];
+		u32 dw4_cursor_coeff = tables[offset + 2];
+		u32 dw4_post_cursor_2 = tables[offset + 3];
+		u32 dw4_post_cursor_1 = tables[offset + 4];
+
+		entries[level].icl.dw2_swing_sel = dw2_swing_sel;
+		entries[level].icl.dw7_n_scalar = dw7_n_scalar;
+		entries[level].icl.dw4_cursor_coeff = dw4_cursor_coeff;
+		entries[level].icl.dw4_post_cursor_2 = dw4_post_cursor_2;
+		entries[level].icl.dw4_post_cursor_1 = dw4_post_cursor_1;
+
+		offset += num_columns;
+	}
+
+	vspeo->entries = entries;
+
+	return vspeo;
+}
+
+const struct intel_ddi_buf_trans *
+intel_bios_get_jsl_combo_vspeo(const struct intel_bios_encoder_data *devdata,
+			       bool has_dp, int port_clock, bool low_vswing_edp)
+{
+	struct intel_display *display = devdata->display;
+	union intel_ddi_buf_trans_entry *entries = devdata->entries;
+	struct intel_ddi_buf_trans *vspeo = devdata->vspeo;
+	const u32 *tables = display->vbt.vspeo.tables;
+	int num_columns = display->vbt.vspeo.num_columns;
+	int num_rows = display->vbt.vspeo.num_rows;
+	size_t offset = 0;
+	int idx = 0;
+	int level;
+
+	if (!validate_vspeo(devdata, has_dp))
+		return NULL;
+
+	if (low_vswing_edp) {
+		if (port_clock > 540000)
+			idx = 0;
+		else if (port_clock > 270000)
+			idx = 2;
+		else
+			idx = 1;
+	}
+
+	offset += idx * num_rows * num_columns;
+
+	for (level = 0; level < num_rows; level++) {
+		u32 dw2_swing_sel = tables[offset];
+		u32 dw7_n_scalar = tables[offset + 1];
+		u32 dw4_cursor_coeff = tables[offset + 2];
+		u32 dw4_post_cursor_2 = tables[offset + 3];
+		u32 dw4_post_cursor_1 = tables[offset + 4];
+
+		entries[level].icl.dw2_swing_sel = dw2_swing_sel;
+		entries[level].icl.dw7_n_scalar = dw7_n_scalar;
+		entries[level].icl.dw4_cursor_coeff = dw4_cursor_coeff;
+		entries[level].icl.dw4_post_cursor_2 = dw4_post_cursor_2;
+		entries[level].icl.dw4_post_cursor_1 = dw4_post_cursor_1;
+
+		offset += num_columns;
+	}
+
+	vspeo->entries = entries;
+
+	return vspeo;
+}
+
 bool intel_bios_encoder_is_dedicated_external(const struct intel_bios_encoder_data *devdata)
 {
 	return devdata->display->vbt.version >= 264 &&
diff --git a/drivers/gpu/drm/i915/display/intel_bios.h b/drivers/gpu/drm/i915/display/intel_bios.h
index 49acf8c405e2b..196b8b3f434f5 100644
--- a/drivers/gpu/drm/i915/display/intel_bios.h
+++ b/drivers/gpu/drm/i915/display/intel_bios.h
@@ -79,6 +79,12 @@ intel_bios_get_c20_vspeo(const struct intel_bios_encoder_data *devdata,
 const struct intel_ddi_buf_trans *
 intel_bios_get_c10_vspeo(const struct intel_bios_encoder_data *devdata,
 			 bool has_dp, int port_clock, bool has_edp);
+const struct intel_ddi_buf_trans *
+intel_bios_get_ehl_combo_vspeo(const struct intel_bios_encoder_data *devdata,
+			       bool has_dp, int port_clock, bool low_vswing_edp);
+const struct intel_ddi_buf_trans *
+intel_bios_get_jsl_combo_vspeo(const struct intel_bios_encoder_data *devdata,
+			       bool has_dp, int port_clock, bool low_vswing_edp);
 
 bool intel_bios_encoder_requests_vspeo(const struct intel_bios_encoder_data *devdata);
 bool intel_bios_encoder_supports_dvi(const struct intel_bios_encoder_data *devdata);
diff --git a/drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c b/drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c
index 92c0d0f933ab4..5ad8ad2d0b8e5 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c
@@ -1784,6 +1784,40 @@ xe3plpd_get_lt_buf_trans(struct intel_encoder *encoder,
 		return intel_get_buf_trans(&xe3plpd_lt_trans_dp14, n_entries);
 }
 
+static const struct intel_ddi_buf_trans *
+jsl_get_combo_buf_trans_override(struct intel_encoder *encoder,
+				 const struct intel_crtc_state *crtc_state,
+				 int *n_entries)
+{
+	const struct intel_bios_encoder_data *devdata = encoder->devdata;
+	bool has_edp, has_dp;
+	int port_clock;
+
+	has_edp = intel_crtc_has_type(crtc_state, INTEL_OUTPUT_EDP);
+	has_dp = intel_crtc_has_dp_encoder(crtc_state);
+	port_clock = crtc_state->port_clock;
+
+	return intel_bios_get_jsl_combo_vspeo(devdata, has_dp, port_clock,
+					      has_edp && use_edp_low_vswing(encoder));
+}
+
+static const struct intel_ddi_buf_trans *
+ehl_get_combo_buf_trans_override(struct intel_encoder *encoder,
+				 const struct intel_crtc_state *crtc_state,
+				 int *n_entries)
+{
+	const struct intel_bios_encoder_data *devdata = encoder->devdata;
+	bool has_edp, has_dp;
+	int port_clock;
+
+	has_edp = intel_crtc_has_type(crtc_state, INTEL_OUTPUT_EDP);
+	has_dp = intel_crtc_has_dp_encoder(crtc_state);
+	port_clock = crtc_state->port_clock;
+
+	return intel_bios_get_ehl_combo_vspeo(devdata, has_dp, port_clock,
+					      has_edp && use_edp_low_vswing(encoder));
+}
+
 static const struct intel_ddi_buf_trans *
 mtl_get_c10_buf_trans_override(struct intel_encoder *encoder,
 			       const struct intel_crtc_state *crtc_state,
@@ -1847,11 +1881,13 @@ void intel_ddi_buf_trans_init(struct intel_encoder *encoder)
 		else
 			encoder->get_buf_trans = tgl_get_dkl_buf_trans;
 	} else if (DISPLAY_VER(display) == 11) {
-		if (display->platform.jasperlake)
+		if (display->platform.jasperlake) {
 			encoder->get_buf_trans = jsl_get_combo_buf_trans;
-		else if (display->platform.elkhartlake)
+			encoder->get_buf_trans_override = jsl_get_combo_buf_trans_override;
+		} else if (display->platform.elkhartlake) {
 			encoder->get_buf_trans = ehl_get_combo_buf_trans;
-		else if (intel_encoder_is_combo(encoder))
+			encoder->get_buf_trans_override = ehl_get_combo_buf_trans_override;
+		} else if (intel_encoder_is_combo(encoder))
 			encoder->get_buf_trans = icl_get_combo_buf_trans;
 		else
 			encoder->get_buf_trans = icl_get_mg_buf_trans;
-- 
2.45.2

