Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AEDCC5DF94
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 06:19:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD19010E153;
	Tue, 25 Aug 2026 06:19:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QmkhMCAl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5472F10E8E2;
 Tue, 25 Aug 2026 06:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787638764; x=1819174764;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MX5UF69+/3ybHi180haCxUqy0PyJpzM6xs+C+NvgW4M=;
 b=QmkhMCAlRDIirXu3a3YeXKFq3qYexZv86i3gzG9E0Bv130OZH5dAK1K9
 Apkm+La7lckGn1R6gvGLCsgKbkjrMRQ2WiShON4aTEW0oU3Q1agdNbcBa
 HNOy1b2/s4O/BeakKr2dzIatzhlO6lagYItmlN++u1R/QmWiiHFNmJe8O
 lI5lbE4ovkWU4Z0DmmqVcYgX3LWqTTcI7njEInUsLIiFNmK7SWMXej5ZY
 6bwAlh1sAIU7KJd6fmo5VHjLpt9dUM4G2z4W+WJ/gGaDgHr+6x0R/rz1p
 /cXeHbxQzD/HJhoaI/tz98DeRDE4/MaPj61rMVgnUeZbumh10RWeZNSjF w==;
X-CSE-ConnectionGUID: Hw0noyYNQ/uQEqPmmoFfHQ==
X-CSE-MsgGUID: z43TZlFRQ4qSmh0b1QuUFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="88112669"
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="88112669"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 23:19:24 -0700
X-CSE-ConnectionGUID: 1WS+Rtv/SoeMSViAW9dIIg==
X-CSE-MsgGUID: hA6muhQ5QK6/NX1WogAjnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="263912948"
Received: from unknown (HELO SRR4-3-Linux-101-amanna.iind.intel.com)
 ([10.190.238.88])
 by fmviesa007.fm.intel.com with ESMTP; 24 Aug 2026 23:19:22 -0700
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jouni.hogander@intel.com, jani.nikula@intel.com, suraj.kandpal@intel.com,
 Animesh Manna <animesh.manna@intel.com>
Subject: [PATCH v5 07/15] drm/i915/alpm: table based establishment period
Date: Tue, 25 Aug 2026 11:15:28 +0530
Message-Id: <20260825054536.3455704-8-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20260825054536.3455704-1-animesh.manna@intel.com>
References: <20260825054536.3455704-1-animesh.manna@intel.com>
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

Only use the table when the link rate is listed (idx valid)
and the LTTPR count is within the table bounds. A zero entry
means the rate has no tabulated value, so fall back to the
computed establishment period below.

Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 drivers/gpu/drm/i915/display/intel_alpm.c | 95 +++++++++++++++++++++++
 1 file changed, 95 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/i915/display/intel_alpm.c
index af2733805505..078e04bb69d2 100644
--- a/drivers/gpu/drm/i915/display/intel_alpm.c
+++ b/drivers/gpu/drm/i915/display/intel_alpm.c
@@ -115,6 +115,92 @@ static int get_tphy2_p2_to_p0(const struct intel_crtc_state *crtc_state)
 	return DISPLAY_VER(display) >= 35 ? (20 * 1000) : (12 * 1000);
 }
 
