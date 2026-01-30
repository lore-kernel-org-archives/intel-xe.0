Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D56E9D49C77
	for <intel-xe@archiver.kernel.org>; Fri, 30 Jan 2026 08:34:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9728210E92F;
	Fri, 30 Jan 2026 08:34:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BYvvvE2Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33B7010E92D;
 Fri, 30 Jan 2026 08:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769762058; x=1801298058;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AqaRnquji9DKg2cv0KwZF82vvj8XZtY3gDDTcYzJojM=;
 b=BYvvvE2Yld9fPsO8XlsoD5WPiiY1MWOnEbZXbHowGhN/PurcY1IlFrBZ
 t8VxCkdiRxqeQgqoRkTE1iSEs+kNzgIjxjWUuO5fUjtTyUQC/d9zIWdMG
 vIOhMnviiAuBIEPMAB6hbG7yWiaY6YMjAiuCQVy/u9N8lJx05Rod5sdKd
 z9K5N5xPkSBDAO6iYakut1MXxsg4Gc4N4sEFM4T+MrHJF61UTMpPVYbj+
 TFrVJ3mVcizEn2Kwo5Ga1bsDlbf4v8bUCPoMf0ZtXDshCn/xYgxdkY6t1
 FPXI8xATXpzfUFrpKiuaQUB70gM3o1qI2hiUCAlv3lFvR3KBEtw6rUz3/ g==;
X-CSE-ConnectionGUID: D3tYH/tiSzmERlubMB8NMg==
X-CSE-MsgGUID: 3MAYVFtlSxaUHe6md1OmAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="74636630"
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; d="scan'208";a="74636630"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 00:34:05 -0800
X-CSE-ConnectionGUID: flzj7NBEQr+mgOjoMbsuQg==
X-CSE-MsgGUID: qCPFaQffTr6ztYxL+TKVdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; d="scan'208";a="208910044"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 00:34:04 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@linux.intel.com, imre.deak@intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 03/17] drm/i915/dp: Extract helper to get the hdisplay limit
Date: Fri, 30 Jan 2026 13:47:58 +0530
Message-ID: <20260130081812.32087-4-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260130081812.32087-1-ankit.k.nautiyal@intel.com>
References: <20260130081812.32087-1-ankit.k.nautiyal@intel.com>
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

Separate out function to get the hdisplay limit for a given platform.

v2: Rename the helper to intel_dp_max_hdisplay_per_pipe(). (Imre)

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Reviewed-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index c0a8ffac6312..4c3a1b6d0015 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -1371,6 +1371,12 @@ intel_dp_mode_valid_downstream(struct intel_connector *connector,
 	return MODE_OK;
 }
 
+static
+int intel_dp_max_hdisplay_per_pipe(struct intel_display *display)
+{
+	return DISPLAY_VER(display) >= 30 ? 6144 : 5120;
+}
+
 static
 bool intel_dp_needs_joiner(struct intel_dp *intel_dp,
 			   struct intel_connector *connector,
@@ -1378,17 +1384,14 @@ bool intel_dp_needs_joiner(struct intel_dp *intel_dp,
 			   int num_joined_pipes)
 {
 	struct intel_display *display = to_intel_display(intel_dp);
-	int hdisplay_limit;
 
 	if (!intel_dp_has_joiner(intel_dp))
 		return false;
 
 	num_joined_pipes /= 2;
 
-	hdisplay_limit = DISPLAY_VER(display) >= 30 ? 6144 : 5120;
-
 	return clock > num_joined_pipes * display->cdclk.max_dotclk_freq ||
-	       hdisplay > num_joined_pipes * hdisplay_limit;
+	       hdisplay > num_joined_pipes * intel_dp_max_hdisplay_per_pipe(display);
 }
 
 int intel_dp_num_joined_pipes(struct intel_dp *intel_dp,
-- 
2.45.2

