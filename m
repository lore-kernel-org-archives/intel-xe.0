Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85CCED3B9B7
	for <intel-xe@archiver.kernel.org>; Wed, 10 Dec 2025 00:39:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45BE110E21F;
	Wed, 10 Dec 2025 00:39:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GovjH0rd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51DFE10E5D1
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Dec 2025 00:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765327164; x=1796863164;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZhPt6LPWezkyQij91Pu/IdOwWp34WfrFBPiYKrU7ZZA=;
 b=GovjH0rdsNT559wqRUT26wpUBPejn1PhFTEbY/kgd1HG82Kz6TX6w7VM
 hf3CdCtyuX0o0c27zAHz5Ok4n9qKe3cJQw7vGipdrj/mEpuq3VF4hzYZc
 DUiMPlxFv9owRJotujo6+QGQJujCBG4vTa9AgKKD0qNj/nSj6JomYQRWS
 jrdFwIThZcuXOl6hLrPkQUoz4JkEa9LIFRK90TD8Zuo2erTjhxPjpjhEV
 M1BevlFYPsv3SVJ9/coD2VD4JY1Ai+jwZHpxgOyIqkYcGHnccnAjJAPwZ
 Gw6QAfBNAVX/VtqdY5qfdh2SUL9+du3UsBrYQRrXCddxYsEl7zaDdQa77 A==;
X-CSE-ConnectionGUID: vdt7fe8USdWm4rxRNPPGrQ==
X-CSE-MsgGUID: Ov9BgXWCSlGCKGbN5xAphw==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="67180385"
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; d="scan'208";a="67180385"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 16:39:24 -0800
X-CSE-ConnectionGUID: NqslKGX4TWKOZh9v7eGZAg==
X-CSE-MsgGUID: a31H54QoTfq1fZK8NkmJTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; d="scan'208";a="196421554"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.139])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 16:39:24 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	matthew.d.roper@intel.com
Subject: [PATCH v5 17/17] drm/xe/doc: Add documentation for Multi Queue Group
 GuC interface
Date: Tue,  9 Dec 2025 16:39:28 -0800
Message-ID: <20251210003913.1612141-36-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251210003913.1612141-19-niranjana.vishwanathapura@intel.com>
References: <20251210003913.1612141-19-niranjana.vishwanathapura@intel.com>
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

Add kernel documentation for Multi Queue group GuC interface.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 Documentation/gpu/xe/xe_exec_queue.rst |  8 ++++
 drivers/gpu/drm/xe/xe_exec_queue.c     |  3 ++
 drivers/gpu/drm/xe/xe_guc_submit.c     | 57 ++++++++++++++++++++++++++
 3 files changed, 68 insertions(+)

diff --git a/Documentation/gpu/xe/xe_exec_queue.rst b/Documentation/gpu/xe/xe_exec_queue.rst
index 732af4741df4..8707806211c9 100644
--- a/Documentation/gpu/xe/xe_exec_queue.rst
+++ b/Documentation/gpu/xe/xe_exec_queue.rst
@@ -13,6 +13,14 @@ Multi Queue Group
 .. kernel-doc:: drivers/gpu/drm/xe/xe_exec_queue.c
    :doc: Multi Queue Group
 
+.. _multi-queue-group-guc-interface:
+
+Multi Queue Group GuC interface
+===============================
+
+.. kernel-doc:: drivers/gpu/drm/xe/xe_guc_submit.c
+   :doc: Multi Queue Group GuC interface
+
 Internal API
 ============
 
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index e16e4d2d4053..cb45962be14c 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -97,6 +97,9 @@
  * When GuC reports an error on any of the queues of a multi queue group,
  * the queue cleanup mechanism is invoked for all the queues of the group
  * as hardware cannot make progress on the multi queue context.
