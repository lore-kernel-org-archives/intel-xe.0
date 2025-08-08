Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9122C87FD3
	for <intel-xe@archiver.kernel.org>; Fri,  8 Aug 2025 10:45:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9509C10E90C;
	Fri,  8 Aug 2025 10:45:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a04aFfJz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5DE310E90C
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Aug 2025 10:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754649907; x=1786185907;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AAiuQ8uwhE9J+4QVenmSrjXSW2Rd+21+y7wNWo/heDo=;
 b=a04aFfJzq/fstxe2X32nCu5p4sI6PniY6CP4TLNJDAKr7V6E/36M+2UT
 RLeYF2UB8QD7Mu94gaj2lU1sTwT3l5Jho16aVYYQM3uFGoQVKdnpNV/oL
 HAjTgTd0gKd9DjmCNX4nrNwF1H83713rGyZW/tQLeLMQ4l1TNEbFa5B5q
 cOmTm+2T1jEFndQcau58VFNBjOUkhmRBpBxCSeRFMg8MROPhDEKQNTXUe
 zW5ObMPG/56p7njVCpf16WkM4urlGk3B+oT2gjiKxRMdcVBWGN75N6UsQ
 E7BjLU7FZuzukdWdGz3Yt0VAs3EZngF+ZDnE28wk2GcsDdIbv/x96i986 Q==;
X-CSE-ConnectionGUID: z0rGKs+/Qp+cN5xVdiPjpg==
X-CSE-MsgGUID: CU+Uw5hmSJSI907WMbYbvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="67265727"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="67265727"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 03:45:07 -0700
X-CSE-ConnectionGUID: AxtBLVXvTrm+e/DIrn8KAw==
X-CSE-MsgGUID: fncWOlcjQwiTs1okravbAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="164519131"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO mkuoppal-desk.lan)
 ([10.245.245.185])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 03:45:04 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: simona.vetter@ffwll.ch, matthew.brost@intel.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, joonas.lahtinen@linux.intel.com,
 christoph.manszewski@intel.com, rodrigo.vivi@intel.com,
 lucas.demarchi@intel.com, andrzej.hajda@intel.com, matthew.auld@intel.com,
 maciej.patelczyk@intel.com, gwan-gyeong.mun@intel.com
Subject: [PATCH 14/15] drm/xe: Implement SR-IOV and eudebug exclusivity
Date: Fri,  8 Aug 2025 13:43:49 +0300
Message-ID: <20250808104356.3294210-16-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250808104356.3294210-1-mika.kuoppala@linux.intel.com>
References: <20250808104356.3294210-1-mika.kuoppala@linux.intel.com>
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

From: Christoph Manszewski <christoph.manszewski@intel.com>

EU debug functionality relies on access to specific mmio registers.
Since VFs don't have access to those registers and in order to avoid
interference with VFs, make SR-IOV and eudebug functionality exclusive.
I.e. don't allow to enable eudebug in VF mode and don't allow to enable
eudebug when any VFs are provisioned. Likewise, don't allow to provision
VFs when eudebug is enabled.

Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_eudebug.c |  6 +++++
 drivers/gpu/drm/xe/xe_eudebug.c       | 33 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_eudebug.h       |  6 +++++
 drivers/gpu/drm/xe/xe_exec_queue.c    |  3 +++
 drivers/gpu/drm/xe/xe_gt.c            |  1 +
 drivers/gpu/drm/xe/xe_pci_sriov.c     | 10 ++++++++
 6 files changed, 59 insertions(+)

diff --git a/drivers/gpu/drm/xe/tests/xe_eudebug.c b/drivers/gpu/drm/xe/tests/xe_eudebug.c
index f839fb292b9b..c1e5eb091fc4 100644
--- a/drivers/gpu/drm/xe/tests/xe_eudebug.c
+++ b/drivers/gpu/drm/xe/tests/xe_eudebug.c
@@ -147,6 +147,12 @@ static int toggle_reg_value(struct xe_device *xe)
 	struct kunit *test = kunit_get_current_test();
 	bool enable_eudebug = xe_eudebug_is_enabled(xe);
 
+	if (IS_SRIOV_VF(xe))
+		kunit_skip(test, "eudebug not available in SR-IOV VF mode\n");
+
+	if (xe->eudebug.state == XE_EUDEBUG_NOT_SUPPORTED)
+		kunit_skip(test, "eudebug not supported\n");
+
 	kunit_printk(KERN_DEBUG, test, "Test eudebug WAs for graphics version: %u\n",
 		     GRAPHICS_VERx100(xe));
 
diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
index 2426bb92792e..8f98233f06f2 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.c
+++ b/drivers/gpu/drm/xe/xe_eudebug.c
@@ -2124,6 +2124,34 @@ bool xe_eudebug_is_enabled(struct xe_device *xe)
 	return READ_ONCE(xe->eudebug.state) == XE_EUDEBUG_ENABLED;
 }
 
