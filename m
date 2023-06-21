Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F3E5EB64DC
	for <intel-xe@archiver.kernel.org>; Wed, 21 Jun 2023 19:41:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 580A010E356;
	Wed, 21 Jun 2023 19:41:56 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 225F810E353
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Jun 2023 19:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687376515; x=1718912515;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=SMN0ZZsuilJLkEot8yw5vQUeYWv3HHPrIEQWwr4a9Ek=;
 b=GegxgaaQ7efMn24kHUr6w1aVGT38/SfR8TD0CXOo9xWBqGVm+vy1wV4M
 8kU/Icat3s76QZVQ7Qc3KWuT/Ku+oHjrQWrwVYO9bjGHxhA+AGBJNddwY
 87fXw4/0kppvUosNiNcvVetL/t/75KBqZ+sFwleFEVda256vPw0j7roBU
 gN0iAeth/op/K/PgBRsP6TZsxaNqoy/IPrvwRVxR9moObV6BCSCNBvHKR
 XGxz4pYYqVot+X2I9UqrVgZC4pOwDz6qKbs4c1fD64WmSx2SKFcg1KMiW
 254d0H7TkKvlJmnuilCG5JK9cm6bvlUkbRPQOWFsOh23orpyRMifwCBvX w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="426230929"
X-IronPort-AV: E=Sophos;i="6.00,261,1681196400"; d="scan'208";a="426230929"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2023 12:41:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="804504226"
X-IronPort-AV: E=Sophos;i="6.00,261,1681196400"; d="scan'208";a="804504226"
Received: from awvttsim-04.aw.intel.com (HELO awvttsim-04.ph.intel.com)
 ([10.228.212.165])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2023 12:41:53 -0700
From: David Kershner <david.kershner@intel.com>
To: david.kershner@intel.com, intel-xe@lists.freedesktop.org,
 michael.j.ruhl@intel.com, john.fleck@intel.com
Date: Wed, 21 Jun 2023 15:41:23 -0400
Message-Id: <20230621194125.2052211-2-david.kershner@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230621194125.2052211-1-david.kershner@intel.com>
References: <20230621194125.2052211-1-david.kershner@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/3] drm/xe: Introduce a module parameter to
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

