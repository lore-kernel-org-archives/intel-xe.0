Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FBC5EB64DA
	for <intel-xe@archiver.kernel.org>; Thu, 22 Jun 2023 20:17:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC2F210E053;
	Thu, 22 Jun 2023 20:17:10 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3742D10E053
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Jun 2023 20:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687465029; x=1719001029;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=SMN0ZZsuilJLkEot8yw5vQUeYWv3HHPrIEQWwr4a9Ek=;
 b=ikznRk751Fr5h1I/d4cGOVTAmCQkGK4kJed4+l32gNSQ6YaCuT/g4b3Z
 0RNV0SiDw0vF0Y+svzrJBsysNpZJEQvM2WAQqZsZgIqZtGkEJ3nqvM1wr
 D6+TvryL4SFvcyLTZ6ZtEhcTXVFzSz4q2XOQ3GsCIXv+qYXVjLabpod2h
 i7JzPgdl7G/e2YhGqSQekJAnKVJHQ9o49QJH+3zDZ50Mo/1PHID4XBpT3
 aRVVw6Y2A9tkcKIQI/1RgBdFmdweSx/Aj89uzKYwfwA/TCZCqP7qXoUdw
 e1Ck0BTO2mxO+FLpyyxl9+YFhKET268WBhC+fhsneN4bPY8pgE0St8cfi Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="360631824"
X-IronPort-AV: E=Sophos;i="6.01,149,1684825200"; d="scan'208";a="360631824"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2023 13:17:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="709212817"
X-IronPort-AV: E=Sophos;i="6.01,149,1684825200"; d="scan'208";a="709212817"
Received: from awvttsim-04.aw.intel.com (HELO awvttsim-04.ph.intel.com)
 ([10.228.212.165])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2023 13:17:07 -0700
From: David Kershner <david.kershner@intel.com>
To: david.kershner@intel.com, intel-xe@lists.freedesktop.org,
 michael.j.ruhl@intel.com, john.fleck@intel.com
Date: Thu, 22 Jun 2023 16:16:54 -0400
Message-Id: <20230622201656.2824543-2-david.kershner@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230622201656.2824543-1-david.kershner@intel.com>
References: <20230622201656.2824543-1-david.kershner@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 1/3] drm/xe: Introduce a module parameter to
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