+static int __xe_eudebug_toggle_support(struct xe_device *xe,
+				       bool support_enable)
+{
+	mutex_lock(&xe->eudebug.lock);
+
+	if (xe_eudebug_is_enabled(xe)) {
+		mutex_unlock(&xe->eudebug.lock);
+		return -EPERM;
+	}
+
+	xe->eudebug.state = support_enable ?
+		XE_EUDEBUG_DISABLED : XE_EUDEBUG_NOT_SUPPORTED;
+
+	mutex_unlock(&xe->eudebug.lock);
+
+	return 0;
+}
+
+void xe_eudebug_support_enable(struct xe_device *xe)
+{
+	__xe_eudebug_toggle_support(xe, true);
+}
+
+int xe_eudebug_support_disable(struct xe_device *xe)
+{
+	return __xe_eudebug_toggle_support(xe, false);
+}
+
 static int xe_eudebug_enable(struct xe_device *xe, bool enable)
 {
 	struct xe_gt *gt;
@@ -2229,6 +2257,11 @@ void xe_eudebug_init(struct xe_device *xe)
 
 	xe->eudebug.state = XE_EUDEBUG_NOT_SUPPORTED;
 
+	if (IS_SRIOV_VF(xe)) {
+		drm_info(&xe->drm, "eudebug not available in SR-IOV VF mode\n");
+		return;
+	}
+
 	err = drmm_mutex_init(dev, &xe->eudebug.lock);
 	if (err)
 		goto out_err;
diff --git a/drivers/gpu/drm/xe/xe_eudebug.h b/drivers/gpu/drm/xe/xe_eudebug.h
index 63a647c242cc..428ae70bdc90 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.h
+++ b/drivers/gpu/drm/xe/xe_eudebug.h
@@ -46,6 +46,9 @@ int xe_eudebug_connect_ioctl(struct drm_device *dev,
 			     void *data,
 			     struct drm_file *file);
 
+void xe_eudebug_support_enable(struct xe_device *xe);
+int xe_eudebug_support_disable(struct xe_device *xe);
+
 void xe_eudebug_init(struct xe_device *xe);
 bool xe_eudebug_is_enabled(struct xe_device *xe);
 
@@ -80,6 +83,9 @@ static inline int xe_eudebug_connect_ioctl(struct drm_device *dev,
 					   void *data,
 					   struct drm_file *file) { return 0; }
 
+static inline void xe_eudebug_support_enable(struct xe_device *xe) { }
+static inline int xe_eudebug_support_disable(struct xe_device *xe) { return 0; }
+
 static inline void xe_eudebug_init(struct xe_device *xe) { }
 static inline bool xe_eudebug_is_enabled(struct xe_device *xe) { return false; }
 
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 3c2eedcc2bca..3b85208fcfd0 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -524,6 +524,9 @@ static int exec_queue_set_eudebug(struct xe_device *xe, struct xe_exec_queue *q,
 			 !(value & DRM_XE_EXEC_QUEUE_EUDEBUG_FLAG_ENABLE)))
 		return -EINVAL;
 
+	if (XE_IOCTL_DBG(xe, !xe_eudebug_is_enabled(xe)))
+		return -EPERM;
+
 	q->eudebug_flags = EXEC_QUEUE_EUDEBUG_FLAG_ENABLE;
 	q->sched_props.preempt_timeout_us = 0;
 
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 390394bbaadc..4c32d868b5ad 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -21,6 +21,7 @@
 #include "xe_bb.h"
 #include "xe_bo.h"
 #include "xe_device.h"
+#include "xe_eudebug.h"
 #include "xe_eu_stall.h"
 #include "xe_exec_queue.h"
 #include "xe_execlist.h"
diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.c b/drivers/gpu/drm/xe/xe_pci_sriov.c
index af05db07162e..4b5de4ffe5e4 100644
--- a/drivers/gpu/drm/xe/xe_pci_sriov.c
+++ b/drivers/gpu/drm/xe/xe_pci_sriov.c
@@ -9,6 +9,7 @@
 #include "regs/xe_bars.h"
 #include "xe_assert.h"
 #include "xe_device.h"
+#include "xe_eudebug.h"
 #include "xe_gt_sriov_pf_config.h"
 #include "xe_gt_sriov_pf_control.h"
 #include "xe_gt_sriov_printk.h"
@@ -155,6 +156,10 @@ static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
 	xe_assert(xe, num_vfs <= total_vfs);
 	xe_sriov_dbg(xe, "enabling %u VF%s\n", num_vfs, str_plural(num_vfs));
 
+	err = xe_eudebug_support_disable(xe);
+	if (err < 0)
+		goto failed_eudebug;
+
 	err = xe_sriov_pf_wait_ready(xe);
 	if (err)
 		goto out;
@@ -197,6 +202,9 @@ static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
 	pf_unprovision_vfs(xe, num_vfs);
 	xe_pm_runtime_put(xe);
 out:
+	xe_eudebug_support_enable(xe);
+failed_eudebug:
+
 	xe_sriov_notice(xe, "Failed to enable %u VF%s (%pe)\n",
 			num_vfs, str_plural(num_vfs), ERR_PTR(err));
 	return err;
@@ -225,6 +233,8 @@ static int pf_disable_vfs(struct xe_device *xe)
 	/* not needed anymore - see pf_enable_vfs() */
 	xe_pm_runtime_put(xe);
 
+	xe_eudebug_support_enable(xe);
+
 	xe_sriov_info(xe, "Disabled %u VF%s\n", num_vfs, str_plural(num_vfs));
 	return 0;
 }
-- 
2.43.0

