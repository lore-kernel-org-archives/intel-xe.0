Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F75A106286C
	for <intel-xe@archiver.kernel.org>; Wed, 11 Mar 2026 11:52:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6C5010E8AA;
	Wed, 11 Mar 2026 11:52:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f6OvJKB0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8C6D10E8B6;
 Wed, 11 Mar 2026 11:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773229919; x=1804765919;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mwhc/pb3zdm4mBR44R5kAx8+kIxcpojGKEbdjJvZRNU=;
 b=f6OvJKB0Tm8z5TKkW+4PqjGgWywbQQdIgcQ8+HG7N0npkyrH+9v7Hdm9
 YhtHEbYflO9hUrJHHBV+HZg2LFnwc11dqFPoikrQ0kJ93f+D+PwFA0sAE
 dTissYtwVwWyb6XBVfhLfnh5S/IlmrMbW779kH4edkMe18PL2fosYwFCu
 0XdNdxhJMLRSjr+24ucUDSyZ9iq4y1MtbnVXTSIXqwGfRJ+2ZdJE/mEfT
 rDJVE79nycMiBBChU0ZXSRh86Vo97vIzpG4Hie3hoWnawYf/hc6tiuCAJ
 GofWjKLODBA/84K2xPhxhNgQvl32nHbowRatEg9ICWeJXXidkCdI2PX81 A==;
X-CSE-ConnectionGUID: 88ff549VRF2+Csn7mYyrOQ==
X-CSE-MsgGUID: O6mxIbL8T9mKi4rpVcRU3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="74204995"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="74204995"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 04:51:58 -0700
X-CSE-ConnectionGUID: dhProZY3R4yVuvA9SUUoSQ==
X-CSE-MsgGUID: YGWoP/QqTzue5KBrzygQEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="224602380"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 04:51:56 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, jouni.hogander@intel.com,
 animesh.manna@intel.com, Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 11/19] drm/i915/dp: Add member to intel_dp to store AS SDP v2
 support
Date: Wed, 11 Mar 2026 17:06:03 +0530
Message-ID: <20260311113611.3393194-12-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260311113611.3393194-1-ankit.k.nautiyal@intel.com>
References: <20260311113611.3393194-1-ankit.k.nautiyal@intel.com>
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

DP v2.1 mentions support for FAVT payload fields parsing in DPCD 0x2214
Bit 2. This essentially signals the support for AS SDP version 2, that
allows source to set the version in HB2[4:0] and the payload length in
HB3[5:0] of the AS SDP header.

Read this bit and store the AS SDP v2 capability in intel_dp.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 .../drm/i915/display/intel_display_types.h    |  1 +
 drivers/gpu/drm/i915/display/intel_dp.c       | 21 +++++++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index e189f8c39ccb..d783cea06aed 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1870,6 +1870,7 @@ struct intel_dp {
 	/* connector directly attached - won't be use for modeset in mst world */
 	struct intel_connector *attached_connector;
 	bool as_sdp_supported;
+	bool as_sdp_v2_supported;
 
 	struct drm_dp_tunnel *tunnel;
 	bool tunnel_suspended:1;
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 0d2403d48528..e6148e7f0ebc 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -6291,6 +6291,24 @@ intel_dp_unset_edid(struct intel_dp *intel_dp)
 					       false);
 }
 
+static bool
+intel_dp_sink_supports_as_sdp_v2(struct intel_dp *intel_dp)
+{
+	struct intel_display *display = to_intel_display(intel_dp);
+	u8 rx_features;
+
+	if (drm_dp_dpcd_read_byte(&intel_dp->aux,
+				  DP_DPRX_FEATURE_ENUMERATION_LIST_CONT_1,
+				  &rx_features) < 0) {
+		drm_dbg_kms(display->drm,
+			    "Failed to read DP_DPRX_FEATURE_ENUMERATION_LIST_CONT_1\n");
+
+		return false;
+	}
+
+	return rx_features & DP_AS_SDP_FAVT_PAYLOAD_FIELDS_PARSING_SUPPORTED;
+}
+
 static void
 intel_dp_detect_sdp_caps(struct intel_dp *intel_dp)
 {
@@ -6298,6 +6316,9 @@ intel_dp_detect_sdp_caps(struct intel_dp *intel_dp)
 
 	intel_dp->as_sdp_supported = HAS_AS_SDP(display) &&
 		drm_dp_as_sdp_supported(&intel_dp->aux, intel_dp->dpcd);
+
+	intel_dp->as_sdp_v2_supported = intel_dp->as_sdp_supported &&
+					intel_dp_sink_supports_as_sdp_v2(intel_dp);
 }
 
 static bool intel_dp_needs_dpcd_probe(struct intel_dp *intel_dp, bool force_on_external)
-- 
2.45.2

