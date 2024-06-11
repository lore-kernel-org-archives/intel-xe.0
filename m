Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 458DAC27C65
	for <intel-xe@archiver.kernel.org>; Tue, 11 Jun 2024 18:32:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD64D10E6FF;
	Tue, 11 Jun 2024 18:32:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R3a34R/n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07B5C10E6FF
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Jun 2024 18:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718130735; x=1749666735;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=I3yv0xGyB2KNXLiwp+WUyecrnT6vrRPKEUDyYdtR9CQ=;
 b=R3a34R/nunTF2ELOoa7KGXynITrP+O9w3DXLw8efJ90+G6IdLL1VIVNL
 ZqQGzSmIGCi3YvnG5YgIsYYgfaL99ORm8BpOj6JJ8qLHp+tMnOzNUYAbK
 V9qUIayBOYeH9uRL3qeZe5yippp6Uyv5IaKiJW1lTOw26iq6qnWiEgTM1
 CeDG61eiEVZcjttKJs+PXCcnoOw20MgcuQPWs0ghg7ATw0rkYRLKceDM9
 s7V8RKdeqScSXqePXzsKQ2EbPjMNDE1mJp4YOmpf54vuTvVOxb8QItJfR
 m87baLCGTebyE73l7sCXghRv5CBN+E2EhZbP9+Z7TNG59KCgr/Grb0SP8 w==;
X-CSE-ConnectionGUID: dXzEZTJMRK2IaG5Tfz5MaQ==
X-CSE-MsgGUID: cbDCpu0bRemUJtfxRK2Wfg==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="18718890"
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="18718890"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 11:31:59 -0700
X-CSE-ConnectionGUID: asYofrrMRW6JI8G0Mv1mVg==
X-CSE-MsgGUID: hFfZa1eyQ+6wJU2fcWfyRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="40135094"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by orviesa008.jf.intel.com with ESMTP; 11 Jun 2024 11:31:58 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [RFC] drm/i915/display: Update vtotal math to address 32b build
Date: Wed, 12 Jun 2024 00:02:08 +0530
Message-ID: <20240611183208.159878-1-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.45.2
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

Fix few divisions which may not work on 32b builds.

Use DIV_ROUND_UP, with that expecting deviate params
from +/- 1 accuracy in value.

Fixes: 1676ecd303ac ("drm/i915: Compute CMRR and calculate vtotal")
Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
---
 drivers/gpu/drm/i915/display/intel_vrr.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
index 05f67dc9d98d..5112961f6964 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.c
+++ b/drivers/gpu/drm/i915/display/intel_vrr.c
@@ -122,10 +122,11 @@ is_cmrr_frac_required(struct intel_crtc_state *crtc_state)
 
 	actual_refresh_k =
 		drm_mode_vrefresh(adjusted_mode) * FIXED_POINT_PRECISION;
-	pixel_clock_per_line =
-		adjusted_mode->crtc_clock * 1000 / adjusted_mode->crtc_htotal;
+	pixel_clock_per_line = DIV_ROUND_UP(adjusted_mode->crtc_clock * 1000,
+					    adjusted_mode->crtc_htotal);
 	calculated_refresh_k =
-		pixel_clock_per_line * FIXED_POINT_PRECISION / adjusted_mode->crtc_vtotal;
+		DIV_ROUND_UP(pixel_clock_per_line * FIXED_POINT_PRECISION,
+			     adjusted_mode->crtc_vtotal);
 
 	if ((actual_refresh_k - calculated_refresh_k) < CMRR_PRECISION_TOLERANCE)
 		return false;
@@ -149,7 +150,8 @@ cmrr_get_vtotal(struct intel_crtc_state *crtc_state, bool video_mode_required)
 
 	crtc_state->cmrr.cmrr_n =
 		desired_refresh_rate * adjusted_mode->crtc_htotal * multiplier_n;
-	vtotal = (adjusted_mode->crtc_clock * 1000 * multiplier_n) / crtc_state->cmrr.cmrr_n;
+	vtotal = DIV_ROUND_UP(adjusted_mode->crtc_clock * 1000 * multiplier_n,
+			      crtc_state->cmrr.cmrr_n);
 	adjusted_pixel_rate = adjusted_mode->crtc_clock * 1000 * multiplier_m;
 	crtc_state->cmrr.cmrr_m = do_div(adjusted_pixel_rate, crtc_state->cmrr.cmrr_n);
 
-- 
2.45.2

