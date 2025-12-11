Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16D0AD3E784
	for <intel-xe@archiver.kernel.org>; Thu, 11 Dec 2025 01:03:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC11410E6D3;
	Thu, 11 Dec 2025 01:03:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KQS0z8sw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ABC810E6C2
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Dec 2025 01:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765414979; x=1796950979;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RsfetDdr+odh6Nm78Jg6TUEys1WgxnNLm9qZeftzjcw=;
 b=KQS0z8swVbkCIwylwS4fr9NrcRA+uTbnn1NC9aM0T2rZAlf5a79oQQe2
 o/vjR8Jmq4jlVTCSY+XZCLDuIgb7EquGNcEDyNsumlhEaBf1ziHs7Lokt
 V8zdPhay8lvK1yENSrPsoBD1UpCMzKFaEk6Kjss8g3s1H3A+Rozbl3EcH
 8FqzpOBCq10ezT4sB+8khIi5WlBy7YgvGvRmCsCX0qawZa/TkhCDIyHKW
 Hgo4SiLWPXcbK8hF9IPC6ho7gXqvC9Zo0D4ISFYnvCxvJqamABdytCynK
 y55kC4XLmSIZsr3zdozvfyejKZuBnGNW4qYwkrGfGTT0/RKUTwfCz3kB8 Q==;
X-CSE-ConnectionGUID: wsUFUhBJSieIncRn8Aja6Q==
X-CSE-MsgGUID: BJgYlxwyRVOBB0ibt27DDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="67442877"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; d="scan'208";a="67442877"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 17:02:59 -0800
X-CSE-ConnectionGUID: hgNwm5lORHy11OjnXD2L+w==
X-CSE-MsgGUID: ItJz5jZeRzqezTLgE3SzdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; d="scan'208";a="196664143"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.139])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 17:02:58 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	matthew.d.roper@intel.com
Subject: [PATCH v6 16/17] drm/xe/doc: Add documentation for Multi Queue Group
Date: Wed, 10 Dec 2025 17:03:04 -0800
Message-ID: <20251211010249.1647839-35-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251211010249.1647839-19-niranjana.vishwanathapura@intel.com>
References: <20251211010249.1647839-19-niranjana.vishwanathapura@intel.com>
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

Add kernel documentation for Multi Queue group and update
the corresponding rst.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 Documentation/gpu/xe/xe_exec_queue.rst |  6 ++++
 drivers/gpu/drm/xe/xe_exec_queue.c     | 45 ++++++++++++++++++++++++++
 2 files changed, 51 insertions(+)

diff --git a/Documentation/gpu/xe/xe_exec_queue.rst b/Documentation/gpu/xe/xe_exec_queue.rst
index 6076569e311c..732af4741df4 100644
--- a/Documentation/gpu/xe/xe_exec_queue.rst
+++ b/Documentation/gpu/xe/xe_exec_queue.rst
@@ -7,6 +7,12 @@ Execution Queue
 .. kernel-doc:: drivers/gpu/drm/xe/xe_exec_queue.c
    :doc: Execution Queue
 
+Multi Queue Group
+=================
+
+.. kernel-doc:: drivers/gpu/drm/xe/xe_exec_queue.c
+   :doc: Multi Queue Group
+
 Internal API
 ============
 
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 3f4840d135a0..e16e4d2d4053 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -54,6 +54,51 @@
  * the ring operations the different engine classes support.
  */
 
+/**
+ * DOC: Multi Queue Group
+ *
+ * Multi Queue Group is another mode of execution supported by the compute
+ * and blitter copy command streamers (CCS and BCS, respectively). It is
+ * an enhancement of the existing hardware architecture and leverages the
+ * same submission model. It enables support for efficient, parallel
+ * execution of multiple queues within a single shared context. The multi
+ * queue group functionality is only supported with GuC submission backend.
+ * All the queues of a group must use the same address space (VM).
+ *
+ * The DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE execution queue property
+ * supports creating a multi queue group and adding queues to a queue group.
+ *
+ * The XE_EXEC_QUEUE_CREATE ioctl call with above property with value field
+ * set to DRM_XE_MULTI_GROUP_CREATE, will create a new multi queue group with
+ * the queue being created as the primary queue (aka q0) of the group. To add
+ * secondary queues to the group, they need to be created with the above
+ * property with id of the primary queue as the value. The properties of
+ * the primary queue (like priority, time slice) applies to the whole group.
+ * So, these properties can't be set for secondary queues of a group.
+ *
+ * The hardware does not support removing a queue from a multi-queue group.
+ * However, queues can be dynamically added to the group. A group can have
+ * up to 64 queues. To support this, XeKMD holds references to LRCs of the
+ * queues even after the queues are destroyed by the user until the whole
+ * group is destroyed. The secondary queues hold a reference to the primary
+ * queue thus preventing the group from being destroyed when user destroys
+ * the primary queue. Once the primary queue is destroyed, secondary queues
+ * can't be added to the queue group, but they can continue to submit the
+ * jobs if the DRM_XE_MULTI_GROUP_KEEP_ACTIVE flag is set during the multi
+ * queue group creation.
+ *
+ * The queues of a multi queue group can set their priority within the group
+ * through the DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY property.
+ * This multi queue priority can also be set dynamically through the
+ * XE_EXEC_QUEUE_SET_PROPERTY ioctl. This is the only other property
+ * supported by the secondary queues of a multi queue group, other than
+ * DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE.
+ *
+ * When GuC reports an error on any of the queues of a multi queue group,
+ * the queue cleanup mechanism is invoked for all the queues of the group
+ * as hardware cannot make progress on the multi queue context.
+ */
+
 enum xe_exec_queue_sched_prop {
 	XE_EXEC_QUEUE_JOB_TIMEOUT = 0,
 	XE_EXEC_QUEUE_TIMESLICE = 1,
-- 
2.43.0

