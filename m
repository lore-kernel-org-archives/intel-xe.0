Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85206EB64DC
	for <intel-xe@archiver.kernel.org>; Tue, 27 Jun 2023 12:17:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42D5B10E2E0;
	Tue, 27 Jun 2023 12:17:39 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 298D110E175
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Jun 2023 12:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687868255; x=1719404255;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=PDG48u0iZC/GXfLaR4GemhvnF08FuZokZY+ysLm7tYw=;
 b=JMQcLgvHqsnFhSlKCZJuyajdfVallJx40ZA4IRUJdK2N446Nq8n4thVH
 82sW0RVHdE9/UlSWx5LpoW4AwDnjn5ljzuNvX9TtFG5KnnFw8TbszJ778
 AZFJB26Zjhbc5hvmQkUfBlWXe6/M0DdW194bI7TZL/EIfolWwGPyA/wFg
 t++2op9j+3j693VbLq1sbb6e3uzcfRAQwi12AREEeFs5Gg6QEOvIDTh8M
 LVYUVqIz8E6Z+NaS6A8O/lEjAf/Kpn3FYpvGBHvHpTlU2o8yTojvT39Ej
 jHO+wVMlonf6hbS6chLVxJLSRpr+qYyfyf+nC6zSK3Do/o6Js3Bs33RGf w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="341144802"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; d="scan'208";a="341144802"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2023 05:17:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="746179415"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; d="scan'208";a="746179415"
Received: from aravind-dev.iind.intel.com ([10.145.162.80])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2023 05:17:33 -0700
From: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 27 Jun 2023 17:51:12 +0530
Message-Id: <20230627122113.1472532-2-aravind.iddamsetty@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230627122113.1472532-1-aravind.iddamsetty@intel.com>
References: <20230627122113.1472532-1-aravind.iddamsetty@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 1/2] drm/xe: Get GT clock to nanosecs
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

