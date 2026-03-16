Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0938F53D6E
	for <intel-xe@archiver.kernel.org>; Mon, 16 Mar 2026 16:08:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B39710E3C2;
	Mon, 16 Mar 2026 16:08:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gI2j0+79";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFD9210E3C2
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Mar 2026 16:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773677330; x=1805213330;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=iZ3Uehv/bEIJO909VLgULB2U8JcOQCPT0UanI6HMNC4=;
 b=gI2j0+79IZFvcwBLuv/Mg/qwMAGbfQUkSNjPIqy+oBq6cUQM2xUP/+ps
 Eox5EHaFFiKzlVjD7AvgRlGFjIzukSZEeqWgqZ7Rd1CIGYHZlGuXLSUIu
 ljjxNAomJO4ReCgVHfEIck0BNC9atOGtNoRW5Kt4MUHqhejUyH91KGKOa
 DkuavLqBcbq4bQH4YSvRq7XoMN1eNmTzIwPJJmov6kwxYADWf7aRU90Sk
 XlTBPaTf28SWPFLXao+Qk9hmFrecWP/i4pdshlfOjc11z6I/WeGomb1Nh
 RAd2nCVwdhtGC6/wiEU7gS6tCeXb7/4oCgJ9BlqSENxILq2C76KsmO4VJ w==;
X-CSE-ConnectionGUID: s/xQ5VSvTRWcNWjhQBoFkQ==
X-CSE-MsgGUID: VDYDT8QZTju0EU4PPDKuAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="73880639"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="73880639"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 09:08:34 -0700
X-CSE-ConnectionGUID: UIz8g+2wR7yezRO9dlHqDQ==
X-CSE-MsgGUID: kWu05j4EQBqfrtkU2q5aYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="221210310"
Received: from shosgclin.sh.intel.com ([10.112.232.103])
 by orviesa010.jf.intel.com with ESMTP; 16 Mar 2026 09:08:32 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Subject: [PATCH] drm/xe: Fix mismatched include guards in header files
Date: Mon, 16 Mar 2026 16:04:45 +0000
Message-ID: <20260316160451.1688247-2-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Fix include guard macros that don't match their respective file names:

- xe_gt_idle_types.h: _XE_GT_IDLE_SYSFS_TYPES_H_ -> _XE_GT_IDLE_TYPES_H_
- xe_guc_exec_queue_types.h: _XE_GUC_ENGINE_TYPES_H_ -> _XE_GUC_EXEC_QUEUE_TYPES_H_
- xe_heci_gsc.h: __XE_HECI_GSC_DEV_H__ -> _XE_HECI_GSC_H_
- xe_hw_engine_class_sysfs.h: _XE_ENGINE_CLASS_SYSFS_H_ -> _XE_HW_ENGINE_CLASS_SYSFS_H_
- xe_late_bind_fw_types.h: _XE_LATE_BIND_TYPES_H_ -> _XE_LATE_BIND_FW_TYPES_H_
- xe_platform_types.h: _XE_PLATFORM_INFO_TYPES_H_ -> _XE_PLATFORM_TYPES_H_
- xe_tile_printk.h: _xe_tile_printk_H_ -> _XE_TILE_PRINTK_H_

These guards appear to be leftovers from file renames or copy-paste
errors. Correcting them to follow the standard convention of matching
the file name prevents potential include guard collisions.

No functional change expected.

Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_idle_types.h         | 6 +++---
 drivers/gpu/drm/xe/xe_guc_exec_queue_types.h  | 4 ++--
 drivers/gpu/drm/xe/xe_heci_gsc.h              | 6 +++---
 drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h | 4 ++--
 drivers/gpu/drm/xe/xe_late_bind_fw_types.h    | 4 ++--
 drivers/gpu/drm/xe/xe_platform_types.h        | 4 ++--
 drivers/gpu/drm/xe/xe_tile_printk.h           | 4 ++--
 7 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_idle_types.h b/drivers/gpu/drm/xe/xe_gt_idle_types.h
index a3667c567f8a..5b5d2e835102 100644
--- a/drivers/gpu/drm/xe/xe_gt_idle_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_idle_types.h
@@ -3,8 +3,8 @@
  * Copyright © 2023 Intel Corporation
  */
 
-#ifndef _XE_GT_IDLE_SYSFS_TYPES_H_
-#define _XE_GT_IDLE_SYSFS_TYPES_H_
+#ifndef _XE_GT_IDLE_TYPES_H_
+#define _XE_GT_IDLE_TYPES_H_
 
 #include <linux/spinlock.h>
 #include <linux/types.h>
