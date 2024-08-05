Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F6A7C3DA4A
	for <intel-xe@archiver.kernel.org>; Mon,  5 Aug 2024 15:13:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59EF510E217;
	Mon,  5 Aug 2024 15:13:01 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CADA810E217
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Aug 2024 15:12:59 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH 1/2] drm/xe/display: Match i915 driver suspend/resume
 sequences better
Date: Mon,  5 Aug 2024 17:13:08 +0200
Message-ID: <20240805151309.461021-2-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240805151309.461021-1-maarten.lankhorst@linux.intel.com>
References: <20240805151309.461021-1-maarten.lankhorst@linux.intel.com>
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

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/xe/display/xe_display.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index ca4468c820788..44405f17c1d28 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -294,8 +294,12 @@ void xe_display_pm_suspend(struct xe_device *xe, bool runtime)
 	 * properly.
 	 */
 	intel_power_domains_disable(xe);
-	if (has_display(xe))
+	intel_fbdev_set_suspend(&xe->drm, FBINFO_STATE_SUSPENDED, true);
+
+	if (has_display(xe)) {
 		drm_kms_helper_poll_disable(&xe->drm);
+		intel_display_driver_disable_user_access(xe);
+	}
 
 	if (!runtime)
 		intel_display_driver_suspend(xe);
@@ -308,8 +312,6 @@ void xe_display_pm_suspend(struct xe_device *xe, bool runtime)
 
 	intel_opregion_suspend(xe, s2idle ? PCI_D1 : PCI_D3cold);
 
-	intel_fbdev_set_suspend(&xe->drm, FBINFO_STATE_SUSPENDED, true);
-
 	intel_dmc_suspend(xe);
 }
 
@@ -353,8 +355,10 @@ void xe_display_pm_resume(struct xe_device *xe, bool runtime)
 		intel_display_driver_resume(xe);
 
 	intel_hpd_poll_disable(xe);
-	if (has_display(xe))
+	if (has_display(xe)) {
 		drm_kms_helper_poll_enable(&xe->drm);
+		intel_display_driver_enable_user_access(xe);
+	}
 
 	intel_opregion_resume(xe);
 
-- 
2.45.2

