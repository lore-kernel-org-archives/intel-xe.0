Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3289AE93711
	for <intel-xe@archiver.kernel.org>; Thu,  5 Oct 2023 13:52:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00D6310E40D;
	Thu,  5 Oct 2023 13:52:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72D9E10E40D
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Oct 2023 13:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696513941; x=1728049941;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+pIdObkFlNyBiF5kSi0xdYYVGI24xezUXsYxLiYY6FI=;
 b=g8EeaI64GiZjb5/6fWCE2LkGmHGqCRYyhqDGunY8HYe9HtcCI7uemoGL
 rMaZhUTmvxutEuAbY0QTq7Kwq2MW+sywSglURTFugyH1dEzzF6ShTTLXX
 QdP2Cf1FN36/3TMtf6xgPpoh901N8/M+B6lSswnUt+PlTPT9KnEaGnQWJ
 EcCdqDa0vCpI/M5VpH8hVdY/VYppn8zDuYi7TG3A9mnNIay9a7gYoRIrB
 70uzCA+zGOMdMKx8Dud6LH0yCrThsAwM1EMDrMS68P9RE5XtVPBybVqvh
 L60HdIDWCzQlk4oC+lm3dLl2c15cRdsLCF5KAmoSp77QRmzLa4YorpZRF Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="373857276"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="373857276"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2023 06:52:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="925593750"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="925593750"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by orsmga005.jf.intel.com with ESMTP; 05 Oct 2023 06:52:19 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  5 Oct 2023 19:29:17 +0530
Message-ID: <20231005135918.2345364-4-uma.shankar@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231005135918.2345364-1-uma.shankar@intel.com>
References: <20231005135918.2345364-1-uma.shankar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 3/3] drm/xe: Create a dummy version for vga decode
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

This implements an exclusive version of vga decode for xe.
Rest of the display changes will be re-used from i915.

Currently it adds just a dummy implementation. VGA decode
needs to be handled correctly in i915, proper implementation
will be adopted once the i915 changes are finalized and merged
upstream.

Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/xe/Makefile                  |  1 +
 drivers/gpu/drm/xe/display/xe_display_misc.c | 13 +++++++++++++
 2 files changed, 14 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/display/xe_display_misc.c

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index dff1386ee6b3..175a357366d9 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -150,6 +150,7 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
 	display/xe_hdcp_gsc.o \
 	display/xe_plane_initial.o \
 	display/xe_display_rps.o \
+	display/xe_display_misc.o \
 	display/ext/i915_irq.o \
 	display/ext/i915_utils.o
 
diff --git a/drivers/gpu/drm/xe/display/xe_display_misc.c b/drivers/gpu/drm/xe/display/xe_display_misc.c
new file mode 100644
index 000000000000..4f2392f911ce
--- /dev/null
+++ b/drivers/gpu/drm/xe/display/xe_display_misc.c
@@ -0,0 +1,13 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include "intel_display_types.h"
+
+struct pci_dev;
+
+unsigned int intel_gmch_vga_set_decode(struct pci_dev *pdev, bool enable_decode)
+{
+	return 0;
+}
-- 
2.42.0

