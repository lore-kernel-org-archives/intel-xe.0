Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEBC1CD6E4A
	for <intel-xe@archiver.kernel.org>; Tue,  2 Jun 2026 08:33:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DB4311393C;
	Tue,  2 Jun 2026 08:33:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oIvigeT/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47F2D11393C;
 Tue,  2 Jun 2026 08:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780389229; x=1811925229;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qgAPm5nHa7rbrMgbxDYJLnyE3+8G97jvlL0iHqZcgA0=;
 b=oIvigeT/a32rOCmtR9Xc/Mp4jDX0DTxcaHPzRDj4E2aaNPZwm2YxFTmW
 abqVYHbOGjWXB87v2AtCH/0eHMFDy0v+TCuFc29NoknHCOVZrwh7E/0m6
 hpQx0H+JEyWo/5zBH/Rd+9u/JhCQpaENxZ9EuIk23R8/3PSBoiAraLmO6
 9iwmZbkkYEIc2ODrzcvyxDd3z2pv9ET9K00csEZka7jC4BoadpmiNipsW
 ueTIexj4vYKMrIySLGtgKSryvL6yKmJtPKutBuk+HgSXN1hVzNphxYP4l
 tCjoIxGBPV/ptP8H9I4yaRaZj+gxJlBBPC097D4SdF7HQEF5pAUe70Y5+ w==;
X-CSE-ConnectionGUID: BFQUr7YsRBe0iavzCihv1g==
X-CSE-MsgGUID: zV20xuerSpKo2gNMHYdifg==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="106614834"
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; d="scan'208";a="106614834"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2026 01:33:49 -0700
X-CSE-ConnectionGUID: cao7j+zgQOiVjk5HHt/JhQ==
X-CSE-MsgGUID: j4Xl8ajgTzitk87TubpgwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; d="scan'208";a="267705172"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.245.253])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2026 01:33:47 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, imre.deak@intel.com, jani.nikula@intel.com
Subject: [CI 11/12] drm/xe/display: use intel_display_driver_pm_shutdown()
Date: Tue,  2 Jun 2026 11:32:51 +0300
Message-ID: <e6783c063f8c0d4a2b413e550165896a3d977585.1780389001.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780389001.git.jani.nikula@intel.com>
References: <cover.1780389001.git.jani.nikula@intel.com>
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

Replace direct intel_display_driver_pm_suspend() and additional calls
with intel_display_driver_shutdown(). This switches to use
drm_atomic_helper_shutdown() instead of drm_atomic_helper_suspend(),
which is the more appropriate thing to do anyway.

Not calling intel_display_driver_pm_suspend() from the xe shutdown path
unblocks further follow-up changes.

There's a slight functional change in that
intel_display_driver_shutdown() returns early for !HAS_DISPLAY(). Assume
this is what we want, and there are no cases where display engine is
present but all pipes have been fused off.

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/display/xe_display.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index 28bcfaacc240..4460438b966f 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -198,16 +198,7 @@ void xe_display_shutdown(struct xe_device *xe)
 	if (!xe->info.probe_display)
 		return;
 
-	intel_display_driver_pm_suspend(display);
-
-	intel_encoder_block_all_hpds(display);
-	intel_hpd_cancel_work(display);
-
-	if (intel_display_device_present(display))
-		intel_display_driver_suspend_access(display);
-
-	intel_encoder_suspend_all(display);
-	intel_encoder_shutdown_all(display);
+	intel_display_driver_shutdown(display);
 
 	intel_opregion_suspend(display, PCI_D3cold);
 
-- 
2.47.3

