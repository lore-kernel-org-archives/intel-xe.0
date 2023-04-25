Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E9CFC77B73
	for <intel-xe@archiver.kernel.org>; Tue, 25 Apr 2023 19:26:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78A1510E5A0;
	Tue, 25 Apr 2023 19:26:57 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E18910E61C
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Apr 2023 19:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682450813; x=1713986813;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jKx4CU9pg3w/7bJ7JwFTXUROlTXYkVDX0MMXD4SIggY=;
 b=XcTLG8Tb+RRSduSQSMaOhlLVajLhwpw6Lx193HaVOwYgRbpj216Uv6ln
 6CkG7eV/2igTC7EBHN3kiC9EQawnderXAz340IR+Omqf4jDFBHSD4PHGm
 TcbHXr5avsySqwLmUy/jEbfLY3kxur0k0w4JdGYQWj9kME3hHvUmaNePM
 ecwQtFCb2H4dQKj3IZ58spuxG+b7HZKrVkUI96e9WgAvix5tzgaKtWojn
 JwnHbV7moLtgmgLXcEv7Hbu7aS13BrmD1hcdb4dAvbGLRVq6PJR+vRrh2
 2JXoyM95c4MCgaAhHlymlJrcdevpownkrnm+Unx3HJMIiu5c2VD2t+vWP w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="331100895"
X-IronPort-AV: E=Sophos;i="5.99,226,1677571200"; d="scan'208";a="331100895"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2023 12:26:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="782990498"
X-IronPort-AV: E=Sophos;i="5.99,226,1677571200"; d="scan'208";a="782990498"
Received: from josouza-mobl2.fso.intel.com ([10.230.18.148])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2023 12:26:48 -0700
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 25 Apr 2023 12:26:21 -0700
Message-Id: <20230425192624.168640-13-jose.souza@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230425192624.168640-1-jose.souza@intel.com>
References: <20230425192624.168640-1-jose.souza@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 12/15] squash! drm/xe/display: Implement
 display support
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
Cc: rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Rename functions after backport https://patchwork.freedesktop.org/series/116431/
and add intel_display_driver_early_probe() call.

Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/Makefile     |  1 +
 drivers/gpu/drm/xe/xe_display.c | 23 +++++++++++++----------
 2 files changed, 14 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index ee4a95beec206..9dc6cf218fb01 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -144,6 +144,7 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
 	i915-display/intel_ddi.o \
 	i915-display/intel_ddi_buf_trans.o \
 	i915-display/intel_display.o \
+	i915-display/intel_display_driver.o \
 	i915-display/intel_display_debugfs.o \
 	i915-display/intel_display_power.o \
 	i915-display/intel_display_power_map.o \
diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
index a8af9eddb496a..408bd7c8d1c75 100644
--- a/drivers/gpu/drm/xe/xe_display.c
+++ b/drivers/gpu/drm/xe/xe_display.c
@@ -22,6 +22,7 @@
 #include "intel_bw.h"
 #include "intel_clock_gating.h"
 #include "intel_display.h"
+#include "intel_display_driver.h"
 #include "intel_display_types.h"
 #include "intel_dmc.h"
 #include "intel_dp.h"
@@ -54,7 +55,7 @@ int xe_display_set_driver_hooks(struct pci_dev *pdev, struct drm_driver *driver)
 		return 0;
 
 	/* Detect if we need to wait for other drivers early on */
-	if (intel_modeset_probe_defer(pdev))
+	if (intel_display_driver_probe_defer(pdev))
 		return -EPROBE_DEFER;
 
 	driver->driver_features |= DRIVER_MODESET | DRIVER_ATOMIC;
@@ -159,7 +160,7 @@ void xe_display_fini_noirq(struct drm_device *dev, void *dummy)
 	if (!xe->info.enable_display)
 		return;
 
-	intel_modeset_driver_remove_noirq(xe);
+	intel_display_driver_remove_noirq(xe);
 	intel_power_domains_driver_remove(xe);
 }
 
@@ -170,6 +171,8 @@ int xe_display_init_noirq(struct xe_device *xe)
 	if (!xe->info.enable_display)
 		return 0;
 
+	intel_display_driver_early_probe(xe);
+
 	/* Early display init.. */
 	intel_opregion_setup(xe);
 
@@ -188,7 +191,7 @@ int xe_display_init_noirq(struct xe_device *xe)
 	if (err)
 		return err;
 
-	err = intel_modeset_init_noirq(xe);
+	err = intel_display_driver_probe_noirq(xe);
 	if (err)
 		return err;
 
@@ -202,7 +205,7 @@ void xe_display_fini_noaccel(struct drm_device *dev, void *dummy)
 	if (!xe->info.enable_display)
 		return;
 
-	intel_modeset_driver_remove_nogem(xe);
+	intel_display_driver_remove_nogem(xe);
 }
 
 int xe_display_init_noaccel(struct xe_device *xe)
@@ -212,7 +215,7 @@ int xe_display_init_noaccel(struct xe_device *xe)
 	if (!xe->info.enable_display)
 		return 0;
 
-	err = intel_modeset_init_nogem(xe);
+	err = intel_display_driver_probe_nogem(xe);
 	if (err)
 		return err;
 
@@ -224,7 +227,7 @@ int xe_display_init(struct xe_device *xe)
 	if (!xe->info.enable_display)
 		return 0;
 
-	return intel_modeset_init(xe);
+	return intel_display_driver_probe(xe);
 }
 
 void xe_display_unlink(struct xe_device *xe)
@@ -265,7 +268,7 @@ void xe_display_modset_driver_remove(struct xe_device *xe)
 	if (!xe->info.enable_display)
 		return;
 
-	intel_modeset_driver_remove(xe);
+	intel_display_driver_remove(xe);
 }
 
 /* IRQ-related functions */
@@ -333,7 +336,7 @@ void xe_display_pm_suspend(struct xe_device *xe)
 	if (xe->info.display.pipe_mask)
 		drm_kms_helper_poll_disable(&xe->drm);
 
-	intel_display_suspend(&xe->drm);
+	intel_display_driver_suspend(xe);
 
 	intel_dp_mst_suspend(xe);
 
@@ -378,13 +381,13 @@ void xe_display_pm_resume(struct xe_device *xe)
 	if (xe->info.display.pipe_mask)
 		drm_mode_config_reset(&xe->drm);
 
-	intel_modeset_init_hw(xe);
+	intel_display_driver_init_hw(xe);
 	intel_clock_gating_init(xe);
 	intel_hpd_init(xe);
 
 	/* MST sideband requires HPD interrupts enabled */
 	intel_dp_mst_resume(xe);
-	intel_display_resume(&xe->drm);
+	intel_display_driver_resume(xe);
 
 	intel_hpd_poll_disable(xe);
 	if (xe->info.display.pipe_mask)
-- 
2.40.0

