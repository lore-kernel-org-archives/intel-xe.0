Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88098C46CA1
	for <intel-xe@archiver.kernel.org>; Mon, 18 Sep 2023 17:30:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B7CC10E29C;
	Mon, 18 Sep 2023 17:30:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6939B10E0E8
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Sep 2023 17:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695058211; x=1726594211;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2NasScHhdhf8e9u6RU3UzRjl22+6ixdlYfni54QZYgE=;
 b=HgAQ/bdvFLKuXfsmmXTDYM9UvLj4n0cHRR8g3gHyyi40N8lR8MTRAkvz
 89qobtCGsE8UD9FU0binODnDCKkNTiOQQiQ3+c4oo3uCUdbnkalNA3CtJ
 fEGCET9tL5CvIKlEoZV9O14M8oenwCc466t5uDKeUAGYq06UJ7n7Fk8Ly
 8IGViJsCiocNHnUFh+AdPUm2L2jrPWtWqgc2WQyswV29KhqSI8rbkBsfd
 3YOE+Iwup0jqo0Zen4+3d6cCAAYiFUkCd7Bf6yETaothRLeLZLYtXb3FW
 B7xHbUVQO1EWV99M0bzmCgEXZdHU772ZqTyvElnGGW7LDDzZf0waDvRMv A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="359140660"
X-IronPort-AV: E=Sophos;i="6.02,157,1688454000"; d="scan'208";a="359140660"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2023 10:30:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="919543200"
X-IronPort-AV: E=Sophos;i="6.02,157,1688454000"; d="scan'208";a="919543200"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by orsmga005.jf.intel.com with ESMTP; 18 Sep 2023 10:30:09 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 18 Sep 2023 23:07:09 +0530
Message-ID: <20230918173711.625930-2-uma.shankar@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230918173711.625930-1-uma.shankar@intel.com>
References: <20230918173711.625930-1-uma.shankar@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/3] drm/i915/display: Add a wrapper function for
 vga decode setup
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
Cc: jani.nikula@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Some of the VGA functionality is not needed by the proposed
Intel Xe driver. Adding a wrapper function for VGA decode setup.

Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/soc/intel_gmch.c | 14 ++++++++++++++
 drivers/gpu/drm/i915/soc/intel_gmch.h |  1 +
 2 files changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/i915/soc/intel_gmch.c b/drivers/gpu/drm/i915/soc/intel_gmch.c
index 49c7fb16e934..818f0b7f62a2 100644
--- a/drivers/gpu/drm/i915/soc/intel_gmch.c
+++ b/drivers/gpu/drm/i915/soc/intel_gmch.c
@@ -12,6 +12,7 @@
 #include "i915_drv.h"
 #include "intel_gmch.h"
 #include "intel_pci_config.h"
+#include <linux/vgaarb.h>
 
 static void intel_gmch_bridge_release(struct drm_device *dev, void *bridge)
 {
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
index d0133eedc720..88db1653ffc9 100644
--- a/drivers/gpu/drm/i915/soc/intel_gmch.h
+++ b/drivers/gpu/drm/i915/soc/intel_gmch.h
@@ -14,5 +14,6 @@ int intel_gmch_bridge_setup(struct drm_i915_private *i915);
 void intel_gmch_bar_setup(struct drm_i915_private *i915);
 void intel_gmch_bar_teardown(struct drm_i915_private *i915);
 int intel_gmch_vga_set_state(struct drm_i915_private *i915, bool enable_decode);
+unsigned int intel_gmch_vga_set_decode(struct pci_dev *pdev, bool enable_decode);
 
 #endif /* __INTEL_GMCH_H__ */
-- 
2.42.0

