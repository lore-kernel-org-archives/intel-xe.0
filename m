Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40035CD8C9D
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jun 2026 16:18:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06B9910F6C1;
	Mon,  8 Jun 2026 16:18:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f/JjPo9C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5A5510F6C1
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jun 2026 16:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780935514; x=1812471514;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AxevtjxRi1kujVFxQsJvFnHCTYMekJJk7wcILJHpv3U=;
 b=f/JjPo9CQv1HHsNUqQjwOscTNHohYaAewEZuQFcGFczw874xIOJk0Ff7
 jBBR7fzdUwZbaidtJY8K7vXV8sg7+Q789u0zt3kBD3/rso+hpes9HadzC
 4GgIYs1ET1lrdt6+/4iypWznsRaA0nPve9Tu4ya2bRWW7lFWvhsfdz38C
 SIGRS6Xjuu6PvwNobFQVaUpOBDsl+qZAXT/SwN13EKFN/l5yRkAHFln9j
 HfhsWGMzaK9lAVdwlAwTShsrG4XfrHHNocemmDu6RzfaUfR7UM0v3MuDa
 Ir45HCdFZBA85+8DIGQ++nX3sZ5KniZ1WR0fldCzUbHT1xC1qcffNgzhb Q==;
X-CSE-ConnectionGUID: EGGMLXWISTu6Bm4YhSluLA==
X-CSE-MsgGUID: gx/Lis/5QLeN031rNN0dTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="85532034"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="85532034"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 09:18:33 -0700
X-CSE-ConnectionGUID: TT4wuRm1SWqWI/gcrtL/sg==
X-CSE-MsgGUID: cmTmy9PNTKWc2UhlmSyYoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="247459180"
Received: from ikozitz-mobl3.ger.corp.intel.com (HELO mkuoppal-desk.intel.com)
 ([10.245.251.97])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 09:18:28 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: simona.vetter@ffwll.ch, matthew.brost@intel.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, joonas.lahtinen@linux.intel.com,
 gustavo.sousa@intel.com, jan.maslak@intel.com,
 dominik.karol.piatkowski@intel.com, rodrigo.vivi@intel.com,
 andrzej.hajda@intel.com, matthew.auld@intel.com,
 maciej.patelczyk@intel.com, gwan-gyeong.mun@intel.com,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH 17/18] drm/xe: Implement SR-IOV and eudebug exclusivity
Date: Mon,  8 Jun 2026 19:16:35 +0300
Message-ID: <20260608161639.1652127-18-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260608161639.1652127-1-mika.kuoppala@linux.intel.com>
References: <20260608161639.1652127-1-mika.kuoppala@linux.intel.com>
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

v2: initialize lock early (Sashiko)

Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 drivers/gpu/drm/xe/tests/xe_eudebug_test.c |  6 ++++++
 drivers/gpu/drm/xe/xe_eudebug.c            | 23 ++++++++++++++++++++--
 2 files changed, 27 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_eudebug_test.c b/drivers/gpu/drm/xe/tests/xe_eudebug_test.c
index c7c1ce3e0a26..0f43efdb014e 100644
--- a/drivers/gpu/drm/xe/tests/xe_eudebug_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_eudebug_test.c
@@ -132,6 +132,12 @@ static int toggle_reg_value(struct xe_device *xe, struct kunit *test)
 {
 	const bool enable_eudebug = xe_eudebug_is_enabled(xe);
 
+	if (IS_SRIOV_VF(xe))
+		kunit_skip(test, "eudebug not available in SR-IOV VF mode\n");
+
+	if (xe->eudebug.state == XE_EUDEBUG_NOT_SUPPORTED)
+		kunit_skip(test, "eudebug not supported\n");
+
 	kunit_printk(KERN_DEBUG, test, "Test eudebug WAs for graphics version: %u\n",
 		     GRAPHICS_VERx100(xe));
 
diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
index a4f80a73c305..12a2ff3a7328 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.c
+++ b/drivers/gpu/drm/xe/xe_eudebug.c
@@ -24,6 +24,7 @@
 #include "xe_hw_engine.h"
 #include "xe_macros.h"
 #include "xe_pm.h"
+#include "xe_sriov_pf.h"
 #include "xe_sync.h"
 #include "xe_vm.h"
 
@@ -2163,6 +2164,7 @@ bool xe_eudebug_is_enabled(struct xe_device *xe)
 int xe_eudebug_enable(struct xe_device *xe, bool enable)
 {
 	struct xe_gt *gt;
+	int ret;
 	int i;
 	u8 id;
 
@@ -2183,6 +2185,14 @@ int xe_eudebug_enable(struct xe_device *xe, bool enable)
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
@@ -2202,11 +2212,15 @@ int xe_eudebug_enable(struct xe_device *xe, bool enable)
 	xe->eudebug.state = enable ?
 		XE_EUDEBUG_ENABLED : XE_EUDEBUG_DISABLED;
 
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
 	mutex_unlock(&xe->eudebug.lock);
 
 	return 0;
@@ -2274,6 +2288,11 @@ void xe_eudebug_init(struct xe_device *xe)
 	if (err)
 		goto out_err;
 
+	if (IS_SRIOV_VF(xe)) {
+		drm_info(&xe->drm, "eudebug not available in SR-IOV VF mode\n");
+		return;
+	}
+
 	wq = drmm_alloc_ordered_workqueue(dev, "xe-eudebug", 0);
 	if (IS_ERR(wq)) {
 		err = PTR_ERR(wq);
-- 
2.43.0

