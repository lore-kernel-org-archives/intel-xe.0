Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 200F91073CB9
	for <intel-xe@archiver.kernel.org>; Wed,  8 Apr 2026 13:16:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D26B110E64E;
	Wed,  8 Apr 2026 13:16:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wzgo1Tct";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7E7B10E64A;
 Wed,  8 Apr 2026 13:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775654170; x=1807190170;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ht6I2MAOPeG/gUYbxBjRoL6318lglFsDSdZJymYpbZE=;
 b=Wzgo1Tct+5vG4Q0hxX1Wvvwaa3ITWbpX9TFOcNaW0DJHb4lcq31uPgSy
 gVhoQwYy8cb9Qsp4D7ivyksmhgcxsgiQpIHNULkJWKOdJKNzK7M4uOjdh
 qorZRL27r6uwxBbScEeQFgcsRnZJa1X9uIrj3pxTmF5m3q1WOct3Drxcx
 JGez2nwIkAxA7NdZGjEsZ7WxgfO4oWEFFqBqmSQQrxZl5cN0AXhxfxF+I
 Htf+Qiq4APETH3x76oJkL2wl08Uj8kDkQj3WXxCjcjdHUuWpg2FIgBLnK
 mKEr/Ko7J+Mdhlqqm/5bso5L71cbnrZrUMQLuq4lIOv861u07F6vxKwb5 Q==;
X-CSE-ConnectionGUID: 04ONTSw5ScOvhxyk2hDRIw==
X-CSE-MsgGUID: Z6P8EJcQTueNoKXu/0kmmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="94216446"
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; d="scan'208";a="94216446"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 06:16:09 -0700
X-CSE-ConnectionGUID: Bd8ujEuiTNqYWr6Pu1dxbg==
X-CSE-MsgGUID: ZfItnmFQQVak7tz9tnf/Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; d="scan'208";a="266457382"
Received: from krybak-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.32])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 06:16:08 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com,
	ville.syrjala@linux.intel.com
Subject: [PATCH 2/4] drm/i915/display: add struct intel_irq_regs and use it
Date: Wed,  8 Apr 2026 16:15:49 +0300
Message-ID: <ed3401c39890fd02fb01510fc194f02e2dda4ebc.1775653994.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1775653994.git.jani.nikula@intel.com>
References: <cover.1775653994.git.jani.nikula@intel.com>
MIME-Version: 1.0
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

Add struct intel_irq_regs, a display version of struct i915_irq_regs,
and use it. The goal is to reduce the dependency on i915 core types and
headers.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 .../gpu/drm/i915/display/intel_display_irq.c  |  4 +-
 .../drm/i915/display/intel_display_reg_defs.h | 10 ++++
 .../gpu/drm/i915/display/intel_display_regs.h | 48 +++++++++----------
 3 files changed, 36 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_irq.c b/drivers/gpu/drm/i915/display/intel_display_irq.c
index 365e467dddaf..8b6b4709989e 100644
--- a/drivers/gpu/drm/i915/display/intel_display_irq.c
+++ b/drivers/gpu/drm/i915/display/intel_display_irq.c
@@ -30,7 +30,7 @@
 #include "intel_psr.h"
 #include "intel_psr_regs.h"
 
-static void irq_reset(struct intel_display *display, struct i915_irq_regs regs)
+static void irq_reset(struct intel_display *display, struct intel_irq_regs regs)
 {
 	intel_de_write(display, regs.imr, 0xffffffff);
 	intel_de_posting_read(display, regs.imr);
@@ -63,7 +63,7 @@ static void assert_iir_is_zero(struct intel_display *display, intel_reg_t reg)
 	intel_de_posting_read(display, reg);
 }
 
