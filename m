Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEA5CE9380E
	for <intel-xe@archiver.kernel.org>; Mon, 13 Apr 2026 04:08:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FDFF10E305;
	Mon, 13 Apr 2026 04:08:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fIsxkUzh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30AFC10E301;
 Mon, 13 Apr 2026 04:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776053328; x=1807589328;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vTr5UUBfXJDTkG0B/q8j3WhJj10dxyLUlv1GmLqNteY=;
 b=fIsxkUzhK8A6U9wpsQsPmPMzO4/gKzgr4ePpU39RWUStMsC/xeEEwBRY
 uFIZB1N1U8p6pwXnkgumyFjmEHQME69M5C1JPWKTNKjbL16GZpRt3VuO9
 h668nVvzKCaVOodUGC98w3nV17ptkx2ug4phB+R5ZOMwiGqr+Ib5N4vDd
 9ttHLUCJpze1ZGc+ZIT4IW2uQAenec43hWqinETvmHPCdMrGavHi/zFR6
 GCzBGJ2Sjpq2xgVo4YwtH+VHbAcJBQQdnIRpm9zqad805lDx5n8nbg0qG
 xxRJuvCAeenPrPXW8nue0T8hHDl/ECVeWtoG/ZRiixzBgKRJxupDtiztl A==;
X-CSE-ConnectionGUID: neFz/nkrT7OHJH3IuDYe+w==
X-CSE-MsgGUID: Y/Rh6XMEQfCDpSLkzZzNEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11757"; a="80568737"
X-IronPort-AV: E=Sophos;i="6.23,176,1770624000"; d="scan'208";a="80568737"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2026 21:08:48 -0700
X-CSE-ConnectionGUID: tbYgEsTGQ8aArCqx76iM+w==
X-CSE-MsgGUID: cvBsU1EWQk+oKcbyfQzMDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,176,1770624000"; d="scan'208";a="229546599"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2026 21:08:45 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, arun.r.murthy@intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 02/12] drm/i915/vrr: Add helper to readback EMP_AS_SDP_TL
Date: Mon, 13 Apr 2026 09:23:39 +0530
Message-ID: <20260413035349.1730312-3-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260413035349.1730312-1-ankit.k.nautiyal@intel.com>
References: <20260413035349.1730312-1-ankit.k.nautiyal@intel.com>
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

EMP_AS_SDP_TL is used to program both DP Adaptive Sync SDP and HDMI
Video Timing EMP for VRR operation. Add a helper to read back the
programmed transmission line from hardware so VRR code can populate
the corresponding CRTC state fields during get_config.

This provides a common read-back path for VRR packet transmission
line state.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_vrr.c | 13 +++++++++++++
 drivers/gpu/drm/i915/display/intel_vrr.h |  1 +
 2 files changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
index 1fed597439b0..abdae7f1f8a8 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.c
+++ b/drivers/gpu/drm/i915/display/intel_vrr.c
@@ -1218,3 +1218,16 @@ int intel_vrr_dcb_vmax_vblank_start_final(const struct intel_crtc_state *crtc_st
 
 	return intel_vrr_vblank_start(crtc_state, VRR_DCB_VMAX(tmp) + 1);
 }
+
+u16 intel_vrr_read_emp_as_sdp_tl(const struct intel_crtc_state *crtc_state)
+{
+	struct intel_display *display = to_intel_display(crtc_state);
+	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
+	u32 val;
+
+	if (!HAS_EMP_AS_SDP_TL(display))
+		return 0;
+
+	val = intel_de_read(display, EMP_AS_SDP_TL(display, cpu_transcoder));
+	return REG_FIELD_GET(EMP_AS_SDP_DB_TL_MASK, val);
+}
diff --git a/drivers/gpu/drm/i915/display/intel_vrr.h b/drivers/gpu/drm/i915/display/intel_vrr.h
index 4f16ca4af91f..6659a8a53432 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.h
+++ b/drivers/gpu/drm/i915/display/intel_vrr.h
@@ -53,5 +53,6 @@ int intel_vrr_dcb_vmin_vblank_start_next(const struct intel_crtc_state *crtc_sta
 int intel_vrr_dcb_vmax_vblank_start_next(const struct intel_crtc_state *crtc_state);
 int intel_vrr_dcb_vmin_vblank_start_final(const struct intel_crtc_state *crtc_state);
 int intel_vrr_dcb_vmax_vblank_start_final(const struct intel_crtc_state *crtc_state);
+u16 intel_vrr_read_emp_as_sdp_tl(const struct intel_crtc_state *crtc_state);
 
 #endif /* __INTEL_VRR_H__ */
-- 
2.45.2

