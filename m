Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 964B3606A319
	for <intel-xe@archiver.kernel.org>; Fri, 23 Oct 2026 05:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MYaU+tey
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E1A9112998;
	Fri, 23 Oct 2026 05:03:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85044112976;
 Fri, 23 Oct 2026 05:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792731770; x=1824267770;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hetMoiPWZ0JTDZTjvujKdkhHrTAz06Of+Q/lWK7pQUg=;
 b=MYaU+teyXh27Gzf/6GyKpZsCpwlr5GwFJf1X/9aRDNDgPJ78g9gqLmhU
 adbnN2OojyG/I8thVJvXmvWbm+yxr9SyHeaS3FkS7U2p0JayZI678uSds
 WxAnp6fva1xfDBXatvzgjNRQegbvGEB++2On3bz4ZkioGwuYXGZMGCV50
 R2AZ4YjFBnLHue/jTWb0BNR+OmU+qV9/+gj6T8D+nuSM0Yq1CLRtZrxi/
 42SlSPrQ4TXqeCQ4VciKdquBUTF9SZp4FngYLqZVIH0/E2Z5zO7KbESNA
 ODGObRPoPdM0AcDClHYPhhD6PY5LTLyA7odjx06U4bGVdMaNKAO4Y3BFg A==;
X-CSE-ConnectionGUID: MEQhhde3TFCCaeUG68EzVQ==
X-CSE-MsgGUID: Ds3tAQQ/SQSYygZp+MUdCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1499168"
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="1499168"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 22:02:50 -0700
X-CSE-ConnectionGUID: RwK+kD4DRQSMiIDeIKZGDg==
X-CSE-MsgGUID: ZkqpoBrDTm2a0I5cSJo/Hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="3926652"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa006.fm.intel.com with ESMTP; 22 Oct 2026 22:02:47 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: mitulkumar.ajitkumar.golani@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH v8 10/14] drm/i915/display: Read back and compare
 Wa_14021768792 state
Date: Fri, 23 Oct 2026 10:32:23 +0530
Message-Id: <20261023050227.2068466-11-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261023050227.2068466-1-suraj.kandpal@intel.com>
References: <20261023050227.2068466-1-suraj.kandpal@intel.com>
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
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add intel_display_can_bypass_m_n_limit() to tell whether Wa_14021768792
can be used for a given Link M/N ratio, and use it to read
bypass_m_n_ratio_limit back from the hardware. Compare the flag in
intel_pipe_config_compare(), so that a mismatch between the computed and
the read back state of the workaround is caught.
Unlike the rest of the M/N registers, CHICKEN_TRANS and HDMI_EMP_DATA
are not double buffered, so the flag has to be compared outside the
fastset exemption that PIPE_CONF_CHECK_M_N() has for update_m_n.
Otherwise a seamless M/N update could switch the DDA out of the
workaround on a live transcoder, with the Link M/N values only following
at the next MSA.

Bspec: 49266
Co-developed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 47 ++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_display.h |  2 +
 2 files changed, 49 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index b48f12cc615f..ecc0e5ec181a 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -3537,6 +3537,49 @@ void intel_get_m_n(struct intel_display *display,
 	m_n->tu = REG_FIELD_GET(TU_SIZE_MASK, intel_de_read(display, data_m_reg)) + 1;
 }
 
+bool intel_display_can_bypass_m_n_limit(struct intel_display *display,
+					int m_n_ratio,
+					enum transcoder transcoder)
+{
+	if (!intel_display_wa(display, INTEL_DISPLAY_WA_14021768792))
+		return false;
+
+	if (m_n_ratio > 15)
+		return false;
+
+	if (transcoder != TRANSCODER_A)
+		return false;
+
+	return true;
+}
+
+static void bmg_enhanced_tgdda_read(struct intel_crtc *crtc,
+				    enum transcoder transcoder,
+				    struct intel_link_m_n *m_n)
+{
+	struct intel_display *display = to_intel_display(crtc);
+	u32 link_m_frac;
+	int m_n_ratio;
+
+	if (!m_n->link_n)
+		return;
+
+	m_n_ratio = DIV_ROUND_UP(m_n->link_m, m_n->link_n);
+
+	if (!intel_display_can_bypass_m_n_limit(display, m_n_ratio, transcoder))
+		return;
+
+	if (!(intel_de_read(display, CHICKEN_TRANS(display, transcoder)) &
+	      DP_ENHANCED_TGDDA_ENABLE))
+		return;
+
+	link_m_frac = REG_FIELD_GET(HDMI_EMP_DATA_LINK_M_FRAC_MASK,
+				    intel_de_read(display, HDMI_EMP_DATA(display, transcoder)));
+
+	if (link_m_frac == m_n->link_m % m_n->link_n)
+		m_n->bypass_m_n_ratio_limit = true;
+}
+
 void intel_cpu_transcoder_get_m1_n1(struct intel_crtc *crtc,
 				    enum transcoder transcoder,
 				    struct intel_link_m_n *m_n)
@@ -3554,6 +3597,8 @@ void intel_cpu_transcoder_get_m1_n1(struct intel_crtc *crtc,
 		intel_get_m_n(display, m_n,
 			      PIPE_DATA_M_G4X(pipe), PIPE_DATA_N_G4X(pipe),
 			      PIPE_LINK_M_G4X(pipe), PIPE_LINK_N_G4X(pipe));
+
+	bmg_enhanced_tgdda_read(crtc, transcoder, m_n);
 }
 
 void intel_cpu_transcoder_get_m2_n2(struct intel_crtc *crtc,
@@ -5478,6 +5523,8 @@ intel_pipe_config_compare(const struct intel_crtc_state *current_config,
 		PIPE_CONF_CHECK_M_N(dp_m2_n2);
 	}
 
+	PIPE_CONF_CHECK_BOOL(dp_m_n.bypass_m_n_ratio_limit);
+
 	PIPE_CONF_CHECK_X(output_types);
 
 	PIPE_CONF_CHECK_I(framestart_delay);
diff --git a/drivers/gpu/drm/i915/display/intel_display.h b/drivers/gpu/drm/i915/display/intel_display.h
index 404168f4213b..d53b7b4a80e7 100644
--- a/drivers/gpu/drm/i915/display/intel_display.h
+++ b/drivers/gpu/drm/i915/display/intel_display.h
@@ -525,5 +525,7 @@ bool intel_scanout_needs_vtd_wa(struct intel_display *display);
 int intel_crtc_num_joined_pipes(const struct intel_crtc_state *crtc_state);
 void intel_display_compute_link_m_n(u32 *link_m, u32 *link_n,
 				    int pixel_clock, int link_symbol_clock);
+bool intel_display_can_bypass_m_n_limit(struct intel_display *display,
+					int m_n_ratio, enum transcoder transcoder);
 
 #endif
-- 
2.34.1

