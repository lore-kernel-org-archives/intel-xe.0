Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08AABC369C7
	for <intel-xe@archiver.kernel.org>; Thu, 17 Apr 2025 10:04:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C334110EA84;
	Thu, 17 Apr 2025 10:04:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VXdzx+IF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6758110EA82;
 Thu, 17 Apr 2025 10:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744884265; x=1776420265;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=15qz6NOaWUSQT2GML6BEdzNB6wVG8f3hPD38/kjbB5o=;
 b=VXdzx+IFQJRH7o6BWXo368NJORNEnfTQTaus6squxpRTtuqDUyKtwxFP
 eqeJPswIaRUKParBcCgvOfSk+ein1PN/eoZHCwEvNI5SyAorJuGSM6I1R
 PnxAASpQmgvgbUKAPMBoJH8iHp235YSmdT81c6TEZeqeBLrNpOhBBzDCA
 zrq52JBjaDFqTqhrDG2cSTteU5ZwNVa43wXCZv8V3ubLMdfHfvo/21s++
 Vw1sGTr3Bs4yNRSADWkPcWvEfiggu7CqOsKjHeZtiHGP7m3Tc9UkbFBbx
 QPYyPeXT+6qj8RDWltEndskcVg/UL1D0B10muwRgrajQu8Ye1hiLqxLPZ A==;
X-CSE-ConnectionGUID: JJkaxqsATjeJcRmOGvocaw==
X-CSE-MsgGUID: P55H+BYPQwiSQET1a6si2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="57106650"
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; d="scan'208";a="57106650"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 03:04:25 -0700
X-CSE-ConnectionGUID: Ki+haV5YQNaNZrplpHJ+Bw==
X-CSE-MsgGUID: uvZFTmFxS5ygnNi5hrGddg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; d="scan'208";a="130745277"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by fmviesa007.fm.intel.com with ESMTP; 17 Apr 2025 03:04:23 -0700
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jouni.hogander@intel.com, jani.nikula@intel.com, jeevan.b@intel.com,
 Animesh Manna <animesh.manna@intel.com>
Subject: [PATCH v9 01/10] drm/i915/alpm: use variable from intel_crtc_state
 instead of intel_psr
Date: Thu, 17 Apr 2025 15:11:14 +0530
Message-Id: <20250417094123.1662424-2-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20250417094123.1662424-1-animesh.manna@intel.com>
References: <20250417094123.1662424-1-animesh.manna@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Jouni Högander <jouni.hogander@intel.com>

Currently code is making assumption that PSR is enabled when
intel_alpm_configure is called. This doesn't work if alpm is configured
before PSR is enabled.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
Reviewed-by: Animesh Manna <animesh.manna@intel.com>
---
 drivers/gpu/drm/i915/display/intel_alpm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/i915/display/intel_alpm.c
index 55f3ae1e68c9..1dbaa8f250aa 100644
--- a/drivers/gpu/drm/i915/display/intel_alpm.c
+++ b/drivers/gpu/drm/i915/display/intel_alpm.c
@@ -317,14 +317,14 @@ static void lnl_alpm_configure(struct intel_dp *intel_dp,
 	u32 alpm_ctl;
 
 	if (DISPLAY_VER(display) < 20 ||
-	    (!intel_dp->psr.sel_update_enabled && !intel_dp_is_edp(intel_dp)))
+	    (!crtc_state->has_sel_update && !intel_dp_is_edp(intel_dp)))
 		return;
 
 	/*
 	 * Panel Replay on eDP is always using ALPM aux less. I.e. no need to
 	 * check panel support at this point.
 	 */
-	if ((intel_dp->psr.panel_replay_enabled && intel_dp_is_edp(intel_dp)) ||
+	if ((crtc_state->has_panel_replay && intel_dp_is_edp(intel_dp)) ||
 	    (crtc_state->has_lobf && intel_alpm_aux_less_wake_supported(intel_dp))) {
 		alpm_ctl = ALPM_CTL_ALPM_ENABLE |
 			ALPM_CTL_ALPM_AUX_LESS_ENABLE |
-- 
2.29.0

