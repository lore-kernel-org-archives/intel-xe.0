Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02465CD6E68
	for <intel-xe@archiver.kernel.org>; Tue,  2 Jun 2026 17:00:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B57DC10F303;
	Tue,  2 Jun 2026 17:00:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OSZAXlx6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AB7710F300;
 Tue,  2 Jun 2026 17:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780419653; x=1811955653;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LKeVLu+vOSvIOrb0yO1QQADe0oOBRnt8D38ylfg3BgI=;
 b=OSZAXlx6Eo+OPYJGz4UluDnerrea5BYKcqUtYQQGst1CHnoGoKyuWyiX
 6wvMciYIddBDvdcJKGY+zUEw5/y9G2GG1d+PKXf7k9WI5tHWf0PqQGv/H
 2h5YoDC9oCNZjt3zP0OcrnKWDkkBTdY8O9cQCjf5wMpLOQi3mZ9Iw+nFX
 rELxScjMox6cJqWmSX+3/tOI3HXHHwLWDbxsJInbtguNTpk1gBK7Pc/xo
 PnO9iPnhZXeVKZ42dZQGRja8bHWGULacK5fgyjWtksnH5IqHcPrq+GppS
 5c3PodLpLgsN1awAXl6LudNRCEBqHdvFAzREtrf3eMWY0w7kTLyH7p3cI w==;
X-CSE-ConnectionGUID: jgD8o9NdRc6dF69ppNprTw==
X-CSE-MsgGUID: kXd1Z116Ql+Hm4hclOEdbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="68755497"
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; d="scan'208";a="68755497"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2026 10:00:53 -0700
X-CSE-ConnectionGUID: iaKZ1ya0T/GAinjzJcljXQ==
X-CSE-MsgGUID: HA9Nv9lDTuSlY0Gp6ZbHDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; d="scan'208";a="239795637"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by fmviesa010.fm.intel.com with ESMTP; 02 Jun 2026 10:00:51 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH v5 7/8] drm/i915: override Combo's VS/PE when requested
Date: Tue,  2 Jun 2026 19:00:30 +0200
Message-ID: <20260602170031.1163205-8-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260602170031.1163205-1-michal.grzelak@intel.com>
References: <20260602170031.1163205-1-michal.grzelak@intel.com>
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

v4->v5
- blend index computation with table parsing
- remove enums entirely
- add spaces around operators (Suraj)
- remove spaces after type casting (Suraj)
- remove INTEL_DISPLAY_STATE_WARN (Suraj)

Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 drivers/gpu/drm/i915/display/intel_bios.c     | 35 ++++++++++++
 drivers/gpu/drm/i915/display/intel_bios.h     |  3 ++
 .../drm/i915/display/intel_ddi_buf_trans.c    | 53 +++++++++++++++++++
 3 files changed, 91 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
index 130cb32254dd5..6bb2c75f52f47 100644
--- a/drivers/gpu/drm/i915/display/intel_bios.c
+++ b/drivers/gpu/drm/i915/display/intel_bios.c
@@ -3926,6 +3926,41 @@ intel_bios_get_cx0_vspeo(const struct intel_bios_encoder_data *devdata,
 	return vspeo;
 }
 
