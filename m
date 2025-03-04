Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88A4AC282D0
	for <intel-xe@archiver.kernel.org>; Tue,  4 Mar 2025 08:32:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53C9810E53F;
	Tue,  4 Mar 2025 08:32:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R8XQ50BN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A71B410E532;
 Tue,  4 Mar 2025 08:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741077136; x=1772613136;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tmvCnc9s58wM8BwoeBBwcUB3y48arWkHN/04vZDKAEQ=;
 b=R8XQ50BN5EiKlb4NrLxSaM138p8SHjKNvza0H/yEXie1olE0qNWasLq4
 XXnjQaAQTKyR+ZRmRm3ztCG/D80DC4s1Ji6tRLfG7gYpUODoSoNqipKP4
 27ha3axG4Iq0OxUeTeG39WYYzQcfwH7DUqkjnkHdztpoflCDtVvKzwzI2
 Lgkmit7QIYvBy+b01ByMehKgMTXzxQ2Xbu6i5479FNaR4lbdScWPRFzh6
 n4OwRMrVvfrE40zyByuRuxWmkBrJUYM3BdueNdWyWsWRodDRzUH9b62RH
 +hxmovR1bOX+TRST0jBset55UXjQuMdVTmxeflK9Gkm56y886GRNu+W+j A==;
X-CSE-ConnectionGUID: oN7mczthRrKoXnw411gL3Q==
X-CSE-MsgGUID: XYVE++YgTtaywIQpaIHbTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="45910176"
X-IronPort-AV: E=Sophos;i="6.13,331,1732608000"; d="scan'208";a="45910176"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2025 00:32:15 -0800
X-CSE-ConnectionGUID: sha9AFqBSKin7LXbDeXCGw==
X-CSE-MsgGUID: Bx+tyoTXT66/1M5PJi85cA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="155492210"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2025 00:32:14 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, jani.nikula@linux.intel.com,
 ville.syrjala@linux.intel.com, mitulkumar.ajitkumar.golani@intel.com
Subject: [PATCH 10/22] drm/i915/dp_mst: Use VRR Timing generator for DP MST
 for fixed_rr
Date: Tue,  4 Mar 2025 13:49:36 +0530
Message-ID: <20250304081948.3177034-11-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250304081948.3177034-1-ankit.k.nautiyal@intel.com>
References: <20250304081948.3177034-1-ankit.k.nautiyal@intel.com>
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

Currently the variable timings are supported only for DP and eDP and not
for DP MST. Call intel_vrr_compute_config() for MST which will configure
fixed refresh rate timings irrespective of whether VRR is supported or
not. Since vrr_capable still doesn't have support for DP MST this will be
just treated as non VRR case and vrr.vmin/vmax/flipline will be all set
to adjusted_mode->crtc_vtotal.

This will help to move away from the legacy timing generator and
always use VRR timing generator by default.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp_mst.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 02f95108c637..bd47cf127b4c 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -52,6 +52,7 @@
 #include "intel_pfit.h"
 #include "intel_psr.h"
 #include "intel_vdsc.h"
+#include "intel_vrr.h"
 #include "skl_scaler.h"
 
 /*
@@ -710,6 +711,8 @@ static int mst_stream_compute_config(struct intel_encoder *encoder,
 		pipe_config->lane_lat_optim_mask =
 			bxt_dpio_phy_calc_lane_lat_optim_mask(pipe_config->lane_count);
 
+	intel_vrr_compute_config(pipe_config, conn_state);
+
 	intel_dp_audio_compute_config(encoder, pipe_config, conn_state);
 
 	intel_ddi_compute_min_voltage_level(pipe_config);
-- 
2.45.2

