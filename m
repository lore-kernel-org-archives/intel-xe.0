Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4153CC76196
	for <intel-xe@archiver.kernel.org>; Tue, 28 Mar 2023 19:58:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1056B10E9CA;
	Tue, 28 Mar 2023 19:58:30 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7748710E491
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Mar 2023 19:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680033504; x=1711569504;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dm2TGypj3XR0h7LF1r5tPmkde1fCFwx8r7URpZEhP4s=;
 b=aDA7dfnZNNboERLhzjsUxxvWaKIeZ/HxwPFWEKFh48DUYY9KoJRA79hM
 /OEgCB9xCe5aSfGSgXI3v5ZI9PIyk/GL4v4x9Z6mGiLkU3LLQvdEOlQAS
 mIMsBCz8oTxciZ9URaB8nZhOJhr69gedJ2qBiqtUSyPBJBwH4AJzcOUOT
 rS6wmqNJEo12V3q012HukMGWtgKUcF1gF8NIpj/HPN44cCCVgStqmyE7k
 4qV9pr9oPGH1XxmE9/QY0IjiffjcUEh/4nrAS0VzFCLGFkinHd+eNgLV/
 mKmKswqTrYecrVEB0I+RZdtvvYH3YcDiLb6IxVYwuHu+cjaIorbkhuWoG A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="343087488"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; d="scan'208";a="343087488"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2023 12:58:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="827609937"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; d="scan'208";a="827609937"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2023 12:58:25 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 28 Mar 2023 12:58:22 -0700
Message-Id: <20230328195822.1941865-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230328195822.1941865-1-matthew.brost@intel.com>
References: <20230328195822.1941865-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/2] drm/xe: Dump GuC log on
 xe_gt_record_default_lrcs failure
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

This will help debug driver load failures.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_uc.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
index 70eabf567156..5b76328fc0af 100644
--- a/drivers/gpu/drm/xe/xe_uc.c
+++ b/drivers/gpu/drm/xe/xe_uc.c
@@ -8,6 +8,7 @@
 #include "xe_device.h"
 #include "xe_gt.h"
 #include "xe_guc.h"
+#include "xe_guc_log.h"
 #include "xe_guc_pc.h"
 #include "xe_guc_submit.h"
 #include "xe_huc.h"
@@ -149,8 +150,12 @@ int xe_uc_init_hw(struct xe_uc *uc)
 		return ret;
 
 	ret = xe_gt_record_default_lrcs(uc_to_gt(uc));
-	if (ret)
+	if (ret) {
+		struct drm_printer p = drm_info_printer(uc_to_xe(uc)->drm.dev);
+
+		xe_guc_log_print(&uc->guc.log, &p);
 		return ret;
+	}
 
 	ret = xe_guc_post_load_init(&uc->guc);
 	if (ret)
-- 
2.34.1

