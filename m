Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15381CCD18E
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 08:02:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD89610E751;
	Wed, 15 Oct 2025 08:02:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IRbwuSaJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC38F10E751
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Oct 2025 08:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760515378; x=1792051378;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/GN4rhSmUv1UaH54kM0uQhP8dZMZlhR9fPYW6j313io=;
 b=IRbwuSaJkCZhkhbfrhegQ2bZxhnbk1JG9Hgzs6nBENlIVFf5h2vPHFkP
 rMLBbL9aqSwdLuUa0z4VPUTt4WK1k0+faImXWWpdjeMrTysDm7ywoft4R
 KtOPm18K4JCRKHD5FG4+XlyGxUUeaWP/j0mLX+dlvf+gcyxo5nkfMF5m/
 GXa2DxfYnCnqH3bsCd+CeCOclgZyzDuKanlZMYze8sGlfZUCe0stFW/U8
 XCxQ4a6eQ0OZ99HOucGvTRmkVJQ6jd3X0OY+w/tV7+/k7wcvhUPS94k2Z
 y37xwdcw/JFSXtUhxMoEwxzZ8lmFY936WUe2zMiL8LE96bYpNGAHG+oNc A==;
X-CSE-ConnectionGUID: KwA2/YbLTNu8cZ9NEmlllg==
X-CSE-MsgGUID: maUyjuFFRw2eaJo3GjXOkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="61891499"
X-IronPort-AV: E=Sophos;i="6.19,230,1754982000"; d="scan'208";a="61891499"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 01:02:58 -0700
X-CSE-ConnectionGUID: Ap0OTqK7Tnmytj3qp95TvQ==
X-CSE-MsgGUID: B3kl6bl5SZaQp1iaV2XryQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,230,1754982000"; d="scan'208";a="205805457"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 01:02:48 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org, linux-acpi@vger.kernel.org,
 linux-pci@vger.kernel.org
Cc: anshuman.gupta@intel.com, rafael@kernel.org, lenb@kernel.org,
 bhelgaas@google.com, ilpo.jarvinen@linux.intel.com,
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com, varun.gupta@intel.com,
 ville.syrjala@linux.intel.com, uma.shankar@intel.com,
 karthik.poosa@intel.com
Subject: [PATCH v5 07/12] drm/xe/vrsr: Enable VRSR on default VGA boot device
Date: Wed, 15 Oct 2025 13:37:05 +0530
Message-Id: <20251015080710.1468409-8-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251015080710.1468409-1-badal.nilawar@intel.com>
References: <20251015080710.1468409-1-badal.nilawar@intel.com>
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

The VRSR feature is to enhance the display screen refresh experience
when the device exits from the D3cold state. Therefore, apply the VRSR
feature to the default VGA boot device and when a display is connected.

v2: Move generic display logic to i915/display (Jani)

Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 22 ++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_display.h |  1 +
 drivers/gpu/drm/xe/display/xe_display.c      |  5 +++++
 drivers/gpu/drm/xe/display/xe_display.h      |  2 ++
 drivers/gpu/drm/xe/xe_pm.c                   |  5 +++++
 5 files changed, 35 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index d5b2612d4ec2..b974e7dc978d 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -8300,3 +8300,25 @@ bool intel_scanout_needs_vtd_wa(struct intel_display *display)
 
 	return IS_DISPLAY_VER(display, 6, 11) && i915_vtd_active(i915);
 }
+
+bool intel_display_connected(struct intel_display *display)
+{
+	struct drm_connector *list_connector;
+	struct drm_connector_list_iter iter;
+	bool ret = false;
+
+	mutex_lock(&display->drm->mode_config.mutex);
+	drm_connector_list_iter_begin(display->drm, &iter);
+
+	drm_for_each_connector_iter(list_connector, &iter) {
+		if (list_connector->status == connector_status_connected) {
+			ret = true;
+			break;
+		}
+	}
+
+	drm_connector_list_iter_end(&iter);
+	mutex_unlock(&display->drm->mode_config.mutex);
+
+	return ret;
+}
diff --git a/drivers/gpu/drm/i915/display/intel_display.h b/drivers/gpu/drm/i915/display/intel_display.h
index fc2ef92ccf68..78a479241c67 100644
--- a/drivers/gpu/drm/i915/display/intel_display.h
+++ b/drivers/gpu/drm/i915/display/intel_display.h
@@ -555,5 +555,6 @@ bool assert_port_valid(struct intel_display *display, enum port port);
 
 bool intel_scanout_needs_vtd_wa(struct intel_display *display);
 int intel_crtc_num_joined_pipes(const struct intel_crtc_state *crtc_state);
+bool intel_display_connected(struct intel_display *display);
 
 #endif
diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index 47619bb8dc10..205040f43ddd 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -58,6 +58,11 @@ bool xe_display_driver_probe_defer(struct pci_dev *pdev)
 	return intel_display_driver_probe_defer(pdev);
 }
 
+bool xe_display_connected(struct xe_device *xe)
+{
+	return intel_display_connected(xe->display);
+}
+
 /**
  * xe_display_driver_set_hooks - Add driver flags and hooks for display
  * @driver: DRM device driver
diff --git a/drivers/gpu/drm/xe/display/xe_display.h b/drivers/gpu/drm/xe/display/xe_display.h
index 76db95c25f7e..11d4b09808e5 100644
--- a/drivers/gpu/drm/xe/display/xe_display.h
+++ b/drivers/gpu/drm/xe/display/xe_display.h
@@ -37,6 +37,7 @@ void xe_display_pm_resume(struct xe_device *xe);
 void xe_display_pm_runtime_suspend(struct xe_device *xe);
 void xe_display_pm_runtime_suspend_late(struct xe_device *xe);
 void xe_display_pm_runtime_resume(struct xe_device *xe);
+bool xe_display_connected(struct xe_device *xe);
 
 #else
 
@@ -67,5 +68,6 @@ static inline void xe_display_pm_runtime_suspend(struct xe_device *xe) {}
 static inline void xe_display_pm_runtime_suspend_late(struct xe_device *xe) {}
 static inline void xe_display_pm_runtime_resume(struct xe_device *xe) {}
 
+static inline bool xe_display_connected(struct xe_device *xe) { return false; }
 #endif /* CONFIG_DRM_XE_DISPLAY */
 #endif /* _XE_DISPLAY_H_ */
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index d95de9015ef5..61466bf0bba6 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -9,6 +9,7 @@
 #include <linux/fault-inject.h>
 #include <linux/pm_runtime.h>
 #include <linux/suspend.h>
+#include <linux/vgaarb.h>
 
 #include <drm/drm_managed.h>
 #include <drm/ttm/ttm_placement.h>
@@ -378,6 +379,7 @@ static int pci_acpi_aux_power_setup(struct xe_device *xe)
 
 static void xe_pm_vrsr_init(struct xe_device *xe)
 {
+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 	int ret;
 
 	if (!xe->info.has_vrsr)
@@ -386,6 +388,9 @@ static void xe_pm_vrsr_init(struct xe_device *xe)
 	if (!xe_pm_vrsr_capable(xe))
 		return;
 
+	if (pdev != vga_default_device() || !xe_display_connected(xe))
+		return;
+
 	/*
 	 * If the VRSR initialization fails, the device will proceed with the regular
 	 * D3cold flow
-- 
2.34.1

