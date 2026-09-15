Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB96AC88E75
	for <intel-xe@archiver.kernel.org>; Tue, 15 Sep 2026 17:03:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EFE010F332;
	Tue, 15 Sep 2026 17:03:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nSgo6i2G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A8DB10E4B6;
 Tue, 15 Sep 2026 17:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789491831; x=1821027831;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MFB5nJyAkbNCs+z4SNlkSKspSC8+eo4kImVd1GBEvos=;
 b=nSgo6i2GfCxin4uMEvwx3aHKwzqHg7UPTBYqsupE+pFpJdS15oWnJaRR
 fM/+FaRPaeJvC8cYlqTLfVw7zwVIfcZWjGUHpEEhoEBIb8msc82KzDxp7
 1BvQa/rfnnX5pl+BSyss00/5Ydv1P3+E9vdTz9JVx7AhhaMEPJUH6MhMq
 e8/CTUGrGDFlvM/RC55Z2FWFLxbCApTgF3gPKphGkz87jxLVtYd+K4iHm
 r0yNOdQHaN5iDoZyp8Vm/WlyB1fr1yb301xoy9Mur6XdOdI9A3EnoVCe2
 6w5aLL+pTAoBSErg4tBcZA5WIa21nku+lPufxXWnP8q0iLyo2HE0LpD+q w==;
X-CSE-ConnectionGUID: uMj7yfmwScqihoPSROYyOw==
X-CSE-MsgGUID: QeOynBnpTG2pmUaZ5os21Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="371898"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="371898"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa116.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 10:03:51 -0700
X-CSE-ConnectionGUID: Msctv6kARfqbLjRDc9ewxQ==
X-CSE-MsgGUID: jP7mofYVQf6oR7YYPSmCxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="270443929"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 10:03:49 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, arun.r.murthy@intel.com,
 jani.nikula@linux.intel.com, suraj.kandpal@intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH v7 10/14] drm/i915/dp: Introduce helpers to enable/disable CMN
 SDP Transmission line
Date: Tue, 15 Sep 2026 22:16:51 +0530
Message-ID: <20260915164657.3429075-11-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260915164657.3429075-1-ankit.k.nautiyal@intel.com>
References: <20260915164657.3429075-1-ankit.k.nautiyal@intel.com>
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

v2:
- Use HAS_COMMON_SDP_TL(display) instead of checking
  crtc_state->dip.cmn_sdp_tl, since 0 is a valid transmission line value.
  (Sashiko)

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dip.c | 56 ++++++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_dip.h |  2 +
 2 files changed, 58 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dip.c b/drivers/gpu/drm/i915/display/intel_dip.c
index d1acc7eb5a39..f8e8577b2755 100644
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
@@ -61,3 +63,57 @@ void intel_dip_sdp_transmission_line_get_config(struct intel_crtc_state *crtc_st
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
+	if (!HAS_COMMON_SDP_TL(display))
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
+	if (!HAS_COMMON_SDP_TL(display))
+		return;
+
+	intel_de_write(display, CMN_SDP_TL(display, cpu_transcoder), 0);
+}
diff --git a/drivers/gpu/drm/i915/display/intel_dip.h b/drivers/gpu/drm/i915/display/intel_dip.h
index 8ff22eb5663b..7c64c84cb1be 100644
--- a/drivers/gpu/drm/i915/display/intel_dip.h
+++ b/drivers/gpu/drm/i915/display/intel_dip.h
@@ -47,5 +47,7 @@ void intel_dip_write_emp_as_sdp_tl(const struct intel_crtc_state *crtc_state);
 
 void intel_dip_sdp_tl_compute_config_late(struct intel_crtc_state *crtc_state);
 void intel_dip_sdp_transmission_line_get_config(struct intel_crtc_state *crtc_state);
+void intel_dip_cmn_sdp_transmission_line_enable(const struct intel_crtc_state *crtc_state);
+void intel_dip_cmn_sdp_transmission_line_disable(const struct intel_crtc_state *old_crtc_state);
 
 #endif /* __INTEL_DIP_H__ */
-- 
2.50.1

