Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67D09CCF2E7
	for <intel-xe@archiver.kernel.org>; Mon, 19 Oct 2026 13:54:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A75810ED65;
	Mon, 19 Oct 2026 13:53:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A51210ED65;
 Mon, 19 Oct 2026 13:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792418034; x=1823954034;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=grUIQH9KdXcoipQhtewfE2TGVMBhPjXcgW3qJ/ng6HU=;
 b=YH2DAzl7+jiJI9O2Savsx3zVerNO5MRCCvF9z4NdjVS1l4zTwNDELPtE
 gjBiwGushR/ONiT6ZtaXAyITamb1JQ4UGSd+eFmJIZPo50QqRkoMJgHCa
 8mXR4v0DhzKrvFJQ61XEQ6Ve+28hOchaAm/Hi/d3TU9dJSdCnl08HuoPp
 mEXjUGmRmdSNZ6erH4rOLR7X6QvTtuHUCJGvo4Kx4BRNPmMLC44tYGDtQ
 l9U3j41ntA3h36fJ0EC8r1BPdFfJQSIJupr7za7mDwfzDMv4K1Xuh0WQS
 4rLdqoQrcqRGp5zw7rSAlGtl8FF2nl7weykOcH/Xo+zC7qsSDAtmfiUWS w==;
X-CSE-ConnectionGUID: af7GLLqfTrm6vcIz/wTiVA==
X-CSE-MsgGUID: 7YciVUyTSuG8946gM6rzqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1204573"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="1204573"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 06:53:53 -0700
X-CSE-ConnectionGUID: 5jxCO82ISbGmFbKM3cn0FQ==
X-CSE-MsgGUID: 2UYLPS2uREaKB2owTkVBvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2641317"
Received: from alekseim-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.34])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 06:53:52 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 11/15] drm/i915/pfit: Check panel fitter source size on GMCH
Date: Mon, 19 Oct 2026 16:53:05 +0300
Message-ID: <20261019135309.23578-12-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261019135309.23578-1-ville.syrjala@linux.intel.com>
References: <20261019135309.23578-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

The GMCH panel fitter is limited to <=2048 pixel wide
sources. Check for that.

There doesn't really seem to be any vertical limit.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_pfit.c | 25 +++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_pfit.c b/drivers/gpu/drm/i915/display/intel_pfit.c
index 5c2e7fdb93cc..d94301c80d57 100644
--- a/drivers/gpu/drm/i915/display/intel_pfit.c
+++ b/drivers/gpu/drm/i915/display/intel_pfit.c
@@ -532,6 +532,27 @@ static void i9xx_scale_fullscreen(struct intel_crtc_state *crtc_state,
 	i9xx_compute_pfit_dst(crtc_state, hscale, vscale);
 }
 
+static int i9xx_pfit_check_src_size(const struct intel_crtc_state *crtc_state)
+{
+	struct intel_display *display = to_intel_display(crtc_state);
+	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
+	int pipe_src_w = drm_rect_width(&crtc_state->pipe_src);
+	int max_src_w;
+
+	/* Not sure there is any vertical limit */
+	max_src_w = 2048;
+
+	if (pipe_src_w > max_src_w) {
+		drm_dbg_kms(display->drm,
+			    "[CRTC:%d:%s] source width %d exceeds pfit max %d\n",
+			    crtc->base.base.id, crtc->base.name,
+			    pipe_src_w, max_src_w);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int i9xx_pfit_check_scaling(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_display *display = to_intel_display(crtc_state);
@@ -678,6 +699,10 @@ static int i9xx_pfit_compute_config(struct intel_crtc_state *crtc_state,
 	if ((pfit_control & PFIT_ENABLE) == 0)
 		return 0;
 
+	ret = i9xx_pfit_check_src_size(crtc_state);
+	if (ret)
+		return ret;
+
 	ret = i9xx_pfit_check_scaling(crtc_state);
 	if (ret)
 		return ret;
-- 
2.55.0

