Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79B7DC001B0
	for <intel-xe@archiver.kernel.org>; Mon, 14 Aug 2023 13:08:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 484AD10E1EB;
	Mon, 14 Aug 2023 13:08:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBF1010E1F3
 for <intel-xe@lists.freedesktop.org>; Mon, 14 Aug 2023 13:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692018503; x=1723554503;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=L6RBbBal97LG9cgiAKiSpXmq7bo5nyP62mJYdJmmAGU=;
 b=hAHquxNRxMW47jz32Jdf9a4o8oN77ehL8lTV4ULGPSdb5qM6DkQA5YnN
 5VNCq2hdFcyshYu13a5f5Xd2maU1JDqJd8U+mItg4XpAAnuZzH3R0JXaE
 mkNl3xdE3g/6Ux2vNHRU6n6WiiD1dmZmsLLkAo6kp//QXp4mUtwDj7tKB
 fPgSJZjMOYnIjU/EqCMv2p2A5/qKxH3j+WDwjox7hNQWYDW+48Y5gsV8P
 wyIEfkupUCAu8gtpoGdpxV+fifzWO5UOjeoq/XICcrbDRsvRSunNtTimQ
 MO/tJkzHq1m78fTbD2Q7b/AaUuEM94RaJZzJGmUAs7QWp05H7uwuJEbOS A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="374804085"
X-IronPort-AV: E=Sophos;i="6.01,172,1684825200"; d="scan'208";a="374804085"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2023 06:08:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="907231848"
X-IronPort-AV: E=Sophos;i="6.01,172,1684825200"; d="scan'208";a="907231848"
Received: from aravind-dev.iind.intel.com ([10.145.162.80])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2023 06:08:21 -0700
From: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 14 Aug 2023 18:42:12 +0530
Message-Id: <20230814131213.1620252-2-aravind.iddamsetty@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230814131213.1620252-1-aravind.iddamsetty@intel.com>
References: <20230814131213.1620252-1-aravind.iddamsetty@intel.com>
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

Helper to convert GT clock cycles to nanoseconds.

v2: Use DIV_ROUND_CLOSEST_ULL helper(Ashutosh)
v3: rename xe_gt_clock_interval_to_ns to xe_gt_clock_cycles_to_ns

Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_clock.c | 5 +++++
 drivers/gpu/drm/xe/xe_gt_clock.h | 4 +++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_clock.c b/drivers/gpu/drm/xe/xe_gt_clock.c
index 2f77b8bbcf53..c67080ce1593 100644
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

