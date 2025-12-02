Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2FFECFD2F6
	for <intel-xe@archiver.kernel.org>; Tue,  2 Dec 2025 13:53:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7820510E65A;
	Tue,  2 Dec 2025 13:53:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EBW+hrbQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A440A10E659
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Dec 2025 13:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764683635; x=1796219635;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0PsK7Wik1StuPlZfQShMMY0Eek+Nvy8GtxVfJEX1SkI=;
 b=EBW+hrbQKRQW7z9BKQTKO4NUJ6G/rKaTzk5C4ycIT7U9Nwdbr65IbuZD
 UBJVNGC4eR1X8NmKVFh/PQqg6QN7mwOiSOil9XFDuUSaF10mT7A9RXQy0
 PbKhzKWFS4dWAa12PQiXD5I0XlgaRC6erO3Zj9OMLBVoed1Yingmnlk1M
 fXBxNBih2fV4JN7kkrVQ+f15ml5BWRi8zFH4fDsHA5LLx1ClHdz5mh8QE
 FioSo0WbjFDXiGLz36fBTWpi1vMxGI7wt4+/qUmVrlvudqWMzCQvWyBaA
 1TePGAQFgK6YPQCXc4CHgM0xpTHTKSfeEaJj0h9aW01+lnNCVGcXqkDvS g==;
X-CSE-ConnectionGUID: fJQHjAOkSKOZi6hYQ2Xd+g==
X-CSE-MsgGUID: k8++g0BASMWp/kObJCITxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66537120"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="66537120"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 05:53:55 -0800
X-CSE-ConnectionGUID: EQnEv+o3TKeuXv6+aro69A==
X-CSE-MsgGUID: AT2l0v0WSoiLx+f3Z/hjYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="199505784"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO mkuoppal-desk.lan)
 ([10.245.246.189])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 05:53:52 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: simona.vetter@ffwll.ch, matthew.brost@intel.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, joonas.lahtinen@linux.intel.com,
 christoph.manszewski@intel.com, rodrigo.vivi@intel.com,
 andrzej.hajda@intel.com, matthew.auld@intel.com,
 maciej.patelczyk@intel.com, gwan-gyeong.mun@intel.com,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH 15/20] drm/xe: Implement SR-IOV and eudebug exclusivity
Date: Tue,  2 Dec 2025 15:52:34 +0200
Message-ID: <20251202135241.880267-16-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251202135241.880267-1-mika.kuoppala@linux.intel.com>
References: <20251202135241.880267-1-mika.kuoppala@linux.intel.com>
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
index 1c1fa02d1bd7..44381084ee96 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.c
+++ b/drivers/gpu/drm/xe/xe_eudebug.c
@@ -25,6 +25,7 @@
 #include "xe_gt_debug.h"
 #include "xe_macros.h"
 #include "xe_pm.h"
+#include "xe_sriov_pf.h"
 #include "xe_sync.h"
 #include "xe_vm.h"
 
@@ -1954,6 +1955,7 @@ bool xe_eudebug_is_enabled(struct xe_device *xe)
 int xe_eudebug_enable(struct xe_device *xe, bool enable)
 {
 	struct xe_gt *gt;
+	int ret;
 	int i;
 	u8 id;
 
@@ -1974,6 +1976,14 @@ int xe_eudebug_enable(struct xe_device *xe, bool enable)
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
@@ -1994,11 +2004,15 @@ int xe_eudebug_enable(struct xe_device *xe, bool enable)
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
 
@@ -2060,6 +2074,11 @@ void xe_eudebug_init(struct xe_device *xe)
 
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

