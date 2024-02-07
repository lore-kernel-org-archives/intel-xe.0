Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB463C4829E
	for <intel-xe@archiver.kernel.org>; Wed,  7 Feb 2024 10:31:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9864E11320D;
	Wed,  7 Feb 2024 10:31:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZrgR1TZm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA1C5113212
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Feb 2024 10:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707301887; x=1738837887;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=F9qWgLcb2j3X4MDOTKS0COXTIMn5FPD2V2CepCSg4ws=;
 b=ZrgR1TZmZ4FdzNQ8xadjQ86l9mqPh/NrtDYvuL1FcgbwbXcWizhxs7Lp
 Te2ffaoo0oj/yfLPHCLXfLQrW3+GzhA/l5JKXLLmYBaBlZ1XYdGoePas3
 csTrMu9Iugb5LAiH1PpiWrvZ4PlV5ds70SKz8/ENeuvCTmp2xNfn17X3J
 +dgX299sFuc00jviVZFcyzNJmyURaK1GhKjXj+rb84fSGV3c/+2max6XO
 GnQ5veMkz4yUsF/BnPMBfo2/SioXt63dB/VfgNdHDlbNONL4aZ1w4fURu
 A6QThw4v7oAJQeqp8HU9Z1cTjSQx/PaB2c6OAtghOdz6KQse8cNdiIwoB g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="12317365"
X-IronPort-AV: E=Sophos;i="6.05,250,1701158400"; d="scan'208";a="12317365"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2024 02:31:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,250,1701158400"; 
   d="scan'208";a="1328870"
Received: from mlyngsie-mobl.ger.corp.intel.com (HELO hazy.ger.corp.intel.com)
 ([10.252.42.69])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2024 02:31:21 -0800
From: Luca Coelho <luciano.coelho@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: uma.shankar@intel.com, ville.syrjala@linux.intel.com,
 jani.nikula@intel.com, gustavo.sousa@intel.com
Subject: [PATCH 5/6] drm/i915/display: add module parameter to enable DMC
 wakelock
Date: Wed,  7 Feb 2024 12:30:06 +0200
Message-Id: <20240207103007.665367-6-luciano.coelho@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240207103007.665367-1-luciano.coelho@intel.com>
References: <20240207103007.665367-1-luciano.coelho@intel.com>
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

This feature should be disabled by default until properly tested and
mature.  Add a module parameter to enable the feature for testing,
while keeping it disabled by default for now.

Additionally, only allow enabling via module parameter if the display
version is greater than 20.

Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
---
 .../gpu/drm/i915/display/intel_display_params.c  |  5 +++++
 .../gpu/drm/i915/display/intel_display_params.h  |  1 +
 drivers/gpu/drm/i915/display/intel_dmc_wl.c      | 16 ++++++++++++++--
 3 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_params.c b/drivers/gpu/drm/i915/display/intel_display_params.c
index 11e03cfb774d..f40b223cc8a1 100644
--- a/drivers/gpu/drm/i915/display/intel_display_params.c
+++ b/drivers/gpu/drm/i915/display/intel_display_params.c
@@ -116,6 +116,11 @@ intel_display_param_named_unsafe(enable_psr2_sel_fetch, bool, 0400,
 	"(0=disabled, 1=enabled) "
 	"Default: 1");
 
+intel_display_param_named_unsafe(enable_dmc_wl, bool, 0400,
+	"Enable DMC wakelock "
+	"(0=disabled, 1=enabled) "
+	"Default: 0");
+
 __maybe_unused
 static void _param_print_bool(struct drm_printer *p, const char *driver_name,
 			      const char *name, bool val)
diff --git a/drivers/gpu/drm/i915/display/intel_display_params.h b/drivers/gpu/drm/i915/display/intel_display_params.h
index 6206cc51df04..bf8dbbdb20a1 100644
--- a/drivers/gpu/drm/i915/display/intel_display_params.h
+++ b/drivers/gpu/drm/i915/display/intel_display_params.h
@@ -46,6 +46,7 @@ struct drm_i915_private;
 	param(int, enable_psr, -1, 0600) \
 	param(bool, psr_safest_params, false, 0400) \
 	param(bool, enable_psr2_sel_fetch, true, 0400) \
+	param(bool, enable_dmc_wl, false, 0400) \
 
 #define MEMBER(T, member, ...) T member;
 struct intel_display_params {
diff --git a/drivers/gpu/drm/i915/display/intel_dmc_wl.c b/drivers/gpu/drm/i915/display/intel_dmc_wl.c
index abe1ea92cf65..21ab67805ff1 100644
--- a/drivers/gpu/drm/i915/display/intel_dmc_wl.c
+++ b/drivers/gpu/drm/i915/display/intel_dmc_wl.c
@@ -79,6 +79,10 @@ void intel_dmc_wl_enable(struct drm_i915_private *i915)
 	struct intel_dmc_wl *wl = &i915->display.wl;
 	unsigned long flags;
 
+	if (!i915->display.params.enable_dmc_wl ||
+	    DISPLAY_VER(i915) <= 20)
+		return;
+
 	spin_lock_irqsave(&wl->lock, flags);
 
 	if (wl->enabled)
@@ -105,6 +109,10 @@ void intel_dmc_wl_disable(struct drm_i915_private *i915)
 	struct intel_dmc_wl *wl = &i915->display.wl;
 	unsigned long flags;
 
+	if (!i915->display.params.enable_dmc_wl ||
+	    DISPLAY_VER(i915) <= 20)
+		return;
+
 	spin_lock_irqsave(&wl->lock, flags);
 
 	/* FIXME: should we cancel the work? */
@@ -135,7 +143,9 @@ void intel_dmc_wl_get(struct drm_i915_private *i915, i915_reg_t reg)
 	unsigned long flags;
 	u32 ctl_value;
 
-	if (!intel_dmc_wl_check_range(reg.reg))
+	if (!i915->display.params.enable_dmc_wl ||
+	    DISPLAY_VER(i915) <= 20 ||
+	    !intel_dmc_wl_check_range(reg.reg))
 		return;
 
 	spin_lock_irqsave(&wl->lock, flags);
@@ -166,7 +176,9 @@ void intel_dmc_wl_put(struct drm_i915_private *i915, i915_reg_t reg)
 	struct intel_dmc_wl *wl = &i915->display.wl;
 	unsigned long flags;
 
-	if (!intel_dmc_wl_check_range(reg.reg))
+	if (!i915->display.params.enable_dmc_wl ||
+	    DISPLAY_VER(i915) <= 20 ||
+	    !intel_dmc_wl_check_range(reg.reg))
 		return;
 
 	spin_lock_irqsave(&wl->lock, flags);
-- 
2.39.2

