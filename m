Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB182EB64D9
	for <intel-xe@archiver.kernel.org>; Mon, 19 Jun 2023 04:48:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52A3910E09C;
	Mon, 19 Jun 2023 04:48:11 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 014E310E09C
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Jun 2023 04:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687150088; x=1718686088;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=PDG48u0iZC/GXfLaR4GemhvnF08FuZokZY+ysLm7tYw=;
 b=J1pXegV8IX23QtnlVM8UQ+AdMCjyHy0sQxHjMo5fIK/fdCZ312Oj2boZ
 zt702OjeV+geQKemAfD5zbTb3pKO2UkJmGFytuHsM2Lq+CQMW5RLwBa8E
 idjMrhl01sw0XJ3txPIqeGCRa0k/650yjl+oC/LhPWEFzHH/zW69oBWPT
 nKgFm6RpLN76sj2Bt1BIGBGm2wNg7mOKvMAUvZ10A00PVL2eJQOvF1mg1
 o56MLVAcK4G+qCC8ouMiDJyftpiD1ttzt0ABIfMbfsrn0KmWaYMfnfR/6
 +H2PIiq31h1VISo1Arw5Q3Ru1kpCqe4zf7lnQmwBZp4sg4Y5rwu2J2b15 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10745"; a="349260735"
X-IronPort-AV: E=Sophos;i="6.00,253,1681196400"; d="scan'208";a="349260735"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2023 21:48:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10745"; a="713541754"
X-IronPort-AV: E=Sophos;i="6.00,253,1681196400"; d="scan'208";a="713541754"
Received: from aravind-dev.iind.intel.com ([10.145.162.80])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2023 21:48:07 -0700
From: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 19 Jun 2023 10:21:27 +0530
Message-Id: <20230619045128.3716798-2-aravind.iddamsetty@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230619045128.3716798-1-aravind.iddamsetty@intel.com>
References: <20230619045128.3716798-1-aravind.iddamsetty@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/2] drm/xe: Get GT clock to nanosecs
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

Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_clock.c | 10 ++++++++++
 drivers/gpu/drm/xe/xe_gt_clock.h |  4 +++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_clock.c b/drivers/gpu/drm/xe/xe_gt_clock.c
index 7cf11078ff57..3689c7d5cf53 100644
--- a/drivers/gpu/drm/xe/xe_gt_clock.c
+++ b/drivers/gpu/drm/xe/xe_gt_clock.c
@@ -78,3 +78,13 @@ int xe_gt_clock_init(struct xe_gt *gt)
 	gt->info.clock_freq = freq;
 	return 0;
 }
+
+static u64 div_u64_roundup(u64 nom, u32 den)
+{
+	return div_u64(nom + den - 1, den);
+}
+
+u64 xe_gt_clock_interval_to_ns(const struct xe_gt *gt, u64 count)
+{
+	return div_u64_roundup(count * NSEC_PER_SEC, gt->info.clock_freq);
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