-static void irq_init(struct intel_display *display, struct i915_irq_regs regs,
+static void irq_init(struct intel_display *display, struct intel_irq_regs regs,
 		     u32 imr_val, u32 ier_val)
 {
 	assert_iir_is_zero(display, regs.iir);
diff --git a/drivers/gpu/drm/i915/display/intel_display_reg_defs.h b/drivers/gpu/drm/i915/display/intel_display_reg_defs.h
index cb46863693cd..d044967aa6d9 100644
--- a/drivers/gpu/drm/i915/display/intel_display_reg_defs.h
+++ b/drivers/gpu/drm/i915/display/intel_display_reg_defs.h
@@ -10,6 +10,16 @@
 
 typedef i915_reg_t intel_reg_t;
 
+/* A triplet for IMR/IER/IIR registers. */
+struct intel_irq_regs {
+	intel_reg_t imr;
+	intel_reg_t ier;
+	intel_reg_t iir;
+};
+
+#define INTEL_IRQ_REGS(_imr, _ier, _iir) \
+	((const struct intel_irq_regs){ .imr = (_imr), .ier = (_ier), .iir = (_iir) })
+
 #define VLV_DISPLAY_BASE		0x180000
 
 /*
diff --git a/drivers/gpu/drm/i915/display/intel_display_regs.h b/drivers/gpu/drm/i915/display/intel_display_regs.h
index dada8dc27ea4..4fc18e5ee239 100644
--- a/drivers/gpu/drm/i915/display/intel_display_regs.h
+++ b/drivers/gpu/drm/i915/display/intel_display_regs.h
@@ -105,9 +105,9 @@
 #define   ERR_INT_FIFO_UNDERRUN_A	(1 << 0)
 #define   ERR_INT_FIFO_UNDERRUN(pipe)	(1 << ((pipe) * 3))
 
-#define VLV_IRQ_REGS		I915_IRQ_REGS(VLV_IMR, \
-					      VLV_IER, \
-					      VLV_IIR)
+#define VLV_IRQ_REGS		INTEL_IRQ_REGS(VLV_IMR, \
+					       VLV_IER, \
+					       VLV_IIR)
 
 #define VLV_EIR		_MMIO(VLV_DISPLAY_BASE + 0x20b0)
 #define VLV_EMR		_MMIO(VLV_DISPLAY_BASE + 0x20b4)
@@ -1116,9 +1116,9 @@
 #define DEIIR   _MMIO(0x44008)
 #define DEIER   _MMIO(0x4400c)
 
-#define DE_IRQ_REGS		I915_IRQ_REGS(DEIMR, \
-					      DEIER, \
-					      DEIIR)
+#define DE_IRQ_REGS		INTEL_IRQ_REGS(DEIMR, \
+					       DEIER, \
+					       DEIIR)
 
 #define DIGITAL_PORT_HOTPLUG_CNTRL	_MMIO(0x44030)
 #define  DIGITAL_PORTA_HOTPLUG_ENABLE		(1 << 4)
@@ -1407,9 +1407,9 @@
 #define  GEN8_PIPE_VSYNC		REG_BIT(1)
 #define  GEN8_PIPE_VBLANK		REG_BIT(0)
 
-#define GEN8_DE_PIPE_IRQ_REGS(pipe)	I915_IRQ_REGS(GEN8_DE_PIPE_IMR(pipe), \
-						      GEN8_DE_PIPE_IER(pipe), \
-						      GEN8_DE_PIPE_IIR(pipe))
+#define GEN8_DE_PIPE_IRQ_REGS(pipe)	INTEL_IRQ_REGS(GEN8_DE_PIPE_IMR(pipe), \
+						       GEN8_DE_PIPE_IER(pipe), \
+						       GEN8_DE_PIPE_IIR(pipe))
 
 #define _HPD_PIN_DDI(hpd_pin)	((hpd_pin) - HPD_PORT_A)
 #define _HPD_PIN_TC(hpd_pin)	((hpd_pin) - HPD_PORT_TC1)
@@ -1446,9 +1446,9 @@
 #define  TGL_DE_PORT_AUX_DDIB		REG_BIT(1)
 #define  TGL_DE_PORT_AUX_DDIA		REG_BIT(0)
 
-#define GEN8_DE_PORT_IRQ_REGS		I915_IRQ_REGS(GEN8_DE_PORT_IMR, \
-						      GEN8_DE_PORT_IER, \
-						      GEN8_DE_PORT_IIR)
+#define GEN8_DE_PORT_IRQ_REGS		INTEL_IRQ_REGS(GEN8_DE_PORT_IMR, \
+						       GEN8_DE_PORT_IER, \
+						       GEN8_DE_PORT_IIR)
 
 /* interrupts */
 #define DE_MASTER_IRQ_CONTROL   (1 << 31)
@@ -1499,9 +1499,9 @@
 #define  XELPDP_PMDEMAND_RSP		REG_BIT(3)
 #define  XE2LPD_DBUF_OVERLAP_DETECTED	REG_BIT(1)
 
-#define GEN8_DE_MISC_IRQ_REGS		I915_IRQ_REGS(GEN8_DE_MISC_IMR, \
-						      GEN8_DE_MISC_IER, \
-						      GEN8_DE_MISC_IIR)
+#define GEN8_DE_MISC_IRQ_REGS		INTEL_IRQ_REGS(GEN8_DE_MISC_IMR, \
+						       GEN8_DE_MISC_IER, \
+						       GEN8_DE_MISC_IIR)
 
 #define GEN11_DISPLAY_INT_CTL		_MMIO(0x44200)
 #define  GEN11_DISPLAY_IRQ_ENABLE	(1 << 31)
