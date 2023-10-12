Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7C49CDB46E
	for <intel-xe@archiver.kernel.org>; Thu, 12 Oct 2023 12:58:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA60F10E4C9;
	Thu, 12 Oct 2023 12:58:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A8BA10E4EA
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Oct 2023 12:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697115530; x=1728651530;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VK1gXfK5GlAq2zrsNYXRbO6tIdFHtVPTH0VEqiQLdnk=;
 b=Mt81A8jrY+ZIXBDphTJOE5zfqqLKgYIR7QUgyAQBhCQAynZ80Q9txpNw
 8xgIL4aANZ16YCWkncTHGtlFZa4pbAwZ9GuU+xd1i4EGZdHjM6qVWTiKl
 drocl9tzWXbBaUZ3Ywj1xKTde72BhRoLS1OcPbDJDscI4Tbo/QVB2Q0YG
 bqd9UYyOl76odoXrMiVOOLJ4NhUcXuUeAVs8vuS5pZ+DGQORx4V9y5nql
 YTUpnf3WSHvHiWsUf7Yg6keuGOOBQvCdRpKJj5CnTncdOTeTBJEMPssUe
 L2B5sNYhhAg0lcQpdOJBXWF+8/xKumG36pNhLo0/iFPp9fPzRmn0Juktl w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="375259088"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; d="scan'208";a="375259088"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 05:58:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="1001541553"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; d="scan'208";a="1001541553"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by fmsmga006.fm.intel.com with ESMTP; 12 Oct 2023 05:58:48 -0700
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 12 Oct 2023 18:24:10 +0530
Message-Id: <20231012125410.2127337-7-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231012125410.2127337-1-chaitanya.kumar.borah@intel.com>
References: <20231012125410.2127337-1-chaitanya.kumar.borah@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 6/6] fixup! drm/xe/display: Implement display
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add definition for INTEL_UC_FIRMWARE_URL to maintain compatibility
with intel_dmc code.

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
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
index 000000000000..7d37bc453165
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
+#define INTEL_UC_FIRMWARE_URL "https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/i915"
+
+#endif
-- 
2.25.1

