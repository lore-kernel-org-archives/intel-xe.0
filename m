Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDF6BE9370C
	for <intel-xe@archiver.kernel.org>; Thu,  5 Oct 2023 13:52:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E88910E40E;
	Thu,  5 Oct 2023 13:52:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1B8810E40A
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Oct 2023 13:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696513939; x=1728049939;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vH1ValGdcGpKilb1bLaqk7nkMSdlTs+ksaqxXJmAFF4=;
 b=kE/zPVVhLL+WMhqyK7fT8H2Opk/ar0MqwRgs93dWGac2hkD7L7Hxo/xx
 50a7xpFAmfMLYKfzQXG2ku18of9QVWgx6Y03s68ziGrWAtCv8RqFzNzNx
 csmFLAQKBgJmPJImJzi461XE5c+MKqj+wdBmJv4XZVlhj8T41PhuCExK1
 DFtbxwzvfaQ+poo9XMMPXNDLG7ogTSuCB3WLV7WgddYMCZZHk47oYX8AB
 3UpGQIqIBJZpUEYsSsJx4DaWE/R9TwqlzYa27+cMspnp3CFN3wtuughvQ
 fO5Z6iPJjUue0fbWCQF00TRve4zrrUKvedKueflcdEKeQ51kiOiCgxJjC g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="373857271"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="373857271"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2023 06:52:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="925593737"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="925593737"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by orsmga005.jf.intel.com with ESMTP; 05 Oct 2023 06:52:17 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  5 Oct 2023 19:29:16 +0530
Message-ID: <20231005135918.2345364-3-uma.shankar@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231005135918.2345364-1-uma.shankar@intel.com>
References: <20231005135918.2345364-1-uma.shankar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/3] drm/i915/display: Created exclusive version
 of vga decode setup
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
Cc: jani.nikula@intel.com, arun.r.murthy@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Current vga arbiter implementation in i915 needs a re-design.
The current approach would cause real problems if anyone actually
needs to talk another GPU using legacy VGA resources.

The main issue is that X becomes a slideshow if it thinks there
are multiple GPUs that have VGA decoding enabled as it insists
on adjusting the VGA routing pretty much for every little operation
involving any of the GPUs.

The cleanup will be planned for i915. Meanwhile to focus on Xe
upstreaming and have a cleaner separation, the said functionality
is being moved to a different file exclusive for i915. Xe driver
will re-use rest of the display code from i915.

v2: Addressed Jani Nikula's review comments.

v3: Dropped a duplicate function (Jani)

v4: Updated commit message with reasoning as sugested by Ville.

Signed-off-by: Uma Shankar <uma.shankar@intel.com>
Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20230929074306.1533859-1-uma.shankar@intel.com
(cherry picked from commit 5846cdfd3d58852cdc991e589de7535151a47a4e)
---
 drivers/gpu/drm/i915/display/intel_vga.c | 18 +-----------------
 drivers/gpu/drm/i915/soc/intel_gmch.c    | 14 ++++++++++++++
 drivers/gpu/drm/i915/soc/intel_gmch.h    |  2 ++
 3 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_vga.c b/drivers/gpu/drm/i915/display/intel_vga.c
index 286a0bdd28c6..4b98833bfa8c 100644
--- a/drivers/gpu/drm/i915/display/intel_vga.c
+++ b/drivers/gpu/drm/i915/display/intel_vga.c
@@ -3,11 +3,9 @@
  * Copyright © 2019 Intel Corporation
  */
 
-#include <linux/pci.h>
 #include <linux/vgaarb.h>
 
 #include <video/vga.h>
-
 #include "soc/intel_gmch.h"
 
 #include "i915_drv.h"
@@ -99,20 +97,6 @@ void intel_vga_reset_io_mem(struct drm_i915_private *i915)
 	vga_put(pdev, VGA_RSRC_LEGACY_IO);
 }
 
-static unsigned int
-intel_vga_set_decode(struct pci_dev *pdev, bool enable_decode)
-{
-	struct drm_i915_private *i915 = pdev_to_i915(pdev);
-
-	intel_gmch_vga_set_state(i915, enable_decode);
-
-	if (enable_decode)
-		return VGA_RSRC_LEGACY_IO | VGA_RSRC_LEGACY_MEM |
-		       VGA_RSRC_NORMAL_IO | VGA_RSRC_NORMAL_MEM;
-	else
-		return VGA_RSRC_NORMAL_IO | VGA_RSRC_NORMAL_MEM;
-}
-
 int intel_vga_register(struct drm_i915_private *i915)
 {
 
@@ -127,7 +111,7 @@ int intel_vga_register(struct drm_i915_private *i915)
 	 * then we do not take part in VGA arbitration and the
 	 * vga_client_register() fails with -ENODEV.
 	 */
-	ret = vga_client_register(pdev, intel_vga_set_decode);
+	ret = vga_client_register(pdev, intel_gmch_vga_set_decode);
 	if (ret && ret != -ENODEV)
 		return ret;
 
diff --git a/drivers/gpu/drm/i915/soc/intel_gmch.c b/drivers/gpu/drm/i915/soc/intel_gmch.c
index 49c7fb16e934..f32e9f78770a 100644
--- a/drivers/gpu/drm/i915/soc/intel_gmch.c
+++ b/drivers/gpu/drm/i915/soc/intel_gmch.c
@@ -5,6 +5,7 @@
 
 #include <linux/pci.h>
 #include <linux/pnp.h>
+#include <linux/vgaarb.h>
 
 #include <drm/drm_managed.h>
 #include <drm/i915_drm.h>
@@ -167,3 +168,16 @@ int intel_gmch_vga_set_state(struct drm_i915_private *i915, bool enable_decode)
 
 	return 0;
 }
+
+unsigned int intel_gmch_vga_set_decode(struct pci_dev *pdev, bool enable_decode)
+{
+	struct drm_i915_private *i915 = pdev_to_i915(pdev);
+
+	intel_gmch_vga_set_state(i915, enable_decode);
+
+	if (enable_decode)
+		return VGA_RSRC_LEGACY_IO | VGA_RSRC_LEGACY_MEM |
+		       VGA_RSRC_NORMAL_IO | VGA_RSRC_NORMAL_MEM;
+	else
+		return VGA_RSRC_NORMAL_IO | VGA_RSRC_NORMAL_MEM;
+}
diff --git a/drivers/gpu/drm/i915/soc/intel_gmch.h b/drivers/gpu/drm/i915/soc/intel_gmch.h
index d0133eedc720..23be2d113afd 100644
--- a/drivers/gpu/drm/i915/soc/intel_gmch.h
+++ b/drivers/gpu/drm/i915/soc/intel_gmch.h
@@ -8,11 +8,13 @@
 
 #include <linux/types.h>
 
+struct pci_dev;
 struct drm_i915_private;
 
 int intel_gmch_bridge_setup(struct drm_i915_private *i915);
 void intel_gmch_bar_setup(struct drm_i915_private *i915);
 void intel_gmch_bar_teardown(struct drm_i915_private *i915);
 int intel_gmch_vga_set_state(struct drm_i915_private *i915, bool enable_decode);
+unsigned int intel_gmch_vga_set_decode(struct pci_dev *pdev, bool enable_decode);
 
 #endif /* __INTEL_GMCH_H__ */
-- 
2.42.0

