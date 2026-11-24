Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB71606A31E
	for <intel-xe@archiver.kernel.org>; Tue, 24 Nov 2026 13:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fUTeJ8ZI
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8D7410E892;
	Tue, 24 Nov 2026 13:32:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10BE210E88B;
 Tue, 24 Nov 2026 13:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795527125; x=1827063125;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/sAvgOInHzZ28edtU0Es4LkDjMfvNV+zuI4iUmGxL1s=;
 b=fUTeJ8ZISshEo8LTL/RqXGiHz7Ll78x5HVKZkoB5XiqWBDfbVTbTqAi5
 bc5FWOrRtobvDYpx+w4UJghaS+u4nsx8i1aN3bm+SlyyeEQbBsARxCJr9
 qAPBMXSv5W6dbJprkI3rexXcuoQ8FTYOsYbIJrajFjmDpFpUiHRwFcbJi
 69obVjOkrsIHB9z3H834eBIdjiFxD53nEIS3dwgvCb2clUJa2/6QMM4qH
 E2SZ5uEFXbidGtJipYUIxvUrA+3qFqtDTDb02f1VHLEU4BMml+KVxr8rJ
 KzVqx+jf5KXw28rmr3LuPa5Wd6fdNIYcGBAkIwovxV5z+QyXwvrNSTFO0 w==;
X-CSE-ConnectionGUID: oe1PP2lqSOWky/xY28rSYw==
X-CSE-MsgGUID: HuEXr+MBQKqdiF/PTlFGSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4423049"
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="4423049"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 05:32:02 -0800
X-CSE-ConnectionGUID: LS/WDyADT6uOMsPzCz9TTg==
X-CSE-MsgGUID: 79r1itkxRg65uV4rLf8llQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; d="scan'208";a="13253196"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.138])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 05:32:01 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH] drm/i915: use local __VLV_DISPLAY_BASE for i915 registers
Date: Tue, 24 Nov 2026 15:31:56 +0200
Message-ID: <20261124133156.1504267-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Avoid including intel_display_reg_defs.h just for VLV_DISPLAY_BASE. It's
not great to have multiple definitions, but for now just break the
dependency.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/i915_reg.h              | 19 ++++++++++---------
 include/drm/intel/intel_gmd_interrupt_regs.h | 14 ++++++++------
 2 files changed, 18 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index 32f8bb39babf..06b3ee0ad1b9 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -26,7 +26,6 @@
 #define _I915_REG_H_
 
 #include "i915_reg_defs.h"
-#include "display/intel_display_reg_defs.h"
 
 /**
  * DOC: The i915 register macro definition style guide
@@ -116,6 +115,8 @@
  *  #define GEN8_BAR                    _MMIO(0xb888)
  */
 
+#define __VLV_DISPLAY_BASE		0x180000
+
 #define GU_CNTL				_MMIO(0x101010)
 #define   LMEM_INIT			REG_BIT(7)
 #define   DRIVERFLR			REG_BIT(31)
@@ -152,7 +153,7 @@
 /*
  * IOSF sideband
  */
-#define VLV_IOSF_DOORBELL_REQ			_MMIO(VLV_DISPLAY_BASE + 0x2100)
+#define VLV_IOSF_DOORBELL_REQ			_MMIO(__VLV_DISPLAY_BASE + 0x2100)
 #define   IOSF_DEVFN_SHIFT			24
 #define   IOSF_OPCODE_SHIFT			16
 #define   IOSF_PORT_SHIFT			8
@@ -174,8 +175,8 @@
 #define   CHV_IOSF_PORT_GPIO_SE			0x48
 #define   CHV_IOSF_PORT_GPIO_E			0xa8
 #define   CHV_IOSF_PORT_GPIO_SW			0xb2
-#define VLV_IOSF_DATA				_MMIO(VLV_DISPLAY_BASE + 0x2104)
-#define VLV_IOSF_ADDR				_MMIO(VLV_DISPLAY_BASE + 0x2108)
+#define VLV_IOSF_DATA				_MMIO(__VLV_DISPLAY_BASE + 0x2104)
+#define VLV_IOSF_ADDR				_MMIO(__VLV_DISPLAY_BASE + 0x2108)
 
 /* DPIO registers */
 #define DPIO_DEVFN			0
@@ -325,8 +326,8 @@
 #define GEN7_MEDIA_MAX_REQ_COUNT	_MMIO(0x4070)
 #define GEN7_GFX_MAX_REQ_COUNT		_MMIO(0x4074)
 
