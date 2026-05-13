Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F75ECD4F3D
	for <intel-xe@archiver.kernel.org>; Wed, 13 May 2026 17:10:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B29710EF9C;
	Wed, 13 May 2026 17:10:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZRMiA75Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32D9F10EFA9;
 Wed, 13 May 2026 17:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778692222; x=1810228222;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mVXStHg3zWrNcRBh867j9O9+2N1HlPFcHKUP/wNWhjs=;
 b=ZRMiA75YKJZkwMi89NqKjdmZ+aTBOAYxhkYFRGdSIOOFm3pc7/uLBD0o
 VK1GQ/oiTewbLmAnZkevsmyN91LkgY6e+KuLPworhmfE7D6XJkYNP09tg
 Jit1L1jgkeXWbTvxLvVZlVkXKDm73AVF48mCCvqo7iutd/CxgOdCakmlQ
 mKp/4uurspGwJ0cmJJtSLuRMF1ax7UR2+QpFKvt5w8RTCKCuxvxSmi3UU
 1y9ghSdjZ3Pi3tAfBntgY3HI9zlDl9GNSpZFCS1jeBw+Q8MNuZqBrxRfa
 xf4anM9SXeyKt5nrn/4u2dFpf7fSv9cYeLjGlFiyw710wBYCcX+WRxgEf g==;
X-CSE-ConnectionGUID: KO69rmvHS/mysl56HtRdkQ==
X-CSE-MsgGUID: ZfvseR6XTl64oM3LEqm/eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="102295315"
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; d="scan'208";a="102295315"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 10:10:22 -0700
X-CSE-ConnectionGUID: GENAmu20TRuZ/8OKE9rcxA==
X-CSE-MsgGUID: ejIJxN0sQAqvrJSw6zK5tA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; d="scan'208";a="238030229"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by orviesa008.jf.intel.com with ESMTP; 13 May 2026 10:10:20 -0700
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: uma.shankar@intel.com, dibin.moolakadan.subrahmanian@intel.com,
 ville.syrjala@linux.intel.com, jani.nikula@intel.com,
 Animesh Manna <animesh.manna@intel.com>
Subject: [PATCH v6 06/16] drm/i915/cmtg: Set transcoder mn for CMTG
Date: Wed, 13 May 2026 22:08:47 +0530
Message-Id: <20260513163857.1541888-7-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20260513163857.1541888-1-animesh.manna@intel.com>
References: <20260513163857.1541888-1-animesh.manna@intel.com>
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

Program CMTG link M/N.

Reviewed-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 drivers/gpu/drm/i915/display/intel_cmtg.c    | 13 +++++++++++++
 drivers/gpu/drm/i915/display/intel_cmtg.h    |  1 +
 drivers/gpu/drm/i915/display/intel_display.c |  1 +
 3 files changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_cmtg.c b/drivers/gpu/drm/i915/display/intel_cmtg.c
index 0a2d838319f9..d490c57ba8b7 100644
--- a/drivers/gpu/drm/i915/display/intel_cmtg.c
+++ b/drivers/gpu/drm/i915/display/intel_cmtg.c
@@ -326,3 +326,16 @@ void intel_cmtg_set_vrr_ctl(const struct intel_crtc_state *crtc_state)
 
 	intel_de_write(display, TRANS_VRR_CTL(display, cmtg_transcoder), vrr_ctl);
 }
+
+void intel_cmtg_set_m_n(const struct intel_crtc_state *crtc_state)
+{
+	struct intel_display *display = to_intel_display(crtc_state);
+	enum transcoder cmtg_transcoder = to_cmtg_transcoder(crtc_state->cpu_transcoder);
+	const struct intel_link_m_n *m_n = &crtc_state->dp_m_n;
+
+	if (!intel_cmtg_is_allowed(crtc_state))
+		return;
+
+	intel_de_write(display, PIPE_DATA_M1(display, cmtg_transcoder), m_n->link_m);
+	intel_de_write(display, PIPE_DATA_N1(display, cmtg_transcoder), m_n->link_n);
+}
diff --git a/drivers/gpu/drm/i915/display/intel_cmtg.h b/drivers/gpu/drm/i915/display/intel_cmtg.h
index c92e3a62ff0d..6796eb727eef 100644
--- a/drivers/gpu/drm/i915/display/intel_cmtg.h
+++ b/drivers/gpu/drm/i915/display/intel_cmtg.h
@@ -11,6 +11,7 @@
 struct intel_display;
 struct intel_crtc_state;
 
+void intel_cmtg_set_m_n(const struct intel_crtc_state *crtc_state);
 void intel_cmtg_set_vrr_timings(const struct intel_crtc_state *crtc_state);
 void intel_cmtg_set_vrr_ctl(const struct intel_crtc_state *crtc_state);
 void intel_cmtg_set_timings(const struct intel_crtc_state *crtc_state, bool lrr);
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 701cb4f9d70d..dd53049898ea 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -1615,6 +1615,7 @@ static void hsw_configure_cpu_transcoder(const struct intel_crtc_state *crtc_sta
 					       &crtc_state->dp_m2_n2);
 	}
 
+	intel_cmtg_set_m_n(crtc_state);
 	intel_set_transcoder_timings(crtc_state);
 
 	if (cpu_transcoder != TRANSCODER_EDP)
-- 
2.29.0

