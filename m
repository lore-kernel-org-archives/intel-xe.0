Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA34BC001DB
	for <intel-xe@archiver.kernel.org>; Tue,  8 Aug 2023 16:45:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7675410E3C0;
	Tue,  8 Aug 2023 16:45:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BA9010E3B8
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Aug 2023 16:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691513149; x=1723049149;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=5VFzSF6JIX+Yi/VJUBHuwmgR2PfRY1X6Y32WAyN5JYw=;
 b=ahx7+o5iCb846vzYY0QHMb4xZDu7YCkl3EGeFHYNUm6fvLpedqiRneBk
 f1ziT9fKiUt3MYaQDdaDj61PnX55ysHapKBNCr/qqhXUR7XBj91lphL1x
 OtOKlHEmmNhhxj2UidgSPUh9LBmIB9udKQQDiRVjJFtrwdDHxSxIQx7Ph
 NPsgqkKBonGElv6gMChVM7NqhzNtO2e82Aw0ixIJhGjQbFikB6hfMuGo4
 YNTMu9oa132xqp2WGJ0MxhkOe2cBjWI5mZBtr0JpTNFHXMaGC3P/xydio
 Hmjk25HmuNQEP51c6GF7aWQeGUDiRA+VcRKnUsyaxlCAMQEa6VPeLNOJs A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="457267545"
X-IronPort-AV: E=Sophos;i="6.01,156,1684825200"; d="scan'208";a="457267545"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2023 09:45:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="766431649"
X-IronPort-AV: E=Sophos;i="6.01,156,1684825200"; d="scan'208";a="766431649"
Received: from awvttsim-04.aw.intel.com (HELO awvttsim-04.ph.intel.com)
 ([10.228.212.165])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2023 09:45:43 -0700
From: David Kershner <david.kershner@intel.com>
To: david.kershner@intel.com, intel-xe@lists.freedesktop.org,
 michael.j.ruhl@intel.com, john.fleck@intel.com, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com, matthew.d.roper@intel.com, matthew.brost@intel.com
Date: Tue,  8 Aug 2023 12:45:32 -0400
Message-Id: <20230808164534.1027552-2-david.kershner@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230808164534.1027552-1-david.kershner@intel.com>
References: <20230808164534.1027552-1-david.kershner@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/3] drm/xe: Introduce a module parameter to
 control XeLink
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

Add a new module parameter to control enable/disable of the XeLink
feature.

Signed-off-by: David Kershner <david.kershner@intel.com>
---
 drivers/gpu/drm/xe/Makefile    |  3 ++-
 drivers/gpu/drm/xe/xe_xelink.c | 17 +++++++++++++++++
 2 files changed, 19 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/xe/xe_xelink.c

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 1b59702cd9f9..d46558cf12a9 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -115,7 +115,8 @@ xe-y += xe_bb.o \
 	xe_vm_madvise.o \
 	xe_wait_user_fence.o \
 	xe_wa.o \
-	xe_wopcm.o
+	xe_wopcm.o \
+	xe_xelink.o
 
 # i915 Display compat #defines and #includes
 subdir-ccflags-$(CONFIG_DRM_XE_DISPLAY) += \
diff --git a/drivers/gpu/drm/xe/xe_xelink.c b/drivers/gpu/drm/xe/xe_xelink.c
new file mode 100644
index 000000000000..51a31f6a4740
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_xelink.c
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include <linux/moduleparam.h>
+
+/*
+ * This module parameter is needed because SRIOV PF and XeLink are mutually
+ * exclusive. The driver needs to be able to enable/disable the XeLink
+ * infrastructure (specifically Device Physical Addressing).  Since there
+ * will be no enable/disable for the SRIOV PF path, this parameter is
+ * needed to explicitly disable XeLink when SRIOV PF is required.
+ */
+static bool xe_enable_xelink = true;
+module_param_named(enable_xelink, xe_enable_xelink, bool, 0400);
+MODULE_PARM_DESC(enable_xelink, "Enable XeLink feature (default: true)");
-- 
2.35.1

