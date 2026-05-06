Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D7A0CD342C
	for <intel-xe@archiver.kernel.org>; Wed,  6 May 2026 22:35:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33C9310EEF7;
	Wed,  6 May 2026 22:35:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GkS2Tzbr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82BCD10EF03
 for <intel-xe@lists.freedesktop.org>; Wed,  6 May 2026 22:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778106912; x=1809642912;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=seRr89lAWOYmQ1vFzVecwC8f2GerDxYqkIAnN8fIqxM=;
 b=GkS2TzbrC9cyxyfu+cp4yJ85j4sWjthSIoRAIQ7DY+aJx1VcbC+zQMNo
 N/9rgfFbvg4c49mfVAw14P5MAVXy5IaxulHFFToPdWj3vj1Xm7B3HyUH5
 8tO1wCUqnuUpdFlbK//ZXyMo/4tVtod4/c7MMsZb6bMpbijaD6dQbD58P
 QNbl9cksthko4HMa9SS8TtSN/gaawYq0iC1RTqbbYEVKV3+tEptF1XwwA
 4wwYj39yvCZ+7wnx2IcAmpB1EUYMtyYVvkd+cLFysAya6pnfHqI3fT/zp
 PA8htNCAvyDO6jD8UMaIFALlC3UMkc6SjvmHHaYnQ3ul33/LDOhxwens1 w==;
X-CSE-ConnectionGUID: PSe3wOFqSs6FTCRSC74/DQ==
X-CSE-MsgGUID: Hqn/siOwReqM7dxLiPb/jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="90429712"
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; d="scan'208";a="90429712"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 15:35:11 -0700
X-CSE-ConnectionGUID: +NXx6itiQxuiD9BoS+Dk6g==
X-CSE-MsgGUID: Lbu6rJRQTaarQCrqdB18dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; d="scan'208";a="259707473"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 15:35:11 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org,
	niranjana.vishwanathapura@intel.com
Cc: matthew.brost@intel.com,
	stuart.summers@intel.com
Subject: [PATCH v4 04/11] drm/xe/multi_queue: Refactor check for multi queue
 support for engine class
Date: Wed,  6 May 2026 15:35:05 -0700
Message-ID: <20260506223500.3769614-17-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260506223500.3769614-13-umesh.nerlige.ramappa@intel.com>
References: <20260506223500.3769614-13-umesh.nerlige.ramappa@intel.com>
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

