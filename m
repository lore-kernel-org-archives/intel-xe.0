Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D659BC4167D
	for <intel-xe@archiver.kernel.org>; Tue, 31 Oct 2023 22:15:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2D7A10E5DA;
	Tue, 31 Oct 2023 22:15:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBCCF10E5D8
 for <intel-xe@lists.freedesktop.org>; Tue, 31 Oct 2023 22:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698790511; x=1730326511;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=jdtNnwz8X76YNifk8lF4Wz5J+Fy/cvYfS16RVxfLrqI=;
 b=MtICmfKxQW27XyIJgK0Kjo0Ruw31kAonIuAn7qQJD928i4XpdEZw/pL1
 9j3eM9d+4MUvalqa9XcwnmqE9uz6U+eRBMGeuZru1fdGIr0KHAaa5jppq
 QqX7bxcNcBAiwcJ8iiwV8A+NvZJASM3aklhiG5HpkWIWaAKubYAG1uNKA
 LX6S/7zAV+hY+NUq9tKKL122ICuPJlGvlrXL2MJsh1iG+oyC7iwpf0/s+
 ZbNsYL6cH50gOur+7B+jcK97HBQpTht0U6umds1T2/hkRc4up7jM/ipst
 7fMpuDaVKwn/lalANxWvY0qd7Vou5X0Zoz9thOMc00A0g1x9Tcon4V036 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="452674823"
X-IronPort-AV: E=Sophos;i="6.03,266,1694761200"; d="scan'208";a="452674823"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2023 15:15:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="789926634"
X-IronPort-AV: E=Sophos;i="6.03,266,1694761200"; d="scan'208";a="789926634"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2023 15:15:11 -0700
From: Brian Welty <brian.welty@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 31 Oct 2023 15:15:09 -0700
Message-Id: <20231031221510.29355-2-brian.welty@intel.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20231031221510.29355-1-brian.welty@intel.com>
References: <20231031221510.29355-1-brian.welty@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/2] drm/xe: Fix dequeue of access counter work
 item
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

The access counters worker function is fixed to advance the head pointer
when dequeuing from the acc_queue.  This now matches the similar logic in
get_pagefault().

Signed-off-by: Bruce Chang <yu.bruce.chang@intel.com>
Signed-off-by: Brian Welty <brian.welty@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_pagefault.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index 2ec0db7a4b29..ab6daebbd77c 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -542,6 +542,8 @@ static int handle_acc(struct xe_gt *gt, struct acc *acc)
 
 #define make_u64(hi__, low__)  ((u64)(hi__) << 32 | (u64)(low__))
 
+#define ACC_MSG_LEN_DW        4
+
 static int get_acc(struct acc_queue *acc_queue, struct acc *acc)
 {
 	const struct xe_guc_acc_desc *desc;
@@ -562,6 +564,9 @@ static int get_acc(struct acc_queue *acc_queue, struct acc *acc)
 		acc->access_type = FIELD_GET(ACC_TYPE, desc->dw0);
 		acc->va_range_base = make_u64(desc->dw3 & ACC_VIRTUAL_ADDR_RANGE_HI,
 					      desc->dw2 & ACC_VIRTUAL_ADDR_RANGE_LO);
+
+		acc_queue->head = (acc_queue->head + ACC_MSG_LEN_DW) %
+				  ACC_QUEUE_NUM_DW;
 	} else {
 		ret = -1;
 	}
@@ -589,8 +594,6 @@ static void acc_queue_work_func(struct work_struct *w)
 	}
 }
 
-#define ACC_MSG_LEN_DW	4
-
 static bool acc_queue_full(struct acc_queue *acc_queue)
 {
 	lockdep_assert_held(&acc_queue->lock);
-- 
2.38.0

