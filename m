Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FA33C88E5C
	for <intel-xe@archiver.kernel.org>; Sun, 13 Sep 2026 15:13:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC79810E94F;
	Sun, 13 Sep 2026 15:13:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZZv+f9hC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A67E10E94B;
 Sun, 13 Sep 2026 15:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789312420; x=1820848420;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mlPrPqEOOPcxPLp5OW0wjoH132KSfVHgB6M2o7YevMI=;
 b=ZZv+f9hCPeKTkeLqUdPczvZ4WGkJeGxeib8UwNpeE0+PjKa/VpOsJFNz
 tTEGYe6u7nJUuUqQuwE+wHzYwrXc5iPaOJHoGAn1e2oPy+nvmMp23TBjL
 5lY+5sNFEMW1bPpXaXM90TcCzLalIpNweZo39lNj+h71jfoLCgMHEm7+y
 xuSaSfL6+ghfy1SBNn9w4wqF1M/Ud0Lir+YhG57s8sZeHt+TTgrjpzgNA
 jkbd1RhAA4noi+nfrEi6Ji7h94pVX4ada15lgFI+CjxadoU4gWaasfmrB
 Aaxkp/5eWPw1V5G9Dox4+Cv7kGT9OtWV+B6wqxeXWVIDb4dOe/IXJWEmY w==;
X-CSE-ConnectionGUID: LvAGYcEKT/eTdTd+SZ4G7Q==
X-CSE-MsgGUID: IRNtqQwHRkS5xl8fpM+eEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="93388778"
X-IronPort-AV: E=Sophos;i="6.27,100,1787036400"; d="scan'208";a="93388778"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2026 08:13:40 -0700
X-CSE-ConnectionGUID: ipPVLZxeS4GOviK1NygBow==
X-CSE-MsgGUID: 35aiQVK0S9aEdv+1Ixxmzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,100,1787036400"; d="scan'208";a="310694174"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2026 08:13:38 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, arun.r.murthy@intel.com,
 jani.nikula@linux.intel.com, suraj.kandpal@intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH v6 10/13] drm/i915/dp: Introduce helpers to enable/disable CMN
 SDP Transmission line
Date: Sun, 13 Sep 2026 20:26:45 +0530
Message-ID: <20260913145649.3240904-11-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260913145649.3240904-1-ankit.k.nautiyal@intel.com>
References: <20260913145649.3240904-1-ankit.k.nautiyal@intel.com>
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
- Use HAS_COMMON_SDP_TL(display) instead of checking crtc_state->dip.cmn_sdp_tl,
  since 0 is a valid transmission line value. (Sashiko)

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
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

