Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9150C5AD55
	for <intel-xe@archiver.kernel.org>; Tue, 11 Aug 2026 02:57:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E47610E252;
	Tue, 11 Aug 2026 02:57:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ta4PGv53";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9784F10E265;
 Tue, 11 Aug 2026 02:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786417029; x=1817953029;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uI9JCI+qc2CJU9sWeQMuoHyrz6UTQ8j4pcz/wBMvXCw=;
 b=Ta4PGv531cMf7ez4Gdt+N758kOfE4JE+afeG0XFIFCBWi+vdrM06kmsf
 2EwvRvnlfw1phEz72z+RMpu7pGhND1iajyXhSJsvpqd0yJ98SMvAhu+zn
 runXH+ebWvZuTErbgB35JnyGEpLbYGU/nE83og/8S8YDB3LAMpNTPkwEp
 okfm84Ax/PjIy3F2MB10MatBmpriboj7tM9cmQr+DT1G72EupJs7u8ei5
 Lbq4d/aj87VQJ/AlP+28m8z8XPV25otFii2gmRes0rTqDoB+cIZV45azc
 I78Xk4p0mwDD0RrPWbB0n0rgE9V3EDNa6dicoyCuVOoSwujxNjWf5FBzT Q==;
X-CSE-ConnectionGUID: mLfm6ErTQ8CX8g96JBVZJg==
X-CSE-MsgGUID: RJCIYPMnTDOUq320/C+19Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="87061771"
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; d="scan'208";a="87061771"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2026 19:57:07 -0700
X-CSE-ConnectionGUID: fGot6fC5RMqg3n7xzsTsJQ==
X-CSE-MsgGUID: 0/p0NENURsuFAZPibASc7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; d="scan'208";a="266696752"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa003.jf.intel.com with ESMTP; 10 Aug 2026 19:57:06 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com,
	Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 1/3] drm/i915/ddi: add helper to compute DDI clock frequency
Date: Tue, 11 Aug 2026 08:26:56 +0530
Message-Id: <20260811025658.2376173-2-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260811025658.2376173-1-suraj.kandpal@intel.com>
References: <20260811025658.2376173-1-suraj.kandpal@intel.com>
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
  DP 8b/10b : rate / 10
  DP 128b/132b (UHBR) : rate / 32
  HDMI FRL  : rate / 18
  HDMI TMDS : rate

The DP case reuses intel_dp_link_symbol_clock().
This will help in upcoming commits to decide value to be written
in DDI_CLK_VALFREQ.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
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