+#define DEFAULT_MAX_LTTPR_COUNT 7
+#define MAX_SUPPORTED_DP_LINK_RATES 12
+
+static const u32 establishment_periods[DEFAULT_MAX_LTTPR_COUNT][MAX_SUPPORTED_DP_LINK_RATES] = {
+	/* 1620, 2160, 2430, 2700, 3240, 4320, 5400, 6750, 8100, 10000, 13500, 20000 */
+	/* No Retimers */
+	{ 61070, 0, 0, 56710, 0, 0, 53450, 0, 52360, 59050, 56750, 54620 },
+	/*  1 Retimer  */
+	{ 155670, 0, 0, 151310, 0, 0, 148050, 0, 146960, 153650, 151350, 149220 },
+	/*  2 Retimers */
+	{ 181160, 0, 0, 172450, 0, 0, 165910, 0, 163740, 177120, 172520, 168220 },
+	/*  3 Retimers */
+	{ 206650, 0, 0, 193580, 0, 0, 183780, 0, 180510, 200590, 193690, 187290 },
+	/*  4 Retimers */
+	{ 232140, 0, 0, 214710, 0, 0, 201650, 0, 197290, 224060, 214860, 206320 },
+	/*  5 Retimers */
+	{ 257620, 0, 0, 235850, 0, 0, 219510, 0, 214070, 247530, 236030, 225360 },
+	/*  6 Retimers */
+	{ 283110, 0, 0, 256980, 0, 0, 237380, 0, 230850, 271000, 257200, 244390 },
+};
+
+enum link_rate_idx {
+	LINK_RATE_INVALID = -1,
+	LINK_RATE_1,
+	LINK_RATE_2,
+	LINK_RATE_3,
+	LINK_RATE_4,
+	LINK_RATE_5,
+	LINK_RATE_6,
+	LINK_RATE_7,
+	LINK_RATE_8,
+	LINK_RATE_9,
+	LINK_RATE_10,
+	LINK_RATE_11,
+	LINK_RATE_12
+};
+
+static int get_link_rate_index(int port_clock)
+{
+	int link_rate_index;
+
+	switch (port_clock) {
+	case 162000:
+		link_rate_index = LINK_RATE_1;	// Rate_1 (RBR) - 1.62 Gbps/Lane
+		break;
+	case 216000:
+		link_rate_index = LINK_RATE_2;	// Rate_2       - 2.16 Gbps/Lane
+		break;
+	case 243000:
+		link_rate_index = LINK_RATE_3;	// Rate_3       - 2.43 Gbps/Lane
+		break;
+	case 270000:
+		link_rate_index = LINK_RATE_4;	// Rate_4 (HBR) - 2.70 Gbps/Lane
+		break;
+	case 324000:
+		link_rate_index = LINK_RATE_5;	// Rate_5 (RBR2)- 3.24 Gbps/Lane
+		break;
+	case 432000:
+		link_rate_index = LINK_RATE_6;	// Rate_6       - 4.32 Gbps/Lane
+		break;
+	case 540000:
+		link_rate_index = LINK_RATE_7;	// Rate_7 (HBR2)- 5.40 Gbps/Lane
+		break;
+	case 675000:
+		link_rate_index = LINK_RATE_8;	// Rate_8       - 6.75 Gbps/Lane
+		break;
+	case 810000:
+		link_rate_index = LINK_RATE_9;	// Rate_9 (HBR3)- 8.10 Gbps/Lane
+		break;
+	case 1000000:
+		link_rate_index = LINK_RATE_10;	// Rate_10 (UHBR10) - 10.0 Gbps/Lane
+		break;
+	case 1350000:
+		link_rate_index = LINK_RATE_11;	// Rate_11 (UHBR13.5) - 13.5 Gbps/Lane
+		break;
+	case 2000000:
+		link_rate_index = LINK_RATE_12;	// Rate_12 (UHBR20) - 20.0 Gbps/Lane
+		break;
+	default:
+		link_rate_index = -1;
+		break;
+	}
+
+	return link_rate_index;
+}
+
 static int get_establishment_period(struct intel_dp *intel_dp,
 				    const struct intel_crtc_state *crtc_state)
 {
@@ -129,8 +215,17 @@ static int get_establishment_period(struct intel_dp *intel_dp,
 	if (intel_crtc_has_type(crtc_state, INTEL_OUTPUT_EDP)) {
 		tcds = (7 + DIV_ROUND_UP(6500, tml_phy_lock) + 1) * tml_phy_lock;
 	} else {
+		int idx = get_link_rate_index(crtc_state->port_clock);
+
 		tcds = 7 * tml_phy_lock;
 		lttpr_count = drm_dp_lttpr_count(intel_dp->lttpr_common_caps);
+
+		if (idx != LINK_RATE_INVALID &&
+		    lttpr_count < DEFAULT_MAX_LTTPR_COUNT &&
+		    establishment_periods[lttpr_count][idx]) {
+			establishment_period = establishment_periods[lttpr_count][idx];
+			return establishment_period;
+		}
 	}
 
 	if (lttpr_count) {
-- 
2.29.0

