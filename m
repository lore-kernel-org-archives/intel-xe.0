Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2A8CEA4FC2
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 14:04:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FB5D10E448;
	Mon, 23 Feb 2026 14:04:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CwCB6AjX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F30710E448
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Feb 2026 14:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771855487; x=1803391487;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hruy7jve9xP7oJqQF5/JQ7X5xENGX6NtpIZp1NR7Kww=;
 b=CwCB6AjX4kBn12wUsE1szavSo0DAHjLHe+dWI9CWxNK6LoWhDWp8GohG
 RQu4eMsqxIewakeJ/dsVBgsjQ8mSW2j2KqfkZ5dFpf6CsyO1NUq2uiRA7
 yJElPSWyWXpavXTu/3f+YqRAUlczFKIjyV6Kqq4Xwr+DdjkBIH6KCJNyT
 c/95sy/EfvoAJQCCacYL98Mfrg4zT0UjzUo44k+GC+pijMkclm2hvhb8n
 cX7tMnuhEs0CPBwSt/AGI7MU7J3qXXPVXD81LFkLw1uXT2diAYghpK5G/
 SGW8VRsrS4LIy2rHNgu2NsOadBxNFF/hILIkBKxCrd5z0Ceq5hZsKfEGE Q==;
X-CSE-ConnectionGUID: 7as1O+/iQ9eNAdGKDv9tbQ==
X-CSE-MsgGUID: m45m/pdATU6FQdjxKt9orA==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="76460948"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="76460948"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 06:04:47 -0800
X-CSE-ConnectionGUID: SfZLFnq9SCSTQQ7SI0ymvA==
X-CSE-MsgGUID: SBDWYUeCRUSpq3Mzgd3qrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="214656471"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO
 mkuoppal-desk.intel.com) ([10.245.246.3])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 06:04:43 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: simona.vetter@ffwll.ch, matthew.brost@intel.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, joonas.lahtinen@linux.intel.com,
 christoph.manszewski@intel.com, rodrigo.vivi@intel.com,
 andrzej.hajda@intel.com, matthew.auld@intel.com,
 maciej.patelczyk@intel.com, gwan-gyeong.mun@intel.com,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH 17/22] drm/xe: Implement SR-IOV and eudebug exclusivity
Date: Mon, 23 Feb 2026 16:03:12 +0200
Message-ID: <20260223140318.1822138-18-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260223140318.1822138-1-mika.kuoppala@linux.intel.com>
References: <20260223140318.1822138-1-mika.kuoppala@linux.intel.com>
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
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 drivers/gpu/drm/xe/tests/xe_eudebug.c | 10 ++++++++++
 drivers/gpu/drm/xe/xe_eudebug.c       | 23 +++++++++++++++++++++--
 2 files changed, 31 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_eudebug.c b/drivers/gpu/drm/xe/tests/xe_eudebug.c
index f839fb292b9b..601725c642bd 100644
--- a/drivers/gpu/drm/xe/tests/xe_eudebug.c
+++ b/drivers/gpu/drm/xe/tests/xe_eudebug.c
@@ -8,9 +8,13 @@
 #include "regs/xe_gt_regs.h"
 #include "regs/xe_engine_regs.h"
 
+#include "xe_device.h"
+#include "xe_eudebug.h"
 #include "xe_force_wake.h"
+#include "xe_gt.h"
 #include "xe_gt_mcr.h"
 #include "xe_mmio.h"
+#include "xe_pm.h"
 
 #include "tests/xe_kunit_helpers.h"
 #include "tests/xe_pci_test.h"
@@ -147,6 +151,12 @@ static int toggle_reg_value(struct xe_device *xe)
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
index bd1f186f496c..eae93c5f5e86 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.c
+++ b/drivers/gpu/drm/xe/xe_eudebug.c
@@ -25,6 +25,7 @@
 #include "xe_gt_debug.h"
 #include "xe_macros.h"
 #include "xe_pm.h"
+#include "xe_sriov_pf.h"
 #include "xe_sync.h"
 #include "xe_vm.h"
 
@@ -2047,6 +2048,7 @@ bool xe_eudebug_is_enabled(struct xe_device *xe)
 int xe_eudebug_enable(struct xe_device *xe, bool enable)
 {
 	struct xe_gt *gt;
+	int ret;
 	int i;
 	u8 id;
 
@@ -2067,6 +2069,14 @@ int xe_eudebug_enable(struct xe_device *xe, bool enable)
 		return 0;
 	}
 
+	if (enable && IS_SRIOV_PF(xe)) {
+		ret = xe_sriov_pf_lockdown(xe);
+		if (ret) {
+			mutex_unlock(&xe->eudebug.lock);
+			return ret;
+		}
+	}
+
 	xe_pm_runtime_get(xe);
 
 	for_each_gt(gt, xe, id) {
@@ -2087,11 +2097,15 @@ int xe_eudebug_enable(struct xe_device *xe, bool enable)
 		XE_EUDEBUG_ENABLED : XE_EUDEBUG_DISABLED;
 	mutex_unlock(&xe->eudebug.lock);
 
-	if (enable)
+	if (enable) {
 		attention_poll_start(xe);
-	else
+	} else {
 		attention_poll_stop(xe);
 
+		if (IS_SRIOV_PF(xe))
+			xe_sriov_pf_end_lockdown(xe);
+	}
+
 	return 0;
 }
 
@@ -2153,6 +2167,11 @@ void xe_eudebug_init(struct xe_device *xe)
 
 	xe->eudebug.state = XE_EUDEBUG_NOT_SUPPORTED;
 
+	if (IS_SRIOV_VF(xe)) {
+		drm_info(&xe->drm, "eudebug not available in SR-IOV VF mode\n");
+		return;
+	}
+
 	err = drmm_mutex_init(dev, &xe->eudebug.lock);
 	if (err)
 		goto out_err;
-- 
2.43.0

