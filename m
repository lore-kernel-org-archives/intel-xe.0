Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B216CD6E63
	for <intel-xe@archiver.kernel.org>; Wed, 11 Oct 2023 12:26:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3259F10E795;
	Wed, 11 Oct 2023 12:26:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61DB410E793
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Oct 2023 12:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697027211; x=1728563211;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5Lm5XaJUl9utqHm64CchAwYkWWN/mOeu78/dGGAqP5g=;
 b=FDrj1RzoX3C/WKYq28QvlhuCTqY+GYBpWEm1YHcFSzaQ9yQsT7DQWdqt
 ew4zX9Lew/6A3FMzMxLeDFWYwjceYZLpcVrra/ONqo5G6cQHxxh7ywuBD
 yRnWBMLfSCLXwMvCUgcwGEWqZGw6u1OvQ/WpU83rqU6isPfQ3Y0zJbSxu
 5Nwn3x4sc2/lbdFZtc6Byh5alLmmmgsye25ennqMd1oC+hZkPTKZPkRBR
 4ZYuI6uEE8W8WrdlNv6A1sg9vLw/4y3Uq1y5C9lZLJn7g6fESHTXlboFX
 p+ombfy61BTicNCH49OzYUrSUW1PjqxCAZm6h0otUqQY0t4dddtyH6t5n g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="364010344"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; d="scan'208";a="364010344"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 05:26:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="844543944"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; d="scan'208";a="844543944"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by FMSMGA003.fm.intel.com with ESMTP; 11 Oct 2023 05:26:49 -0700
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 11 Oct 2023 17:52:15 +0530
Message-Id: <20231011122215.2025850-7-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231011122215.2025850-1-chaitanya.kumar.borah@intel.com>
References: <20231011122215.2025850-1-chaitanya.kumar.borah@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 6/6] drm/xe: Add intel_uc_fw.h compatibility
 header
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
 drivers/gpu/drm/xe/compat-i915-headers/intel_uc_fw.h | 12 ++++++++++++
 2 files changed, 13 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/intel_uc_fw.h

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
index 56a9de859bf9..5cb8582c9846 100644
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
index 000000000000..c0c8d13acd40
--- /dev/null
+++ b/drivers/gpu/drm/xe/compat-i915-headers/intel_uc_fw.h
@@ -0,0 +1,12 @@
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
+
-- 
2.25.1

