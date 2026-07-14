Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E1E8C43458
	for <intel-xe@archiver.kernel.org>; Tue, 14 Jul 2026 10:50:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D586E10ECE7;
	Tue, 14 Jul 2026 10:50:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JhaKk4tx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FE7C10ECE7;
 Tue, 14 Jul 2026 10:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784026209; x=1815562209;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/oQ1AF9dyKUIDm4A1s3Go0nU4vAGDAsuKX/Sg396CIs=;
 b=JhaKk4txDU21PpsVivZFqTv5XlL0kD3+WQKJlbdVOlCg/r9UZzong+xJ
 7mQ2nHON3i7ABwWzkBXLcpNnBXhQxswy3O+0w84G2WKKVxmPnoMIrz97U
 bV9i78dJ/tP9RDXa79l9o4elp0dxnhvZ61RA2qL2UH20qoI8ow7pAnlhO
 UAb5rQVa3LKYwrCriU1nHCG9KCCZOYQLVX+myc3YHlc60mvaug8O1KfAL
 GZlwiCsqg4xMg8lZadEnB+1inpDFCGcA4KncOdAK9vfFtC+nxMDPWqnQI
 APXOPA1VWHjyLutPHI50n4MDqOA0NfcGufQlxcrCD5MwFPhsODBbmIN7I g==;
X-CSE-ConnectionGUID: T/c8KNaPRNSCKdW61gmQAw==
X-CSE-MsgGUID: KcIDF8FpRyy83FseVG3Qbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11846"; a="88544452"
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; d="scan'208";a="88544452"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 03:50:09 -0700
X-CSE-ConnectionGUID: MEpYZyIDTROk/ssXsyGsyg==
X-CSE-MsgGUID: yMTfiSj6TiSkGoQXM5o3fQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; d="scan'208";a="260134514"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by orviesa005.jf.intel.com with ESMTP; 14 Jul 2026 03:50:07 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, uma.shankar@intel.com,
 ankit.k.nautiyal@intel.com, chaitanya.kumar.borah@intel.com
Subject: [PATCH v3 5/8] drm/i915/vrr: Move CMRR hw registers to fix refresh
 rate path
Date: Tue, 14 Jul 2026 16:09:34 +0530
Message-ID: <20260714103938.2371448-6-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260714103938.2371448-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20260714103938.2371448-1-mitulkumar.ajitkumar.golani@intel.com>
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

Move CMRR register writes to fix refresh rate register write path
to consolidate with fix refresh rate implementation.

Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
---
 drivers/gpu/drm/i915/display/intel_vrr.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
index 25ce56d48bb1..95c7b0c05ec3 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.c
+++ b/drivers/gpu/drm/i915/display/intel_vrr.c
@@ -337,6 +337,17 @@ void intel_vrr_set_fixed_rr_timings(const struct intel_crtc_state *crtc_state,
 	if (!intel_vrr_possible(crtc_state))
 		return;
 
+	if (crtc_state->vrr.cmrr.enable) {
+		intel_de_write(display, TRANS_CMRR_M_HI(display, transcoder),
+			       upper_32_bits(crtc_state->vrr.cmrr.cmrr_m));
+		intel_de_write(display, TRANS_CMRR_M_LO(display, transcoder),
+			       lower_32_bits(crtc_state->vrr.cmrr.cmrr_m));
+		intel_de_write(display, TRANS_CMRR_N_HI(display, transcoder),
+			       upper_32_bits(crtc_state->vrr.cmrr.cmrr_n));
+		intel_de_write(display, TRANS_CMRR_N_LO(display, transcoder),
+			       lower_32_bits(crtc_state->vrr.cmrr.cmrr_n));
+	}
+
 	intel_de_write(display, TRANS_VRR_VMIN(display, transcoder),
 		       intel_vrr_fixed_rr_hw_vmin(crtc_state) - 1);
 	intel_de_write(display, TRANS_VRR_VMAX(display, transcoder),
@@ -648,17 +659,6 @@ void intel_vrr_set_transcoder_timings(const struct intel_crtc_state *crtc_state)
 		return;
 	}
 
-	if (crtc_state->vrr.cmrr.enable) {
-		intel_de_write(display, TRANS_CMRR_M_HI(display, cpu_transcoder),
-			       upper_32_bits(crtc_state->vrr.cmrr.cmrr_m));
-		intel_de_write(display, TRANS_CMRR_M_LO(display, cpu_transcoder),
-			       lower_32_bits(crtc_state->vrr.cmrr.cmrr_m));
-		intel_de_write(display, TRANS_CMRR_N_HI(display, cpu_transcoder),
-			       upper_32_bits(crtc_state->vrr.cmrr.cmrr_n));
-		intel_de_write(display, TRANS_CMRR_N_LO(display, cpu_transcoder),
-			       lower_32_bits(crtc_state->vrr.cmrr.cmrr_n));
-	}
-
 	intel_vrr_set_fixed_rr_timings(crtc_state, cpu_transcoder);
 	intel_cmtg_set_vrr_timings(crtc_state);
 
-- 
2.48.1

