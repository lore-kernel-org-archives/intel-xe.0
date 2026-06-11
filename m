Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31119CD98D4
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jun 2026 07:51:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E57B410ED61;
	Thu, 11 Jun 2026 07:51:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TDMNFDft";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5BBA10ED40;
 Thu, 11 Jun 2026 07:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781164275; x=1812700275;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9ivhXUxL6froDTFjWs4HQXYK5jqsNieutqqkSLpX55E=;
 b=TDMNFDftFPYxu21CKJmQ9cuMS5tpl008ZOgh2k+Zh+b02YJwRq9Taq4p
 AIHpR1JXFmBOIGsySeDog+k3xg0bhIaHYHvq6/r3h6zUpytfmSidAlQMS
 ugOk6O8BIoi9xy971/8CM1sK7dZdhmd/KUlxF0OJLcqgXuPR1SvsTek+b
 mdkrHu0vBDxcwlxwmEQgXq5qAjY7wHXSpzEl+a3GBAqfG8gWSPCowKba4
 f2tDHhhf/hQKF2Wsk/L9Fk/0f4u3OikjfbFKhc0JvxnhbI1mwt91gEm1b
 88WHXdeB1mQJ7fGwvyPcMgOJqvTSz6W2IGPQKiEWLNP7ZkEQPh6O5Zam5 A==;
X-CSE-ConnectionGUID: c9TG0NSVT7SHttCfjkl7dA==
X-CSE-MsgGUID: Fs9KxsOLTcy3GWpPe4eoTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="93078758"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; d="scan'208";a="93078758"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 00:51:15 -0700
X-CSE-ConnectionGUID: gwKwCuNZSxK+F69JCbRXWA==
X-CSE-MsgGUID: i65TJFLoR56uWHWUvSDIZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; d="scan'208";a="251503363"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 00:51:12 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, arun.r.murthy@intel.com,
 jani.nikula@linux.intel.com, Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH v4 10/12] drm/i915/dp: Introduce helpers to enable/disable CMN
 SDP Transmission line
Date: Thu, 11 Jun 2026 13:03:12 +0530
Message-ID: <20260611073316.1439306-11-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260611073316.1439306-1-ankit.k.nautiyal@intel.com>
References: <20260611073316.1439306-1-ankit.k.nautiyal@intel.com>
MIME-Version: 1.0
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

Introduce helpers to program or disable CMN_SDP_TL and stagger registers
using the state stored in crtc_state.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dip.c | 56 ++++++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_dip.h |  2 +
 2 files changed, 58 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dip.c b/drivers/gpu/drm/i915/display/intel_dip.c
index 333314637db5..5cda9792d593 100644
--- a/drivers/gpu/drm/i915/display/intel_dip.c
+++ b/drivers/gpu/drm/i915/display/intel_dip.c
@@ -4,6 +4,8 @@
  *
  */
 
+#include <drm/drm_print.h>
+
 #include "intel_de.h"
 #include "intel_dip.h"
 #include "intel_dip_regs.h"
@@ -45,3 +47,57 @@ void intel_dip_sdp_transmission_line_get_config(struct intel_crtc_state *crtc_st
 {
 	crtc_state->dip.emp_as_sdp_tl = intel_dip_read_emp_as_sdp_tl(crtc_state);
 }
+
+static int intel_dip_sdp_tl_to_stagger(const struct intel_crtc_state *crtc_state,
+				       u16 sdp_transmission_line)
+{
+	return sdp_transmission_line - crtc_state->dip.cmn_sdp_tl;
+}
+
+void intel_dip_cmn_sdp_transmission_line_enable(const struct intel_crtc_state *crtc_state)
+{
+	struct intel_display *display = to_intel_display(crtc_state);
+	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
+	int gmp_stagger;
+	int pps_stagger;
+	int vsc_ext_stagger;
+
+	if (!crtc_state->dip.cmn_sdp_tl)
+		return;
+
+	gmp_stagger = intel_dip_sdp_tl_to_stagger(crtc_state,
+						  crtc_state->dip.gmp_sdp_tl);
+
+	pps_stagger = intel_dip_sdp_tl_to_stagger(crtc_state,
+						  crtc_state->dip.pps_sdp_tl);
+
+	vsc_ext_stagger = intel_dip_sdp_tl_to_stagger(crtc_state,
+						      crtc_state->dip.vsc_ext_sdp_tl);
+
+	if (drm_WARN_ON(display->drm, gmp_stagger < 0))
+		return;
+	if (drm_WARN_ON(display->drm, pps_stagger < 0))
+		return;
+	if (drm_WARN_ON(display->drm, vsc_ext_stagger < 0))
+		return;
+
+	intel_de_write(display, CMN_SDP_TL_STGR_CTL(display, cpu_transcoder),
+		       GMP_STAGGER(gmp_stagger) |
+		       PPS_STAGGER(pps_stagger) |
+		       VSC_EXT_STAGGER(vsc_ext_stagger));
+
+	intel_de_write(display, CMN_SDP_TL(display, cpu_transcoder),
+		       TRANSMISSION_LINE_ENABLE |
+		       BASE_TRANSMISSION_LINE(crtc_state->dip.cmn_sdp_tl));
+}
+
+void intel_dip_cmn_sdp_transmission_line_disable(const struct intel_crtc_state *old_crtc_state)
+{
+	struct intel_display *display = to_intel_display(old_crtc_state);
+	enum transcoder cpu_transcoder = old_crtc_state->cpu_transcoder;
+
+	if (!old_crtc_state->dip.cmn_sdp_tl)
+		return;
+
+	intel_de_write(display, CMN_SDP_TL(display, cpu_transcoder), 0);
+}
diff --git a/drivers/gpu/drm/i915/display/intel_dip.h b/drivers/gpu/drm/i915/display/intel_dip.h
index 03ef749a79ca..24d6228c2f8d 100644
--- a/drivers/gpu/drm/i915/display/intel_dip.h
+++ b/drivers/gpu/drm/i915/display/intel_dip.h
@@ -61,5 +61,7 @@ struct intel_dip {
 
 void intel_dip_sdp_tl_compute_config_late(struct intel_crtc_state *crtc_state);
 void intel_dip_sdp_transmission_line_get_config(struct intel_crtc_state *crtc_state);
+void intel_dip_cmn_sdp_transmission_line_enable(const struct intel_crtc_state *crtc_state);
+void intel_dip_cmn_sdp_transmission_line_disable(const struct intel_crtc_state *old_crtc_state);
 
 #endif /* __INTEL_DIP_H__ */
-- 
2.45.2

