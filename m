Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F84CCA5FFF
	for <intel-xe@archiver.kernel.org>; Wed,  7 Oct 2026 07:52:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D040D10E50E;
	Wed,  7 Oct 2026 07:52:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U1ndikiX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2055A10E3B1;
 Wed,  7 Oct 2026 07:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791359560; x=1822895560;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=krYiri3CL4fiJBh+gK9AojxZ6JeD9QS2iC9ssOEWK6E=;
 b=U1ndikiX6abgwBC9L/6egZvVf9V7URWwtfqQDA1zPt2qDsZe59GjhJjv
 vFrM479uK/3a2A8IFJrqHkTbVGAfmdFIotIhf40cNxO4oJox+TOcbxLSi
 OfLpYUyhuLo8xn7h0i4X/RLIKTc5L91M+ik9STYQFPd3AUKtDAOrhOPPH
 l8wxP9EL8t76vodavsI8XBdp5VFt7oGcKolrRihzLtWuTkYrP4VnKGILO
 3R3AdoJfAEH/hk+hBlFRTXw8TPD3dltWOeb6/SzKsPveTrNSu9g3Zb++S
 In4WswReEdWDMhsOyxlspgKBuQj+0V463A/tpw7NN938Bacle8u01vWIk w==;
X-CSE-ConnectionGUID: 7WFYgk9kRj2Kr9dwB6Ophw==
X-CSE-MsgGUID: UAGg1IJ5S2WTPjXtJbVKfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="119874"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="119874"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 00:33:07 -0700
X-CSE-ConnectionGUID: huDzaYH1TJOj56w0WTUjvA==
X-CSE-MsgGUID: rhB4wqWCTv6wLgoF9VaFlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; d="scan'208";a="285466410"
Received: from vsrini4-xps-8920.iind.intel.com ([10.223.167.75])
 by fmviesa005.fm.intel.com with ESMTP; 07 Oct 2026 00:33:04 -0700
From: Vidya Srinivas <vidya.srinivas@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, uma.shankar@intel.com,
 Vidya Srinivas <vidya.srinivas@intel.com>,
 Charlton Lin <charlton.lin@intel.com>
Subject: [PATCH] drm/i915/display: Limit scaler count and disable pipe joiner
 on WCL
Date: Wed,  7 Oct 2026 12:53:34 +0530
Message-ID: <20261007072334.1801956-1-vidya.srinivas@intel.com>
X-Mailer: git-send-email 2.45.2
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

Pipe joining is not supported in the WCL display configuration.
Modes that would require joining are rejected, matching the
4k 60Hz maximum resolution documented for the platform.

Single pipe scaler instead of two.

Bspec: 74286

Suggested-by: Charlton Lin <charlton.lin@intel.com>
Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_device.c | 5 ++++-
 drivers/gpu/drm/i915/display/intel_dp.c             | 4 ++--
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_device.c b/drivers/gpu/drm/i915/display/intel_display_device.c
index f17fc2c68472..c74256359c25 100644
--- a/drivers/gpu/drm/i915/display/intel_display_device.c
+++ b/drivers/gpu/drm/i915/display/intel_display_device.c
@@ -1813,7 +1813,10 @@ static void __intel_display_device_info_runtime_init(struct intel_display *displ
 	if (intel_display_wa(display, INTEL_DISPLAY_WA_14011765242))
 		for_each_pipe(display, pipe)
 			display_runtime->num_scalers[pipe] = 0;
-	else if (DISPLAY_VER(display) >= 11) {
+	else if (DISPLAY_VERx100(display) == 3002) {
+		for_each_pipe(display, pipe)
+			display_runtime->num_scalers[pipe] = 1;
+	} else if (DISPLAY_VER(display) >= 11) {
 		for_each_pipe(display, pipe)
 			display_runtime->num_scalers[pipe] = 2;
 	} else if (DISPLAY_VER(display) >= 9) {
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index d8c0d9381471..47741957935a 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -477,9 +477,9 @@ bool intel_dp_has_joiner(struct intel_dp *intel_dp)
 	    !connector->panel.vbt.edp.pipe_joiner_enable)
 		return false;
 
-	return DISPLAY_VER(display) >= 12 ||
+	return ((DISPLAY_VER(display) >= 12 && DISPLAY_VERx100(display) != 3002) ||
 		(DISPLAY_VER(display) == 11 &&
-		 encoder->port != PORT_A);
+		 encoder->port != PORT_A));
 }
 
 static int dg2_max_source_rate(struct intel_dp *intel_dp)
-- 
2.45.2

