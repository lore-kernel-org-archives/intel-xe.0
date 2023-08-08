Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A71B7C001B0
	for <intel-xe@archiver.kernel.org>; Tue,  8 Aug 2023 11:50:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EBE110E158;
	Tue,  8 Aug 2023 11:50:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA98910E158
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Aug 2023 11:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691495441; x=1723031441;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LReJga2oyzikm7lXhuFFyNbH70QPmqwXLh5757c+4LM=;
 b=H433GsnxlfW131Z0d55zdREMysa2iMZaVKX3L69gPlR9yfk+ZdJO06xY
 /Nv/oI176nJ3e+xVwFS38248INjcRng2OTspG5Wy4nwEXZL49LU37n5T7
 saysLwh25uewCcatzdpQlGM8pt6yt56z3mPB17jyo4qiksAv0THnQXaLX
 k+bpJ/M0WjBXRVl6VGv+yB3d4MHzzLLqbmXxHP3cSzAO+HN06JEToYzS1
 evCjnU6me5iQ/gJVLLZsHkMTOM2YyDhFhgDVkRns96GJ84dujyLK8ESya
 wvjxm2mTmHB4AnuC9oHehtZNEXcrS2eUqe0s/gbCAo1QAcQY59SIz2Eqv Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="370790164"
X-IronPort-AV: E=Sophos;i="6.01,156,1684825200"; d="scan'208";a="370790164"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2023 04:50:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="724898497"
X-IronPort-AV: E=Sophos;i="6.01,156,1684825200"; d="scan'208";a="724898497"
Received: from aravind-dev.iind.intel.com ([10.145.162.80])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2023 04:50:39 -0700
From: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  8 Aug 2023 17:24:35 +0530
Message-Id: <20230808115436.400611-2-aravind.iddamsetty@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230808115436.400611-1-aravind.iddamsetty@intel.com>
References: <20230808115436.400611-1-aravind.iddamsetty@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 1/2] drm/xe: Get GT clock to nanosecs
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

Helpers to get GT clock to nanosecs

v2: Use DIV_ROUND_CLOSEST_ULL helper(Ashutosh)

Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_clock.c | 5 +++++
 drivers/gpu/drm/xe/xe_gt_clock.h | 4 +++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_clock.c b/drivers/gpu/drm/xe/xe_gt_clock.c
index 2f77b8bbcf53..88c29ad84146 100644
--- a/drivers/gpu/drm/xe/xe_gt_clock.c
+++ b/drivers/gpu/drm/xe/xe_gt_clock.c
@@ -78,3 +78,8 @@ int xe_gt_clock_init(struct xe_gt *gt)
 	gt->info.clock_freq = freq;
 	return 0;
 }
+
+u64 xe_gt_clock_interval_to_ns(const struct xe_gt *gt, u64 count)
+{
+	return DIV_ROUND_CLOSEST_ULL(count * NSEC_PER_SEC, gt->info.clock_freq);
+}
diff --git a/drivers/gpu/drm/xe/xe_gt_clock.h b/drivers/gpu/drm/xe/xe_gt_clock.h
index 511923afd224..91fc9b7e83f5 100644
--- a/drivers/gpu/drm/xe/xe_gt_clock.h
+++ b/drivers/gpu/drm/xe/xe_gt_clock.h
@@ -6,8 +6,10 @@
 #ifndef _XE_GT_CLOCK_H_
 #define _XE_GT_CLOCK_H_
 
+#include <linux/types.h>
+
 struct xe_gt;
 
 int xe_gt_clock_init(struct xe_gt *gt);
-
+u64 xe_gt_clock_interval_to_ns(const struct xe_gt *gt, u64 count);
 #endif
-- 
2.25.1

