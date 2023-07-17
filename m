Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA8C9C001DC
	for <intel-xe@archiver.kernel.org>; Mon, 17 Jul 2023 13:32:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A731110E257;
	Mon, 17 Jul 2023 13:32:18 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C7F310E253
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Jul 2023 13:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689600736; x=1721136736;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UPFSDq/c0oTECigShCnp84zXZJMK6V8E7p+yczqucFg=;
 b=YSt21TO7LDCanev6y0D3TBmNP8vsx/8TSpjXc1rwinGDWnT228K0g5C4
 0Guzn0QpPGtcDnfGcx9y38WhlNTjFMuvxwG7WYt0iAUASqz8AUbDMGU5C
 JV6EqnneeXVbZC+G2rooL2BRo9/Bu0RFGYcGwl2ZrBjbWl/hwvbH3j77y
 KVvcSfhf1puGwY47abNl8QIA3ws9AsgfvJcXPQBYOUcwo5qbYxMgVorOW
 dmTSOCCv2S1UNmscSYmbyiTI88+po2+y71rMcqVcapg9qktRFiJCg9hGl
 /PjGZ+89Uq3dAUE+wvRMJobvQpZhO4t66/goHAcySpNa6njvwrj3+AgL5 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="355867837"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; d="scan'208";a="355867837"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2023 06:32:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="836881064"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; d="scan'208";a="836881064"
Received: from kprutko-mobl3.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.13.224])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2023 06:32:14 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 17 Jul 2023 14:32:01 +0100
Message-ID: <20230717133159.47980-7-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230717133159.47980-6-matthew.auld@intel.com>
References: <20230717133159.47980-6-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 1/4] drm/xe/selftests: hold rpm for
 evict_test_run_device()
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
Cc: Nirmoy Das <nirmoy.das@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

We are calling fairly low level things like xe_bo_restore_kernel() which
expect caller to be holding mem_access.ref. Since we are doing stuff
like evict_all we likely don't want to race with rpm suspend, since that
potentially wants to do the same thing, so just wrap the whole test.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_bo.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
index 5309204d8d1b..edee4116c59d 100644
--- a/drivers/gpu/drm/xe/tests/xe_bo.c
+++ b/drivers/gpu/drm/xe/tests/xe_bo.c
@@ -12,6 +12,7 @@
 
 #include "xe_bo_evict.h"
 #include "xe_pci.h"
+#include "xe_pm.h"
 
 static int ccs_test_migrate(struct xe_gt *gt, struct xe_bo *bo,
 			    bool clear, u64 get_val, u64 assign_val,
@@ -295,9 +296,15 @@ static int evict_test_run_device(struct xe_device *xe)
 		return 0;
 	}
 
+	xe_pm_runtime_get(xe); /* FIXME: remove once mem_access actually works */
+	xe_device_mem_access_get(xe);
+
 	for_each_gt(gt, xe, id)
 		evict_test_run_gt(xe, gt, test);
 
+	xe_device_mem_access_put(xe);
+	xe_pm_runtime_put(xe);
+
 	return 0;
 }
 
-- 
2.41.0

