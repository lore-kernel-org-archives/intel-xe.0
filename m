Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49F7BCD37AB
	for <intel-xe@archiver.kernel.org>; Thu,  7 May 2026 16:20:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8B1410F1F8;
	Thu,  7 May 2026 16:20:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b4QHvrO2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2178510E0BD
 for <intel-xe@lists.freedesktop.org>; Thu,  7 May 2026 16:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778170825; x=1809706825;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=w1sCa2c4rnE3FwmTrM8++EB6/9j0IajUbp9Wz7BPi3U=;
 b=b4QHvrO2yA53KuLravO1wJUk8ElAkeHcLg96741vcdzk0cA2zDJ1p3S1
 /mU1thrvd7U6HV62QS2o3jgzfpwhQEdKrIf2wvfZoIAdonarBDtu9g5Go
 GEwQk5eJuUWSYVr8nb3ZibIjk8/eiaIclt0fLYn8GSCAw8PX/8ho6Kl+g
 Gi7+tXO2a2SHI+p7pVe7d39UxIm+6SMops6J0OtMmD8IeFZof1ZsfkeB/
 xan3paAGM2OcPSmthuPNbtaSLXNE7h8+wE/m6o/kUQ0LwKSjhIzMJJx6p
 3oL8Oc672xoe5p33ZD6EGZxsCDrLrJN2AWOqVv+FAwWqnzVXeLvOiNO4E Q==;
X-CSE-ConnectionGUID: wTws2z1IQj6TOrYBeLONpw==
X-CSE-MsgGUID: iiw57501TjCWFLPTUPCrmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="79063602"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; d="scan'208";a="79063602"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 09:20:24 -0700
X-CSE-ConnectionGUID: N0P02p6RTEaJhBuULgs76w==
X-CSE-MsgGUID: 0M/ef9c9ScqXIxGnvVsweg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; d="scan'208";a="266876572"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 09:20:24 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org,
	niranjana.vishwanathapura@intel.com
Cc: matthew.brost@intel.com,
	stuart.summers@intel.com
Subject: [PATCH v5 04/11] drm/xe/multi_queue: Refactor check for multi queue
 support for engine class
Date: Thu,  7 May 2026 09:20:21 -0700
Message-ID: <20260507162016.3888309-17-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260507162016.3888309-13-umesh.nerlige.ramappa@intel.com>
References: <20260507162016.3888309-13-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
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

xe exec queue code is using a check to see if a class of engines support
multi queue. This check is also needed by other code, so move it to
xe_gt and export it for others.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
v2: (Niranjana)
- s/xe_gt_hwe_class_supports_multi_queue/xe_gt_supports_multi_queue/
- Update comment for helper
- Move helper to header and make it static inline
---
 drivers/gpu/drm/xe/xe_exec_queue.c |  7 +------
 drivers/gpu/drm/xe/xe_gt.h         | 15 +++++++++++++++
 2 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 071b8c41df43..62a75c8fe72f 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -852,11 +852,6 @@ static int xe_exec_queue_group_init(struct xe_device *xe, struct xe_exec_queue *
 	return 0;
 }
 
-static inline bool xe_exec_queue_supports_multi_queue(struct xe_exec_queue *q)
-{
-	return q->gt->info.multi_queue_engine_class_mask & BIT(q->class);
-}
-
 static int xe_exec_queue_group_validate(struct xe_device *xe, struct xe_exec_queue *q,
 					u32 primary_id)
 {
@@ -931,7 +926,7 @@ static void xe_exec_queue_group_delete(struct xe_device *xe, struct xe_exec_queu
 static int exec_queue_set_multi_group(struct xe_device *xe, struct xe_exec_queue *q,
 				      u64 value)
 {
-	if (XE_IOCTL_DBG(xe, !xe_exec_queue_supports_multi_queue(q)))
+	if (XE_IOCTL_DBG(xe, !xe_gt_supports_multi_queue(q->gt, q->class)))
 		return -ENODEV;
 
 	if (XE_IOCTL_DBG(xe, !xe_device_uc_enabled(xe)))
diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
index de7e47763411..4150aa594f05 100644
--- a/drivers/gpu/drm/xe/xe_gt.h
+++ b/drivers/gpu/drm/xe/xe_gt.h
@@ -155,4 +155,19 @@ static inline bool xe_gt_recovery_pending(struct xe_gt *gt)
 		xe_gt_sriov_vf_recovery_pending(gt);
 }
 
+/**
+ * xe_gt_supports_multi_queue() - Check if gt supports multi queue for the
+ * specified engine class.
+ *
+ * @gt: the GT object
+ * @class: hwe class type
+ *
+ * Return: true if the hw engine class supports multi queue, else false
+ */
+static inline bool xe_gt_supports_multi_queue(const struct xe_gt *gt,
+					      enum xe_engine_class class)
+{
+	return gt->info.multi_queue_engine_class_mask & BIT(class);
+}
+
 #endif
-- 
2.51.0

