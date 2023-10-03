Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D55F9E7AD5E
	for <intel-xe@archiver.kernel.org>; Tue,  3 Oct 2023 14:46:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1C8810E2B7;
	Tue,  3 Oct 2023 14:46:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1448C10E2AD
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Oct 2023 14:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696344364; x=1727880364;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nz3PO4bL3/jy2O2nnMSDVIFP8IKgqSqui9d+L/gatIY=;
 b=KwpLuif/ODdppjvE0fp+DABc9tLnN+kL5VoGK+Z1CLS1xqdVETTwFb7R
 siInIdM0wHPMrtOEyytYglR2HRswy6ZCWbu+VJOnqsiWH7s/nsmfAWmQH
 /bIgtDuMWsjLcbKsKP5ak9WPGH8cR6fCvHhXKpkJf/w01/QAp0mfK+s5T
 +3onW6wk71A9qmtaZETH4dB98jN5sp5xYq7LMKk+v1sJNFQaXKEHhX2X+
 RsX8S49+31OYW1XQZNlp5FIe7hTSfXK6Yc5zlSq9abStCQUmmMNHcHE6G
 grO0u9/6h6snAwiY3GFDJG7deNLrlvqJn44Qpv/8yMe9/kIRC7h0gARKW w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="447058526"
X-IronPort-AV: E=Sophos;i="6.03,197,1694761200"; d="scan'208";a="447058526"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 07:35:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="821272699"
X-IronPort-AV: E=Sophos;i="6.03,197,1694761200"; d="scan'208";a="821272699"
Received: from akorotox-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.55.199])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 07:35:09 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  3 Oct 2023 17:34:48 +0300
Message-Id: <70a0652ffedbfa33e36b0b2eea4a0aad5bc378da.1696343521.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1696343521.git.jani.nikula@intel.com>
References: <cover.1696343521.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 01/10] fixup! drm/xe/display: Implement display
 support
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
Cc: jani.nikula@intel.com, lucas.demarchi@intel.com, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

We have an abstraction for "has display", and it's
HAS_DISPLAY(). Unfortunately, it requires access to
DISPLAY_RUNTIME_INFO(), so include compat-i915-headers/i915_drv.h too,
although it's a bit meh.

Looking at this makes me think there's a bunch of confusion in:

- the pipe_mask or now HAS_DISPLAY() checks
- the global enable_display checks
- the xe->info.enable_display checks
- redefinition of INTEL_DISPLAY_ENABLED()

I really don't understand this, but it all looks very suspicious. This
change leaves all that in place, unmodified.

v2: define local has_display() to make this a bit cleaner

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/xe_display.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
index 07898e0e175e..68729997e1fe 100644
--- a/drivers/gpu/drm/xe/xe_display.c
+++ b/drivers/gpu/drm/xe/xe_display.c
@@ -15,6 +15,7 @@
 #include <drm/xe_drm.h>
 
 #include "soc/intel_dram.h"
+#include "i915_drv.h"		/* FIXME: HAS_DISPLAY() depends on this */
 #include "intel_acpi.h"
 #include "intel_audio.h"
 #include "intel_bw.h"
@@ -32,6 +33,11 @@
 
 /* Xe device functions */
 
+static bool has_display(struct xe_device *xe)
+{
+	return HAS_DISPLAY(xe);
+}
+
 /**
  * xe_display_driver_probe_defer - Detect if we need to wait for other drivers
  *				   early on
@@ -316,7 +322,7 @@ static void intel_suspend_encoders(struct xe_device *xe)
 	struct drm_device *dev = &xe->drm;
 	struct intel_encoder *encoder;
 
-	if (xe->info.display_runtime.pipe_mask)
+	if (has_display(xe))
 		return;
 
 	drm_modeset_lock_all(dev);
@@ -346,7 +352,7 @@ void xe_display_pm_suspend(struct xe_device *xe)
 	 * properly.
 	 */
 	intel_power_domains_disable(xe);
-	if (xe->info.display_runtime.pipe_mask)
+	if (has_display(xe))
 		drm_kms_helper_poll_disable(&xe->drm);
 
 	intel_display_driver_suspend(xe);
@@ -392,7 +398,7 @@ void xe_display_pm_resume(struct xe_device *xe)
 
 	intel_dmc_resume(xe);
 
-	if (xe->info.display_runtime.pipe_mask)
+	if (has_display(xe))
 		drm_mode_config_reset(&xe->drm);
 
 	intel_display_driver_init_hw(xe);
@@ -403,7 +409,7 @@ void xe_display_pm_resume(struct xe_device *xe)
 	intel_display_driver_resume(xe);
 
 	intel_hpd_poll_disable(xe);
-	if (xe->info.display_runtime.pipe_mask)
+	if (has_display(xe))
 		drm_kms_helper_poll_enable(&xe->drm);
 
 	intel_opregion_resume(xe);
@@ -424,7 +430,7 @@ void xe_display_probe(struct xe_device *xe)
 
 	intel_display_device_probe(xe);
 
-	if (xe->info.display_runtime.pipe_mask)
+	if (has_display(xe))
 		return;
 
 no_display:
-- 
2.39.2