@@ -1533,9 +1533,9 @@
 						 GEN11_TBT_HOTPLUG(HPD_PORT_TC2) | \
 						 GEN11_TBT_HOTPLUG(HPD_PORT_TC1))
 
-#define GEN11_DE_HPD_IRQ_REGS		I915_IRQ_REGS(GEN11_DE_HPD_IMR, \
-						      GEN11_DE_HPD_IER, \
-						      GEN11_DE_HPD_IIR)
+#define GEN11_DE_HPD_IRQ_REGS		INTEL_IRQ_REGS(GEN11_DE_HPD_IMR, \
+						       GEN11_DE_HPD_IER, \
+						       GEN11_DE_HPD_IIR)
 
 #define GEN11_TBT_HOTPLUG_CTL				_MMIO(0x44030)
 #define GEN11_TC_HOTPLUG_CTL				_MMIO(0x44038)
@@ -1557,9 +1557,9 @@
 #define  XELPDP_TBT_HOTPLUG(hpd_pin)		REG_BIT(_HPD_PIN_TC(hpd_pin))
 #define  XELPDP_TBT_HOTPLUG_MASK		REG_GENMASK(3, 0)
 
-#define PICAINTERRUPT_IRQ_REGS			I915_IRQ_REGS(PICAINTERRUPT_IMR, \
-							      PICAINTERRUPT_IER, \
-							      PICAINTERRUPT_IIR)
+#define PICAINTERRUPT_IRQ_REGS			INTEL_IRQ_REGS(PICAINTERRUPT_IMR, \
+							       PICAINTERRUPT_IER, \
+							       PICAINTERRUPT_IIR)
 
 #define XELPDP_PORT_HOTPLUG_CTL(hpd_pin)	_MMIO(0x16F270 + (_HPD_PIN_TC(hpd_pin) * 0x200))
 #define  XELPDP_TBT_HOTPLUG_ENABLE		REG_BIT(6)
@@ -1875,9 +1875,9 @@
 #define SDEIIR  _MMIO(0xc4008)
 #define SDEIER  _MMIO(0xc400c)
 
-#define SDE_IRQ_REGS			I915_IRQ_REGS(SDEIMR, \
-						      SDEIER, \
-						      SDEIIR)
+#define SDE_IRQ_REGS			INTEL_IRQ_REGS(SDEIMR, \
+						       SDEIER, \
+						       SDEIIR)
 
 #define SERR_INT			_MMIO(0xc4040)
 #define  SERR_INT_POISON		(1 << 31)
-- 
2.47.3

