Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91C84C6FD19
	for <intel-xe@archiver.kernel.org>; Fri, 10 Mar 2023 19:15:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E0F110E079;
	Fri, 10 Mar 2023 19:15:17 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDC4510E079
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Mar 2023 19:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678475714; x=1710011714;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EJus0m68YFw4yKzb7SRBBwS5LZD4vAC8oijpI2RkIiY=;
 b=ep8iG5kBWtTRZPIWt1K9KpW1wMzVJiFzkIlUgqZMnVvRMsBaarZfrTe4
 vOQeGwIDOnrhYQqA9pNI0Kg4tWlPbLgHq/zwBoFQ8HnxQejGOT5wqcO10
 4RLQYiGiUnrtSlJkdixzrlX1YN47ErKLcpn7c4+cn29EZSBOs0ExP76UQ
 o4sHZcgkdq65QheIZow+2rzQvKomgFEH18Bi6cSLnwr7edv+R5Qgd38NZ
 hy9ZS6jIEEELQGMcNafUxnlJCiDvUo+wn0PWoXKEOYFs8SRdx1LOKXVzc
 SpfQna7+ywaqOasuadbcwlVzWz8TCK4XoL2vaFJJEPcCtq7vxHAz72HD8 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="317200043"
X-IronPort-AV: E=Sophos;i="5.98,250,1673942400"; d="scan'208";a="317200043"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2023 11:14:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="671188168"
X-IronPort-AV: E=Sophos;i="5.98,250,1673942400"; d="scan'208";a="671188168"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2023 11:14:52 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 10 Mar 2023 11:14:30 -0800
Message-Id: <20230310191430.2229799-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Fix module load without display IP
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, maarten.lankhorst@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

When the device info initialization moved to the display part, one use
case was left behind: platforms without display IP. In order to keep the
knowledge about the display in xe_display.c, xe_display_info_init()
should be the place where this is set.

Remove the warning and set the info accordingly. This moves a later
check from  intel_device_info_runtime_init() into a very earlier one,
when no HW access is being done yet.

Fixes: 01a4268df2dd ("drm/xe/display: Move device info initialization to display")
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---

This fixes the module loading for me in PVC as long as I also remove
the ast module, due to another unrelated issue.

I do wonder though about the need for the drm.driver_features dance. We
set it very early on probe to call aperture_remove_conflicting_pci_framebuffers(),
which may be needed if the device supports display, but should not be
driven by xe.  For now fixing just the most immediate issue that should
bring us back to the behavior we had before the commit being fixed.

 .../gpu/drm/xe/display/ext/intel_device_info.c    |  6 ------
 drivers/gpu/drm/xe/xe_display.c                   | 15 +++++++++------
 2 files changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/ext/intel_device_info.c b/drivers/gpu/drm/xe/display/ext/intel_device_info.c
index 7f50b5e386f5..3dc1219864b4 100644
--- a/drivers/gpu/drm/xe/display/ext/intel_device_info.c
+++ b/drivers/gpu/drm/xe/display/ext/intel_device_info.c
@@ -107,12 +107,6 @@ void intel_device_info_runtime_init(struct drm_i915_private *dev_priv)
 			runtime->has_dsc = 0;
 	}
 
-	if (!HAS_DISPLAY(dev_priv)) {
-		dev_priv->drm.driver_features &= ~(DRIVER_MODESET |
-						   DRIVER_ATOMIC);
-		memset(runtime, 0, sizeof(*runtime));
-	}
-
 	runtime->rawclk_freq = intel_read_rawclk(dev_priv);
 	drm_dbg(&dev_priv->drm, "rawclk rate: %d kHz\n", runtime->rawclk_freq);
 }
diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
index cf6c60d7e5ff..9cd0c329da66 100644
--- a/drivers/gpu/drm/xe/xe_display.c
+++ b/drivers/gpu/drm/xe/xe_display.c
@@ -57,6 +57,11 @@ int xe_display_set_driver_hooks(struct pci_dev *pdev, struct drm_driver *driver)
 	return 0;
 }
 
+static void unset_driver_hooks(struct xe_device *xe)
+{
+	xe->drm.driver_features &= ~(DRIVER_MODESET | DRIVER_ATOMIC);
+}
+
 static void display_destroy(struct drm_device *dev, void *dummy)
 {
 	struct xe_device *xe = to_xe_device(dev);
@@ -79,7 +84,6 @@ int xe_display_create(struct xe_device *xe)
 {
 	int err;
 
-	/* Initialize display parts here.. */
 	spin_lock_init(&xe->display.fb_tracking.lock);
 
 	xe->display.hotplug.dp_wq = alloc_ordered_workqueue("xe-dp", 0);
@@ -496,11 +500,10 @@ void xe_display_info_init(struct xe_device *xe)
 		xe->info.display = (struct xe_device_display_info) { XE_LPDP };
 		break;
 	default:
-		/*
-		 * If platform doesn't have display, enable_display should
-		 * had been forced to false already at this point
-		 */
-		drm_WARN_ON(&xe->drm, 1);
+		drm_dbg(&xe->drm, "No display IP, skipping\n");
+		xe->info.enable_display = false;
+		unset_driver_hooks(xe);
+		return;
 	}
 }
 
-- 
2.39.0

