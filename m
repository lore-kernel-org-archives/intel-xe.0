Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9234BC43458
	for <intel-xe@archiver.kernel.org>; Wed,  1 Jul 2026 13:53:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 487A710E3D5;
	Wed,  1 Jul 2026 13:53:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i+W4PqYO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3AAE10E3B6;
 Wed,  1 Jul 2026 13:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782914020; x=1814450020;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/cFqdby3aEE43NZsri4r1IRftfCX1GKYaakxYG5YYpU=;
 b=i+W4PqYOuKbpPALkrgQYVOb6T/QzmHMgZ58t2dzhafBuTXDjy1OYhbSM
 2rOtBVbC4pA5MdRtlGPp3ugzLwKJ8TjM3C7nmvwAO6WGw10WKKHsmGfek
 U0vqWUSkhTDKTU8U9qnyZyd92GylzLL7nBj2hd/kd7rKySgtVlioLo5ZI
 XfGXnIDFDVcN4kxYmD8YYWsyfS+qceNDPYsdvYFB54dJy7gQK5bdo+52/
 nE7izIsw/xLmv3MwgEk2TL7XC77hsopA/hfpO2DCg4OFXS6gB57JLhw1K
 bx+JhPiZ0WdhpFFyxyy/wHhgARPKU3FAAUOQcMd61BxhEVxfXPK81LX3U w==;
X-CSE-ConnectionGUID: bt4/bhHfSBmqBskLRYb9Lg==
X-CSE-MsgGUID: 1vWm/l4zSF2Fbn5jYgs3bg==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="83733958"
X-IronPort-AV: E=Sophos;i="6.25,141,1779174000"; d="scan'208";a="83733958"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2026 06:53:40 -0700
X-CSE-ConnectionGUID: 06tLN+qeSd2SOI//8v9z2w==
X-CSE-MsgGUID: 15GTlvnxS9aqButko9B6vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,141,1779174000"; d="scan'208";a="249207312"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.61])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2026 06:53:38 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 rodrigo.vivi@intel.com
Subject: [RESEND v2 7/8] drm/xe/display: add
 xe_display_pm_runtime_resume_early()
Date: Wed,  1 Jul 2026 16:53:05 +0300
Message-ID: <04158267b9d3715512bfb46c9772da04d3372184.1782913901.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782913901.git.jani.nikula@intel.com>
References: <cover.1782913901.git.jani.nikula@intel.com>
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
index 01b6501a204a..306c853dd07a 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -349,6 +349,7 @@ static void xe_display_disable_d3cold(struct xe_device *xe)
 	intel_display_driver_runtime_pm_enable(display);
 }
 
+/* before irq suspend */
 void xe_display_pm_runtime_suspend(struct xe_device *xe)
 {
 	struct intel_display *display = xe->display;
@@ -364,6 +365,7 @@ void xe_display_pm_runtime_suspend(struct xe_device *xe)
 	intel_hpd_poll_enable(display);
 }
 
+/* after irq suspend */
 void xe_display_pm_runtime_suspend_late(struct xe_device *xe)
 {
 	struct intel_display *display = xe->display;
@@ -382,6 +384,17 @@ void xe_display_pm_runtime_suspend_late(struct xe_device *xe)
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

