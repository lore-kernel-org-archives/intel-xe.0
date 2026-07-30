Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBB9FC55167
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jul 2026 11:09:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5DD710EED1;
	Thu, 30 Jul 2026 11:09:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H2nq6Qtb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5976710EECA;
 Thu, 30 Jul 2026 11:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785409777; x=1816945777;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BZa1t+b+KbnWJWTN7XS7xizzmcbQMbL+Sm3F88DFk2U=;
 b=H2nq6QtbEdGIcPf2I4XWcfkBHf7Tt9RF4tiFev/bY/al++7P+2K7DPVW
 OIijQkBE17z3iwVOBTHEu2AifkqZjJTzQB5tps83KgWwrM6OXqxDYa04E
 6cnByQvYho31LusI8Qfm7jIAVoCoju2jHcBHGC2CqZS4Gv7cWPoB2jqo6
 0Zt2Sf9RJqHoTRL2hm7OzmvtDtRFc61DwICgSv7TVVu2iDsWrzqPOVCKc
 9QSAuxRVY3JjGXNjECMKt6BLCSZb0cneak7H4Np2bn+FOIjS8GV34rh5b
 Nocg8NqytbI4pIgg32+hemFYuBmg9rgSrZZ7HW0FWJCQVqHEYxvxdAHzH A==;
X-CSE-ConnectionGUID: 18molfzSSd+4gyv5OYWzeA==
X-CSE-MsgGUID: OgOUyk5RSRCzMg23+j0F4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="86217230"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="86217230"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 04:09:35 -0700
X-CSE-ConnectionGUID: vzrb3I8AQwyjGNBgZBXjiw==
X-CSE-MsgGUID: E9aZlmGkTZmnL4cqMlHpxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="298482255"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by orviesa001.jf.intel.com with ESMTP; 30 Jul 2026 04:09:33 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, uma.shankar@intel.com,
 ankit.k.nautiyal@intel.com, chaitanya.kumar.borah@intel.com
Subject: [PATCH v8 02/10] drm/i915/vrr: Restrict CMRR enable condition to
 VRR-TG-default platforms
Date: Thu, 30 Jul 2026 16:29:09 +0530
Message-ID: <20260730105919.3913412-3-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260730105919.3913412-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20260730105919.3913412-1-mitulkumar.ajitkumar.golani@intel.com>
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

CMRR is currently advertised on all HAS_CMRR platforms, but it depends
on the VRR timing generator being the default timing generator, which
currently only applies to DISPLAY_VER >= 30.

Gate the CMRR enable condition and readout accordingly so CMRR is only
reported on supported platforms.

No functional change.

--v2:
- Create a separate function to check if CMRR possible

--v3:
- Simplify commit message (Chaitanya)
- Remove redundant outer parenthesis (Chaitanya)

Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 drivers/gpu/drm/i915/display/intel_vrr.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
index 51e4f3309b8b..b0c9101e6ed3 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.c
+++ b/drivers/gpu/drm/i915/display/intel_vrr.c
@@ -187,15 +187,21 @@ int intel_vrr_vmax_vblank_start(const struct intel_crtc_state *crtc_state)
 	return intel_vrr_vmax_vtotal(crtc_state) - crtc_state->vrr.guardband;
 }
 
+static bool intel_vrr_cmrr_possible(const struct intel_crtc_state *crtc_state)
+{
+	struct intel_display *display = to_intel_display(crtc_state);
+
+	return HAS_CMRR(display) && intel_vrr_always_use_vrr_tg(display);
+}
+
 static bool
 is_cmrr_frac_required(struct intel_crtc_state *crtc_state)
 {
-	struct intel_display *display = to_intel_display(crtc_state);
 	int calculated_refresh_k, actual_refresh_k, pixel_clock_per_line;
 	struct drm_display_mode *adjusted_mode = &crtc_state->hw.adjusted_mode;
 
 	/* Avoid CMRR for now till we have VRR with fixed timings working */
-	if (!HAS_CMRR(display) || true)
+	if (!intel_vrr_cmrr_possible(crtc_state) || true)
 		return false;
 
 	actual_refresh_k =
@@ -1066,7 +1072,7 @@ void intel_vrr_get_config(struct intel_crtc_state *crtc_state)
 	trans_vrr_ctl = intel_de_read(display,
 				      TRANS_VRR_CTL(display, cpu_transcoder));
 
-	if (HAS_CMRR(display))
+	if (intel_vrr_cmrr_possible(crtc_state))
 		crtc_state->cmrr.enable = (trans_vrr_ctl & VRR_CTL_CMRR_ENABLE);
 
 	if (crtc_state->cmrr.enable) {
-- 
2.48.1