-#define VLV_GU_CTL0	_MMIO(VLV_DISPLAY_BASE + 0x2030)
-#define VLV_GU_CTL1	_MMIO(VLV_DISPLAY_BASE + 0x2034)
+#define VLV_GU_CTL0	_MMIO(__VLV_DISPLAY_BASE + 0x2030)
+#define VLV_GU_CTL1	_MMIO(__VLV_DISPLAY_BASE + 0x2034)
 #define GEN2_IER	_MMIO(0x20a0)
 #define GEN2_IIR	_MMIO(0x20a4)
 #define GEN2_IMR	_MMIO(0x20a8)
@@ -336,10 +337,10 @@
 					      GEN2_IER, \
 					      GEN2_IIR)
 
-#define VLV_GUNIT_CLOCK_GATE	_MMIO(VLV_DISPLAY_BASE + 0x2060)
+#define VLV_GUNIT_CLOCK_GATE	_MMIO(__VLV_DISPLAY_BASE + 0x2060)
 #define   GINT_DIS		(1 << 22)
 #define   GCFG_DIS		(1 << 8)
-#define VLV_GUNIT_CLOCK_GATE2	_MMIO(VLV_DISPLAY_BASE + 0x2064)
+#define VLV_GUNIT_CLOCK_GATE2	_MMIO(__VLV_DISPLAY_BASE + 0x2064)
 
 #define EIR		_MMIO(0x20b0)
 #define EMR		_MMIO(0x20b4)
@@ -608,7 +609,7 @@
 #define VLV_CLK_CTL2			_MMIO(0x101104)
 #define   CLK_CTL2_CZCOUNT_30NS_SHIFT	28
 
-#define VLV_DPFLIPSTAT				_MMIO(VLV_DISPLAY_BASE + 0x70028)
+#define VLV_DPFLIPSTAT				_MMIO(__VLV_DISPLAY_BASE + 0x70028)
 #define   PIPEB_LINE_COMPARE_INT_EN			REG_BIT(29)
 #define   PIPEB_HLINE_INT_EN			REG_BIT(28)
 #define   PIPEB_VBLANK_INT_EN			REG_BIT(27)
diff --git a/include/drm/intel/intel_gmd_interrupt_regs.h b/include/drm/intel/intel_gmd_interrupt_regs.h
index 0d85ec907396..fcfd8bc093b8 100644
--- a/include/drm/intel/intel_gmd_interrupt_regs.h
+++ b/include/drm/intel/intel_gmd_interrupt_regs.h
@@ -4,6 +4,8 @@
 #ifndef _INTEL_GMD_INTERRUPT_REGS_H_
 #define _INTEL_GMD_INTERRUPT_REGS_H_
 
+#define __VLV_DISPLAY_BASE		0x180000
+
 #define I915_PM_INTERRUPT				(1 << 31)
 #define I915_ISP_INTERRUPT				(1 << 22)
 #define I915_LPE_PIPE_B_INTERRUPT			(1 << 21)
@@ -62,12 +64,12 @@
 #define  SCPD_FBC_IGNORE_3D			(1 << 6)
 #define  CSTATE_RENDER_CLOCK_GATE_DISABLE	(1 << 5)
 
-#define VLV_IIR_RW	_MMIO(VLV_DISPLAY_BASE + 0x2084)
-#define VLV_IER		_MMIO(VLV_DISPLAY_BASE + 0x20a0)
-#define VLV_IIR		_MMIO(VLV_DISPLAY_BASE + 0x20a4)
-#define VLV_IMR		_MMIO(VLV_DISPLAY_BASE + 0x20a8)
-#define VLV_ISR		_MMIO(VLV_DISPLAY_BASE + 0x20ac)
-#define VLV_PCBR	_MMIO(VLV_DISPLAY_BASE + 0x2120)
+#define VLV_IIR_RW	_MMIO(__VLV_DISPLAY_BASE + 0x2084)
+#define VLV_IER		_MMIO(__VLV_DISPLAY_BASE + 0x20a0)
+#define VLV_IIR		_MMIO(__VLV_DISPLAY_BASE + 0x20a4)
+#define VLV_IMR		_MMIO(__VLV_DISPLAY_BASE + 0x20a8)
+#define VLV_ISR		_MMIO(__VLV_DISPLAY_BASE + 0x20ac)
+#define VLV_PCBR	_MMIO(__VLV_DISPLAY_BASE + 0x2120)
 #define VLV_PCBR_ADDR_SHIFT	12
 
 #endif
-- 
2.47.3

