Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E358C79FAA
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 06:39:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F34EC10E9D8;
	Tue,  8 Sep 2026 06:39:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CtEKnWlF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8C0510E4F1;
 Tue,  8 Sep 2026 06:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788849551; x=1820385551;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ei77+SxL/Ig5q2OxyxezuEeqtP2WrVL9nnXPMTDMVaw=;
 b=CtEKnWlF1cMDQNXDBPLyNZ6KUu511t8ZcvxDm32l5w4dALd/HMUZOwmd
 TPXePPn4VjMIyCn5lTdUPOuX0PjczxflH+YstuWVjuse+37DO8C2ZUnk+
 F08OzKpVlHfK1x9JTGqUjPgmZCldZBSccKA8Usyt+H5/v+I2kvSISvihx
 risuJca6GYeCPoEzX3FoSQj9zVgcI+zPzqw2ritKLxcltox2oeIIOvLnL
 jiJ6+buPVKZtDG3xQG1t3RMr8XLdEaMsXug4K9BdPC/Zoi0VZrMMkYAdR
 ijyYZayeLKGsU+TrA3uFeuc5Hg1zCpCFKL7yM5trI3p7j6NgzHVMmciIe g==;
X-CSE-ConnectionGUID: ZB8GkkM6Spa+fKyYRybY8Q==
X-CSE-MsgGUID: nJ3s7q+3RuSVYuTXpnebsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="93061790"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="93061790"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 23:39:09 -0700
X-CSE-ConnectionGUID: vx8ioQaURrGemeJX8ZJt2Q==
X-CSE-MsgGUID: ciJiacYjQ8usvYAebJJAOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="264702443"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 23:39:06 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, arun.r.murthy@intel.com,
 jani.nikula@linux.intel.com, suraj.kandpal@intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH v5 05/12] drm/i915/display: Add crtc state for DIP
 transmission lines
Date: Tue,  8 Sep 2026 11:52:16 +0530
Message-ID: <20260908062224.2897987-6-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260908062224.2897987-1-ankit.k.nautiyal@intel.com>
References: <20260908062224.2897987-1-ankit.k.nautiyal@intel.com>
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
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
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
index fc30a455bed3..6dd2626256cf 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -5603,6 +5603,8 @@ intel_pipe_config_compare(const struct intel_crtc_state *current_config,
 
 	PIPE_CONF_CHECK_I(set_context_latency);
 
+	PIPE_CONF_CHECK_I(dip.emp_as_sdp_tl);
+
 #undef PIPE_CONF_CHECK_X
 #undef PIPE_CONF_CHECK_I
 #undef PIPE_CONF_CHECK_LLI
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 9016be52c7ea..65f9a9745f53 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -46,6 +46,7 @@
 
 #include "i915_gtt_view_types.h"
 #include "intel_bios.h"
+#include "intel_dip.h"
 #include "intel_display.h"
 #include "intel_display_conversion.h"
 #include "intel_display_limits.h"
@@ -1312,6 +1313,8 @@ struct intel_crtc_state {
 		struct drm_dp_as_sdp as_sdp;
 	} infoframes;
 
+	struct intel_dip dip;
+
 	u8 eld[MAX_ELD_BYTES];
 
 	/* HDMI scrambling status */
-- 
2.50.1

