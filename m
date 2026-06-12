Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97B82CD8CA8
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jun 2026 04:25:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D74710E097;
	Fri, 12 Jun 2026 04:25:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lhxn4LnV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3059110E097
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jun 2026 04:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781238355; x=1812774355;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kf9AU1frkyhGiLzAH3yKsIQBLkd6wnfNgcPihpqrIOA=;
 b=lhxn4LnVAysRgKB0MF8Mm1M4POkoDGPrI3doI7AciHT1qwOe25fgUWF6
 Hpz2VCSwkq4XAfAabTX1IZCxjzrZ8H/sfNDJOzQEZY/35Ilrxvf7yFh0/
 U8pFri5Gc3iJGIqezp/zAm23bTpuIXIs7qHLRTN6YxAWfK5JCujxnQg87
 6rcUen7A82u8act7cVzQNKmFOWqON8KpeNek2hH0JmYqjUNMIJBlUsN+D
 hfbr/lHYlkzmPHfcCAZmxTWpB5DYpc4EBK4xqlzuVfa4X890SERG2CT4W
 yHCxAOFaygqr0c1tv4OYva7+3j1bgFef+kVbDRV4mZ8h/6+cUYYZdTXhb A==;
X-CSE-ConnectionGUID: YeJJx2BkSSqOIrO1Yz04Pw==
X-CSE-MsgGUID: VSp4RyXcTFC2Y8WsX+l5xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="85966173"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; d="scan'208";a="85966173"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 21:25:54 -0700
X-CSE-ConnectionGUID: FVDFZvqPQb2vPByxgjN1Hw==
X-CSE-MsgGUID: 5TkOuQbVS72ngWD6MFy15w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; d="scan'208";a="245820251"
Received: from gsse-cloud1.jf.intel.com ([10.54.39.91])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 21:25:54 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Wang Xin <x.wang@intel.com>,
	Jia Yao <jia.yao@intel.com>
Subject: [PATCH] drm/xe: Disable scheduling early on FD close to avoid CAT
 error cascade
Date: Thu, 11 Jun 2026 21:25:48 -0700
Message-Id: <20260612042548.3740605-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

When an FD is closed with many exec queues, teardown relies on the TDR
path to clean up scheduling. However, the TDR handling is serialized
(i.e., only one exec queue is processed at a time), which can make it
too slow compared to GuC scheduling activity.

In this window, GuC may continue to schedule contexts backed by
invalid page tables, leading to a cascade of CAT errors and repeated
engine resets. This significantly increases recovery time and can
degrade system stability.

To mitigate this, eagerly disable scheduling by sending a self-message
outside of the TDR path. This prevents further scheduling of invalid
contexts and avoids the CAT error/reset cascade.

This change improves robustness and reduces recovery latency in
multiple queue teardown scenarios.

Cc: Wang Xin <x.wang@intel.com>
Cc: Jia Yao <jia.yao@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 32 ++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index e82018445b7c..1625d3cd03fc 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1872,11 +1872,23 @@ static void __guc_exec_queue_process_msg_set_multi_queue_priority(struct xe_sche
 	kfree(msg);
 }
 
+static void __guc_exec_queue_process_msg_kill(struct xe_sched_msg *msg)
+{
+	struct xe_exec_queue *q = msg->private_data;
+	struct xe_exec_queue *primary = xe_exec_queue_multi_queue_primary(q);
+
+	if (exec_queue_enabled(primary))
+		disable_scheduling(primary, true);
+
+	kfree(msg);
+}
+
 #define CLEANUP				1	/* Non-zero values to catch uninitialized msg */
 #define SET_SCHED_PROPS			2
 #define SUSPEND				3
 #define RESUME				4
 #define SET_MULTI_QUEUE_PRIORITY	5
+#define KILL				6
 #define OPCODE_MASK	0xf
 #define MSG_LOCKED	BIT(8)
 #define MSG_HEAD	BIT(9)
@@ -1903,6 +1915,9 @@ static void guc_exec_queue_process_msg(struct xe_sched_msg *msg)
 	case SET_MULTI_QUEUE_PRIORITY:
 		__guc_exec_queue_process_msg_set_multi_queue_priority(msg);
 		break;
+	case KILL:
+		__guc_exec_queue_process_msg_kill(msg);
+		break;
 	default:
 		XE_WARN_ON("Unknown message type");
 	}
@@ -2014,12 +2029,29 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
 
 	return err;
 }
+static void guc_exec_queue_add_msg(struct xe_exec_queue *q, struct xe_sched_msg *msg,
+				   u32 opcode);
 
 static void guc_exec_queue_kill(struct xe_exec_queue *q)
 {
+	struct xe_sched_msg *msg;
+
 	trace_xe_exec_queue_kill(q);
 	set_exec_queue_killed(q);
 	__suspend_fence_signal(q);
+
+	/*
+	 * We eagerly send a message to ourselves to disable scheduling, as the
+	 * TDR is serialized (i.e., only one exec queue is processed at a time).
+	 * If an FD is closed with many exec queues, the TDR can be slower than
+	 * the GuC scheduling contexts with invalid page tables, creating a
+	 * cascade of CAT errors and engine resets, which is quite slow. Avoid
+	 * this by immediately disabling scheduling outside of the TDR.
+	 */
+	msg = kmalloc_obj(*msg);
+	if (msg)	/* Not fatal if malloc fails */
+		guc_exec_queue_add_msg(q, msg, KILL);
+
 	xe_guc_exec_queue_trigger_cleanup(q);
 }
 
-- 
2.34.1

