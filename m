Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03EADCEE33B
	for <intel-xe@archiver.kernel.org>; Tue, 18 Nov 2025 16:44:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAF2A10E501;
	Tue, 18 Nov 2025 16:44:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kOrBXvhI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CE9D10E4F6
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Nov 2025 16:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763484229; x=1795020229;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=deVX1CVb6CkB56Fwbp+TEcG8vj8LMmLzM+414Ex+f1s=;
 b=kOrBXvhILgD+sb1Wk+uzvIUYdZht+KuNLB87ujFxHQHa0G4+kqE8dYNe
 kuoT2QCoS/Mrvz1miNHSHcXXG0JyeJelrg8dRnD5BwWo3mSNA5N3qBvet
 +7JAOE1cjGTcTd527x68UxQtQkvJNKdsOsfUV9I+9F0ZrJOI7ICgSuuLB
 TCPaWJXie4Rju55z9dXJGywTh+4jXeaIhmIGaSZK67O/pN9czDTf2/aH4
 /46iH4nP6Li0CXI8Cd3XkgGwrbXodcaMzDumYXEw5zFYbAVnDYQ8Ud4oX
 liYwEHcnm6oSU1iiW893kaEqmPU2XmVJUW2y6xnJq5hnS0QR7EX0ATK+d g==;
X-CSE-ConnectionGUID: iR7+mmsKSAinCROJzZXFCQ==
X-CSE-MsgGUID: UGQDU0+RSeKJqXQId+nHOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="65544757"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="65544757"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 08:43:49 -0800
X-CSE-ConnectionGUID: GUw581SrR1uR+0iWAJgtgw==
X-CSE-MsgGUID: KAQqx3J5RI6d8RF/+cpPkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="190952197"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 08:43:49 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [CI 02/27] drm/xe/pm: Add scope-based cleanup helper for runtime PM
Date: Tue, 18 Nov 2025 08:43:41 -0800
Message-ID: <20251118164338.3572146-31-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251118164338.3572146-29-matthew.d.roper@intel.com>
References: <20251118164338.3572146-29-matthew.d.roper@intel.com>
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

v3:
 - Add comments to the kerneldoc for the existing 'get' functions
   indicating that scope-based handling should be preferred where
   possible.  (Gustavo)

Cc: Gustavo Sousa <gustavo.sousa@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_pm.c | 21 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pm.h | 17 +++++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 0e573fb11bbb..ad92a142dc7e 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -722,6 +722,13 @@ static void xe_pm_runtime_lockdep_prime(void)
 /**
  * xe_pm_runtime_get - Get a runtime_pm reference and resume synchronously
  * @xe: xe device instance
+ *
+ * When possible, scope-based runtime PM (through guard(xe_pm_runtime)) is
+ * be preferred over direct usage of this function.  Manual get/put handling
+ * should only be used when the function contains goto-based logic which
+ * can break scope-based handling, or when the lifetime of the runtime PM
+ * reference does not match a specific scope (e.g., runtime PM obtained in one
+ * function and released in a different one).
  */
 void xe_pm_runtime_get(struct xe_device *xe)
 {
@@ -754,6 +761,13 @@ void xe_pm_runtime_put(struct xe_device *xe)
  * xe_pm_runtime_get_ioctl - Get a runtime_pm reference before ioctl
  * @xe: xe device instance
  *
+ * When possible, scope-based runtime PM (through
+ * ACQUIRE(xe_pm_runtime_ioctl, ...)) is be preferred over direct usage of this
+ * function.  Manual get/put handling should only be used when the function
+ * contains goto-based logic which can break scope-based handling, or when the
+ * lifetime of the runtime PM reference does not match a specific scope (e.g.,
+ * runtime PM obtained in one function and released in a different one).
+ *
  * Returns: Any number greater than or equal to 0 for success, negative error
  * code otherwise.
  */
@@ -823,6 +837,13 @@ static bool xe_pm_suspending_or_resuming(struct xe_device *xe)
  * It will warn if not protected.
  * The reference should be put back after this function regardless, since it
  * will always bump the usage counter, regardless.
+ *
+ * When possible, scope-based runtime PM (through guard(xe_pm_runtime_noresume))
+ * is be preferred over direct usage of this function.  Manual get/put handling
+ * should only be used when the function contains goto-based logic which can
+ * break scope-based handling, or when the lifetime of the runtime PM reference
+ * does not match a specific scope (e.g., runtime PM obtained in one function
+ * and released in a different one).
  */
 void xe_pm_runtime_get_noresume(struct xe_device *xe)
 {
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

