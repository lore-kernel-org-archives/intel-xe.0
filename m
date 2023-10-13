Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F71ACDB482
	for <intel-xe@archiver.kernel.org>; Fri, 13 Oct 2023 06:58:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5C4010E5C7;
	Fri, 13 Oct 2023 06:58:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59BFF10E5C2
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Oct 2023 06:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697180284; x=1728716284;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NSJ8Eo6MgbLKsCNLLT6EhMnugHo1OOGMIcHR5bbvaE8=;
 b=ZvPEb8yoUrk+jtn2EcPrdqMAEMYEbnZ3qUwwwNfleXJ84s9xR9UofPuO
 iJPid+zibwp1FEwDSADHyTSBt0YP3YgUOBdh3SEuf5lxoN6T5rUHmq2R3
 N2xUILY8zfIw9kLOvitKlbxoBUtoEKGcoplu7CSm0ZPjgEfHr+RGFYQi6
 XOtbXEdh4lvDZVxCqj/5EH0iyRg77x9mey550/1y8z1AqwGYyGv7A5r5Y
 TfPVj/hjkO8AnhEYsQvQGDejp5zO7UtBP2jA6kzTVQoCJ8v7V9xivlm6L
 fvf4LOj5p5TBgR3XFVPVe3C9Q052uHUW7dLyTg7xV0ZEQuWx/Qw5J3DU9 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="384954572"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; d="scan'208";a="384954572"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 23:58:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="731243528"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; d="scan'208";a="731243528"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by orsmga006.jf.intel.com with ESMTP; 12 Oct 2023 23:58:01 -0700
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 13 Oct 2023 12:23:23 +0530
Message-Id: <20231013065323.2233783-7-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231013065323.2233783-1-chaitanya.kumar.borah@intel.com>
References: <20231013065323.2233783-1-chaitanya.kumar.borah@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 6/6] fixup! drm/xe/display: Implement display
 support
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
Cc: lucas.demarchi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add definition for INTEL_UC_FIRMWARE_URL to maintain compatibility
with intel_dmc code.

v2: Do not specify directory for firmware repository path

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h    |  1 +
 drivers/gpu/drm/xe/compat-i915-headers/intel_uc_fw.h | 11 +++++++++++
 2 files changed, 12 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/intel_uc_fw.h

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
index 9cbe16863be2..4e922446e40e 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
@@ -22,6 +22,7 @@
 #include "i915_utils.h"
 #include "intel_gt_types.h"
 #include "intel_step.h"
+#include "intel_uc_fw.h"
 #include "intel_uncore.h"
 #include "intel_runtime_pm.h"
 #include <linux/pm_runtime.h>
diff --git a/drivers/gpu/drm/xe/compat-i915-headers/intel_uc_fw.h b/drivers/gpu/drm/xe/compat-i915-headers/intel_uc_fw.h
new file mode 100644
index 000000000000..009745328992
--- /dev/null
+++ b/drivers/gpu/drm/xe/compat-i915-headers/intel_uc_fw.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _INTEL_UC_FW_H_
+#define _INTEL_UC_FW_H_
+
+#define INTEL_UC_FIRMWARE_URL "https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git"
+
+#endif
-- 
2.25.1

