Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14A4AF8E4A9
	for <intel-xe@archiver.kernel.org>; Fri, 17 Apr 2026 04:50:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC5D810E28E;
	Fri, 17 Apr 2026 04:50:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="huWXlg8+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 754D510E28E;
 Fri, 17 Apr 2026 04:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776401403; x=1807937403;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UBSoZEvSrLWpr8Y4M05lDl272QKFsmniII/mJiI4XY4=;
 b=huWXlg8+sLtoYUBJulNB5MerjvgFF9TlRZzYCZQKDfoyG8yQJExBiI/N
 gb1PrwKSC1Bjzj9IJRWlYULE4H+kfzGtI5u71jJLxVilaamuSKWgNss/E
 pcxN5oYAAASLcWmtSI7BAesfHa+9+1tMK+Qm+n9DtJY8ilJVEFyWssB1f
 tBVeQgK4wEeAy7yKvJtARKyC3gAV0nYUL3W5+Iu+wBh8heoxl/R/nofZs
 gUcrZKWKPyHFieBrK7AedxNQvMB19QA4wyv4l6ZJ8hou1U8mMNz+w0Ir/
 3OtBK8J6qd/OyrZ9JiGuGi2T1lK5PivRArMxd6bqA3GHzqNUFsTS5Bau/ A==;
X-CSE-ConnectionGUID: MjZ6EhAbS7e4jMJ+sXEMog==
X-CSE-MsgGUID: 6/hLaj37Tkyecnn320kG+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="88795897"
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; d="scan'208";a="88795897"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 21:50:02 -0700
X-CSE-ConnectionGUID: 2kQ7gmTeRkGYbeLz3/KiHw==
X-CSE-MsgGUID: y0R59w+ZRFicInXazf2NvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; d="scan'208";a="230076483"
Received: from amilburn-desk.amilburn-desk (HELO jhogande-mobl3.intel.com)
 ([10.245.245.73])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 21:50:00 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH] drm/i915/psr: Disable PSR2 on Xiaomi Book Pro 14 2026 as a
 quirk
Date: Fri, 17 Apr 2026 07:49:26 +0300
Message-ID: <20260417044926.750354-1-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Add new quirk (QUIRK_DISABLE_PSR2) for disabling PSR2 as a quirk for
problematic setups. Apply this newly added quirk on Xiaomi Book Pro 14 2026.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/7677
Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_psr.c    | 6 ++++++
 drivers/gpu/drm/i915/display/intel_quirks.c | 9 +++++++++
 drivers/gpu/drm/i915/display/intel_quirks.h | 1 +
 3 files changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index b4ca5843d098..19b3b9d52eb9 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -695,6 +695,12 @@ static void _psr_init_dpcd(struct intel_dp *intel_dp, struct intel_connector *co
 
 	connector->dp.psr_caps.sync_latency = intel_dp_get_sink_sync_latency(intel_dp);
 
+	if (intel_has_quirk(display, QUIRK_DISABLE_PSR2)) {
+		drm_dbg_kms(display->drm,
+			    "PSR2 support not currently available for this setup\n");
+		return;
+	}
+
 	if (DISPLAY_VER(display) >= 9 &&
 	    connector->dp.psr_caps.dpcd[0] >= DP_PSR2_WITH_Y_COORD_IS_SUPPORTED) {
 		bool y_req = connector->dp.psr_caps.dpcd[1] &
diff --git a/drivers/gpu/drm/i915/display/intel_quirks.c b/drivers/gpu/drm/i915/display/intel_quirks.c
index 883f297d4b83..229e0025a06c 100644
--- a/drivers/gpu/drm/i915/display/intel_quirks.c
+++ b/drivers/gpu/drm/i915/display/intel_quirks.c
@@ -94,6 +94,12 @@ static void quirk_disable_edp_panel_replay(struct intel_dp *intel_dp)
 	drm_info(display->drm, "Applying disable Panel Replay quirk\n");
 }
 
+static void quirk_disable_psr2(struct intel_display *display)
+{
+	intel_set_quirk(display, QUIRK_DISABLE_PSR2);
+	drm_info(display->drm, "Applying disable PSR2 quirk\n");
+}
+
 struct intel_quirk {
 	int device;
 	int subsystem_vendor;
@@ -250,6 +256,9 @@ static struct intel_quirk intel_quirks[] = {
 
 	/* Dell XPS 13 7390 2-in-1 */
 	{ 0x8a52, 0x1028, 0x08b0, quirk_edp_limit_rate_hbr2 },
+
+	/* Xiaomi Book Pro 14 2026 */
+	{ 0xb081, 0x1d72, 0x2424, quirk_disable_psr2 },
 };
 
 static const struct intel_dpcd_quirk intel_dpcd_quirks[] = {
diff --git a/drivers/gpu/drm/i915/display/intel_quirks.h b/drivers/gpu/drm/i915/display/intel_quirks.h
index 83214eb94b0c..970a4fe52faf 100644
--- a/drivers/gpu/drm/i915/display/intel_quirks.h
+++ b/drivers/gpu/drm/i915/display/intel_quirks.h
@@ -22,6 +22,7 @@ enum intel_quirk_id {
 	QUIRK_FW_SYNC_LEN,
 	QUIRK_EDP_LIMIT_RATE_HBR2,
 	QUIRK_DISABLE_EDP_PANEL_REPLAY,
+	QUIRK_DISABLE_PSR2,
 };
 
 void intel_init_quirks(struct intel_display *display);
-- 
2.43.0

