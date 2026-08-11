Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50250C5CFE7
	for <intel-xe@archiver.kernel.org>; Tue, 11 Aug 2026 17:58:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C832310E361;
	Tue, 11 Aug 2026 17:58:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PfgHJ8QF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EBE110E34F;
 Tue, 11 Aug 2026 17:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786471132; x=1818007132;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ih2iEDi9Z55k51HWGJURAxp7Qdn173899FbvVRRH3P4=;
 b=PfgHJ8QFcJ/72RPmw1QAHpKJqSuqLUBFrA9uwY2V44IvNBOAlYXeilk7
 GnyEqCC/KX2GI3EXLzWcoIreYYtWwzEdmHQCtJhOt8oACrKYSkOS6p/d/
 edPiXRkmNJ7c0hCSJpvuP21TQ91pA97ofkHCsBxaeMYLnUhnxhdSlgi6A
 nTKjxpDVZkeU197EM38Ai31c4HtJGfwMJvtyn5hsOyCL5paeHP/92+XCz
 fcZCfqMOC0QaZMD+K9PJoFppvTX+aZ0B2vHQXHMFrg5jSrFFHvsPGvGg6
 9gMGEY2B81kZ8jH4buQkQlLU2n5MUa49DrwE7ti9eph9KJ8q2hSEY/iCi g==;
X-CSE-ConnectionGUID: RjLFEbdLR4WWFYw5e5RMJQ==
X-CSE-MsgGUID: pcPRbQ7USXiTVktDzI37bQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="86941287"
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; d="scan'208";a="86941287"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 10:58:52 -0700
X-CSE-ConnectionGUID: qgteCVU4R2679cErbxvAlA==
X-CSE-MsgGUID: H/fCD/LpQ6ORbk9r92WUdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; d="scan'208";a="260083593"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa007.fm.intel.com with ESMTP; 11 Aug 2026 10:58:50 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com,
	Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH v2 1/3] drm/i915/ddi: add helper to compute DDI clock frequency
Date: Tue, 11 Aug 2026 23:28:42 +0530
Message-Id: <20260811175844.2613721-2-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260811175844.2613721-1-suraj.kandpal@intel.com>
References: <20260811175844.2613721-1-suraj.kandpal@intel.com>
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

Add intel_ddi_link_symbol_clock() to return the DDI clock frequency for
a given port clock:
  DP 8b/10b : rate
  DP 128b/132b (UHBR) : (10 / 32) * rate
  HDMI FRL  : (10 / 18) * rate
  HDMI TMDS : rate

The DP case reuses intel_dp_link_symbol_clock().
This will help in upcoming commits to decide value to be written
in DDI_CLK_VALFREQ.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
v1 -> v2
-Update commit message with correct formula (Jani)

 drivers/gpu/drm/i915/display/intel_ddi.c | 11 +++++++++++
 drivers/gpu/drm/i915/display/intel_ddi.h |  1 +
 2 files changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index bf5788c5bbd3..dd9064592ec9 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -1529,6 +1529,17 @@ int intel_ddi_level(struct intel_encoder *encoder,
 	return level;
 }
 
+int intel_ddi_link_symbol_clock(struct intel_encoder *encoder, int clock)
+{
+	if (intel_encoder_is_dp(encoder))
+		return intel_dp_link_symbol_clock(clock);
+
+	if (intel_hdmi_is_frl(clock))
+		return DIV_ROUND_CLOSEST(clock * 10, 18);
+
+	return clock;
+}
+
 static void
 hsw_set_signal_levels(struct intel_encoder *encoder,
 		      const struct intel_crtc_state *crtc_state)
diff --git a/drivers/gpu/drm/i915/display/intel_ddi.h b/drivers/gpu/drm/i915/display/intel_ddi.h
index 580ecb09b8b6..239d5a403f91 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.h
+++ b/drivers/gpu/drm/i915/display/intel_ddi.h
@@ -81,6 +81,7 @@ void intel_ddi_sanitize_encoder_pll_mapping(struct intel_encoder *encoder);
 int intel_ddi_level(struct intel_encoder *encoder,
 		    const struct intel_crtc_state *crtc_state,
 		    int lane);
+int intel_ddi_link_symbol_clock(struct intel_encoder *encoder, int clock);
 void intel_ddi_update_active_dpll(struct intel_atomic_state *state,
 				  struct intel_encoder *encoder,
 				  struct intel_crtc *crtc);
-- 
2.34.1

