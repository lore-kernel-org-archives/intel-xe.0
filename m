Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49535E81DE9
	for <intel-xe@archiver.kernel.org>; Fri,  6 Oct 2023 11:49:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11B5610E1F8;
	Fri,  6 Oct 2023 11:49:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5F9410E4D7
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Oct 2023 11:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696592991; x=1728128991;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aGTb8CGwxmn+XU7p/LCaXql62RFlnloiJUFhvgvliPA=;
 b=R9wb3FQRVOBmNjIjMJsOwg4ofTiNrHPlGUTmYQLxVZTQ/jdRd5Q/KjlF
 K6fD0xtMaBp2/TNS+Ze7CghfYNL8LEJ8LCBKGNxRr0h6CBn7lSIfrWtHn
 xP8nx0BoMj7ho/HABM66zrPOND/r3/gZEr/hez2BcTnUt9IOSR4FmmBVF
 6jTj+GZtfD/i7Drcl9AiZWvPWeD8PnlvMztuNlX2UPCtGHXKgrGb9Fij+
 53OA8y6CH+6FZGMhvBBZv8ApMKkgywfSNHhpLvU9SptvFRBhXcxqZeB8Q
 UZEvea778fYIUxn3pq/EKTrYsbNdWRl/pk3KObneR6D811T7HRd8bP+Mr A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="414731377"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; d="scan'208";a="414731377"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2023 04:49:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="1083423657"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; d="scan'208";a="1083423657"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by fmsmga005.fm.intel.com with ESMTP; 06 Oct 2023 04:49:48 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  6 Oct 2023 17:26:45 +0530
Message-ID: <20231006115645.2402795-4-uma.shankar@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231006115645.2402795-1-uma.shankar@intel.com>
References: <20231006115645.2402795-1-uma.shankar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [v2 3/3] drm/xe: Create a dummy version for vga decode
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

This introduces an exclusive version of vga decode for xe.
Rest of the display changes will be re-used from i915.

Currently it adds just a dummy implementation. VGA decode
needs to be handled correctly in i915, proper implementation
will be adopted once the i915 changes are finalized and merged
in upstream.

v2: Addressed Arun's review comments

Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/xe/Makefile                  |  1 +
 drivers/gpu/drm/xe/display/xe_display_misc.c | 14 ++++++++++++++
 2 files changed, 15 insertions(+)
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
index 000000000000..81ff97e704ea
--- /dev/null
+++ b/drivers/gpu/drm/xe/display/xe_display_misc.c
@@ -0,0 +1,14 @@
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
+	/* ToDo: Implement the actual handling of vga decode */
+	return 0;
+}
-- 
2.42.0

