Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 377D4EDE985
	for <intel-xe@archiver.kernel.org>; Thu, 14 Sep 2023 06:05:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D87DD10E507;
	Thu, 14 Sep 2023 06:05:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09F0710E506
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Sep 2023 06:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694671547; x=1726207547;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BWniwdDNtk8A3HQgb6lWGmgRbzVCWuUsVmmxeLHxAaw=;
 b=aTcqBWrzbsGBTSOtcWg+M/qXZbQiGBcQJje0YTP1ca/HSHIzJ6yhhsiW
 sTmPoUWusiscKjAw3aQhyCrjvnyKHFCpjnW9xNCzFIh/92q+Tq8DQ2Eem
 KEVdJDVeQtkMvtlc5aDRUFxhJJbg8bHvRA5+XLZnJJJ7q1QkD90DIikD+
 Nlxf0kJ/yL+y+yl2jFJjVkZlWDhWVX/zPWCLQKeddYis1HmthpK+aRezW
 3kruoUvVknNvz8p5uNxjLTXBT1x8j0P083hz6Si1/XAPw+fiGST3BYdOp
 VOy5gDz6WJdEIjjt6ovbUKTpBpY4f6j9p3QrBFuZjU1K8poaxNfZPejKe g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="381547246"
X-IronPort-AV: E=Sophos;i="6.02,145,1688454000"; d="scan'208";a="381547246"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2023 23:04:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="773770177"
X-IronPort-AV: E=Sophos;i="6.02,145,1688454000"; d="scan'208";a="773770177"
Received: from aravind-dev.iind.intel.com ([10.145.162.80])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2023 23:04:48 -0700
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 14 Sep 2023 11:43:15 +0530
Message-Id: <20230914061317.1024579-2-aravind.iddamsetty@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230914061317.1024579-1-aravind.iddamsetty@linux.intel.com>
References: <20230914061317.1024579-1-aravind.iddamsetty@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 1/3] drm/xe: Get GT clock to nanosecs
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
Cc: rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Helper to convert GT clock cycles to nanoseconds.

v2: Use DIV_ROUND_CLOSEST_ULL helper(Ashutosh)
v3: rename xe_gt_clock_interval_to_ns to xe_gt_clock_cycles_to_ns

Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_gt_clock.c | 5 +++++
 drivers/gpu/drm/xe/xe_gt_clock.h | 4 +++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_clock.c b/drivers/gpu/drm/xe/xe_gt_clock.c
index 9136937324f3..25a18eaad9c4 100644
--- a/drivers/gpu/drm/xe/xe_gt_clock.c
+++ b/drivers/gpu/drm/xe/xe_gt_clock.c
@@ -78,3 +78,8 @@ int xe_gt_clock_init(struct xe_gt *gt)
 	gt->info.clock_freq = freq;
 	return 0;
 }
+
+u64 xe_gt_clock_cycles_to_ns(const struct xe_gt *gt, u64 count)
+{
+	return DIV_ROUND_CLOSEST_ULL(count * NSEC_PER_SEC, gt->info.clock_freq);
+}
diff --git a/drivers/gpu/drm/xe/xe_gt_clock.h b/drivers/gpu/drm/xe/xe_gt_clock.h
index 511923afd224..aa162722f859 100644
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
+u64 xe_gt_clock_cycles_to_ns(const struct xe_gt *gt, u64 count);
 #endif
-- 
2.25.1

