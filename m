Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E898ECD343B
	for <intel-xe@archiver.kernel.org>; Tue,  5 May 2026 23:44:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4331810E4C5;
	Tue,  5 May 2026 23:44:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mJkkjGE+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB87E10E18F
 for <intel-xe@lists.freedesktop.org>; Tue,  5 May 2026 23:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778024658; x=1809560658;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=A4+WRS465WwvElMdD/Qey2xw5fxA/BtAgDooCnL1TzA=;
 b=mJkkjGE+Jz7iFPDiDC3zzrDC+a3WpLhQqsBvGt3O4QnloafKpYai8MqO
 bWJE23JmTEambIpVRTYLbWgdl55f9Pyrlyi7ExCNbgwuEp7RbOJYaY4ab
 1dqHOTTKOKB17Lnf2fBtH2jzcG5ADApQX4+568tWqlrKdFOWjuil/+Opo
 UFewwyuuW5owxV26MkQFpg1voq+hq8ZmL72zRtKJwCWtrN50I/HvQutZ1
 nS01ppTpASpciNdwvf9r1GrI8Vz5T4mCV6RpGPwv48jtrwLD+Er78pTED
 x7ubohDoLUKq3cmbQRIWQfooJfndC69VmGXcoN3LKodL3dqhFJPm8r8N4 w==;
X-CSE-ConnectionGUID: 7FfdR5rNRhab604Oo8pibw==
X-CSE-MsgGUID: vtwOJePARWKWFGTsfUl+zA==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="78771095"
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; d="scan'208";a="78771095"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 16:44:16 -0700
X-CSE-ConnectionGUID: Z9cogdgIShKF+FpBzcTm5A==
X-CSE-MsgGUID: fJthG3BJRIa1G5WYhkty0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; d="scan'208";a="231569040"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 16:44:16 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org,
	niranjana.vishwanathapura@intel.com
Cc: matthew.brost@intel.com,
	stuart.summers@intel.com
Subject: [PATCH v3 04/11] drm/xe/multi_queue: Refactor check for multi queue
 support for engine class
Date: Tue,  5 May 2026 16:44:13 -0700
Message-ID: <20260505234408.3552147-17-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260505234408.3552147-13-umesh.nerlige.ramappa@intel.com>
References: <20260505234408.3552147-13-umesh.nerlige.ramappa@intel.com>
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
 drivers/gpu/drm/xe/xe_exec_queue.c |  7 +------
 drivers/gpu/drm/xe/xe_gt.c         | 14 ++++++++++++++
 drivers/gpu/drm/xe/xe_gt.h         |  3 +++
 3 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 071b8c41df43..9b36ff5b09a6 100644
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
+	if (XE_IOCTL_DBG(xe, !xe_gt_hwe_class_supports_multi_queue(q->gt, q->class)))
 		return -ENODEV;
 
 	if (XE_IOCTL_DBG(xe, !xe_device_uc_enabled(xe)))
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index cdc678d1ae1f..0b49252e2001 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -1170,6 +1170,20 @@ struct xe_hw_engine *xe_gt_any_hw_engine(struct xe_gt *gt)
 	return NULL;
 }
 
+/**
+ * xe_gt_hwe_class_supports_multi_queue() - Check hwe class supports multi queue.
+ *
+ * @gt: the GT object
+ * @class: hwe class type
+ *
+ * Return: true if the hw engine class supports multi queue, else false
+ */
+bool xe_gt_hwe_class_supports_multi_queue(const struct xe_gt *gt,
+					  enum xe_engine_class class)
+{
+	return gt->info.multi_queue_engine_class_mask & BIT(class);
+}
+
 /**
  * xe_gt_declare_wedged() - Declare GT wedged
  * @gt: the GT object
diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
index de7e47763411..1972ab01e716 100644
--- a/drivers/gpu/drm/xe/xe_gt.h
+++ b/drivers/gpu/drm/xe/xe_gt.h
@@ -155,4 +155,7 @@ static inline bool xe_gt_recovery_pending(struct xe_gt *gt)
 		xe_gt_sriov_vf_recovery_pending(gt);
 }
 
+bool xe_gt_hwe_class_supports_multi_queue(const struct xe_gt *gt,
+					  enum xe_engine_class class);
+
 #endif
-- 
2.51.0

