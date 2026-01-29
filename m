Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 085FED61037
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jan 2026 17:27:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B79AC10E8B0;
	Thu, 29 Jan 2026 17:27:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dhsHazB8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8C3C10E8BF;
 Thu, 29 Jan 2026 17:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769707665; x=1801243665;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZZ939Trd59/yoiKHWZBFAtXcOEs4sg+Hj1UB1HbosEw=;
 b=dhsHazB8k3QHFHzS8fXuEBnyO4wCZdgBfqrufh82JyvNLh/rhodzrDsl
 l0RpUxl8y8TFkSuKyEBsxTS5nxY+23tNhwgWSrZQGxcBLGpxleAxbzr/m
 Ttz2mpeKeEUtn0KoATdznLIOfjNzlNaORKr3Z3HX6P6A7j56giHYWTCsE
 qQL+f+rGRsORs8yboOk2ZHHG+VUKjTeQkdlRUvSQgsLsenC1gk3XflaMr
 J1C8uaty0wluAgzQRcVr5Pfvzh/NaolixNrzigz6wh/pIXVrInIYzN4WH
 nfRHJb4V15RzklzKU+vE8QNLgm5+Xh3rn2mqTNJam46fcAwNFD3v4VZOk w==;
X-CSE-ConnectionGUID: KolOQg2BSPK9tH9bxz2gMg==
X-CSE-MsgGUID: 4/KKHEJ5TdqwDngrRQJeSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="70926796"
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="70926796"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 09:27:45 -0800
X-CSE-ConnectionGUID: Ml6wCRxSRjGf93pTIJkYRw==
X-CSE-MsgGUID: lKO1ejcEQF2+byRh3mzWlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="239360838"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 09:27:43 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@linux.intel.com, imre.deak@intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 01/16] drm/i915/dp: Early reject bad hdisplay in
 intel_dp_mode_valid
Date: Thu, 29 Jan 2026 22:41:39 +0530
Message-ID: <20260129171154.3898077-2-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260129171154.3898077-1-ankit.k.nautiyal@intel.com>
References: <20260129171154.3898077-1-ankit.k.nautiyal@intel.com>
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

Move check for bad hdisplay early as it is independent on other checks.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Reviewed-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 79fd3b8d8b25..126da297efc5 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -1460,6 +1460,9 @@ intel_dp_mode_valid(struct drm_connector *_connector,
 	if (mode->clock < 10000)
 		return MODE_CLOCK_LOW;
 
+	if (intel_dp_hdisplay_bad(display, mode->hdisplay))
+		return MODE_H_ILLEGAL;
+
 	fixed_mode = intel_panel_fixed_mode(connector, mode);
 	if (intel_dp_is_edp(intel_dp) && fixed_mode) {
 		status = intel_panel_mode_valid(connector, mode);
@@ -1483,9 +1486,6 @@ intel_dp_mode_valid(struct drm_connector *_connector,
 	if (target_clock > max_dotclk)
 		return MODE_CLOCK_HIGH;
 
-	if (intel_dp_hdisplay_bad(display, mode->hdisplay))
-		return MODE_H_ILLEGAL;
-
 	max_link_clock = intel_dp_max_link_rate(intel_dp);
 	max_lanes = intel_dp_max_lane_count(intel_dp);
 
-- 
2.45.2

