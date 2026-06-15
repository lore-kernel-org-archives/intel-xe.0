Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 120BACD98E4
	for <intel-xe@archiver.kernel.org>; Mon, 15 Jun 2026 18:12:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B362610E5DB;
	Mon, 15 Jun 2026 18:12:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CZEpZLBe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 768E010E5D5;
 Mon, 15 Jun 2026 18:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781547171; x=1813083171;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JrZUsTQIljcEmFCGyXEQ0OubGZ2ZKzFoyxuvJdEb98U=;
 b=CZEpZLBeBkBz8tXYmwJtBRLsfiMwYzVE6C5F7J2gZqImF8suCT4W7YRl
 AQ3rE9guDN/MSt1FGnNYuIvmbvP3AO5/yBGw5iKfS4Ezs5WmTV4p/iJXh
 9X6XP+7Bmz5+2KOvpygvBiZrCLEkmoWaxdtdNewA6MZpfNph/5dOHAqdT
 KHhclU6rhW9yf7TkSZsKl1OLTePyhOBrqbMJkEoDIzSZQP6DAJVnQuFiG
 yTQW/bY0okFnJI5kNTXgPEGt9LJjVBVrTRLDi0+ynkdVfM9W6vjG7RL8N
 9pc9RBN7Zy727CWMxaFlN8si/dn2hkaOFWJfIj6tR3keGNjqQURNTOvXU A==;
X-CSE-ConnectionGUID: eoN74n4nSk2/UJB05uGBng==
X-CSE-MsgGUID: Dk+eCUZwQESmRHR5iXLmhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="104968191"
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="104968191"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 11:12:51 -0700
X-CSE-ConnectionGUID: mSpC2biRQ/a3mP+lovzjPw==
X-CSE-MsgGUID: 1YhFQ0HCRO2OhqaM8znPZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="251833821"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by orviesa004.jf.intel.com with ESMTP; 15 Jun 2026 11:12:49 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH v8 6/7] drm/i915: override Combo's VS/PE when requested
Date: Mon, 15 Jun 2026 20:12:06 +0200
Message-ID: <20260615181207.1033389-7-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260615181207.1033389-1-michal.grzelak@intel.com>
References: <20260615181207.1033389-1-michal.grzelak@intel.com>
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
---
 drivers/gpu/drm/i915/display/intel_bios.c     | 98 +++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_bios.h     |  6 ++
 .../drm/i915/display/intel_ddi_buf_trans.c    |  6 ++
 3 files changed, 110 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
index aa46c63c4f10f..1841e82cd0a58 100644
--- a/drivers/gpu/drm/i915/display/intel_bios.c
+++ b/drivers/gpu/drm/i915/display/intel_bios.c
@@ -3959,6 +3959,104 @@ intel_bios_get_c10_vspeo(const struct intel_bios_encoder_data *devdata,
 	return vspeo;
 }
 
+const struct intel_ddi_buf_trans *
+intel_bios_get_ehl_combo_vspeo(const struct intel_bios_encoder_data *devdata,
+			       bool has_dp, int port_clock, bool has_edp)
+{
+	struct intel_display *display;
+	union intel_ddi_buf_trans_entry *entries;
+	int num_columns, num_rows, level, idx;
+	struct intel_ddi_buf_trans *vspeo;
+	const u32 *tables;
+	size_t offset = 0;
+
+	if (!validate_vspeo(devdata, has_dp))
+		return NULL;
+
+	display = devdata->display;
+	vspeo = devdata->vspeo;
+	entries = (void *)vspeo->entries;
+	tables = display->vbt.vspeo.tables;
+	num_columns = display->vbt.vspeo.num_columns;
+	num_rows = display->vbt.vspeo.num_rows;
+
+	idx = port_clock > 270000 ? 1 : 0;
+	if (has_edp)
+		idx = port_clock > 540000 ? 2 : 1;
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
+	return vspeo;
+}
+
+const struct intel_ddi_buf_trans *
+intel_bios_get_jsl_combo_vspeo(const struct intel_bios_encoder_data *devdata,
+			       bool has_dp, int port_clock, bool low_vswing_edp)
+{
+	struct intel_display *display;
+	union intel_ddi_buf_trans_entry *entries;
+	int num_columns, num_rows, level, idx;
+	struct intel_ddi_buf_trans *vspeo;
+	const u32 *tables;
+	size_t offset = 0;
+
+	if (!validate_vspeo(devdata, has_dp))
+		return NULL;
+
+	display = devdata->display;
+	vspeo = devdata->vspeo;
+	entries = (void *)vspeo->entries;
+	tables = display->vbt.vspeo.tables;
+	num_columns = display->vbt.vspeo.num_columns;
+	num_rows = display->vbt.vspeo.num_rows;
+
+	idx = 0;
+	if (low_vswing_edp) {
+		if (port_clock > 540000)
+			idx = 0;
+		else if (port_clock > 270000)
+			idx = 1;
+		else
+			idx = 2;
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
+	return vspeo;
+}
+
 bool intel_bios_encoder_is_dedicated_external(const struct intel_bios_encoder_data *devdata)
 {
 	return devdata->display->vbt.version >= 264 &&
diff --git a/drivers/gpu/drm/i915/display/intel_bios.h b/drivers/gpu/drm/i915/display/intel_bios.h
index 49acf8c405e2b..c55765a945949 100644
--- a/drivers/gpu/drm/i915/display/intel_bios.h
+++ b/drivers/gpu/drm/i915/display/intel_bios.h
@@ -79,6 +79,12 @@ intel_bios_get_c20_vspeo(const struct intel_bios_encoder_data *devdata,
 const struct intel_ddi_buf_trans *
 intel_bios_get_c10_vspeo(const struct intel_bios_encoder_data *devdata,
 			 bool has_dp, int port_clock, bool has_edp);
+const struct intel_ddi_buf_trans *
+intel_bios_get_ehl_combo_vspeo(const struct intel_bios_encoder_data *devdata,
+			       bool has_dp, int port_clock, bool has_edp);
+const struct intel_ddi_buf_trans *
+intel_bios_get_jsl_combo_vspeo(const struct intel_bios_encoder_data *devdata,
+			       bool has_dp, int port_clock, bool low_vswing_edp);
 
 bool intel_bios_encoder_requests_vspeo(const struct intel_bios_encoder_data *devdata);
 bool intel_bios_encoder_supports_dvi(const struct intel_bios_encoder_data *devdata);
diff --git a/drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c b/drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c
index 26070a1d4ae5d..9ea87ebf2328d 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c
@@ -1873,6 +1873,12 @@ const struct intel_ddi_buf_trans *intel_ddi_buf_trans_get(struct intel_encoder *
 			buf_trans = intel_bios_get_c10_vspeo(devdata, has_dp, port_clock, has_edp);
 		else
 			buf_trans = intel_bios_get_c20_vspeo(devdata, has_dp, is_uhbr);
+	} else if (DISPLAY_VER(display) == 11) {
+		if (display->platform.jasperlake)
+			buf_trans = intel_bios_get_jsl_combo_vspeo(devdata, has_dp, port_clock,
+								   has_edp && use_edp_low_vswing(encoder));
+		else if (display->platform.elkhartlake)
+			buf_trans = intel_bios_get_ehl_combo_vspeo(devdata, has_dp, port_clock, has_edp);
 	}
 
 	if (buf_trans)
-- 
2.45.2

