Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77153CD4F3C
	for <intel-xe@archiver.kernel.org>; Mon, 18 May 2026 04:09:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3678A10E5C5;
	Mon, 18 May 2026 04:09:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EEswyMTd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B179D10E5B2;
 Mon, 18 May 2026 04:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779077388; x=1810613388;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aR1cgnQntVT989E8BAT8tqbqFcYyiHkB17d9I9938zE=;
 b=EEswyMTdCOMbkrNCorVTWFVsQMsGVNQDZj/qNK+3V3+W6iPfd8Gf1drL
 pw6aaEFUiruR54GrM5Cjo5UZl4BZ6RWOfKI84CokHw1/5PjNdvHlxwgvi
 JdTCoamQGE3Ou1Zkgm1mXmSUXz433M5Aq9SqcNuyE//IIStKLz6ov5ES4
 S/hAzanFNMVnyP9opx/eTyy7PBXtHg3qnp9MUjzNyw46LFAp0O5mFt7hR
 yH/39jBrb0xcMeXZCNJ/KEqznMZG7dWH7GFsOAEAseGY08RxGybibjO7j
 bOXzxF2xcGdica4VnbUzuPcxRJlNmQFlPf8hHZxmzrDBty3prNZ7QdfEG Q==;
X-CSE-ConnectionGUID: 6xTqsSIRSa+XXv4fUq/rxA==
X-CSE-MsgGUID: buh+/cIITuGyDEmv+GsWrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11789"; a="97495624"
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; d="scan'208";a="97495624"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2026 21:09:47 -0700
X-CSE-ConnectionGUID: L96Cu5VqTJ27JIveBBUPrQ==
X-CSE-MsgGUID: 2Ja7KqMfSyKBhuYVYVei5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; d="scan'208";a="277403613"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2026 21:09:45 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, jouni.hogander@intel.com,
 animesh.manna@intel.com, Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 08/11] drm/i915/dp: Program AS SDP DB[1:0] for PR with Link off
Date: Mon, 18 May 2026 09:24:58 +0530
Message-ID: <20260518035502.2909359-9-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260518035502.2909359-1-ankit.k.nautiyal@intel.com>
References: <20260518035502.2909359-1-ankit.k.nautiyal@intel.com>
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

For Panel Replay with AUX-less ALPM (link-off PR), the source must send
Adaptive-Sync SDP v2. Program DB[1:0] per DP spec v2.1:
- VRR AVT: 00b (variable VTotal)
- VRR FAVT: 10b/11b (TRR not reached/reached)
- Fixed timing with PR link-off (VRR off): 01b (AS disabled; VTotal fixed)

Also, drop the redundant target_rr assignment.

v2: Fix the else case. (Ville)

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 7f243463bf7b..8d0d04f306a7 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -3211,9 +3211,10 @@ static void intel_dp_compute_as_sdp(struct intel_dp *intel_dp,
 		as_sdp->mode = DP_AS_SDP_FAVT_TRR_REACHED;
 		as_sdp->target_rr = drm_mode_vrefresh(adjusted_mode);
 		as_sdp->target_rr_divider = true;
-	} else {
+	} else if (crtc_state->vrr.enable) {
 		as_sdp->mode = DP_AS_SDP_AVT_DYNAMIC_VTOTAL;
-		as_sdp->target_rr = 0;
+	} else {
+		as_sdp->mode = DP_AS_SDP_AVT_FIXED_VTOTAL;
 	}
 }
 
-- 
2.45.2

