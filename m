Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D726CDB481
	for <intel-xe@archiver.kernel.org>; Wed, 24 Jun 2026 14:37:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F330D10EF54;
	Wed, 24 Jun 2026 14:37:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cm3bAbBX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 915B910EF54;
 Wed, 24 Jun 2026 14:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782311856; x=1813847856;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Pt4IrCiE7gQEqyDHYJD2UgHNDwyseYSSLsVD44Hmchg=;
 b=Cm3bAbBXV/TTdDuQXq9KlPljJjeLuW/MvMbJaR0W16NY4CIQwpQlh8+3
 ypfpRDyb2KAPLx7LFU19fow5kBB3xCNpgSZ72o48FWpjlgJd3CnhEocz6
 SW5TbCbq0t5+XkbPyURJcJlvm66Yz8o/w2++zyyLyHAIdmQzIrtJwTQsn
 rLViaXoLEmsjUfjSCXUyskcX6gntnvR8/ii9yJ3F2Kdy1jkPNgrpRYOOO
 ROuabRvvL4Xo/fLagVgqjwX6qm+LULeXTW6wNEOMONLaBOr5N8NEaZJ1B
 JsMHA80Wrhew6FlC5oPtKjVDVhEAEIVEhGUMefsRnE52ZB6+YQkvDbzWi Q==;
X-CSE-ConnectionGUID: Kulp5VADQ1qvhNKHUFl0dQ==
X-CSE-MsgGUID: fipcq3S/SLurN6WcJttIgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="100626242"
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="100626242"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 07:37:35 -0700
X-CSE-ConnectionGUID: cjryxfBYTuKvdYTQvhavBw==
X-CSE-MsgGUID: YYYG2CbgRDye0iJfzzGBog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="273980223"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.187])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 07:37:33 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, rodrigo.vivi@intel.com,
 ville.syrjala@linux.intel.com
Subject: [PATCH v2 7/8] drm/xe/display: add
 xe_display_pm_runtime_resume_early()
Date: Wed, 24 Jun 2026 17:36:54 +0300
Message-ID: <fe5c59f2f5dfdc8a50908ee4bb9108a7a6e332dd.1782311749.git.jani.nikula@intel.com>
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

Add new display runtime PM hook xe_display_pm_runtime_resume_early(), to
be called before IRQ resume. This is initially a no-op placeholder.

Add comments on the timing relative to irq suspend/resume to all the
runtime PM hooks.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/display/xe_display.c | 13 +++++++++++++
 drivers/gpu/drm/xe/display/xe_display.h |  1 +
 drivers/gpu/drm/xe/xe_pm.c              |  2 ++
 3 files changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index bdafc010fae1..a26b8bca1cb6 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -367,6 +367,7 @@ static void xe_display_disable_d3cold(struct xe_device *xe)
 	intel_display_driver_runtime_pm_enable(display);
 }
 
+/* before irq suspend */
 void xe_display_pm_runtime_suspend(struct xe_device *xe)
 {
 	struct intel_display *display = xe->display;
@@ -382,6 +383,7 @@ void xe_display_pm_runtime_suspend(struct xe_device *xe)
 	intel_hpd_poll_enable(display);
 }
 
+/* after irq suspend */
 void xe_display_pm_runtime_suspend_late(struct xe_device *xe)
 {
 	struct intel_display *display = xe->display;
@@ -400,6 +402,17 @@ void xe_display_pm_runtime_suspend_late(struct xe_device *xe)
 	intel_dmc_wl_flush_release_work(display);
 }
 
+/* before irq resume */
+void xe_display_pm_runtime_resume_early(struct xe_device *xe)
+{
+	if (!xe->info.probe_display)
+		return;
+
+	if (xe->d3cold.allowed)
+		return;
+}
+
+/* after irq resume */
 void xe_display_pm_runtime_resume(struct xe_device *xe)
 {
 	struct intel_display *display = xe->display;
diff --git a/drivers/gpu/drm/xe/display/xe_display.h b/drivers/gpu/drm/xe/display/xe_display.h
index e5f9aed93206..52a5afed172c 100644
--- a/drivers/gpu/drm/xe/display/xe_display.h
+++ b/drivers/gpu/drm/xe/display/xe_display.h
@@ -43,6 +43,7 @@ void xe_display_pm_resume_early(struct xe_device *xe);
 void xe_display_pm_resume(struct xe_device *xe);
 void xe_display_pm_runtime_suspend(struct xe_device *xe);
 void xe_display_pm_runtime_suspend_late(struct xe_device *xe);
+void xe_display_pm_runtime_resume_early(struct xe_device *xe);
 void xe_display_pm_runtime_resume(struct xe_device *xe);
 
 #define XE_DISPLAY_DRIVER_FEATURES	(DRIVER_MODESET | DRIVER_ATOMIC)
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 99562f691080..a5289a9df8d2 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -700,6 +700,8 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 	if (xe->d3cold.allowed)
 		xe_sysctrl_pm_resume(xe);
 
+	xe_display_pm_runtime_resume_early(xe);
+
 	xe_irq_resume(xe);
 
 	for_each_gt(gt, xe, id) {
-- 
2.47.3

