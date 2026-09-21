Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88C79C982DE
	for <intel-xe@archiver.kernel.org>; Mon, 21 Sep 2026 05:37:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D80D10E232;
	Mon, 21 Sep 2026 05:37:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JNS85qlp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97CCC10E229;
 Mon, 21 Sep 2026 05:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789969040; x=1821505040;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OhG5NcdTd+A/yhLNgLkMRsQkOYezCdRRFyZGOL1C2zA=;
 b=JNS85qlpz0Cbxa5KhslElGqtfOx3e2nrmWuXxzEuO8HQQiSKPJZFlm7N
 i3DBFBX9SrjkcPtCevkdufF+pSvk6k+cmhZ9UhlP/yXNZ3DIxpqja+7KS
 M46T2doRgm4mwuKbSi/nYMsl+RlVQMUGyKMpP+JgI8JzQX8z2ScRLCXEd
 nNgUwu7YQEE8Zeh8OQJwzOhsy8GcqJsrkPFIoN5M5SXpFWSyvuQlX91u3
 EC6IDvh7p0RelzKIRQ7T28D7WIZGjbiOAaljGEK55tA4fJXp4HUrSCS7R
 Kn1/N0ivOxiTmynalX9RhzQj0wESqcRf0ebbYo4eE4EWYLk31fExhhKuf A==;
X-CSE-ConnectionGUID: X8JbeAGGQgGHS5d0ZyQHpA==
X-CSE-MsgGUID: UGByPrLnSiyNSYZUxe5HsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11911"; a="966608"
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; 
   d="scan'208";a="966608"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2026 22:37:19 -0700
X-CSE-ConnectionGUID: s3zjVE60QBafx9LmJGwk5A==
X-CSE-MsgGUID: gXe54+/8QoykWhf/Wxk7lA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; d="scan'208";a="300444470"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa001.fm.intel.com with ESMTP; 20 Sep 2026 22:37:18 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com,
	Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 3/8] drm/i915/ddi: log DPCD access errors
Date: Mon, 21 Sep 2026 11:07:05 +0530
Message-Id: <20260921053710.1586776-4-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260921053710.1586776-1-suraj.kandpal@intel.com>
References: <20260921053710.1586776-1-suraj.kandpal@intel.com>
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

Now that the DPCD accessors return a proper error code, include it in
the error messages using %pe and ERR_PTR(), instead of just stating
that the access failed.

Store the FEC_STATUS write result in ret as well, so that it can be
logged the same way.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_ddi.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index 7efd4c4d4994..a46ab5d3d70f 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -2341,8 +2341,8 @@ static void intel_dp_sink_set_msa_timing_par_ignore_state(struct intel_dp *intel
 				     enable ? DP_MSA_TIMING_PAR_IGNORE_EN : 0);
 	if (ret < 0)
 		drm_dbg_kms(display->drm,
-			    "Failed to %s MSA_TIMING_PAR_IGNORE in the sink\n",
-			    str_enable_disable(enable));
+			    "Failed to %s MSA_TIMING_PAR_IGNORE in the sink (%pe)\n",
+			    str_enable_disable(enable), ERR_PTR(ret));
 }
 
 static void intel_dp_sink_set_fec_ready(struct intel_dp *intel_dp,
@@ -2358,13 +2358,17 @@ static void intel_dp_sink_set_fec_ready(struct intel_dp *intel_dp,
 	ret = drm_dp_dpcd_write_byte(&intel_dp->aux, DP_FEC_CONFIGURATION,
 				     enable ? DP_FEC_READY : 0);
 	if (ret < 0)
-		drm_dbg_kms(display->drm, "Failed to set FEC_READY to %s in the sink\n",
-			    str_enabled_disabled(enable));
+		drm_dbg_kms(display->drm, "Failed to set FEC_READY to %s in the sink (%pe)\n",
+			    str_enabled_disabled(enable), ERR_PTR(ret));
 
-	if (enable &&
-	    drm_dp_dpcd_write_byte(&intel_dp->aux, DP_FEC_STATUS,
-				   DP_FEC_DECODE_EN_DETECTED | DP_FEC_DECODE_DIS_DETECTED) < 0)
-		drm_dbg_kms(display->drm, "Failed to clear FEC detected flags\n");
+	if (enable) {
+		ret = drm_dp_dpcd_write_byte(&intel_dp->aux, DP_FEC_STATUS,
+					     DP_FEC_DECODE_EN_DETECTED |
+					     DP_FEC_DECODE_DIS_DETECTED);
+		if (ret < 0)
+			drm_dbg_kms(display->drm, "Failed to clear FEC detected flags (%pe)\n",
+				    ERR_PTR(ret));
+	}
 }
 
 static int wait_for_fec_detected(struct drm_dp_aux *aux, bool enabled)
-- 
2.34.1

