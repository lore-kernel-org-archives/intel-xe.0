Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6419BC27C4F
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jun 2024 13:57:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 004EC10E8BE;
	Wed, 26 Jun 2024 13:57:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FAFZHMj9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AEE510E8BE
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jun 2024 13:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719410261; x=1750946261;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9yuGUDGvURhDdWvqn4kRG+HQbmgrZoikcD8BR2bC6FI=;
 b=FAFZHMj9m+UZUTu0h2kD9utt+wHNuUT+Q+rTnxldwH/3ps9Y7hbh5TDo
 S6BMNyMc+aOlYpMhgO2mOnuJz261qXrP26lNo9SzZQW+MpiEbs/vdrTte
 R6iKA53AweSJZd9UmRsnZLIu5CjGRaTyznSwGmpgmJgghaKxlC1pnzC7n
 LJzx4ZIJlbOFyRM4o7al9YVdWHtO1eG785hDbbiatPnM6iRaJ0nfdQbUu
 finWbCFPN9IXfBmNe+KNTqIPFoI0zu/ymCJMUcaJ3FSMmhUufec2enFt0
 oojp/tj0BBZImLk4QLXiyBE5/l+8wHe3kDnZYgUpi59ItQCYgnCzB2pW+ g==;
X-CSE-ConnectionGUID: DApaSL75RHi1d6bDU4ENeg==
X-CSE-MsgGUID: GL8AlZR0TByrKBx7m9DJLA==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="16624030"
X-IronPort-AV: E=Sophos;i="6.08,267,1712646000"; d="scan'208";a="16624030"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 06:57:41 -0700
X-CSE-ConnectionGUID: pk/IPoRfRcu2tKSDygJrbA==
X-CSE-MsgGUID: buYxnU3LQMa5tLSQStRmhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,267,1712646000"; d="scan'208";a="43976910"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 06:57:39 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH v2] drm/xe/guc: Configure TLB timeout based on CT buffer size
Date: Wed, 26 Jun 2024 15:42:39 +0200
Message-ID: <20240626134239.5190-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany, Commercial Register: Amtsgericht Muenchen HRB 186928
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

GuC TLB invalidation depends on GuC to process the request from the CT
queue and then the real time to invalidate TLB. Add a function to return
overestimated possible time a TLB inval H2G might take which can be used
as timeout value for TLB invalidation wait time.

v2: Address reviews from Michal.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1622
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Suggested-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |  7 ++++++-
 drivers/gpu/drm/xe/xe_guc_ct.c              | 13 +++++++++++++
 drivers/gpu/drm/xe/xe_guc_ct.h              |  2 ++
 3 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index e1f1ccb01143..6fc85f711074 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -17,7 +17,12 @@
 #include "xe_trace.h"
 #include "regs/xe_guc_regs.h"
 
-#define TLB_TIMEOUT	(HZ / 4)
+/**
+ * TLB inval depends on pending commands in the CT queue and then the real
+ * invalidation time. Double up the time to process full CT queue
+ * just to be on the safe side.
+ */
+#define TLB_TIMEOUT	(xe_ct_full_queue_proc_time_jiffies() * 2)
 
 static void xe_gt_tlb_fence_timeout(struct work_struct *work)
 {
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 873d1bcbedd7..0cdf0d4d20e5 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -112,6 +112,19 @@ ct_to_xe(struct xe_guc_ct *ct)
 #define CTB_G2H_BUFFER_SIZE	(4 * CTB_H2G_BUFFER_SIZE)
 #define G2H_ROOM_BUFFER_SIZE	(CTB_G2H_BUFFER_SIZE / 4)
 
+/**
+ * xe_ct_full_queue_proc_time_jiffies - Return maximum time to process a full CT command queue
+ *
+ * Observation is that A 4KB buffer full of commands takes a little over a second to process.
+ * Use that to calculate maximum time to process a full CT command queue.
+ *
+ * Return: Maximum time to process the full CT queue in jiffies.
+ */
+long xe_ct_full_queue_proc_time_jiffies(void)
+{
+	return (CTB_H2G_BUFFER_SIZE * HZ) / SZ_4K;
+}
+
 static size_t guc_ct_size(void)
 {
 	return 2 * CTB_DESC_SIZE + CTB_H2G_BUFFER_SIZE +
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
index 105bb8e99a8d..57280f82dc35 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.h
+++ b/drivers/gpu/drm/xe/xe_guc_ct.h
@@ -64,4 +64,6 @@ xe_guc_ct_send_block_no_fail(struct xe_guc_ct *ct, const u32 *action, u32 len)
 	return xe_guc_ct_send_recv_no_fail(ct, action, len, NULL);
 }
 
+long xe_ct_full_queue_proc_time_jiffies(void);
+
 #endif
-- 
2.42.0

