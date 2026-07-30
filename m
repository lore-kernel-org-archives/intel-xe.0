Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CABC1C5516C
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jul 2026 11:10:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4224610EF00;
	Thu, 30 Jul 2026 11:10:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I+NRC7p2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8235810EEEA;
 Thu, 30 Jul 2026 11:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785409794; x=1816945794;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tkN1Wr+vS6JwVSJmBJ1Frighcsrub0/aEFBFcvY2VLA=;
 b=I+NRC7p2onWJE+Syw3i9X+oYSdrukGIh8MeyaW35XZa8Sf2cJi0QGUpQ
 XYb9bNkGWDsrPMPWk9L/v4BVps+jIOV3wnsS1PGNfU36VqY+wS7F1IhJB
 zr7Kqpa64ybP09iOm9sZoF06hxe3p6ed1Z5D3FBackzo4TcgIe81SXwoH
 B1oxxgQ8Gx9REFfEx+KLuZ/+GEUTKbMRWN9Ycjf5zaX3Lvhnsk7JsShT0
 K4M1Owao7r5JHrGFRw5zU+hsBkP6vUQMHO5a15wSCcpkheyOyL3/y21tZ
 5jZo5OU/DPqIKNrMxKIy2pnvT7Sq/qrOZZvdnAzfgk5GoXqcztcn04b4x A==;
X-CSE-ConnectionGUID: 8E892GN2TsatDCDP5nf2Hw==
X-CSE-MsgGUID: m9usucRdRlqo0QIpLdF0rg==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="97182438"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="97182438"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 04:09:54 -0700
X-CSE-ConnectionGUID: cm3Shdw7SWu2c00LKvOYsA==
X-CSE-MsgGUID: SYg/RS84Te6iQf5pZpaOKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="265327204"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 04:09:51 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: alexander.kaplan@sms-medipool.de,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 13/14] drm/i915/hdmi: Add helper to get max FRL rate for an
 HDMI sink
Date: Thu, 30 Jul 2026 16:22:25 +0530
Message-ID: <20260730105226.2731341-14-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260730105226.2731341-1-ankit.k.nautiyal@intel.com>
References: <20260730105226.2731341-1-ankit.k.nautiyal@intel.com>
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

Add the helpers for getting the max FRL rate with and without DSC
for an HDMI sink.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_hdmi.c | 19 +++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_hdmi.h |  3 +++
 2 files changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index 95393ec5d561..352a315b0fb0 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -3479,3 +3479,22 @@ intel_hdmi_dsc_get_bpp(int src_fractional_bpp, int slice_width, int num_slices,
 
 	return dsc_bpp_x16;
 }
+
+int intel_hdmi_sink_max_frl_rate(struct drm_connector *connector)
+{
+	int max_lanes = connector->display_info.hdmi.max_lanes;
+	int rate_per_lane = connector->display_info.hdmi.max_frl_rate_per_lane;
+
+	return max_lanes * rate_per_lane;
+}
+
+int intel_hdmi_sink_dsc_max_frl_rate(struct drm_connector *connector)
+{
+	int max_lanes = connector->display_info.hdmi.dsc_cap.max_lanes;
+	int rate_per_lane = connector->display_info.hdmi.dsc_cap.max_frl_rate_per_lane;
+
+	if (!max_lanes || !rate_per_lane)
+		return 0;
+
+	return max_lanes * rate_per_lane;
+}
diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.h b/drivers/gpu/drm/i915/display/intel_hdmi.h
index 072c8d228697..f7a494df19e6 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.h
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.h
@@ -80,4 +80,7 @@ void hsw_read_infoframe(struct intel_encoder *encoder,
 void intel_hdmi_poll_for_scrambling_enable(const struct intel_crtc_state *crtc_state,
 					   struct drm_connector *_connector);
 
+int intel_hdmi_sink_max_frl_rate(struct drm_connector *connector);
+int intel_hdmi_sink_dsc_max_frl_rate(struct drm_connector *connector);
+
 #endif /* __INTEL_HDMI_H__ */
-- 
2.50.1

