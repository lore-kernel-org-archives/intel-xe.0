Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 145EFC2BBCA
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jun 2024 09:04:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9293A10E0BE;
	Tue, 25 Jun 2024 09:04:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bFVgwxtK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2071810E0BE
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Jun 2024 09:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719306289; x=1750842289;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=61ioGvwW0oJ8lGPQBmNm1riatlIaojPh5imNmrQov7U=;
 b=bFVgwxtKxG+uNpDhdM5NmjBIJCWjIdVlDwjEPE4Rx45Ig3/URs5S5fse
 zVVs5deb0TWcyispyr8kR9zrZTpV3k5T11gyDvHN5Qwj1I4opUz1qEuLm
 hVTTMyzs2fhXqvrGDERN+aQ3rfmBDk2Oq9I+RRnZwVqFRIl7BXgjIhIRz
 8SfpYCIPCeQ+pVHr11U6qS10mExbBvk/mKegLfZrVqpIdqi2+mzVIe9XI
 1qO6zc4eSQClhZRoyeMtguxerJCnk+GZIZOxrcQcwL57p7deQxjzWB8zd
 xicpIfQVkMiVdc6VIWFaoH6yFDJ7b5El+Qyr9CYOTLPG2+63ImQ0KkcOv g==;
X-CSE-ConnectionGUID: TjJPJao0QrCQiXVRBh/IhA==
X-CSE-MsgGUID: /bCt6Kh8RBaB34B7lzFwPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="16456014"
X-IronPort-AV: E=Sophos;i="6.08,263,1712646000"; d="scan'208";a="16456014"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 02:04:49 -0700
X-CSE-ConnectionGUID: 4g+q+4bQTMeZUHQhxJO2Fg==
X-CSE-MsgGUID: XyOgSZwRTnSd/2uWxrRoxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,263,1712646000"; d="scan'208";a="74346016"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 02:04:48 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH] drm/xe/guc: Configure TLB timeout based on CT buffer size
Date: Tue, 25 Jun 2024 10:49:47 +0200
Message-ID: <20240625084947.30869-1-nirmoy.das@intel.com>
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

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1622
Cc: Matthew Brost <matthew.brost@intel.com>
Suggested-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |  2 +-
 drivers/gpu/drm/xe/xe_guc_ct.c              | 12 ++++++++++++
 drivers/gpu/drm/xe/xe_guc_ct.h              |  2 ++
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index e1f1ccb01143..fa61070d6201 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -17,7 +17,7 @@
 #include "xe_trace.h"
 #include "regs/xe_guc_regs.h"
 
-#define TLB_TIMEOUT	(HZ / 4)
+#define TLB_TIMEOUT	xe_guc_tlb_timeout_jiffies()
 
 static void xe_gt_tlb_fence_timeout(struct work_struct *work)
 {
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index b4137fe195a4..e30c0da86acc 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -112,6 +112,18 @@ ct_to_xe(struct xe_guc_ct *ct)
 #define CTB_G2H_BUFFER_SIZE	(4 * CTB_H2G_BUFFER_SIZE)
 #define G2H_ROOM_BUFFER_SIZE	(CTB_G2H_BUFFER_SIZE / 4)
 
+/**
+ * xe_guc_tlb_timeout_jiffies - Calculate the maximum time to process a tlb inval command
+ *
+ * This function computes the maximum time to process a tlb inval H2G commands
+ * in jiffies. A 4KB buffer full of commands takes a little over a second to process,
+ * so this time is set to 2 seconds to be safe.
+ */
+long xe_guc_tlb_timeout_jiffies(void)
+{
+	return (CTB_H2G_BUFFER_SIZE * HZ) / SZ_2K;
+}
+
 static size_t guc_ct_size(void)
 {
 	return 2 * CTB_DESC_SIZE + CTB_H2G_BUFFER_SIZE +
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
index 105bb8e99a8d..a9755574d6c9 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.h
+++ b/drivers/gpu/drm/xe/xe_guc_ct.h
@@ -64,4 +64,6 @@ xe_guc_ct_send_block_no_fail(struct xe_guc_ct *ct, const u32 *action, u32 len)
 	return xe_guc_ct_send_recv_no_fail(ct, action, len, NULL);
 }
 
+long xe_guc_tlb_timeout_jiffies(void);
+
 #endif
-- 
2.42.0

