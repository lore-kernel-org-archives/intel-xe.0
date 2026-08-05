Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2198C55ABF
	for <intel-xe@archiver.kernel.org>; Wed,  5 Aug 2026 04:07:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8292A10ECA8;
	Wed,  5 Aug 2026 04:07:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L7HQcXZo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7320610ECA1;
 Wed,  5 Aug 2026 04:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785902854; x=1817438854;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1UWG1ycSWPoBKfVvkEhLl9kugyt+4GWTujlCu38SrYg=;
 b=L7HQcXZoPNnYQxZoZKDYXJHDB/YaXmdGXOPb2oyV/toxtIVvyvO5ktvY
 5n3dJtkYaJY2hBLLZ4GF6eEfR6tn2Pu6NoSys0irCUYyfwAHZm8wvBNhK
 6b4F8HGNU91UOCaU4Xv4W+XOSQzIl/qdDD/bO8vqh4ChsqHm+Tvf2Cb2w
 b7gq/OX7lBY9NesEeCtLnJ7JDsglv0KtgW4PmpFV7IAsQAY+jzSLSHfNX
 0neJIRPvtb6D9oMLP7GLEJInGzKetuK0I5jT4joZ4XMAcNJyYfxgxc8yL
 m8WZLDJ/XAGN342r8LWOcWoyHRuCLCJ2czTxHyndcmfP9t+V6+PlgEuIZ w==;
X-CSE-ConnectionGUID: SvvA8aprSDKlxt+Ed+YJGg==
X-CSE-MsgGUID: VE2U+D++SqKAw2wHoGfxZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="90143534"
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; d="scan'208";a="90143534"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2026 21:07:34 -0700
X-CSE-ConnectionGUID: Wdz8O6nbQ2idZTTLM061Gg==
X-CSE-MsgGUID: zxs7JxB1Qr+a5in728I8+A==
X-ExtLoop1: 1
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2026 21:07:31 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: alexander.kaplan@sms-medipool.de, suraj.kandpal@intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 4/5] drm/i915/hdmi: Add helper to get max FRL rate for an HDMI
 sink
Date: Wed,  5 Aug 2026 09:20:26 +0530
Message-ID: <20260805035027.3473398-5-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260805035027.3473398-1-ankit.k.nautiyal@intel.com>
References: <20260805035027.3473398-1-ankit.k.nautiyal@intel.com>
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
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_hdmi.c | 19 +++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_hdmi.h |  3 +++
 2 files changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index d3efd9e4e86a..9b637e38a1a5 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -3422,3 +3422,22 @@ intel_hdmi_dsc_get_bpp(int src_fractional_bpp, int slice_width, int num_slices,
 
 	return 0;
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
index c3a0e81615e4..c95ed37bcc0c 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.h
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.h
@@ -75,4 +75,7 @@ void hsw_read_infoframe(struct intel_encoder *encoder,
 void intel_hdmi_poll_for_scrambling_enable(const struct intel_crtc_state *crtc_state,
 					   struct drm_connector *_connector);
 
+int intel_hdmi_sink_max_frl_rate(struct drm_connector *connector);
+int intel_hdmi_sink_dsc_max_frl_rate(struct drm_connector *connector);
+
 #endif /* __INTEL_HDMI_H__ */
-- 
2.50.1

