Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 386A6CD98EE
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jun 2026 16:23:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E559910ECCA;
	Tue, 16 Jun 2026 16:23:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MDktNPqB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7DD210ECC7;
 Tue, 16 Jun 2026 16:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781627011; x=1813163011;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NB3WQUet3X+mh5mP+5jZAfT8Td0seTZu1G6HX+tr5V0=;
 b=MDktNPqBk+neaZSNq1HtElc/GOjLjsd8ex1W1RedV/NltgQ5Np6NSTQM
 dWXBuzfY5li/pg4NxCyfOGIzoH6ptCDMhs0q5NuY/Q4PP3Nm/MHCLnf+z
 liPvxysYszyDoJuADPHEfcj47wTlWeEsZ5JLhEC1GVKOZ3ScQriG5/opd
 DOf1IBtd2W7gAb2QVzwvmOeZhW5IWyq0z6ViyM+vu96pPjG6fnXxlOPmW
 y7UmBg8vR3iYEeNXOx9TjL/GEZrEWvDBsxTA4UmXvk3iXLKkAc7v4EF1+
 Gzn6Q0D/lcAFxrMLJwPt+8Tk/Of2Hh+NHqjGYerMCu7x86HHdBzsjzy36 Q==;
X-CSE-ConnectionGUID: ARzVcEjTSpGyuc/slg3jxw==
X-CSE-MsgGUID: mgByy0yrStmIf3umGipHUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="93781333"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="93781333"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 09:23:31 -0700
X-CSE-ConnectionGUID: 5QtvBJe9SF+Oujb/jDz6Yw==
X-CSE-MsgGUID: w0YG9eKHTfGvKgejkh9qFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="247693546"
Received: from dibin-nuc7i7bnh.iind.intel.com ([10.190.239.19])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 09:23:30 -0700
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: uma.shankar@intel.com, animesh.manna@intel.com, jani.nikula@linux.intel.com
Subject: [PATCH v6 13/16] drm/i915/display: Add helper to enable DC counter
Date: Tue, 16 Jun 2026 21:51:51 +0530
Message-ID: <20260616162154.2630995-14-dibin.moolakadan.subrahmanian@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260616162154.2630995-1-dibin.moolakadan.subrahmanian@intel.com>
References: <20260616162154.2630995-1-dibin.moolakadan.subrahmanian@intel.com>
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

Add xe3lpd_enable_dc_count() to enable the DC_COUNT_EN register.
Also define DC_STATE_DC3CO_RESIDENCY to read DC3CO residency.
Needed to retrieve DC residency for DC3CO.

Signed-off-by: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_power_well.c | 5 +++++
 drivers/gpu/drm/i915/display/intel_display_power_well.h | 1 +
 drivers/gpu/drm/i915/display/intel_display_regs.h       | 5 +++++
 drivers/gpu/drm/i915/display/intel_dmc.c                | 3 +++
 4 files changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display_power_well.c b/drivers/gpu/drm/i915/display/intel_display_power_well.c
index 9c8ea14a5cff..4f7144d72dc6 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power_well.c
+++ b/drivers/gpu/drm/i915/display/intel_display_power_well.c
@@ -866,6 +866,11 @@ void gen9_set_dc_state(struct intel_display *display, u32 state)
 	power_domains->dc_state = val & mask;
 }
 
+void xe3lpd_enable_dc_count(struct intel_display *display)
+{
+	intel_de_write(display, DC_COUNT_EN, DC_COUNT_EN_COUNTER_ENABLE);
+}
+
 static void assert_can_enable_dc3co(struct intel_display *display)
 {
 	drm_WARN_ONCE(display->drm,
diff --git a/drivers/gpu/drm/i915/display/intel_display_power_well.h b/drivers/gpu/drm/i915/display/intel_display_power_well.h
index 8f5524da2d06..0ce64b894436 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power_well.h
+++ b/drivers/gpu/drm/i915/display/intel_display_power_well.h
@@ -159,6 +159,7 @@ void gen9_set_dc_state(struct intel_display *display, u32 state);
 void gen9_disable_dc_states(struct intel_display *display);
 void bxt_enable_dc9(struct intel_display *display);
 void bxt_disable_dc9(struct intel_display *display);
+void xe3lpd_enable_dc_count(struct intel_display *display);
 
 extern const struct i915_power_well_ops i9xx_always_on_power_well_ops;
 extern const struct i915_power_well_ops chv_pipe_power_well_ops;
diff --git a/drivers/gpu/drm/i915/display/intel_display_regs.h b/drivers/gpu/drm/i915/display/intel_display_regs.h
index 2255d9d31ca4..329909e3f70a 100644
--- a/drivers/gpu/drm/i915/display/intel_display_regs.h
+++ b/drivers/gpu/drm/i915/display/intel_display_regs.h
@@ -3086,6 +3086,11 @@ enum skl_power_gate {
 #define  DC_STATE_DEBUG_MASK_CORES	(1 << 0)
 #define  DC_STATE_DEBUG_MASK_MEMORY_UP	(1 << 1)
 
+#define DC_COUNT_EN			_MMIO(0x457B4)
+#define DC_COUNT_EN_COUNTER_ENABLE	REG_BIT(31)
+
+#define DC_STATE_DC3CO_RESIDENCY	_MMIO(0x457B8)
+
 #define D_COMP_BDW			_MMIO(0x138144)
 
 /* Pipe WM_LINETIME - watermark line time */
diff --git a/drivers/gpu/drm/i915/display/intel_dmc.c b/drivers/gpu/drm/i915/display/intel_dmc.c
index 4785001644f5..a133785c815b 100644
--- a/drivers/gpu/drm/i915/display/intel_dmc.c
+++ b/drivers/gpu/drm/i915/display/intel_dmc.c
@@ -941,6 +941,9 @@ void intel_dmc_load_program(struct intel_display *display)
 
 	gen9_set_dc_state_debugmask(display);
 
+	if (DISPLAY_VER(display) >= 35)
+		xe3lpd_enable_dc_count(display);
+
 	pipedmc_clock_gating_wa(display, false);
 }
 
-- 
2.43.0

