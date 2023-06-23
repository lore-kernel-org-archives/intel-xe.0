Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE133EB64DD
	for <intel-xe@archiver.kernel.org>; Fri, 23 Jun 2023 04:13:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74BC610E5D3;
	Fri, 23 Jun 2023 04:13:07 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0839D10E5D2
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Jun 2023 04:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687493585; x=1719029585;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=SMN0ZZsuilJLkEot8yw5vQUeYWv3HHPrIEQWwr4a9Ek=;
 b=KRrwPnV0KwbnSAIfmfgvI4mO20/alquElbkfxPMPU/LSvLUiSiaz9YgP
 A8RfSppFwL1OivWYE8oKODlx551vTM9Myr97kirOOk3dC70OmDvMBq571
 g7Sn+ZLaLNqd2gfzZVEBI+QApz1Z56JK8mq4LGLz51p5OxgsFQU5XqT1p
 8yA3gknrr0dqOIaFgJBDoIUSUb1JCsIEGTEFQ74mvXgJVA/mhNWSJ1fjg
 kw/T7EwuRNsfXo5uyqr7R5Lfv/iZfhoWlXHZupd0l6MPvs7LCgLJLwZpY
 06xHYZaWk6A2twT0eI2xBbjucQI40QDR2x1juFqt8hsOvvKe2MMwsEciS g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="447056726"
X-IronPort-AV: E=Sophos;i="6.01,150,1684825200"; d="scan'208";a="447056726"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2023 21:13:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="828226800"
X-IronPort-AV: E=Sophos;i="6.01,150,1684825200"; d="scan'208";a="828226800"
Received: from awvttsim-04.aw.intel.com (HELO awvttsim-04.ph.intel.com)
 ([10.228.212.165])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2023 21:13:03 -0700
From: David Kershner <david.kershner@intel.com>
To: david.kershner@intel.com, intel-xe@lists.freedesktop.org,
 michael.j.ruhl@intel.com, john.fleck@intel.com
Date: Fri, 23 Jun 2023 00:12:55 -0400
Message-Id: <20230623041257.3550266-2-david.kershner@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230623041257.3550266-1-david.kershner@intel.com>
References: <20230623041257.3550266-1-david.kershner@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 1/3] drm/xe: Introduce a module parameter to
 control IAF
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

Add a new module parameter to control enable/disable of the IAF
feature.

Signed-off-by: David Kershner <david.kershner@intel.com>
---
 drivers/gpu/drm/xe/Makefile |  1 +
 drivers/gpu/drm/xe/xe_iaf.c | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_iaf.c

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 081c57fd8632..b2a992884c0f 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -75,6 +75,7 @@ xe-y += xe_bb.o \
 	xe_hw_fence.o \
 	xe_huc.o \
 	xe_huc_debugfs.o \
+	xe_iaf.o \
 	xe_irq.o \
 	xe_lrc.o \
 	xe_migrate.o \
diff --git a/drivers/gpu/drm/xe/xe_iaf.c b/drivers/gpu/drm/xe/xe_iaf.c
new file mode 100644
index 000000000000..0049e6854f80
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_iaf.c
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include <linux/moduleparam.h>
+
+/*
+ * This module parameter is needed because SRIOV PF and IAF are mutually
+ * exclusive (see HSDES #14014623804).  Until this is fixed, the driver
+ * needs to be able to enable/disable the IAF infrastructure (specifically
+ * Device Physical Addressing).  Since there will be no enable/disable for the
+ * SRIOV PF path, this parameter is needed to explicitly disable IAF when
+ * SRIOV PF is required.
+ */
+static bool xe_enable_iaf;
+module_param_named(enable_iaf, xe_enable_iaf, bool, 0400);
+MODULE_PARM_DESC(enable_iaf, "Enable IAF feature (default: true)");
-- 
2.35.1

