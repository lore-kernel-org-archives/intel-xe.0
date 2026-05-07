Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A2D8CD3444
	for <intel-xe@archiver.kernel.org>; Thu,  7 May 2026 01:32:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 190DD10EF53;
	Thu,  7 May 2026 01:32:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oKJxKhI5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 241EC10EF50;
 Thu,  7 May 2026 01:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778117542; x=1809653542;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rR7A4PMoNpuRbZo/oBg7Lsi2jXJEDgFgiWcXGYLB18c=;
 b=oKJxKhI5vfEOYzDzmM6uBHrOeC2Fi1B4395xIVPp4ic8sNxutXFIwMn7
 fyEw6GbgQrNM4CaG+Y1I09TBT9VIsibjlogHfpks47/zk9l1PhRafDOhR
 3Qbiw7CAeG95AXwEnqnK1tSPqvoKAG/hCL3U8aujeknZa/Kp9DK8AQu+6
 v6BcRsh/0Q7ipD34obDDdsJ4Uiyco2Pw0QSNGqi0cJ7NxPARz3Ey3xtSY
 lt8eEWPOMdxvqOQyGDJ3QviPxzzoZyi8knLQrpiFIaFHWMRMIgJTyfc8l
 1QhNbU24ZoQ4GYdDatiZqqoXgh2IeEdkIZEnmwC3ZbspfQyPMRHjo/PRz Q==;
X-CSE-ConnectionGUID: XCtt7j7LRfCVXtFnjWgh0A==
X-CSE-MsgGUID: RwqJFlHtTsiH9H59MaDtLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="78089047"
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; d="scan'208";a="78089047"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 18:32:22 -0700
X-CSE-ConnectionGUID: rUQBMz7bSXaPVNKBhVJyNg==
X-CSE-MsgGUID: AO5ATL8ZS3mo9GoSIRW+7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; d="scan'208";a="266692851"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by orviesa002.jf.intel.com with ESMTP; 06 May 2026 18:32:21 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, suraj.kandpal@intel.com,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH v3 21/31] drm/i915/buf_trans: compute C20's VS/PE-O index
Date: Thu,  7 May 2026 03:31:27 +0200
Message-ID: <20260507013137.527510-22-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260507013137.527510-1-michal.grzelak@intel.com>
References: <20260507013137.527510-1-michal.grzelak@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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

Compute the most appropriate VS/PE-O index for C20 basing on highest
available DP mode.

Use 6th table if encoder supports DP 2.0 or higher. Otherwise use 5th
table for DP.

Warn if encoder does not support DP. In that case fallback to using
default VS/PE tables.

v2->v3
- return -EINVAL instead of -1 (Suraj)

Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 .../drm/i915/display/intel_ddi_buf_trans.c    | 23 ++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c b/drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c
index 54ad46643fb5c..e7c497d31d1a8 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c
@@ -1786,6 +1786,23 @@ xe3plpd_get_lt_buf_trans(struct intel_encoder *encoder,
 		return intel_get_buf_trans(&xe3plpd_lt_trans_dp14, n_entries);
 }
 
+static int
+snps_c20_compute_index(const struct intel_crtc_state *crtc_state)
+{
+	if (intel_crtc_has_dp_encoder(crtc_state)) {
+		if (intel_dp_is_uhbr(crtc_state))
+			return 5;
+		else
+			return 4;
+	}
+
+	drm_WARN(to_intel_display(crtc_state)->drm, 1,
+		 "non-DP (%d) encoder asks to compute VS/PE-O index\n",
+		 crtc_state->output_types);
+
+	return -EINVAL;
+}
+
 static enum lt_vspeo_index
 lt_compute_index(const struct intel_crtc_state *crtc_state)
 {
@@ -1809,8 +1826,12 @@ vspeo_compute_index(struct intel_encoder *encoder,
 {
 	struct intel_display *display = to_intel_display(encoder);
 
-	if (HAS_LT_PHY(display))
+	if (HAS_LT_PHY(display)) {
 		return lt_compute_index(crtc_state);
+	} else if (DISPLAY_VER(display) >= 14) {
+		if (!intel_encoder_is_c10phy(encoder))
+			return snps_c20_compute_index(crtc_state);
+	}
 
 	drm_dbg_kms(display->drm,
 		    "VS/PE-O unsupported, using default VS/PE tables");
-- 
2.45.2

