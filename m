Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ED64C61DC6
	for <intel-xe@archiver.kernel.org>; Thu, 27 Aug 2026 12:35:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 228B610EFD8;
	Thu, 27 Aug 2026 12:35:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lMep8OJP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CE2410EFD8;
 Thu, 27 Aug 2026 12:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787834108; x=1819370108;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=J3FaoOzd6C98TuT1NZ5vJVDN9Bf9Cde6xaUJFttcB78=;
 b=lMep8OJPTBn6OlB9xIKaA1i410sTRCJxTnaBVoCd47w6yGeHxPGfwgbR
 S1znbtp6xdX6g7x6+FKCoQzPtvFyDIb636rSPwStMzsnBBUR2G1ANHyO5
 w7zEGGhiO/zNPH7X+O1fJFQ4sTB2p9nSBTWSC54BQ512d08SWNQ4SUoA+
 03bYda/iiEXv0/skq1JsQFK5vo8x2JkMPLgzaYyaEm43Aeoma51XZ4zPQ
 kKG5J9+yWdz/5S/LTMDPpzb3z/AOSVVlW8x/G8r8L7ftqzol8f1qmcGib
 V4htagSvFjdkUpWKNYK0wzq+57vryvUXjNXj8rI+sHGxWxaKoexnKV1av Q==;
X-CSE-ConnectionGUID: 1SB3fjGsRdKwIowYuMVe2w==
X-CSE-MsgGUID: MduDnwl2Qaye2AxA/6lOXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="98929261"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="98929261"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 05:35:08 -0700
X-CSE-ConnectionGUID: r+YMJCdqTKuAsEcGhyYRzw==
X-CSE-MsgGUID: CE4Pn5dYSGyJuE/hCmXl+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="261734574"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.219])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 05:35:06 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com, ville.syrjala@linux.intel.com,
 jani.nikula@intel.com, Maarten Lankhorst <maarten.lankhorst@intel.com>
Subject: [PATCH v2 1/7] drm/i915/reset: move gpu_reset_clobbers_display
 platform property to display
Date: Thu, 27 Aug 2026 15:34:51 +0300
Message-ID: <9179d6a76992007287876a2736080fc2ac4d3c70.1787833879.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787833879.git.jani.nikula@intel.com>
References: <cover.1787833879.git.jani.nikula@intel.com>
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

Whether the "GPU reset clobbers display" platform property belongs to
i915 core or display is neither here nor there. Move it to display for
the benefit of follow-up changes.

Instead of having a device info flag for it, just express this in terms
of the platforms: up to and including display version 4, except G45 and
GM45. This is historical platform information, and it's not going to
change. The added function actually better answers the question, "On
which platforms a display reset is required after a GPU reset?"

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_reset.c | 8 ++++++++
 drivers/gpu/drm/i915/display/intel_display_reset.h | 1 +
 drivers/gpu/drm/i915/gt/intel_reset.c              | 4 ++--
 drivers/gpu/drm/i915/i915_pci.c                    | 6 ------
 drivers/gpu/drm/i915/intel_device_info.h           | 1 -
 5 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_reset.c b/drivers/gpu/drm/i915/display/intel_display_reset.c
index 504ec7043cd9..6ec1af1c8431 100644
--- a/drivers/gpu/drm/i915/display/intel_display_reset.c
+++ b/drivers/gpu/drm/i915/display/intel_display_reset.c
@@ -23,6 +23,14 @@ bool intel_display_reset_supported(struct intel_display *display)
 	return display && HAS_DISPLAY(display);
 }
 
