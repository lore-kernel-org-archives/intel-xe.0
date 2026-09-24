Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72F5FC98312
	for <intel-xe@archiver.kernel.org>; Thu, 24 Sep 2026 05:58:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BEA310E8EB;
	Thu, 24 Sep 2026 05:58:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kHA6M6dD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0170610E883;
 Thu, 24 Sep 2026 05:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790229492; x=1821765492;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HlYqs+sVhtcFUKDd+qhR0CpEHEtE60zYUn9i0fVCdb0=;
 b=kHA6M6dDx8XkD7D4pHlZ2Gl+PQ/PJSy/fBYjXcfWwnlx3IbgCsdj2qZi
 WHgOZljhKwCy3tCqUY7ZRxOkAKJEzar8y1M1uQfbcucV+rpYRetJYk2VB
 sXeMie9lQ0RGTexMu8KFFnV2Mjdb0q/449NXlPraLGg4G3IPzAzvWIAFP
 /NjYFov4WffFTdnJlKs8JKPcp6Ibzkm8GHlfQecWJ/WgQlH55sf98xWLT
 p7lbNPVg+O7KCy+/EN3fouo9DVaghPyiYfd0brWADnAimDC5o9fsurNCf
 BnGXe91Sygb+5j4E4qKa3/wl+N/qWRPs/5EgElZ+blgNNTlXW6ih4FxMJ g==;
X-CSE-ConnectionGUID: Y2eVC6NjT3CJouVWAwe5Sg==
X-CSE-MsgGUID: 5cgwFNy1SDCFD5YnSyGykg==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="107375089"
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; d="scan'208";a="107375089"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 22:58:12 -0700
X-CSE-ConnectionGUID: 5Styya+tQ4CzdQyvBhbTvg==
X-CSE-MsgGUID: UGafnq/6SkuFkcBdazLROw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="5170394"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa013.fm.intel.com with ESMTP; 23 Sep 2026 22:58:10 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, dibin.moolakadan.subrahmanian@intel.com,
 animesh.manna@intel.com, Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 1/2] drm/i915/cmtg: Select the right CMTG vblank for DC3co
Date: Thu, 24 Sep 2026 11:27:35 +0530
Message-Id: <20260924055734.2138787-2-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260924055734.2138787-1-suraj.kandpal@intel.com>
References: <20260924055734.2138787-1-suraj.kandpal@intel.com>
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

The DC3co enable state change is double buffered on a CMTG delayed
vblank, and CHICKEN_DCPR_1 bit 5 picks which CMTG that is. We never
programmed it, so CMTG B setups ended up using CMTG A's vblank and only
worked by virtue of the reset value.

Bspec: 75253
Fixes: c588a324183b ("drm/i915/cmtg: Add trigger to enable/disable cmtg")
Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_cmtg.c         | 2 ++
 drivers/gpu/drm/i915/display/intel_display_regs.h | 1 +
 2 files changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_cmtg.c b/drivers/gpu/drm/i915/display/intel_cmtg.c
index 3c0f5b2fb2e7..7db642b2c3f7 100644
--- a/drivers/gpu/drm/i915/display/intel_cmtg.c
+++ b/drivers/gpu/drm/i915/display/intel_cmtg.c
@@ -368,6 +368,8 @@ static void intel_cmtg_enable_ddi(const struct intel_crtc_state *crtc_state)
 	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
 	u32 interrupt_mask = 0;
 
+	intel_de_rmw(display, GEN8_CHICKEN_DCPR_1, DC3CO_CMTG_VBLANK_SELECT,
+		     cpu_transcoder == TRANSCODER_B ? DC3CO_CMTG_VBLANK_SELECT : 0);
 	intel_de_rmw(display, TRANS_DDI_FUNC_CTL2(display, cpu_transcoder), 0, CMTG_SECONDARY_MODE);
 	intel_de_rmw(display, CMTG_SCANLINE_GB1(cpu_transcoder), 0, CMTG_HW_GB_ENABLE);
 	crtc->cmtg.enabled = true;
diff --git a/drivers/gpu/drm/i915/display/intel_display_regs.h b/drivers/gpu/drm/i915/display/intel_display_regs.h
index 8251ec15190b..6ac615087e0f 100644
--- a/drivers/gpu/drm/i915/display/intel_display_regs.h
+++ b/drivers/gpu/drm/i915/display/intel_display_regs.h
@@ -413,6 +413,7 @@
 #define   _LATENCY_REPORTING_REMOVED_PIPE_C	REG_BIT(25)
 #define   _LATENCY_REPORTING_REMOVED_PIPE_B	REG_BIT(24)
 #define   _LATENCY_REPORTING_REMOVED_PIPE_A	REG_BIT(23)
+#define   DC3CO_CMTG_VBLANK_SELECT		REG_BIT(5)
 #define   LATENCY_REPORTING_REMOVED(pipe)	_PICK((pipe), \
 						      _LATENCY_REPORTING_REMOVED_PIPE_A, \
 						      _LATENCY_REPORTING_REMOVED_PIPE_B, \
-- 
2.34.1

