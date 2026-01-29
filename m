Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C37F9D6103B
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jan 2026 17:28:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7613E10E8B1;
	Thu, 29 Jan 2026 17:28:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g74F+eb9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EA2E10E8BA;
 Thu, 29 Jan 2026 17:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769707678; x=1801243678;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gqWVPd5DRpINfDh7uwV6GWsuP2tGGdCCicL+Hm0qxTM=;
 b=g74F+eb9ZzgwLQuHqRe6L+10lBrtc5/vi6AdqcvTJZ307EMwgHh32BWy
 bo2urpuQDzw0oNs2srRg3nGIr0Ve6KtS6tXGw0OnVNxfKYB7NM6kAJmOG
 o/X4TWIWSgAbwBuin1bHKSIPH41C/2YIy3HRlNhul0Lbb+h16dj3udSXq
 gyIYzzj+LXGqZIcLAXry/BuK99lVmEXcPmL/5SraPAT9/LFGyz6sBqIlE
 2N4i8hCcx4cFhRI5H56ynGDXQaXwCrQJcq0dgtdksZCJ4+GIAazb43xhC
 Vn6Jt+oezmn3nnNYbUcIHT2nbJbUazgW7DB5O3yHNCHRZjpmezZ1eRclI A==;
X-CSE-ConnectionGUID: V0qKCy/WSam3f7ZqH/zu/g==
X-CSE-MsgGUID: 9PL0HgBZRKmsRrwGrB9g8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="70926861"
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="70926861"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 09:27:57 -0800
X-CSE-ConnectionGUID: GCEHZJXGTiWiUepj6Q8TJw==
X-CSE-MsgGUID: c35ufzD3SLK/GZlrwK8Wbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="239360964"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 09:27:55 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@linux.intel.com, imre.deak@intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 06/16] drm/i915/dp_mst: Move the check for dotclock at the end
Date: Thu, 29 Jan 2026 22:41:44 +0530
Message-ID: <20260129171154.3898077-7-ankit.k.nautiyal@intel.com>
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

Refactor the mode_valid to have all joiner dependent stuff together and
place the check for dotclock limit at the very end.

This will help in the following refactor to iterate over the joiner
candidates and find the best joiner candidate that satisfy all checks
and limits.

v2: Update status to MODE_CLOCK_HIGH if max_dotclock check fails. (Imre)
v3: Drop redundant MODE_OK assignment and return. (Imre)

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Reviewed-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp_mst.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 24f8e60df9ac..ec6882af0631 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -1470,20 +1470,19 @@ mst_connector_mode_valid_ctx(struct drm_connector *_connector,
 	 *   corresponding link capabilities of the sink) in case the
 	 *   stream is uncompressed for it by the last branch device.
 	 */
-	num_joined_pipes = intel_dp_num_joined_pipes(intel_dp, connector,
-						     mode->hdisplay, target_clock);
-	max_dotclk *= num_joined_pipes;
-
 	ret = drm_modeset_lock(&mgr->base.lock, ctx);
 	if (ret)
 		return ret;
 
-	if (mode_rate > max_rate || mode->clock > max_dotclk ||
+	if (mode_rate > max_rate ||
 	    drm_dp_calc_pbn_mode(mode->clock, min_bpp << 4) > port->full_pbn) {
 		*status = MODE_CLOCK_HIGH;
 		return 0;
 	}
 
+	num_joined_pipes = intel_dp_num_joined_pipes(intel_dp, connector,
+						     mode->hdisplay, target_clock);
+
 	if (intel_dp_has_dsc(connector) && drm_dp_sink_supports_fec(connector->dp.fec_capability)) {
 		/*
 		 * TBD pass the connector BPC,
@@ -1513,6 +1512,15 @@ mst_connector_mode_valid_ctx(struct drm_connector *_connector,
 	}
 
 	*status = intel_mode_valid_max_plane_size(display, mode, num_joined_pipes);
+
+	if (*status != MODE_OK)
+		return 0;
+
+	max_dotclk *= num_joined_pipes;
+
+	if (mode->clock > max_dotclk)
+		*status = MODE_CLOCK_HIGH;
+
 	return 0;
 }
 
-- 
2.45.2