+bool intel_display_reset_needed_after_gpu_reset(struct intel_display *display)
+{
+	/* aka gpu_reset_clobbers_display */
+	return intel_display_reset_supported(display) &&
+		DISPLAY_VER(display) <= 4 &&
+		!display->platform.g45 && !display->platform.gm45;
+}
+
 bool intel_display_reset_test(struct intel_display *display)
 {
 	return display && HAS_DISPLAY(display) &&
diff --git a/drivers/gpu/drm/i915/display/intel_display_reset.h b/drivers/gpu/drm/i915/display/intel_display_reset.h
index b88c330a3441..68312403904e 100644
--- a/drivers/gpu/drm/i915/display/intel_display_reset.h
+++ b/drivers/gpu/drm/i915/display/intel_display_reset.h
@@ -11,6 +11,7 @@
 struct intel_display;
 
 bool intel_display_reset_supported(struct intel_display *display);
+bool intel_display_reset_needed_after_gpu_reset(struct intel_display *display);
 bool intel_display_reset_test(struct intel_display *display);
 void intel_display_reset_prepare(struct intel_display *display);
 void intel_display_reset_finish(struct intel_display *display, bool test_only);
diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c b/drivers/gpu/drm/i915/gt/intel_reset.c
index 6053f3e8aa27..439635bf94dd 100644
--- a/drivers/gpu/drm/i915/gt/intel_reset.c
+++ b/drivers/gpu/drm/i915/gt/intel_reset.c
@@ -1180,9 +1180,9 @@ static int resume(struct intel_gt *gt)
 
 bool intel_gt_gpu_reset_clobbers_display(struct intel_gt *gt)
 {
-	struct drm_i915_private *i915 = gt->i915;
+	struct intel_display *display = gt->i915->display;
 
-	return INTEL_INFO(i915)->gpu_reset_clobbers_display;
+	return intel_display_reset_needed_after_gpu_reset(display);
 }
 
 /**
diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
index 82415af47d54..64e8db0f7aed 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -80,7 +80,6 @@ __diag_ignore_all("-Woverride-init", "Allow field initialization overrides for d
 #define I830_FEATURES \
 	GEN(2), \
 	.is_mobile = 1, \
-	.gpu_reset_clobbers_display = true, \
 	.has_3d_pipeline = 1, \
 	.hws_needs_physical = 1, \
 	.unfenced_needs_alignment = 1, \
@@ -96,7 +95,6 @@ __diag_ignore_all("-Woverride-init", "Allow field initialization overrides for d
 #define I845_FEATURES \
 	GEN(2), \
 	.has_3d_pipeline = 1, \
-	.gpu_reset_clobbers_display = true, \
 	.hws_needs_physical = 1, \
 	.unfenced_needs_alignment = 1, \
 	.platform_engine_mask = BIT(RCS0), \
@@ -130,7 +128,6 @@ static const struct intel_device_info i865g_info = {
 
 #define GEN3_FEATURES \
 	GEN(3), \
-	.gpu_reset_clobbers_display = true, \
 	.platform_engine_mask = BIT(RCS0), \
 	.has_3d_pipeline = 1, \
 	.has_snoop = true, \
@@ -193,7 +190,6 @@ static const struct intel_device_info pnv_m_info = {
 
 #define GEN4_FEATURES \
 	GEN(4), \
-	.gpu_reset_clobbers_display = true, \
 	.platform_engine_mask = BIT(RCS0), \
 	.has_3d_pipeline = 1, \
 	.has_snoop = true, \
@@ -223,7 +219,6 @@ static const struct intel_device_info g45_info = {
 	GEN4_FEATURES,
 	PLATFORM(INTEL_G45),
 	.platform_engine_mask = BIT(RCS0) | BIT(VCS0),
-	.gpu_reset_clobbers_display = false,
 };
 
 static const struct intel_device_info gm45_info = {
@@ -231,7 +226,6 @@ static const struct intel_device_info gm45_info = {
 	PLATFORM(INTEL_GM45),
 	.is_mobile = 1,
 	.platform_engine_mask = BIT(RCS0) | BIT(VCS0),
-	.gpu_reset_clobbers_display = false,
 };
 
 #define GEN5_FEATURES \
diff --git a/drivers/gpu/drm/i915/intel_device_info.h b/drivers/gpu/drm/i915/intel_device_info.h
index 9387385cb418..7296e7dcf828 100644
--- a/drivers/gpu/drm/i915/intel_device_info.h
+++ b/drivers/gpu/drm/i915/intel_device_info.h
@@ -148,7 +148,6 @@ enum intel_ppgtt_type {
 	/* Keep has_* in alphabetical order */ \
 	func(has_64bit_reloc); \
 	func(has_64k_pages); \
-	func(gpu_reset_clobbers_display); \
 	func(has_reset_engine); \
 	func(has_3d_pipeline); \
 	func(has_flat_ccs); \
-- 
2.47.3

