Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3A0ECCF9E3
	for <intel-xe@archiver.kernel.org>; Mon, 10 Nov 2025 23:20:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3441C10E385;
	Mon, 10 Nov 2025 23:20:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VtFiOEBt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8901F10E45A
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Nov 2025 23:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762816833; x=1794352833;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lbUeWbp9R0akmXoPs+vvuQ0mfz7JxF3mC8si/IP4yJU=;
 b=VtFiOEBt0Ukgj1BB8moI4xgDzjBeW33NYQdeNIkwldbZdq47/XPD/0/T
 U7DELZF6+Myw2sZVuAATzvSmmr5O1QjUGNLK4LxpDKNf0rXp1MqoQw5DO
 QTg6/luDV3XUAYw08jyujRc1vNao+jvcdiKCpdfoMapEmB3DFwOaq6Tfh
 yhWvuFoit1H2LNdLMEU6+l01vKYvjdneDueilQlU9HVjTy2rToyCD3RQo
 PjOWP5mBx6i3sPKQnHGoYlSZP0cVFHVr/+a8ASmYSeEbhWEVWZIj5npuP
 OLjvR04f9wyyTrlbCZ5d+xFnvft3L95TbPsm0h/Sa8xQ+GO6bYFw4cqVw g==;
X-CSE-ConnectionGUID: hhZiC4xSRvCNCT8htxvC8A==
X-CSE-MsgGUID: Q5SIhAMISOqPxz8P1MLtfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="67480250"
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="67480250"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 15:20:32 -0800
X-CSE-ConnectionGUID: picvqgI7RkqUqIW+MiIctw==
X-CSE-MsgGUID: RA8gHsKJTHiORHAVMx5YcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="189243960"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 15:20:31 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH v2 05/30] drm/xe/pm: Add scope-based cleanup helper for
 runtime PM
Date: Mon, 10 Nov 2025 15:20:23 -0800
Message-ID: <20251110232017.1475869-37-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251110232017.1475869-32-matthew.d.roper@intel.com>
References: <20251110232017.1475869-32-matthew.d.roper@intel.com>
MIME-Version: 1.0
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

Add a scope-based helpers for runtime PM that may be used to simplify
cleanup logic and potentially avoid goto-based cleanup.

For example, using

        guard(xe_pm_runtime)(xe);

will get runtime PM and cause a corresponding put to occur automatically
when the current scope is exited.  'xe_pm_runtime_noresume' can be used
as a guard replacement for the corresponding 'noresume' variant.
There's also an xe_pm_runtime_ioctl conditional guard that can be used
as a replacement for xe_runtime_ioctl():

        ACQUIRE(xe_pm_runtime_ioctl, pm)(xe);
        if ((ret = ACQUIRE_ERR(xe_pm_runtime_ioctl, &pm)) < 0)
                /* failed */

In a few rare cases (such as gt_reset_worker()) we need to ensure that
runtime PM is dropped when the function is exited by any means
(including error paths), but the function does not need to acquire
runtime PM because that has already been done earlier by a different
function.  For these special cases, an 'xe_pm_runtime_release_only'
guard can be used to handle the release without doing an acquisition.

These guards will be used in future patches to eliminate some of our
goto-based cleanup.

v2:
 - Specify success condition for xe_pm runtime_ioctl as _RET >= 0 so
   that positive values will be properly identified as success and
   trigger destructor cleanup properly.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_pm.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
index f7f89a18b6fc..6b27039e7b2d 100644
--- a/drivers/gpu/drm/xe/xe_pm.h
+++ b/drivers/gpu/drm/xe/xe_pm.h
@@ -6,6 +6,7 @@
 #ifndef _XE_PM_H_
 #define _XE_PM_H_
 
+#include <linux/cleanup.h>
 #include <linux/pm_runtime.h>
 
 #define DEFAULT_VRAM_THRESHOLD 300 /* in MB */
@@ -37,4 +38,20 @@ int xe_pm_block_on_suspend(struct xe_device *xe);
 void xe_pm_might_block_on_suspend(void);
 int xe_pm_module_init(void);
 
+static inline void __xe_pm_runtime_noop(struct xe_device *xe) {}
+
+DEFINE_GUARD(xe_pm_runtime, struct xe_device *,
+	     xe_pm_runtime_get(_T), xe_pm_runtime_put(_T))
+DEFINE_GUARD(xe_pm_runtime_noresume, struct xe_device *,
+	     xe_pm_runtime_get_noresume(_T), xe_pm_runtime_put(_T))
+DEFINE_GUARD_COND(xe_pm_runtime, _ioctl, xe_pm_runtime_get_ioctl(_T), _RET >= 0)
+
+/*
+ * Used when a function needs to release runtime PM in all possible cases
+ * and error paths, but the wakeref was already acquired by a different
+ * function (i.e., get() has already happened so only a put() is needed).
+ */
+DEFINE_GUARD(xe_pm_runtime_release_only, struct xe_device *,
+	     __xe_pm_runtime_noop(_T), xe_pm_runtime_put(_T));
+
 #endif
-- 
2.51.1