@@ -40,4 +40,4 @@ struct xe_gt_idle {
 	u64 (*idle_residency)(struct xe_guc_pc *pc);
 };
 
-#endif /* _XE_GT_IDLE_SYSFS_TYPES_H_ */
+#endif /* _XE_GT_IDLE_TYPES_H_ */
diff --git a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
index fd0915ed8eb1..e5e53b421f29 100644
--- a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
@@ -3,8 +3,8 @@
  * Copyright © 2022 Intel Corporation
  */
 
-#ifndef _XE_GUC_ENGINE_TYPES_H_
-#define _XE_GUC_ENGINE_TYPES_H_
+#ifndef _XE_GUC_EXEC_QUEUE_TYPES_H_
+#define _XE_GUC_EXEC_QUEUE_TYPES_H_
 
 #include <linux/spinlock.h>
 #include <linux/workqueue.h>
diff --git a/drivers/gpu/drm/xe/xe_heci_gsc.h b/drivers/gpu/drm/xe/xe_heci_gsc.h
index 745eb6783942..a76f4122b778 100644
--- a/drivers/gpu/drm/xe/xe_heci_gsc.h
+++ b/drivers/gpu/drm/xe/xe_heci_gsc.h
@@ -2,8 +2,8 @@
 /*
  * Copyright(c) 2023, Intel Corporation. All rights reserved.
  */
-#ifndef __XE_HECI_GSC_DEV_H__
-#define __XE_HECI_GSC_DEV_H__
+#ifndef _XE_HECI_GSC_H_
+#define _XE_HECI_GSC_H_
 
 #include <linux/types.h>
 
@@ -37,4 +37,4 @@ int xe_heci_gsc_init(struct xe_device *xe);
 void xe_heci_gsc_irq_handler(struct xe_device *xe, u32 iir);
 void xe_heci_csc_irq_handler(struct xe_device *xe, u32 iir);
 
-#endif /* __XE_HECI_GSC_DEV_H__ */
+#endif /* _XE_HECI_GSC_H_ */
diff --git a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h
index 28a0d7c909c0..37225c1ae528 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h
@@ -3,8 +3,8 @@
  * Copyright © 2023 Intel Corporation
  */
 
-#ifndef _XE_ENGINE_CLASS_SYSFS_H_
-#define _XE_ENGINE_CLASS_SYSFS_H_
+#ifndef _XE_HW_ENGINE_CLASS_SYSFS_H_
+#define _XE_HW_ENGINE_CLASS_SYSFS_H_
 
 #include <linux/kobject.h>
 
diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
index 2a8a985c37e7..7fdb24e810b3 100644
--- a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
+++ b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
@@ -3,8 +3,8 @@
  * Copyright © 2025 Intel Corporation
  */
 
-#ifndef _XE_LATE_BIND_TYPES_H_
-#define _XE_LATE_BIND_TYPES_H_
+#ifndef _XE_LATE_BIND_FW_TYPES_H_
+#define _XE_LATE_BIND_FW_TYPES_H_
 
 #include <linux/iosys-map.h>
 #include <linux/mutex.h>
diff --git a/drivers/gpu/drm/xe/xe_platform_types.h b/drivers/gpu/drm/xe/xe_platform_types.h
index 6cff385227ea..3447848b74e3 100644
--- a/drivers/gpu/drm/xe/xe_platform_types.h
+++ b/drivers/gpu/drm/xe/xe_platform_types.h
@@ -3,8 +3,8 @@
  * Copyright © 2022 Intel Corporation
  */
 
-#ifndef _XE_PLATFORM_INFO_TYPES_H_
-#define _XE_PLATFORM_INFO_TYPES_H_
+#ifndef _XE_PLATFORM_TYPES_H_
+#define _XE_PLATFORM_TYPES_H_
 
 /*
  * Keep this in graphics version based order and chronological order within a
diff --git a/drivers/gpu/drm/xe/xe_tile_printk.h b/drivers/gpu/drm/xe/xe_tile_printk.h
index 63640a42685d..738433a764bd 100644
--- a/drivers/gpu/drm/xe/xe_tile_printk.h
+++ b/drivers/gpu/drm/xe/xe_tile_printk.h
@@ -3,8 +3,8 @@
  * Copyright © 2025 Intel Corporation
  */
 
-#ifndef _xe_tile_printk_H_
-#define _xe_tile_printk_H_
+#ifndef _XE_TILE_PRINTK_H_
+#define _XE_TILE_PRINTK_H_
 
 #include "xe_printk.h"
 
-- 
2.43.0

