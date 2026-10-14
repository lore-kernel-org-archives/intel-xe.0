Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6216CC6B1D
	for <intel-xe@archiver.kernel.org>; Wed, 14 Oct 2026 12:06:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 764D210FD33;
	Wed, 14 Oct 2026 12:06:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73E9D10FD33;
 Wed, 14 Oct 2026 12:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791979558; x=1823515558;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/KBU9/Gtq4e+91zqAe9tPtIjMZSt0dv9pQxX5HkSjQs=;
 b=aCOAgXLQkK7erJG8Yv86+KFPX0MbsXVt83gdZqqwodvzKXvoJbh66l+V
 cN2Y4e8A330YV8vdJ8jm5wf+ZSLQzxKMNU8DiHtc/0wbxQYb1XLnQKW4v
 /w7EFD7FuWqdMo5yKhb6jcba9AnYTirT4KaXPrY7LIOOMS3IUyEM1NjeD
 HTN7yA2odTg9HapCgHUCDrg1fzvHUwTSqLO372J0RI2tQDiZdnJdg3+ck
 c9SbNmlma6o3kn3ZoSdT0mQwyWXE75DlgC5fkTrqGcVpyO+I+XORNEEMo
 /lrQOT5RkNpCZgLUeoDbO/nXUqN6gtqqazlTvFjsUNFXVnovvAIVrV06q w==;
X-CSE-ConnectionGUID: B3YbmT/WQNKsmJwBQlvdKg==
X-CSE-MsgGUID: NCyAEqJSTHeMfStss0fwVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="739798"
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="739798"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 05:05:58 -0700
X-CSE-ConnectionGUID: t+Bp33hTQ6inhLXtEHfO3g==
X-CSE-MsgGUID: ZVCp7JKxQ2aNH6T9676RRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="1736802"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.13])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 05:05:56 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 3/6] drm/i915/de: Convert intel_de_read64_2x32_volatile() to
 intel_de_read64_2x32_volatile_fw()
Date: Wed, 14 Oct 2026 15:05:39 +0300
Message-ID: <20261014120542.29675-4-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261014120542.29675-1-ville.syrjala@linux.intel.com>
References: <20261014120542.29675-1-ville.syrjala@linux.intel.com>
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

Our only use of intel_de_read64_2x32_volatile() is for the
PIPEFRAMEPIXEL/PIPEFRAMEHIGH read. That only gets used on gen3/4
so we don't actually need the uncore.lock protection there.
Replace intel_de_read64_2x32_volatile() with a hand rolled
intel_de_read64_2x32_volatile_fw().

This will reduce the uncore usage footprint of intel_de.h,
which will help with cleaning up the final uncore i915 vs. xe
mess.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_de.h     | 35 ++++++++++-----------
 drivers/gpu/drm/i915/display/intel_vblank.c |  4 +--
 2 files changed, 19 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_de.h b/drivers/gpu/drm/i915/display/intel_de.h
index 4ae041a96b31..76f698cfa354 100644
--- a/drivers/gpu/drm/i915/display/intel_de.h
+++ b/drivers/gpu/drm/i915/display/intel_de.h
@@ -35,24 +35,6 @@ intel_de_read(struct intel_display *display, intel_reg_t reg)
 	return val;
 }
 
-static inline u64
-intel_de_read64_2x32_volatile(struct intel_display *display,
-			      intel_reg_t lower_reg, intel_reg_t upper_reg)
-{
-	u64 val;
-
-	intel_dmc_wl_get(display, lower_reg);
-	intel_dmc_wl_get(display, upper_reg);
-
-	val = intel_uncore_read64_2x32(__to_uncore(display), lower_reg,
-				       upper_reg);
-
-	intel_dmc_wl_put(display, upper_reg);
-	intel_dmc_wl_put(display, lower_reg);
-
-	return val;
-}
-
 static inline u64
 intel_de_read64_2x32(struct intel_display *display, intel_reg_t reg)
 {
@@ -158,6 +140,23 @@ intel_de_rmw_fw(struct intel_display *display, intel_reg_t reg, u32 clear, u32 s
 	return old;
 }
 
+static inline u64
+intel_de_read64_2x32_volatile_fw(struct intel_display *display,
+				 i915_reg_t lower_reg, i915_reg_t upper_reg)
+{
+	u32 old_upper, upper, lower;
+	int loop = 0;
+
+	upper = intel_de_read_fw(display, upper_reg);
+	do {
+		old_upper = upper;
+		lower = intel_de_read_fw(display, lower_reg);
+		upper = intel_de_read_fw(display, upper_reg);
+	} while (upper != old_upper && loop++ < 2);
+
+	return (u64)upper << 32 | lower;
+}
+
 static inline void
 intel_de_posting_read_fw(struct intel_display *display, intel_reg_t reg)
 {
diff --git a/drivers/gpu/drm/i915/display/intel_vblank.c b/drivers/gpu/drm/i915/display/intel_vblank.c
index a01be2e34bc9..d706284f073b 100644
--- a/drivers/gpu/drm/i915/display/intel_vblank.c
+++ b/drivers/gpu/drm/i915/display/intel_vblank.c
@@ -109,8 +109,8 @@ u32 i915_get_vblank_counter(struct drm_crtc *crtc)
 	 * we get a low value that's stable across two reads of the high
 	 * register.
 	 */
-	frame = intel_de_read64_2x32_volatile(display, PIPEFRAMEPIXEL(display, pipe),
-					      PIPEFRAMEHIGH(display, pipe));
+	frame = intel_de_read64_2x32_volatile_fw(display, PIPEFRAMEPIXEL(display, pipe),
+						 PIPEFRAMEHIGH(display, pipe));
 
 	pixel = REG_FIELD_GET(PIPE_PIXEL_MASK, frame);
 	frame = REG_FIELD_GET64(PIPE_FRAME_MASK, frame);
-- 
2.55.0

