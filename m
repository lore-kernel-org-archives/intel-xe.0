Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91C59C982FA
	for <intel-xe@archiver.kernel.org>; Wed, 23 Sep 2026 12:54:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C2BA10E8AD;
	Wed, 23 Sep 2026 12:54:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fNSITy0r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B168910E0C3;
 Wed, 23 Sep 2026 12:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790168068; x=1821704068;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=F//mVial+qlR8syOZDXh3M8llgkqQC/YskaR6aypKsg=;
 b=fNSITy0r9mCaPUhfLaUYpjz7DD1C+lVng3Tru6WvsZhcgLHIpX/GOatb
 u/C57yrA1qsT0eEh3y2EFtj7HXhkhkNDxjcGiib1fViwVReyt4Qfh43Yr
 jg1azhGIlmMSmAiyRrgHYjk09KubEjxApLgsdgcfb5w5RgKhpyrRVcC1W
 PlPMpr92wE/HeommHyBNDhYGBf5cntAt+eBa2xuXUQJ5XEqHKRgWKucI5
 Qf7gH3OSrv/eSpVR2Yqsqrgg0GXOW1Jjpu8vaqHF+9iR2wlU0522mOyHD
 yrnPrKqqN7oL6U9xR9fS8JPQbuSkYdwuQxFMDp32HnjVYiY1CuUV/Uj1j w==;
X-CSE-ConnectionGUID: 92RYSCVuTuCpmNmRZFOTfg==
X-CSE-MsgGUID: ZpmIJGAQQw2NV1uYMcyphg==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="89993024"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; d="scan'208";a="89993024"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 05:54:26 -0700
X-CSE-ConnectionGUID: fzrl3OoETzaDTPkQe+sx9A==
X-CSE-MsgGUID: T4zOBQPoRm+1uLlogyIeqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; d="scan'208";a="273795588"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.253])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 05:54:24 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: imre.deak@intel.com,
	ville.syrjala@linux.intel.com
Subject: [PATCH v2] drm/{i915, xe}: add/move intel_opregion_suspend() to
 intel_display_driver_shutdown_late()
Date: Wed, 23 Sep 2026 15:54:19 +0300
Message-ID: <20260923125419.1755740-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <a913a25a45ccf18159cbabb921111ae719b44d04.1790089118.git.jani.nikula@intel.com>
References: <a913a25a45ccf18159cbabb921111ae719b44d04.1790089118.git.jani.nikula@intel.com>
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

Add intel_opregion_suspend() to
intel_display_driver_shutdown_late(). This unifies the behaviour with
intel_display_driver_pm_suspend_late(), calling intel_opregion_suspend()
with IRQs disabled.

For xe, this delays intel_opregion_suspend() until after IRQ and GT
shutdown.

For i915, this starts calling intel_opregion_suspend() on shutdown.

v2: Move the call to intel_display_driver_shutdown_late() (Imre)

Cc: Imre Deak <imre.deak@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_driver.c | 2 ++
 drivers/gpu/drm/xe/display/xe_display.c             | 2 --
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_driver.c b/drivers/gpu/drm/i915/display/intel_display_driver.c
index abab457bce3a..f11cff0e1294 100644
--- a/drivers/gpu/drm/i915/display/intel_display_driver.c
+++ b/drivers/gpu/drm/i915/display/intel_display_driver.c
@@ -711,6 +711,8 @@ void intel_display_driver_shutdown_late(struct intel_display *display)
 	if (!HAS_DISPLAY(display))
 		return;
 
+	intel_opregion_suspend(display, PCI_D3cold);
+
 	/*
 	 * The only requirement is to reboot with display DC states disabled,
 	 * for now leaving all display power wells in the INIT power domain
diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index b013ec00b75d..1e37b1c29bb1 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -176,8 +176,6 @@ void xe_display_shutdown(struct xe_device *xe)
 		return;
 
 	intel_display_driver_shutdown(display);
-
-	intel_opregion_suspend(display, PCI_D3cold);
 }
 
 void xe_display_shutdown_late(struct xe_device *xe)
-- 
2.47.3