+const struct intel_ddi_buf_trans *
+intel_bios_get_combo_vspeo(const struct intel_bios_encoder_data *devdata,
+			   int idx)
+{
+	struct intel_display *display = devdata->display;
+	struct intel_ddi_buf_trans *vspeo = (void *)devdata->vspeo;
+	union intel_ddi_buf_trans_entry *entries = (void *)vspeo->entries;
+	const u32 *tables = display->vbt.vspeo.tables;
+	int num_columns = display->vbt.vspeo.num_columns;
+	int num_rows = display->vbt.vspeo.num_rows;
+	size_t offset = 0;
+	int level;
+
+	offset += idx * num_rows * num_columns;
+
+	for (level = 0; level < num_rows; level++) {
+
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
+	return vspeo;
+}
+
 bool intel_bios_encoder_is_dedicated_external(const struct intel_bios_encoder_data *devdata)
 {
 	return devdata->display->vbt.version >= 264 &&
diff --git a/drivers/gpu/drm/i915/display/intel_bios.h b/drivers/gpu/drm/i915/display/intel_bios.h
index 940f42efd4d7e..cf2db50518319 100644
--- a/drivers/gpu/drm/i915/display/intel_bios.h
+++ b/drivers/gpu/drm/i915/display/intel_bios.h
@@ -79,6 +79,9 @@ intel_bios_get_lt_vspeo(const struct intel_bios_encoder_data *devdata,
 const struct intel_ddi_buf_trans *
 intel_bios_get_cx0_vspeo(const struct intel_bios_encoder_data *devdata,
 			 int idx);
+const struct intel_ddi_buf_trans *
+intel_bios_get_combo_vspeo(const struct intel_bios_encoder_data *devdata,
+			   int idx);
 
 bool intel_bios_encoder_requests_vspeo(const struct intel_bios_encoder_data *devdata);
 bool intel_bios_encoder_supports_dvi(const struct intel_bios_encoder_data *devdata);
diff --git a/drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c b/drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c
index bb619f94f0ec1..2c6bf8ec04312 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c
@@ -1784,6 +1784,52 @@ xe3plpd_get_lt_buf_trans(struct intel_encoder *encoder,
 		return intel_get_buf_trans(&xe3plpd_lt_trans_dp14, n_entries);
 }
 
+static const struct intel_ddi_buf_trans *
+jsl_get_combo_vspeo_buf_trans(struct intel_encoder *encoder,
+			      const struct intel_crtc_state *crtc_state,
+			      int *n_entries)
+{
+	if (intel_crtc_has_type(crtc_state, INTEL_OUTPUT_EDP)) {
+		if (use_edp_low_vswing(encoder)) {
+			if (crtc_state->port_clock > 540000)
+				return intel_bios_get_combo_vspeo(encoder->devdata, 0);
+			else if (crtc_state->port_clock > 270000)
+				return intel_bios_get_combo_vspeo(encoder->devdata, 2);
+			else
+				return intel_bios_get_combo_vspeo(encoder->devdata, 1);
+		}
+	}
+
+	if (intel_crtc_has_dp_encoder(crtc_state))
+		return intel_bios_get_combo_vspeo(encoder->devdata, 0);
+
+	return encoder->get_buf_trans(encoder, crtc_state, n_entries);
+}
+
+static const struct intel_ddi_buf_trans *
+ehl_get_combo_vspeo_buf_trans(struct intel_encoder *encoder,
+			      const struct intel_crtc_state *crtc_state,
+			      int *n_entries)
+{
+	if (intel_crtc_has_type(crtc_state, INTEL_OUTPUT_EDP)) {
+		if (use_edp_low_vswing(encoder)) {
+			if (crtc_state->port_clock > 540000)
+				return intel_bios_get_combo_vspeo(encoder->devdata, 2);
+			else
+				return intel_bios_get_combo_vspeo(encoder->devdata, 1);
+		}
+	}
+
+	if (intel_crtc_has_dp_encoder(crtc_state)) {
+		if (crtc_state->port_clock > 270000)
+			return intel_bios_get_combo_vspeo(encoder->devdata, 1);
+		else
+			return intel_bios_get_combo_vspeo(encoder->devdata, 0);
+	}
+
+	return encoder->get_buf_trans(encoder, crtc_state, n_entries);
+}
+
 static const struct intel_ddi_buf_trans *
 mtl_get_c10_vspeo_buf_trans(struct intel_encoder *encoder,
 			    const struct intel_crtc_state *crtc_state,
@@ -1924,6 +1970,13 @@ const struct intel_ddi_buf_trans *intel_ddi_buf_trans_get(struct intel_encoder *
 			buf_trans = mtl_get_c10_vspeo_buf_trans(encoder, crtc_state, n_entries);
 		else
 			buf_trans = mtl_get_c20_vspeo_buf_trans(encoder, crtc_state, n_entries);
+	} else if (DISPLAY_VER(display) == 11) {
+		if (display->platform.jasperlake)
+			buf_trans = jsl_get_combo_vspeo_buf_trans(encoder, crtc_state, n_entries);
+		else if (display->platform.elkhartlake)
+			buf_trans = ehl_get_combo_vspeo_buf_trans(encoder, crtc_state, n_entries);
+		else
+			buf_trans = encoder->get_buf_trans(encoder, crtc_state, n_entries);
 	} else {
 		buf_trans = encoder->get_buf_trans(encoder, crtc_state, n_entries);
 	}
-- 
2.45.2

