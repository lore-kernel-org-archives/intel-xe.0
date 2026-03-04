Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E53F1EB7ED4
	for <intel-xe@archiver.kernel.org>; Wed,  4 Mar 2026 11:30:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C23810E9C0;
	Wed,  4 Mar 2026 11:30:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xbd7T/5z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A87EA10E9BE;
 Wed,  4 Mar 2026 11:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772623833; x=1804159833;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ModowaH3ddRUzOoFqaUSGFP8KUU5Romr5ZtcgfL4wxo=;
 b=Xbd7T/5z55FqUVVDc+h2VR7QraIWB8N5jRMSMQaC8/zgM4YH/Godatew
 /L7Km0Zpo75EOtE6EPcc1Kvw0JqekTJ2vgvgCNML/8WekcekH2uZQVqaA
 vRTl+3B8OESXcBd3cwY79ynncbkFD7um1fHKtaEveeTFbkqA+Jd39lOh2
 XZxPnZX7pf7NBr6PvhgYkSVXjj13xdOGM8knTu2jMeUD9USv3DmkOuqcL
 ju+XBNoqZ13U1jgDxVVAPCovhar3WAokf7fkxnw6tE621G1Fq2IS6WSVK
 01u3GcsxgVYClw/lPROllybUg0y0pRULNjFXoPYnYeneSXs6BKdq0bjbq Q==;
X-CSE-ConnectionGUID: SPcuNP/9Rw6+X1nFFkHVBw==
X-CSE-MsgGUID: XVg0JiC/T6eXWwu+TveDLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="91255327"
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; d="scan'208";a="91255327"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 03:30:33 -0800
X-CSE-ConnectionGUID: xT7YHw3FRj+IelrDWjc+6A==
X-CSE-MsgGUID: 2qvPnDsqTjeNiKwvLHzd7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; d="scan'208";a="248790026"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO
 jhogande-mobl3.intel.com) ([10.245.245.129])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 03:30:31 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 stable@vger.kernel.org
Subject: [PATCH v3 4/4] drm/i915/psr: Write DSC parameters on Selective Update
 in ET mode
Date: Wed,  4 Mar 2026 13:30:11 +0200
Message-ID: <20260304113011.626542-5-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260304113011.626542-1-jouni.hogander@intel.com>
References: <20260304113011.626542-1-jouni.hogander@intel.com>
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

v2: move psr2_su_area under skip_sel_fetch_set_loop label

Bspec: 68927, 71709
Fixes: 467e4e061c44 ("drm/i915/psr: Enable psr2 early transport as possible")
Cc: <stable@vger.kernel.org> # v6.9+
Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_psr.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index 7b197e84e77d..cb3df2611515 100644
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
@@ -3039,6 +3045,10 @@ int intel_psr2_sel_fetch_update(struct intel_atomic_state *state,
 	}
 
 skip_sel_fetch_set_loop:
+	if (full_update)
+		clip_area_update(&crtc_state->psr2_su_area, &crtc_state->pipe_src,
+				 &crtc_state->pipe_src);
+
 	psr2_man_trk_ctl_calc(crtc_state, full_update);
 	crtc_state->pipe_srcsz_early_tpt =
 		psr2_pipe_srcsz_early_tpt_calc(crtc_state, full_update);
-- 
2.43.0

