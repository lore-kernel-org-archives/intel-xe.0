Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB882CDE003
	for <intel-xe@archiver.kernel.org>; Wed, 24 Jun 2026 14:37:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1F7410EF68;
	Wed, 24 Jun 2026 14:37:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mwCB9oUT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70EB110EF68;
 Wed, 24 Jun 2026 14:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782311861; x=1813847861;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Q86w7dtiBcBLhdAWeiySCT0NtjO9cG3Kzl77MIukcQY=;
 b=mwCB9oUTuR2rwQUtWRzc4Ee6fMU6bDWmcDRZMKYwc2+NCEYemd7veJX3
 LSpbGL8Z5Yn5D1d/iiRdbsm0pkNxE/+IP14Mack6rxXZCedPTEV97nvjm
 OkZgEzLQsiPF5KMK6BWFr+H4DNJMve0sPhIDbI/X8Tqzh7NDIzBgN9PH3
 tmGC4/APInOBSXZE10FA6J7URqTknZXKF/qD/eKlxPvgigl3vd70C28b/
 UJQ71HQUffQxxd0q70GLDxedR+tK5Ye/ROF8jU7cByqTiHUbGHszpbGcJ
 7cCaOL9q1t8729DO3eD5JNVPj3bF3dqEZanIFehx+XRaO0yJxvXWZCADa A==;
X-CSE-ConnectionGUID: oaACd1FhS6GGZjtd2KaIWw==
X-CSE-MsgGUID: santeAZ6Q8S6ioHnvP2G9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="94567934"
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="94567934"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 07:37:40 -0700
X-CSE-ConnectionGUID: IqtLy6ZAQtOcD7Bc82Zx+g==
X-CSE-MsgGUID: Zdv023BFQ4y63kT0Umi09g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="273564497"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.187])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2026 07:37:37 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, rodrigo.vivi@intel.com,
 ville.syrjala@linux.intel.com
Subject: [PATCH v2 8/8] drm/xe/display: unify runtime suspend/resume with i915
 for non-d3cold
Date: Wed, 24 Jun 2026 17:36:55 +0300
Message-ID: <c391cffa5625ce8c552d0381103e26e6687fb4f8.1782311749.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782311749.git.jani.nikula@intel.com>
References: <cover.1782311749.git.jani.nikula@intel.com>
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

Add the call to intel_display_driver_pm_runtime_suspend(), which, for
the time being, is a no-op. The intel_hpd_poll_enable() is called later.

Add the call to intel_display_driver_pm_runtime_suspend_late(), which
starts calling intel_display_power_runtime_suspend() and
intel_opregion_notify_adapter(). Deep down, the former should take care
of intel_dmc_wl_flush_release_work(), allowing us to drop the extra call
in xe_display_pm_runtime_suspend_late(). The intel_hpd_poll_enable()
call is also done here, postponed from the previous location in
xe_display_pm_runtime_suspend().

Add the call to intel_display_driver_pm_runtime_resume_early(), which
contains the intel_display_power_runtime_resume() and
intel_opregion_notify_adapter() counterparts to the calls in
intel_display_power_runtime_suspend_late().

Finally, intel_display_driver_pm_runtime_resume() replaces the direct
calls to intel_hpd_init(), intel_hpd_poll_disable(), and
skl_watermark_ipc_update(). (The hotplug poll enable/disable calls are
asymmetric.)

v2:
- Rebase, move placement of the calls

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/display/xe_display.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index a26b8bca1cb6..8e48853c276e 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -380,7 +380,7 @@ void xe_display_pm_runtime_suspend(struct xe_device *xe)
 		return;
 	}
 
-	intel_hpd_poll_enable(display);
+	intel_display_driver_pm_runtime_suspend(display);
 }
 
 /* after irq suspend */
@@ -398,18 +398,21 @@ void xe_display_pm_runtime_suspend_late(struct xe_device *xe)
 		return;
 	}
 
-	/* Ensure the wakelock release work gets flushed */
-	intel_dmc_wl_flush_release_work(display);
+	intel_display_driver_pm_runtime_suspend_late(display);
 }
 
 /* before irq resume */
 void xe_display_pm_runtime_resume_early(struct xe_device *xe)
 {
+	struct intel_display *display = xe->display;
+
 	if (!xe->info.probe_display)
 		return;
 
 	if (xe->d3cold.allowed)
 		return;
+
+	intel_display_driver_pm_runtime_resume_early(display);
 }
 
 /* after irq resume */
@@ -425,9 +428,7 @@ void xe_display_pm_runtime_resume(struct xe_device *xe)
 		return;
 	}
 
-	intel_hpd_init(display);
-	intel_hpd_poll_disable(display);
-	skl_watermark_ipc_update(display);
+	intel_display_driver_pm_runtime_resume(display);
 }
 
 
-- 
2.47.3

