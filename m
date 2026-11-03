Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D66CB606A326
	for <intel-xe@archiver.kernel.org>; Tue,  3 Nov 2026 00:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FI2MWyGR
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0C2310F2C8;
	Tue,  3 Nov 2026 00:15:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EDB510E75A;
 Tue,  3 Nov 2026 00:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793664933; x=1825200933;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wz8gk/Y09NaNBHhQz2DFkJdUKJylDi9D5prEZzI2q3M=;
 b=FI2MWyGRdARgeWPwmKlUyWkTIuFYZ4rZaGb3OrU+bSVkxdOB69C3GCNN
 ceYxZIcMoIRNEimWnkxncDOQymY9ld8XkNaG9n40/qExS43g0e11urGtB
 b4r8+hgbECMhAcAezrJXzxY6NLvdcEz6wWWMR+oT0Pe+pdvxn68/dOTxJ
 BuhH6tJd2E4bxKdL7KTGlJa5GNRrFiKd5ebuyMMPHtWEEWh4ErM0ZwAil
 v/2GMm7Oi6g5ky43JvOa+Ai8RETfFdirul6Jd89bOxN9UsTZA5wcbvo77
 1clSMHPh/Wet5npi2viML48DbQxAFWt0ElHy5A0xxNtn6mZFF8LtDSnf0 w==;
X-CSE-ConnectionGUID: O2ZLDJ1YSliW8WGfSjrWkg==
X-CSE-MsgGUID: XIeIZfatTjClK6imL7WEng==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2386914"
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="2386914"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 16:15:30 -0800
X-CSE-ConnectionGUID: lC7pPe/cQuiIqcv9vY7Npw==
X-CSE-MsgGUID: WrqaR47aSwCUI7ka+96Vkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="6648406"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 16:15:28 -0800
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Suraj Kandpal <suraj.kandpal@intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>
Subject: [PATCH v1 1/1] drm/i915: override LT's default Vswing / Pre-emphasis
 when requested
Date: Tue,  3 Nov 2026 01:15:18 +0100
Message-ID: <20261103001518.3478578-2-michal.grzelak@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261103001518.3478578-1-michal.grzelak@linux.intel.com>
References: <20261103001518.3478578-1-michal.grzelak@linux.intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add support for Vswing / Pre-emphasis Override for NVL+.

Add an accessor function for LT to read the requested table from VBT#57.

There are no changes to intel_ddi_dp_level() since entry's row selection
logic is same as if no override has been requested.

Register values do not extend beyond lowest byte although each value is
stored on 4 bytes-wide entry. Hence cast each register value from u32
into u8 when parsing requested table and set according field of port's
buffer with it.

Change layout of NVL+ VS/PE-O's tables to use 3 tables.

Use 1st table exclusively for eDP.

Use 3rd table for DP 2.0 or higher. Otherwise use 2nd table for DP 1.4.

Signed-off-by: Michał Grzelak <michal.grzelak@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_bios.c     | 46 +++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_bios.h     |  3 ++
 .../drm/i915/display/intel_ddi_buf_trans.c    | 16 +++++++
 3 files changed, 65 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
index 7b6a6f8c3cf19..3c1fc48ca2758 100644
--- a/drivers/gpu/drm/i915/display/intel_bios.c
+++ b/drivers/gpu/drm/i915/display/intel_bios.c
@@ -3886,6 +3886,52 @@ validate_vspeo(const struct intel_bios_encoder_data *devdata, bool has_dp)
 	return true;
 }
 
+const struct intel_ddi_buf_trans *
+intel_bios_get_lt_vspeo(const struct intel_bios_encoder_data *devdata,
+			bool has_dp, bool is_uhbr, bool has_edp)
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
+	if (has_edp)
+		idx = 0;
+	else if (is_uhbr)
+		idx = 2;
+	else
+		idx = 1;
+
+	offset += idx * num_rows * num_columns;
+
+	for (level = 0; level < num_rows; level++) {
+		u32 main_cursor = tables[offset];
+		u32 pre_cursor = tables[offset + 1];
+		u32 post_cursor = tables[offset + 2];
+		u32 txswing = tables[offset + 3];
+		u32 txswing_level = tables[offset + 4];
+
+		entries[level].lt.main_cursor = main_cursor;
+		entries[level].lt.pre_cursor = pre_cursor;
+		entries[level].lt.post_cursor = post_cursor;
+		entries[level].lt.txswing = txswing;
+		entries[level].lt.txswing_level = txswing_level;
+
+		offset += num_columns;
+	}
+
+	vspeo->entries = entries;
+
+	return vspeo;
+}
+
 const struct intel_ddi_buf_trans *
 intel_bios_get_c20_vspeo(const struct intel_bios_encoder_data *devdata,
 			 bool has_dp, bool is_uhbr)
diff --git a/drivers/gpu/drm/i915/display/intel_bios.h b/drivers/gpu/drm/i915/display/intel_bios.h
index 196b8b3f434f5..261b037d65608 100644
--- a/drivers/gpu/drm/i915/display/intel_bios.h
+++ b/drivers/gpu/drm/i915/display/intel_bios.h
@@ -73,6 +73,9 @@ bool intel_bios_get_dsc_params(struct intel_encoder *encoder,
 const struct intel_bios_encoder_data *
 intel_bios_encoder_data_lookup(struct intel_display *display, enum port port);
 
+const struct intel_ddi_buf_trans *
+intel_bios_get_lt_vspeo(const struct intel_bios_encoder_data *devdata,
+			bool has_dp, bool is_uhbr, bool has_edp);
 const struct intel_ddi_buf_trans *
 intel_bios_get_c20_vspeo(const struct intel_bios_encoder_data *devdata,
 			 bool has_dp, bool is_uhbr);
diff --git a/drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c b/drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c
index cc5912178d9cd..2a3de8df3d29c 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c
@@ -1848,12 +1848,28 @@ mtl_get_c20_buf_trans_override(struct intel_encoder *encoder,
 	return intel_bios_get_c20_vspeo(devdata, has_dp, is_uhbr);
 }
 
+static const struct intel_ddi_buf_trans *
+xe3plpd_get_lt_buf_trans_override(struct intel_encoder *encoder,
+				  const struct intel_crtc_state *crtc_state,
+				  int *n_entries)
+{
+	const struct intel_bios_encoder_data *devdata = encoder->devdata;
+	bool has_dp, is_uhbr, has_edp;
+
+	has_dp = intel_crtc_has_dp_encoder(crtc_state);
+	is_uhbr = intel_dp_is_uhbr(crtc_state);
+	has_edp = intel_crtc_has_type(crtc_state, INTEL_OUTPUT_EDP);
+
+	return intel_bios_get_lt_vspeo(devdata, has_dp, is_uhbr, has_edp);
+}
+
 void intel_ddi_buf_trans_init(struct intel_encoder *encoder)
 {
 	struct intel_display *display = to_intel_display(encoder);
 
 	if (HAS_LT_PHY(display)) {
 		encoder->get_buf_trans = xe3plpd_get_lt_buf_trans;
+		encoder->get_buf_trans_override = xe3plpd_get_lt_buf_trans_override;
 	} else if (DISPLAY_VER(display) >= 14) {
 		if (intel_encoder_is_c10phy(encoder)) {
 			encoder->get_buf_trans = mtl_get_c10_buf_trans;
-- 
2.45.2

