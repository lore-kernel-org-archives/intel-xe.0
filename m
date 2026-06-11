Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCE28CD98D5
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jun 2026 07:51:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9707010ED55;
	Thu, 11 Jun 2026 07:51:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U47ENROP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B2F910ED4D;
 Thu, 11 Jun 2026 07:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781164265; x=1812700265;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ROwZLJveGkv790fu54bt/20CG/NJWm0DsnCGlQRn5RY=;
 b=U47ENROPvhRX1zxim5rVxJGjiJBAvqxiom4NJDJBBvH/0+65VXJg8rhT
 f35h73ixyuxXoF4w9EMErC5K7d3wOnnvAtoYoPlNCze7OZgmP55m97qbP
 ylwoRgjoGRZuAOtd6Ml9lGWqwBSUFwqbaBxULxJT5S9s9A6U8+sJF8Otc
 ZmiZdaGWO5vQHcg8BaBG8sg7yluTHi2sFMgLqABAYSkUHTK4yjsBOCcQT
 LgS7LwHhU4W2lD9k452/iCDTSufoK2GGvSrve2W+9UUaRoWMC3xLr5ApD
 JFGDcj1nRPAfUH2lbBPy/WEyirY8MoO+2Ef1pNjAuSDmzuFsTgHpdwgT0 Q==;
X-CSE-ConnectionGUID: HrM5N1fgQiu91EvETwv/QA==
X-CSE-MsgGUID: LV/CLicUSNanSvaA3QjGCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="93078747"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; d="scan'208";a="93078747"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 00:51:04 -0700
X-CSE-ConnectionGUID: JskoRPjER72s+xPkxtDHxQ==
X-CSE-MsgGUID: 51Q75E5kTeu88XFChVDlqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; d="scan'208";a="251503339"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 00:51:02 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, arun.r.murthy@intel.com,
 jani.nikula@linux.intel.com, Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH v4 05/12] drm/i915/display: Add crtc state for DIP
 transmission lines
Date: Thu, 11 Jun 2026 13:03:07 +0530
Message-ID: <20260611073316.1439306-6-ankit.k.nautiyal@intel.com>
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

The Adaptive Sync SDP is currently the only packet with a programmable
transmission line.

Make a structure struct intel_dip for Data Island Packets. Add a member to
track Adaptive-Sync SDP transmission line. Include the new member in the
pipe configuration comparison.

This will pave the way for supporting more packets' programmable
transmission lines, including the common base SDP transmission line
introduced with Xe3p_lpd.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dip.h           | 8 ++++++++
 drivers/gpu/drm/i915/display/intel_display.c       | 2 ++
 drivers/gpu/drm/i915/display/intel_display_types.h | 3 +++
 3 files changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dip.h b/drivers/gpu/drm/i915/display/intel_dip.h
index 25bae4a04d6b..37507ac3e645 100644
--- a/drivers/gpu/drm/i915/display/intel_dip.h
+++ b/drivers/gpu/drm/i915/display/intel_dip.h
@@ -35,4 +35,12 @@ struct intel_crtc_state;
 u16 intel_dip_read_emp_as_sdp_tl(const struct intel_crtc_state *crtc_state);
 void intel_dip_write_emp_as_sdp_tl(const struct intel_crtc_state *crtc_state);
 
+struct intel_dip {
+	/*
+	 * DIP Transmission line, relative to the Vtotal.
+	 * The programmed transmit line is (Vtotal - value)
+	 */
+	u16 emp_as_sdp_tl;
+};
+
 #endif /* __INTEL_DIP_H__ */
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index bdf02b67c1d8..c84ee0e865ee 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -5507,6 +5507,8 @@ intel_pipe_config_compare(const struct intel_crtc_state *current_config,
 
 	PIPE_CONF_CHECK_I(set_context_latency);
 
+	PIPE_CONF_CHECK_I(dip.emp_as_sdp_tl);
+
 #undef PIPE_CONF_CHECK_X
 #undef PIPE_CONF_CHECK_I
 #undef PIPE_CONF_CHECK_LLI
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index aa4772a1c208..6cc3a4c2f17c 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -46,6 +46,7 @@
 
 #include "i915_gtt_view_types.h"
 #include "intel_bios.h"
+#include "intel_dip.h"
 #include "intel_display.h"
 #include "intel_display_conversion.h"
 #include "intel_display_limits.h"
@@ -1301,6 +1302,8 @@ struct intel_crtc_state {
 		struct drm_dp_as_sdp as_sdp;
 	} infoframes;
 
+	struct intel_dip dip;
+
 	u8 eld[MAX_ELD_BYTES];
 
 	/* HDMI scrambling status */
-- 
2.45.2

