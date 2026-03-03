Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1838EC143C
	for <intel-xe@archiver.kernel.org>; Tue,  3 Mar 2026 12:54:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51BAB10E7F3;
	Tue,  3 Mar 2026 12:54:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XaRZj+J6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E6A410E7F1;
 Tue,  3 Mar 2026 12:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772542469; x=1804078469;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3b3P1T/Y4vDyVuyNHgJGmaERiDYq0CEjgJ+mNM5MDCY=;
 b=XaRZj+J6g7GVPUCintc/wX8E/iJAxc3AJDK6Ir2zQT4QbkhlxvPcbB7y
 7L3vQLMuNQKLWcrqNrgWKqWC5N9aAAiskRxFFAgu3NcPRP64AOhGoGi4G
 hHlDsAlX8ypo0tZHolQRUv3m8QVcFJ1GQcIKUKnqha8uNqtxz164jgPi1
 B1LY7PcZVNG1bxnLFadvBa/Gd4L8cKm5VDRUaB7Et/27G2HaB1FzSygv+
 o4UncAUmYngaQeHQQ04It04JWpoMVVMWNujEd5038w+Bg33vfHuGRW+sA
 SCP13O8VaZlw81wnKkBCKmTXFahSkMyhp+Xw4q/9b4V0CKY22h/DiM9Mv Q==;
X-CSE-ConnectionGUID: GMfkMFMRTTy6AqTiltyZrg==
X-CSE-MsgGUID: cG+sMpVSSSauralE/hvmag==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="77421870"
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="77421870"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 04:54:29 -0800
X-CSE-ConnectionGUID: LA/16VF6S5yH4VnsP3fXZw==
X-CSE-MsgGUID: deMKW2pMSJmIOph7YTUjnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="222651984"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO
 jhogande-mobl3.intel.com) ([10.245.245.74])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 04:54:26 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 stable@vger.kernel.org
Subject: [PATCH v2 4/4] drm/i915/psr: Write DSC parameters on Selective Update
 in ET mode
Date: Tue,  3 Mar 2026 14:54:09 +0200
Message-ID: <20260303125409.503148-5-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260303125409.503148-1-jouni.hogander@intel.com>
References: <20260303125409.503148-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

There are slice row per frame and pic height parameters in DSC that needs
to be configured on every Selective Update in Early Transport mode. Use
helper provided by DSC code to configure these on Selective Update when in
Early Transport mode. Also fill crtc_state->psr2_su_area with full frame
area on full frame update for DSC calculation.

Bspec: 68927, 71709
Fixes: 467e4e061c44 ("drm/i915/psr: Enable psr2 early transport as possible")
Cc: <stable@vger.kernel.org> # v6.9+
Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_psr.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index 7b197e84e77d..adcfd3dd8f20 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -2618,6 +2618,12 @@ void intel_psr2_program_trans_man_trk_ctl(struct intel_dsb *dsb,
 
 	intel_de_write_dsb(display, dsb, PIPE_SRCSZ_ERLY_TPT(crtc->pipe),
 			   crtc_state->pipe_srcsz_early_tpt);
+
+	if (!crtc_state->dsc.compression_enable)
+		return;
+
+	intel_dsc_su_et_parameters_configure(dsb, encoder, crtc_state,
+					     drm_rect_height(&crtc_state->psr2_su_area));
 }
 
 static void psr2_man_trk_ctl_calc(struct intel_crtc_state *crtc_state,
@@ -2945,8 +2951,11 @@ int intel_psr2_sel_fetch_update(struct intel_atomic_state *state,
 		full_update = true;
 	}
 
-	if (full_update)
+	if (full_update) {
+		clip_area_update(&crtc_state->psr2_su_area, &crtc_state->pipe_src,
+				 &crtc_state->pipe_src);
 		goto skip_sel_fetch_set_loop;
+	}
 
 	intel_psr_apply_su_area_workarounds(crtc_state);
 
-- 
2.43.0

