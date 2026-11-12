Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB42F606A321
	for <intel-xe@archiver.kernel.org>; Thu, 12 Nov 2026 21:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kEFf59Xj
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 715F610EBDA;
	Thu, 12 Nov 2026 21:35:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 892C411236A
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Nov 2026 21:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794519326; x=1826055326;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VXdcl4LO16WU3zFVz5Bd8OxvFZnpjU4JSaNU3uuO29I=;
 b=kEFf59Xj+jXiynYX2NUpeaDLvYq3B8oyFlaFvBYoP9ykPy2ga1voQ+2W
 C9T3+wxtkCpW0a8yRaAZInHvlg4t3+dc5T9j65OCBBTcsxNLTRDdfSsnn
 zXAxdKW5HeJxodRIM+Y/1jrRMxgee/3jabNbY7gRCDBOwVzcXQcqw+1Ko
 3X8ZbAUFkPZnH0TNbOHM3vqTRrWQU4WQJYIbyK+lkgtoGWXCVQfy3e3jz
 8DOPMt9dFISbW0QNDyk7Cyg2gI40QSXsJOceom25nohcYZhXNGDH4eEc3
 IG/n0cqN8FlCe9ToeSR7DcMF+oin7Vfn6/t9CelpkyQk1FPF1AsnM0ojw Q==;
X-CSE-ConnectionGUID: 6XsNI6W+STGROPAzp7nb1Q==
X-CSE-MsgGUID: gN/UmdcyQIOALW4/o+ynww==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3351728"
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="3351728"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 13:35:12 -0800
X-CSE-ConnectionGUID: 0BFiNJUESzCKWSws3tEOqw==
X-CSE-MsgGUID: gm4+JDIoQsGaHqYAfoKO7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="8754543"
Received: from dut4463arlhx.fm.intel.com ([10.105.10.189])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 13:35:12 -0800
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.d.roper@intel.com, gustavo.sousa@intel.com,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 8/8] drm/xe: Add a new debug focused configfs group
Date: Thu, 12 Nov 2026 21:35:13 +0000
Message-ID: <20261112213508.457213-18-stuart.summers@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261112213508.457213-10-stuart.summers@intel.com>
References: <20261112213508.457213-10-stuart.summers@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add the skeleton code for a new debug specific configfs group.
Just add the structure for now. Actual debug content will be
added in a subsequent patch.

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/Makefile            |  3 +++
 drivers/gpu/drm/xe/xe_configfs.c       |  5 +++++
 drivers/gpu/drm/xe/xe_configfs_debug.c | 14 ++++++++++++++
 drivers/gpu/drm/xe/xe_configfs_debug.h | 13 +++++++++++++
 drivers/gpu/drm/xe/xe_configfs_types.h |  3 +++
 5 files changed, 38 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_configfs_debug.c
 create mode 100644 drivers/gpu/drm/xe/xe_configfs_debug.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 0392ba58dd65..57e74a8039d0 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -168,6 +168,9 @@ xe-$(CONFIG_HWMON) += xe_hwmon.o
 
 xe-$(CONFIG_PERF_EVENTS) += xe_pmu.o
 xe-$(CONFIG_CONFIGFS_FS) += xe_configfs.o
+ifeq ($(CONFIG_CONFIGFS_FS),y)
+xe-$(CONFIG_DRM_XE_DEBUG) += xe_configfs_debug.o
+endif
 
 xe-$(CONFIG_UEFI_CPER) += xe_cper.o \
 			  xe_trace_cper.o
diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index e810cd2a00be..8547fc53fc2f 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -14,6 +14,7 @@
 
 #include "instructions/xe_mi_commands.h"
 #include "xe_configfs.h"
+#include "xe_configfs_debug.h"
 #include "xe_defaults.h"
 #include "xe_gt_types.h"
 #include "xe_module.h"
@@ -1407,6 +1408,10 @@ static struct config_group *xe_config_make_device_group(struct config_group *gro
 		config_group_init_type_name(&dev->sriov, "sriov", &xe_config_sriov_type);
 		configfs_add_default_group(&dev->sriov, &dev->group);
 	}
+#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
+	config_group_init_type_name(&dev->debug, "debug", &xe_configfs_debug_type);
+	configfs_add_default_group(&dev->debug, &dev->group);
+#endif
 
 	mutex_init(&dev->lock);
 
diff --git a/drivers/gpu/drm/xe/xe_configfs_debug.c b/drivers/gpu/drm/xe/xe_configfs_debug.c
new file mode 100644
index 000000000000..45617282cec5
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_configfs_debug.c
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#include <linux/configfs.h>
+#include <linux/module.h>
+
+#include "xe_configfs_debug.h"
+#include "xe_configfs_types.h"
+
+const struct config_item_type xe_configfs_debug_type = {
+	.ct_owner	= THIS_MODULE,
+};
diff --git a/drivers/gpu/drm/xe/xe_configfs_debug.h b/drivers/gpu/drm/xe/xe_configfs_debug.h
new file mode 100644
index 000000000000..5f938450aed2
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_configfs_debug.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+#ifndef _XE_CONFIGFS_DEBUG_H_
+#define _XE_CONFIGFS_DEBUG_H_
+
+#if IS_ENABLED(CONFIG_DRM_XE_DEBUG) && IS_ENABLED(CONFIG_CONFIGFS_FS)
+struct config_item_type;
+extern const struct config_item_type xe_configfs_debug_type;
+#endif
+
+#endif /* _XE_CONFIGFS_DEBUG_H_ */
diff --git a/drivers/gpu/drm/xe/xe_configfs_types.h b/drivers/gpu/drm/xe/xe_configfs_types.h
index b1e351761d69..3a9ab40d519b 100644
--- a/drivers/gpu/drm/xe/xe_configfs_types.h
+++ b/drivers/gpu/drm/xe/xe_configfs_types.h
@@ -22,6 +22,9 @@ struct wa_bb {
 struct xe_config_group_device {
 	struct config_group group;
 	struct config_group sriov;
+#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
+	struct config_group debug;
+#endif
 
 	/*
 	 * Fields sorted by type (largest first) then name: struct arrays,
-- 
2.43.0

