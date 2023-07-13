Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23120EB64DD
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jul 2023 09:41:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E81CA10E008;
	Thu, 13 Jul 2023 09:41:49 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D22C110E008
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Jul 2023 09:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689241307; x=1720777307;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HdbBzjOfOwNAQK03S/lrp+CI5FjwEgH2vot1OYYkUa4=;
 b=fUnbWrA5CUJ3xaISkIOeDioc0Dy2E2nSw+oNxBf02SNdMCaZzuKepRtq
 7sQDnukSHOC8wCZ0Kb06V785AaOX9ZqJUXUicxWLhaZVyrILI36TjIDsR
 hvu4U0kXBkHG/GCEF0AW5qEWsb5BoAFByeRvm7ZK9/fOCu3kl936XnLl8
 62AzJQ82FWoZ/pQi8FrcsnFTXXVb1itepS3h3bJXAozd/7rRnNWwbrcGT
 YWDPE55cVddHxc+edZ4eelFIDd/bEP3tqJhziSzKYMgGbWEWiVNvtRzRe
 5L6/vTW1TmFMX64zrBXY+FuGngV6RIRS11Ep/tW1ntRvY8oGnkQ0gXBjp w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="431292983"
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="431292983"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2023 02:41:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="751555726"
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="751555726"
Received: from rossdevx-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.28.133])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2023 02:41:46 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 13 Jul 2023 10:41:26 +0100
Message-ID: <20230713094125.326709-5-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/4] drm/xe/selftests: hold rpm for
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

We are calling fairly low level things like xe_bo_restore_kernel() which
expect caller to be holding mem_access.ref. Since we are doing stuff
like evict_all we likely don't want to race with rpm suspend, since that
potentially wants to do the same thing, so just wrap the whole test.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
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