+ *
+ * Refer :ref:`multi-queue-group-guc-interface` for multi queue group GuC
+ * interface.
  */
 
 enum xe_exec_queue_sched_prop {
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index e870bd165708..87ebb8d0ba97 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -664,6 +664,63 @@ static void set_exec_queue_group_banned(struct xe_exec_queue *q)
 	xe_map_wr_field(xe_, &map_, 0, struct guc_submit_parallel_scratch, \
 			field_, val_)
 
+/**
+ * DOC: Multi Queue Group GuC interface
+ *
+ * The multi queue group coordination between KMD and GuC is through a software
+ * construct called Context Group Page (CGP). The CGP is a KMD managed 4KB page
+ * allocated in the global GTT.
+ *
+ * CGP format:
+ *
+ * +-----------+---------------------------+---------------------------------------------+
+ * | DWORD     | Name                      | Description                                 |
+ * +-----------+---------------------------+---------------------------------------------+
+ * | 0         | Version                   | Bits [15:8]=Major ver, [7:0]=Minor ver      |
+ * +-----------+---------------------------+---------------------------------------------+
+ * | 1..15     | RESERVED                  | MBZ                                         |
+ * +-----------+---------------------------+---------------------------------------------+
+ * | 16        | KMD_QUEUE_UPDATE_MASK_DW0 | KMD queue mask for queues 31..0             |
+ * +-----------+---------------------------+---------------------------------------------+
+ * | 17        | KMD_QUEUE_UPDATE_MASK_DW1 | KMD queue mask for queues 63..32            |
+ * +-----------+---------------------------+---------------------------------------------+
+ * | 18..31    | RESERVED                  | MBZ                                         |
+ * +-----------+---------------------------+---------------------------------------------+
+ * | 32        | Q0CD_DW0                  | Queue 0 context LRC descriptor lower DWORD  |
+ * +-----------+---------------------------+---------------------------------------------+
+ * | 33        | Q0ContextIndex            | Context ID for Queue 0                      |
+ * +-----------+---------------------------+---------------------------------------------+
+ * | 34        | Q1CD_DW0                  | Queue 1 context LRC descriptor lower DWORD  |
+ * +-----------+---------------------------+---------------------------------------------+
+ * | 35        | Q1ContextIndex            | Context ID for Queue 1                      |
+ * +-----------+---------------------------+---------------------------------------------+
+ * | ...       |...                        | ...                                         |
+ * +-----------+---------------------------+---------------------------------------------+
+ * | 158       | Q63CD_DW0                 | Queue 63 context LRC descriptor lower DWORD |
+ * +-----------+---------------------------+---------------------------------------------+
+ * | 159       | Q63ContextIndex           | Context ID for Queue 63                     |
+ * +-----------+---------------------------+---------------------------------------------+
+ * | 160..1024 | RESERVED                  | MBZ                                         |
+ * +-----------+---------------------------+---------------------------------------------+
+ *
+ * While registering Q0 with GuC, CGP is updated with Q0 entry and GuC is notified
+ * through XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_QUEUE H2G message which specifies
+ * the CGP address. When the secondary queues are added to the group, the CGP is
+ * updated with entry for that queue and GuC is notified through the H2G interface
+ * XE_GUC_ACTION_MULTI_QUEUE_CONTEXT_CGP_SYNC. GuC responds to these H2G messages
+ * with a XE_GUC_ACTION_NOTIFY_MULTIQ_CONTEXT_CGP_SYNC_DONE G2H message. GuC also
+ * sends a XE_GUC_ACTION_NOTIFY_MULTI_QUEUE_CGP_CONTEXT_ERROR notification for any
+ * error in the CGP. Only one of these CGP update messages can be outstanding
+ * (waiting for GuC response) at any time. The bits in KMD_QUEUE_UPDATE_MASK_DW*
+ * fields indicate which queue entry is being updated in the CGP.
+ *
+ * The primary queue (Q0) represents the multi queue group context in GuC and
+ * submission on any queue of the group must be through Q0 GuC interface only.
+ *
+ * As it is not required to register secondary queues with GuC, the secondary queue
+ * context ids in the CGP are populated with Q0 context id.
+ */
+
 #define CGP_VERSION_MAJOR_SHIFT	8
 
 static void xe_guc_exec_queue_group_cgp_update(struct xe_device *xe,
-- 
2.43.0

