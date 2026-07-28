Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C30DC54F4C
	for <intel-xe@archiver.kernel.org>; Tue, 28 Jul 2026 15:11:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 394D810E5A3;
	Tue, 28 Jul 2026 15:11:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jNd/3+lM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A70310E58A;
 Tue, 28 Jul 2026 15:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785251479; x=1816787479;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BZa1t+b+KbnWJWTN7XS7xizzmcbQMbL+Sm3F88DFk2U=;
 b=jNd/3+lMHz/ONDJK94vzRfv8UaLzFkDc/faVkHgjcVphzzfc1cDLAmw2
 IVZbyUwSzsJHSTbe9nQQuYCPzLXXJQRfJ+sHQ6mHXfRGkG9Y6UzJNyyno
 En7uN7A4wU8PGH4bwMoiaM2RRC+FWOzgvpqk2+H1+BRUisguH16nn0h+6
 V8ALa//Inp9tNLt7vAAqwVIEXL8pSwNjSUp3bGCk1sAGKHu7tFd5mXv6K
 BoFodP+1viIQWXnQxDqeq0lqAOL6q0CmF4x18boWs+PXJYk/pCUdPqSrl
 vp2vRLDB0B1C1t0beQeGpBhL0a2IDb5BAtzOuOh7YVHXtLly3L23IosFD A==;
X-CSE-ConnectionGUID: W00iu+aOTZ+zVoJur+EhBA==
X-CSE-MsgGUID: ISU+uTo5QA+nzlwUZh6neg==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="88376922"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="88376922"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 08:10:00 -0700
X-CSE-ConnectionGUID: XUbJ0M/qT0GkYTOC+qtH1Q==
X-CSE-MsgGUID: pS05+IanQnyZ0PYQhT8JWg==
X-ExtLoop1: 1
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by fmviesa003.fm.intel.com with ESMTP; 28 Jul 2026 08:09:59 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, uma.shankar@intel.com,
 ankit.k.nautiyal@intel.com, chaitanya.kumar.borah@intel.com
Subject: [PATCH v7 02/10] drm/i915/vrr: Restrict CMRR enable condition to
 VRR-TG-default platforms
Date: Tue, 28 Jul 2026 20:29:34 +0530
Message-ID: <20260728145943.3848704-3-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260728145943.3848704-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20260728145943.3848704-1-mitulkumar.ajitkumar.golani@intel.com>
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

