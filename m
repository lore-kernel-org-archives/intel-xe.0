Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 031B8606A31A
	for <intel-xe@archiver.kernel.org>; Wed, 28 Oct 2026 11:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=N3m07sia
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C358D10E620;
	Wed, 28 Oct 2026 11:26:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E3DA10E620;
 Wed, 28 Oct 2026 11:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793186799; x=1824722799;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=puHCynIOKJsiWajIlufMpSnhOCJJwlV2BqjHZMFdP9k=;
 b=N3m07siaFTtxLI0zMyHBcJHK2Mk27HwIqrRQVu1twcH1/78iVHDPF+vo
 1JcTfsWGZCX7y/zo6xoXFslDbYE+RoNyAfxlrnSvA70khlpEI9JzwAXTo
 QybAqvzyrBEYJ0LBz9tzqgHkoTRv+lCRSNaWbaLB2NwsEEFgbQdw2FQbJ
 FzTW83GD3FCRX9rWOD1swKvUIkamJAcyCo2D8lv7ADLl/XoqVwthK0XpX
 tFGUh49Y2XoX2NaVwXhPb6jdRJKP8UcVkh3k+Z9Gewehdca4cjva+FvlL
 f0xb3llf2VXo1WoZV4e27S/rE/x19A9x2fErbazCcZyjgh8KFJd1Me97R g==;
X-CSE-ConnectionGUID: yCDS8llVRVmKfrMQ4DccIg==
X-CSE-MsgGUID: 7AZL6nw5QXWdyY+xsr8q0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1783735"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1783735"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 04:26:39 -0700
X-CSE-ConnectionGUID: hpUc5HDSRkm0vJqR8zLtRQ==
X-CSE-MsgGUID: Kfyj5NSGQYKdMON70Awtiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="4827345"
Received: from xiaolu.sh.intel.com ([10.239.146.103])
 by orviesa002.jf.intel.com with ESMTP; 28 Oct 2026 04:26:37 -0700
From: Xiao Lu <xiaolu.xie@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@linux.intel.com, rodrigo.vivi@intel.com,
 jouni.hogander@intel.com, ankit.k.nautiyal@intel.com,
 ville.syrjala@linux.intel.com, mitulkumar.ajitkumar.golani@intel.com,
 Xiao Lu <xiaolu.xie@intel.com>
Subject: [PATCH] drm/i915/display: Write the DIP header last on Xe2+ and reset
 VSC_SELECT
Date: Wed, 28 Oct 2026 19:24:23 +0800
Message-ID: <20261028112423.2445450-1-xiaolu.xie@intel.com>
X-Mailer: git-send-email 2.43.0
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
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Xe2_LPD and later the video DIP data registers are located in the
core display clock domain, while the packets that are anchored to a
transmission line register get double buffered in the transcoder clock
domain. The hardware clock crosses the whole packet to the transcoder
clock domain on the write of the packet header (dword 0), hence bspec
requires programming all the data bytes of such packets first and the
header last. On PTL the VSC SDP is anchored to the transmission line
(EMP_AS_SDP_TL) when the AS SDP is enabled, and bspec recommends using
the same order for all the video DIPs, so that the programming doesn't
depend on how a given packet is double buffered.

hsw_write_infoframe() writes the header first, so the clock crossing
triggered by the header write happens before the data of the packet has
been updated. Write the header last on display version 20+.

Also, VSC_SELECT in VIDEO_DIP_CTL is a two bit field selecting whether
the header and the data of the VSC SDP come from the hardware or from
the software, but hsw_write_infoframe() ORs the wanted value into
whatever the register already contained, so a stale setting is not
replaced (e.g. 1 | 2 results in 3). Clear the field before setting it,
and clear it as well when the SDPs get disabled in
intel_dp_set_infoframes(), so that a stale setting left behind by an
earlier user doesn't carry over.

This is meant to address the VSC SDP being dropped by an eDP panel on
PTL after some HDR modesets, where the VSC ECC registers differ from
the working case.

Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/9693
Bspec: 75640
Signed-off-by: Xiao Lu <xiaolu.xie@intel.com>
---
Not yet tested on the affected hardware. Sending for review, and for the reporter of xe#9693 to try.

 drivers/gpu/drm/i915/display/intel_dp.c   |  4 ++++
 drivers/gpu/drm/i915/display/intel_hdmi.c | 21 ++++++++++++++++-----
 2 files changed, 20 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 00e02e019..41e521468 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -5606,6 +5606,10 @@ void intel_dp_set_infoframes(struct intel_encoder *encoder,
 	if (!enable || !crtc_state->has_psr)
 		val &= ~VIDEO_DIP_ENABLE_VSC_HSW;
 
+	/* Reset the VSC select when disabling the SDPs, so it doesn't go stale */
+	if (!enable)
+		val &= ~VSC_SELECT_MASK;
+
 	intel_de_write(display, reg, val);
 	intel_de_posting_read(display, reg);
 
diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index b6fa1a155..0738f695c 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -524,6 +524,12 @@ void hsw_write_infoframe(struct intel_encoder *encoder,
 	const u32 *data = frame;
 	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
 	intel_reg_t ctl_reg = HSW_TVIDEO_DIP_CTL(display, cpu_transcoder);
+	/*
+	 * On Xe2_LPD+ the packet registers are clock crossed to the transcoder
+	 * clock domain on the write of the packet header (dword 0), so the
+	 * header must be written after all the data.
+	 */
+	bool hdr_last = DISPLAY_VER(display) >= 20 && len > 0;
 	int data_size;
 	int i;
 	u32 val = intel_de_read(display, ctl_reg);
@@ -535,25 +541,30 @@ void hsw_write_infoframe(struct intel_encoder *encoder,
 	val &= ~hsw_infoframe_enable(type);
 	intel_de_write(display, ctl_reg, val);
 
-	for (i = 0; i < len; i += 4) {
+	for (i = hdr_last ? 4 : 0; i < len; i += 4)
 		intel_de_write(display,
 			       hsw_dip_data_reg(display, cpu_transcoder, type, i >> 2),
-			       *data);
-		data++;
-	}
+			       data[i >> 2]);
 	/* Write every possible data byte to force correct ECC calculation. */
 	for (; i < data_size; i += 4)
 		intel_de_write(display,
 			       hsw_dip_data_reg(display, cpu_transcoder, type, i >> 2),
 			       0);
+	if (hdr_last)
+		intel_de_write(display,
+			       hsw_dip_data_reg(display, cpu_transcoder, type, 0),
+			       data[0]);
 
 	/* Wa_14013475917 */
 	if (!(IS_DISPLAY_VER(display, 13, 14) && crtc_state->has_psr &&
 	      !crtc_state->has_panel_replay && type == DP_SDP_VSC))
 		val |= hsw_infoframe_enable(type);
 
-	if (type == DP_SDP_VSC)
+	if (type == DP_SDP_VSC) {
+		/* VSC_SELECT is a two bit field, don't OR into a stale value */
+		val &= ~VSC_SELECT_MASK;
 		val |= VSC_DIP_HW_DATA_SW_HEA;
+	}
 
 	intel_de_write(display, ctl_reg, val);
 	intel_de_posting_read(display, ctl_reg);
-- 
2.43.0

