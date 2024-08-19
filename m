Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E63BC3DA4A
	for <intel-xe@archiver.kernel.org>; Mon, 19 Aug 2024 11:33:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2657A10E245;
	Mon, 19 Aug 2024 11:33:07 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4D9D10E245
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Aug 2024 11:33:05 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Imre Deak <imre.deak@intel.com>
Subject: [PATCH 2/5] drm/xe/display: Match i915 driver suspend/resume
 sequences better
Date: Mon, 19 Aug 2024 13:32:51 +0200
Message-ID: <20240819113254.82286-3-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240819113254.82286-1-maarten.lankhorst@linux.intel.com>
References: <20240819113254.82286-1-maarten.lankhorst@linux.intel.com>
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

Suspend fbdev sooner, and disable user access before suspending to
prevent some races. I've noticed this when comparing xe suspend to
i915's.

Matches the following commits from i915:
24b412b1bfeb ("drm/i915: Disable intel HPD poll after DRM poll init/enable")
1ef28d86bea9 ("drm/i915: Suspend the framebuffer console earlier during system suspend")
bd738d859e71 ("drm/i915: Prevent modesets during driver init/shutdown")

Thanks to Imre for pointing me to those commits.

Driver shutdown is currently missing, but I have some idea how to
implement it next.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/xe/display/xe_display.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index 65d7a5040270e..7a1d39e1bbd7d 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -297,8 +297,11 @@ void xe_display_pm_suspend(struct xe_device *xe, bool runtime)
 	 * properly.
 	 */
 	intel_power_domains_disable(xe);
-	if (has_display(xe))
+	intel_fbdev_set_suspend(&xe->drm, FBINFO_STATE_SUSPENDED, true);
+	if (has_display(xe)) {
 		drm_kms_helper_poll_disable(&xe->drm);
+		intel_display_driver_disable_user_access(xe);
+	}
 
 	if (!runtime)
 		intel_display_driver_suspend(xe);
@@ -307,12 +310,13 @@ void xe_display_pm_suspend(struct xe_device *xe, bool runtime)
 
 	intel_hpd_cancel_work(xe);
 
+	if (has_display(xe))
+		intel_display_driver_suspend_access(xe);
+
 	intel_encoder_suspend_all(&xe->display);
 
 	intel_opregion_suspend(xe, s2idle ? PCI_D1 : PCI_D3cold);
 
-	intel_fbdev_set_suspend(&xe->drm, FBINFO_STATE_SUSPENDED, true);
-
 	intel_dmc_suspend(xe);
 }
 
@@ -350,14 +354,19 @@ void xe_display_pm_resume(struct xe_device *xe, bool runtime)
 	intel_display_driver_init_hw(xe);
 	intel_hpd_init(xe);
 
+	if (has_display(xe))
+		intel_display_driver_resume_access(xe);
+
 	/* MST sideband requires HPD interrupts enabled */
 	intel_dp_mst_resume(xe);
 	if (!runtime)
 		intel_display_driver_resume(xe);
 
-	intel_hpd_poll_disable(xe);
-	if (has_display(xe))
+	if (has_display(xe)) {
 		drm_kms_helper_poll_enable(&xe->drm);
+		intel_display_driver_enable_user_access(xe);
+	}
+	intel_hpd_poll_disable(xe);
 
 	intel_opregion_resume(xe);
 
-- 
2.45.2

