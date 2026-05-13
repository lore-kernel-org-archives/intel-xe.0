Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82BEFCD4F3D
	for <intel-xe@archiver.kernel.org>; Wed, 13 May 2026 17:10:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 473C610EFB4;
	Wed, 13 May 2026 17:10:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FpdOHDlL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E73210EFB2;
 Wed, 13 May 2026 17:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778692240; x=1810228240;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tRhl/ygBdeZZsawjmG+OsHATEBQMwcbKryHTISy5/6k=;
 b=FpdOHDlL6QB6ydA6S0PsL8VCaKQVDMb0Zq2uRC2eeF1sUNvRTDRsAfFI
 yP5sh6xjHcGGUpx1cHLoRjzwP9gemRRZ1TK8/57o13hGPMyI8VXkbE95V
 4AjZTE1DsqQfspIM49xrTnAGwUE+cYCFqCdC0mHjQ62aBRW/rVeMvqlZz
 cLuo92Zhxfn8zBxBJ/vwGUXx9a2FbvBoxd6J922qxGYA29ucw1ipW8TTC
 kHkg2eb9mznEJZJzHBFEuXfJsaEV87t2f325l3y8iBajOwSM+jdugQdGj
 vmj6LU3nXRzvDc2vCcFBj3lsaS2C5K2uHs914sNhgWecEftiryytXOYJ5 Q==;
X-CSE-ConnectionGUID: mAT9+IVjRhypXe5BVnVlMA==
X-CSE-MsgGUID: Ctib9+qbT+KS3BKqS/yxng==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="102295329"
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; d="scan'208";a="102295329"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 10:10:39 -0700
X-CSE-ConnectionGUID: Bh/AozvWQXeYLUtvWExXVw==
X-CSE-MsgGUID: 4j3RqtEwTpiRiJaj5nlztQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; d="scan'208";a="238030288"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by orviesa008.jf.intel.com with ESMTP; 13 May 2026 10:10:38 -0700
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: uma.shankar@intel.com, dibin.moolakadan.subrahmanian@intel.com,
 ville.syrjala@linux.intel.com, jani.nikula@intel.com
Subject: [PATCH v6 12/16] drm/i915/cmtg: Add CMTG HWGB programming
Date: Wed, 13 May 2026 22:08:53 +0530
Message-Id: <20260513163857.1541888-13-animesh.manna@intel.com>
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

From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>

Program CMTG guardband to generate the Lower/Upper and early entry
guardband indicators to the DMC for DC3co control.

Signed-off-by: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
---
 drivers/gpu/drm/i915/display/intel_cmtg.c     | 25 +++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_cmtg.h     |  1 +
 .../gpu/drm/i915/display/intel_cmtg_regs.h    |  8 ++++++
 3 files changed, 34 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_cmtg.c b/drivers/gpu/drm/i915/display/intel_cmtg.c
index f069b8b46b9f..cd3b2d093017 100644
--- a/drivers/gpu/drm/i915/display/intel_cmtg.c
+++ b/drivers/gpu/drm/i915/display/intel_cmtg.c
@@ -448,3 +448,28 @@ void intel_cmtg_disable_interrupt(const struct intel_crtc_state *crtc_state)
 	intel_cmtg_mask_interrupt(crtc_state, true);
 	spin_unlock_irq(&display->irq.lock);
 }
+
+void intel_cmtg_set_hwgb(const struct intel_crtc_state *crtc_state)
+{
+	struct intel_display *display = to_intel_display(crtc_state);
+	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
+	u32 breakeven_gb;
+	u32 dc5_exit_latency;
+	u32 line_time_us = 75;
+	u32 val;
+
+	if (crtc_state->linetime)
+		line_time_us = DIV_ROUND_UP(crtc_state->linetime, 8);
+
+	/* Break Even Guardband - DC3co Entry Latency / linetime )*/
+	breakeven_gb = DIV_ROUND_UP(55, line_time_us);
+
+	/* DC5 Exit Latency - DC3co Exit Latency / linetime ) */
+	dc5_exit_latency = DIV_ROUND_UP(40, line_time_us);
+
+	val = REG_FIELD_PREP(CMTG_HW_GB_BREAKEVEN_MASK, breakeven_gb) |
+	REG_FIELD_PREP(CMTG_HW_GB_DC5_EXIT_LATENCY_MASK, dc5_exit_latency) |
+	REG_FIELD_PREP(CMTG_HW_GB_UP_LW_BG_DIFF_MASK, 1);
+
+	intel_de_write(display, CMTG_HW_GB(cpu_transcoder), val);
+}
diff --git a/drivers/gpu/drm/i915/display/intel_cmtg.h b/drivers/gpu/drm/i915/display/intel_cmtg.h
index 8fcb44d6398f..2c801a74acf9 100644
--- a/drivers/gpu/drm/i915/display/intel_cmtg.h
+++ b/drivers/gpu/drm/i915/display/intel_cmtg.h
@@ -23,5 +23,6 @@ void intel_cmtg_sanitize(struct intel_display *display);
 bool intel_cmtg_is_allowed(const struct intel_crtc_state *crtc_state);
 void intel_cmtg_enable_interrupt(const struct intel_crtc_state *crtc_state);
 void intel_cmtg_disable_interrupt(const struct intel_crtc_state *crtc_state);
+void intel_cmtg_set_hwgb(const struct intel_crtc_state *crtc_state);
 
 #endif /* __INTEL_CMTG_H__ */
diff --git a/drivers/gpu/drm/i915/display/intel_cmtg_regs.h b/drivers/gpu/drm/i915/display/intel_cmtg_regs.h
index 240a02cd4a3a..6404f763bd52 100644
--- a/drivers/gpu/drm/i915/display/intel_cmtg_regs.h
+++ b/drivers/gpu/drm/i915/display/intel_cmtg_regs.h
@@ -24,4 +24,12 @@
 #define  CMTG_SYNC_TO_PORT		REG_BIT(29)
 #define  CMTG_STATE			REG_BIT(23)
 
+#define _CMTG_HW_GB_A				0x6FA8C
+#define _CMTG_HW_GB_B				0x6FB8C
+#define CMTG_HW_GB(trans)			_MMIO_TRANS((trans), \
+							    _CMTG_HW_GB_A, _CMTG_HW_GB_B)
+#define CMTG_HW_GB_BREAKEVEN_MASK		REG_GENMASK(11, 0)
+#define CMTG_HW_GB_DC5_EXIT_LATENCY_MASK	REG_GENMASK(27, 16)
+#define CMTG_HW_GB_UP_LW_BG_DIFF_MASK		REG_GENMASK(31, 28)
+
 #endif /* __INTEL_CMTG_REGS_H__ */
-- 
2.29.0

