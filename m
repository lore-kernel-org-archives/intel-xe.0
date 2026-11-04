Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33655606A84C
	for <intel-xe@archiver.kernel.org>; Wed,  4 Nov 2026 22:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HOC0siHG
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC89310FF7B;
	Wed,  4 Nov 2026 22:19:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75B3310FF5A;
 Wed,  4 Nov 2026 22:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793830747; x=1825366747;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NS8ek/Ompv3O9W2Du7TsogHY+kD3ttURPNXn8WRryo8=;
 b=HOC0siHGAevqnY8p2tCdKCFSAkSDqBnpaEjJfLHW9OQJdjP62Nm73J5r
 LG4CTf2M/BgbeKxOfLs1u0iVmC8L4qmjY5i6THDIsOweVRawdLGHNKqJ/
 QdhefDG5DP3/NjkxDqzarNqR3vrNV6GFhJUpXU4jZ8u7UJA74p4IDj/SI
 H1V0HxpHEtw4+N8y2FQuS6KoeRok1Uod6YGphX1ukwQqgl1NbuDqKP9Wz
 kXG4ZUoA3e8GcFKBW4w/LFuVtYl01huvcSXhbaONRq1XX0nh5PatlwOyO
 bYM1CNfi7YukEh32ocLFlzjYwbjCADJG+G+S2XArFBuQKe06GC8J5O20D w==;
X-CSE-ConnectionGUID: mCK4wIh1R5a0x1V6KmLb+g==
X-CSE-MsgGUID: hQy2/4rmRve3mFysLluTgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2510039"
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="2510039"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2026 14:19:06 -0800
X-CSE-ConnectionGUID: ilPqzbnSRMCVIRPEc3iQFg==
X-CSE-MsgGUID: krxllux0QNqVAwYi2kjO2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="6994076"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.86])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2026 14:19:04 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 4/9] drm/i915/de: Eliminate runtime overhead from DMC wakelock
 on pre-LNL platforms
Date: Thu,  5 Nov 2026 00:18:37 +0200
Message-ID: <20261104221842.18799-5-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104221842.18799-1-ville.syrjala@linux.intel.com>
References: <20261104221842.18799-1-ville.syrjala@linux.intel.com>
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
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Now that we have the mmio read/write vfuncs we can get rid of
any runtime overhead from the DMC wakelock checks for the
platforms that don't support wakelock (pre-LNL).

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_de.c | 50 ++++++++++++++++++++++++-
 drivers/gpu/drm/i915/display/intel_de.h | 15 +-------
 2 files changed, 50 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_de.c b/drivers/gpu/drm/i915/display/intel_de.c
index cde2886fe2ca..66de0d6be569 100644
--- a/drivers/gpu/drm/i915/display/intel_de.c
+++ b/drivers/gpu/drm/i915/display/intel_de.c
@@ -163,14 +163,36 @@ u16 intel_de_read16(struct intel_display *display, intel_reg_t reg)
 	return intel_uncore_read16(__to_uncore(display), reg);
 }
 
+#define __MMIO_WAKELOCK		BIT(0)
+
+static __always_inline void
+__mmio_wakelock_pre(struct intel_display *display, intel_reg_t reg,
+		    const unsigned int mmio_flags)
+{
+	if (mmio_flags & __MMIO_WAKELOCK)
+		intel_dmc_wl_get(display, reg);
+}
+
+static __always_inline void
+__mmio_wakelock_post(struct intel_display *display, intel_reg_t reg,
+		     const unsigned int mmio_flags)
+{
+	if (mmio_flags & __MMIO_WAKELOCK)
+		intel_dmc_wl_put(display, reg);
+}
+
 static __always_inline u32
 __intel_de_read(struct intel_display *display, intel_reg_t reg,
 		const unsigned int mmio_flags)
 {
 	u32 val;
 
+	__mmio_wakelock_pre(display, reg, mmio_flags);
+
 	val = intel_uncore_read(__to_uncore(display), reg);
 
+	__mmio_wakelock_post(display, reg, mmio_flags);
+
 	return val;
 }
 
@@ -178,7 +200,11 @@ static __always_inline void
 __intel_de_write(struct intel_display *display, intel_reg_t reg, u32 val,
 		 const unsigned int mmio_flags)
 {
+	__mmio_wakelock_pre(display, reg, mmio_flags);
+
 	intel_uncore_write(__to_uncore(display), reg, val);
+
+	__mmio_wakelock_post(display, reg, mmio_flags);
 }
 
 #define I9XX_MMIO_FLAGS 0
@@ -200,9 +226,31 @@ static const struct intel_mmio_funcs i9xx_mmio_funcs = {
 	.write = i9xx_mmio_write,
 };
 
+#define LNL_MMIO_FLAGS __MMIO_WAKELOCK
+
+static u32 lnl_mmio_read(struct intel_display *display, intel_reg_t reg)
+{
+	return __intel_de_read(display, reg, LNL_MMIO_FLAGS);
+}
+
+static void lnl_mmio_write(struct intel_display *display, intel_reg_t reg, u32 val)
+{
+	__intel_de_write(display, reg, val, LNL_MMIO_FLAGS);
+}
+
+#undef LNL_MMIO_FLAGS
+
+static const struct intel_mmio_funcs lnl_mmio_funcs = {
+	.read = lnl_mmio_read,
+	.write = lnl_mmio_write,
+};
+
 void intel_de_init(struct intel_display *display)
 {
 	display->mmio.uncore = to_intel_uncore(display->drm);
 
-	display->mmio.funcs = &i9xx_mmio_funcs;
+	if (DISPLAY_VER(display) >= 20)
+		display->mmio.funcs = &lnl_mmio_funcs;
+	else
+		display->mmio.funcs = &i9xx_mmio_funcs;
 }
diff --git a/drivers/gpu/drm/i915/display/intel_de.h b/drivers/gpu/drm/i915/display/intel_de.h
index 63aef17e6ed3..760b8bc31f9b 100644
--- a/drivers/gpu/drm/i915/display/intel_de.h
+++ b/drivers/gpu/drm/i915/display/intel_de.h
@@ -7,7 +7,6 @@
 #define __INTEL_DE_H__
 
 #include "intel_display_core.h"
-#include "intel_dmc_wl.h"
 #include "intel_dsb.h"
 #include "intel_uncore.h"
 #include "intel_uncore_trace.h"
@@ -31,15 +30,7 @@ u16 intel_de_read16(struct intel_display *display, intel_reg_t reg);
 static inline u32
 intel_de_read(struct intel_display *display, intel_reg_t reg)
 {
-	u32 val;
-
-	intel_dmc_wl_get(display, reg);
-
-	val = display->mmio.funcs->read(display, reg);
-
-	intel_dmc_wl_put(display, reg);
-
-	return val;
+	return display->mmio.funcs->read(display, reg);
 }
 
 static inline u64
@@ -63,11 +54,7 @@ intel_de_posting_read(struct intel_display *display, intel_reg_t reg)
 static inline void
 intel_de_write(struct intel_display *display, intel_reg_t reg, u32 val)
 {
-	intel_dmc_wl_get(display, reg);
-
 	display->mmio.funcs->write(display, reg, val);
-
-	intel_dmc_wl_put(display, reg);
 }
 
 static inline u32
-- 
2.56.0

