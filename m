Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F8B7C624DA
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 15:01:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3EF910F67F;
	Thu,  3 Sep 2026 15:01:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UqdisaBe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 344C210F67F
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 15:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788447696; x=1819983696;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WFVb+3bRMKyRi1TdvXjX307P6T88jJDFGNcL8iZHLEI=;
 b=UqdisaBeSlMHx0qmAws3cheZwR9YbOlmB7rN7BwOaEEkUspHMfTa4Qtg
 ClHfhMi066NwOI1vcCjDDTg0LYKw3iX+jHrVM/nHEjL1SuwFlHaa+qndO
 wFFjkBmsxOKtycLdYQyLkC5nrqmh6RxUIdaN56Sx1I2pRA+Rar9Min36K
 HtWX1ZUQ7dbzVqaVRtJxw5crh6yP/7Rcoo0LDwJTbsSxh/6U1sP0lZnDN
 +nv8EHJftBWze+IVUTflShC4NafPghuMVStxe/4caPKk15vQex4dGZWMk
 9+7IYQNZ65/txXVzNrPfpIUB48QsZ9UvKpsWwu1oARM91PMCcRN3n9l5k A==;
X-CSE-ConnectionGUID: yL1hI3rsRoGR+BlXVVLJKg==
X-CSE-MsgGUID: M/zvpsfET3yMNFNbG7YmGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="76486849"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="76486849"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 08:01:29 -0700
X-CSE-ConnectionGUID: qqLuI8MCRKix0vcrsck+ww==
X-CSE-MsgGUID: raRAgABTRImtFHAHIkyfIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="268441206"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO
 mkuoppal-desk.intel.com) ([10.245.246.233])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 08:01:24 -0700
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
Subject: [PATCH v10 18/27] drm/xe: Implement SR-IOV and eudebug exclusivity
Date: Thu,  3 Sep 2026 17:59:42 +0300
Message-ID: <20260903145952.848051-19-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260903145952.848051-1-mika.kuoppala@linux.intel.com>
References: <20260903145952.848051-1-mika.kuoppala@linux.intel.com>
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
I.e. don't allow enabling eudebug in VF mode and don't allow enabling
eudebug when any VFs are enabled. Likewise, don't allow enabling
VFs when eudebug is enabled.

v2: initialize lock early (Sashiko)
v3: say why eudebug was refused (Claude)

Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 drivers/gpu/drm/xe/tests/xe_eudebug_test.c |  3 +++
 drivers/gpu/drm/xe/xe_eudebug.c            | 24 ++++++++++++++++++++--
 2 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_eudebug_test.c b/drivers/gpu/drm/xe/tests/xe_eudebug_test.c
index a207840fdb91..0ed2de04ba83 100644
--- a/drivers/gpu/drm/xe/tests/xe_eudebug_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_eudebug_test.c
@@ -160,6 +160,9 @@ static void toggle_reg(struct kunit *test)
 	if (xe->eudebug.cap_state == XE_EUDEBUG_CAP_NOT_SUPPORTED)
 		kunit_skip(test, "eudebug not supported\n");
 
+	if (IS_SRIOV_VF(xe))
+		kunit_skip(test, "eudebug not available in SR-IOV VF mode\n");
+
 	kunit_printk(KERN_DEBUG, test, "Test eudebug WAs for graphics version: %u\n",
 		     GRAPHICS_VERx100(xe));
 
diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
index 470246af9810..2c8d8fc82898 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.c
+++ b/drivers/gpu/drm/xe/xe_eudebug.c
@@ -26,6 +26,7 @@
 #include "xe_hw_engine.h"
 #include "xe_macros.h"
 #include "xe_pm.h"
+#include "xe_sriov_pf.h"
 #include "xe_sync.h"
 #include "xe_vm.h"
 
@@ -2245,6 +2246,7 @@ bool xe_eudebug_is_enabled(struct xe_device *xe)
 int xe_eudebug_enable(struct xe_device *xe, bool enable)
 {
 	struct xe_gt *gt;
+	int ret;
 	int i;
 	u8 id;
 
@@ -2259,6 +2261,14 @@ int xe_eudebug_enable(struct xe_device *xe, bool enable)
 	if (enable == xe_eudebug_is_enabled(xe))
 		return 0;
 
+	if (enable && IS_SRIOV_PF(xe)) {
+		ret = xe_sriov_pf_lockdown(xe);
+		if (ret) {
+			drm_dbg(&xe->drm, "Can't enable eudebug: VFs are enabled\n");
+			return ret;
+		}
+	}
+
 	xe_pm_runtime_get(xe);
 	for_each_gt(gt, xe, id) {
 		for (i = 0; i < ARRAY_SIZE(gt->hw_engines); i++) {
@@ -2276,10 +2286,14 @@ int xe_eudebug_enable(struct xe_device *xe, bool enable)
 	WRITE_ONCE(xe->eudebug.cap_state, enable ?
 		   XE_EUDEBUG_CAP_ENABLED : XE_EUDEBUG_CAP_DISABLED);
 
-	if (enable)
+	if (enable) {
 		xe_eudebug_attention_poll_start(xe);
-	else
+	} else {
+		if (IS_SRIOV_PF(xe))
+			xe_sriov_pf_end_lockdown(xe);
+
 		xe_eudebug_attention_poll_stop(xe);
+	}
 
 	return 0;
 }
@@ -2359,6 +2373,11 @@ void xe_eudebug_init(struct xe_device *xe)
 	if (xe->eudebug.cap_state == XE_EUDEBUG_CAP_NOT_SUPPORTED)
 		return;
 
+	if (IS_SRIOV_VF(xe)) {
+		drm_info(&xe->drm, "eudebug not available in SR-IOV VF mode\n");
+		goto out_not_supported;
+	}
+
 	wq = drmm_alloc_ordered_workqueue(dev, "xe-eudebug-discovery", 0);
 	if (IS_ERR(wq)) {
 		err = PTR_ERR(wq);
@@ -2404,6 +2423,7 @@ void xe_eudebug_init(struct xe_device *xe)
 out_err:
 	drm_warn(&xe->drm, "eudebug disabled, init fail: %d\n", err);
 
+out_not_supported:
 	WRITE_ONCE(xe->eudebug.cap_state, XE_EUDEBUG_CAP_NOT_SUPPORTED);
 }
 
-- 
2.53.0

