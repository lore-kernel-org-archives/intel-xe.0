Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DA61CD98DE
	for <intel-xe@archiver.kernel.org>; Mon, 15 Jun 2026 12:41:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EE2910E3E8;
	Mon, 15 Jun 2026 12:41:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U3ELd8pi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 630A110E3E8;
 Mon, 15 Jun 2026 12:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781527273; x=1813063273;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Bmk7CMP47bSL+iZxANLEKIkXIEVn+VuauVVzMF5s0LA=;
 b=U3ELd8piAPupTsKNaOJsyrZjVDp4U93STSVmi5PWJs5uRmUFRagIr9uP
 IXxeRz2M5PFy9PIUsfCOIU7/SbPY1brRXDgQ7S88RxtcyZbYqiGBj9KDD
 33Rgdej1MUMFSLWzsZugv5QSZTMD39TLl3/+bbo/SeNlVjeSQnXhCBnc6
 PKndhOrEx8c7lJ6yJWcq4kNAm7fyBat1T5hQb6DxfvDZWJ6tjiUpMBwtj
 hXwdWetlv/I9OeXuaMGDyPN4FixuPnZRvpfAvy4gJ7badcLlZ5mkxCVX1
 zrpW1ZYicH6YEGUpH0rcrMMhou734z4BYivXYK7qaCT/I0UKxkKh0ayGi w==;
X-CSE-ConnectionGUID: JQ4RFoSZSzWsOOSFnxDrYw==
X-CSE-MsgGUID: tDrMrh+1SSOmlwEAkE0W9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="82112405"
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="82112405"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 05:41:13 -0700
X-CSE-ConnectionGUID: whE2zSrFRGSCzl3mzeCRLA==
X-CSE-MsgGUID: r1TEIYptS1CUPZsfVtJSXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="271160399"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.28])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 05:41:11 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, rodrigo.vivi@intel.com,
 ville.syrjala@linux.intel.com
Subject: [PATCH 4/4] drm/xe/display: unify runtime suspend/resume with i915
 for non-d3cold
Date: Mon, 15 Jun 2026 15:40:48 +0300
Message-ID: <9495bbd32c47e67de43d984382cdc0303073e068.1781527161.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1781527161.git.jani.nikula@intel.com>
References: <cover.1781527161.git.jani.nikula@intel.com>
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

With the special d3cold handling in xe runtime suspend/resume separated,
unify the non-d3cold paths with i915. There are multiple changes here at
once that probably wouldn't make much sense to split out further.

Add the call to intel_display_driver_pm_runtime_suspend(), which in turn
starts calling intel_display_power_runtime_suspend(). Deep down, this
should take care of intel_dmc_wl_flush_release_work(), allowing us to
drop the extra call in xe_display_pm_runtime_suspend_late().

Add the call to intel_display_driver_pm_runtime_suspend_late(), which
starts calling intel_opregion_notify_adapter(). The
intel_hpd_poll_enable() call is also done here, postponed from the
previous location in xe_display_pm_runtime_suspend().

Add the call to intel_display_driver_pm_runtime_resume_early(), which
contains the intel_display_power_runtime_resume() and
intel_opregion_notify_adapter() counterparts found in
intel_display_power_runtime_suspend() and
intel_display_power_runtime_suspend_late(). (They are not symmetric.)

Finally, intel_display_driver_pm_runtime_resume() replaces the direct
calls to intel_hpd_init(), intel_hpd_poll_disable(), and
skl_watermark_ipc_update().

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/display/xe_display.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index bdafc010fae1..8c147610f721 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -379,7 +379,7 @@ void xe_display_pm_runtime_suspend(struct xe_device *xe)
 		return;
 	}
 
-	intel_hpd_poll_enable(display);
+	intel_display_driver_pm_runtime_suspend(display);
 }
 
 void xe_display_pm_runtime_suspend_late(struct xe_device *xe)
@@ -396,8 +396,7 @@ void xe_display_pm_runtime_suspend_late(struct xe_device *xe)
 		return;
 	}
 
-	/* Ensure the wakelock release work gets flushed */
-	intel_dmc_wl_flush_release_work(display);
+	intel_display_driver_pm_runtime_suspend_late(display);
 }
 
 void xe_display_pm_runtime_resume(struct xe_device *xe)
@@ -412,9 +411,8 @@ void xe_display_pm_runtime_resume(struct xe_device *xe)
 		return;
 	}
 
-	intel_hpd_init(display);
-	intel_hpd_poll_disable(display);
-	skl_watermark_ipc_update(display);
+	intel_display_driver_pm_runtime_resume_early(display);
+	intel_display_driver_pm_runtime_resume(display);
 }
 
 
-- 
2.47.3

