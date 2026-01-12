Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07D25CF45DE
	for <intel-xe@archiver.kernel.org>; Mon, 12 Jan 2026 23:27:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82DE910E43E;
	Mon, 12 Jan 2026 23:27:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kEJBs4jA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16F6010E2BA
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Jan 2026 23:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768260457; x=1799796457;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hevKHwZHWaYD2u5GrMgvwlzv6cL2D183j6BF7RDe4a4=;
 b=kEJBs4jA0YO/rMREMAySho7NlYeTJ2ek4KZdPTr0pG3wZKV76glT2Nrx
 J9ExyvVYwCgCqyOncCBzMR1uIAk/aNZBylph9RgC3R7FRP7ManwlfrxFa
 AnWwuvlqek7Wp/wL0JBvAHWhXNGB/ukttHNGQd4b3eDbmoqkPzaBBQ7mp
 E6mc5q8mL23VioI0tOqFt8uR1ZlIcm/NlfRLCiSlQd82F6hkykRbc7T7j
 g5XMiPtcIdN5xdIrBa1KClz+otMFaXSWJ13+aB4/J4ZBjVhv8NKU6+m0r
 NKvSp4sxa4k//O9kqxOpnQYFaMF8VGZPEYxgh7Stp4tHil/ibtGCxgCoe Q==;
X-CSE-ConnectionGUID: zqUagb66QbGhUBNTgmmYPg==
X-CSE-MsgGUID: +s+gDJOISR2coN72MgBwTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69594772"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="69594772"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 15:27:37 -0800
X-CSE-ConnectionGUID: kA16ifITSo+69EyxkX+mKA==
X-CSE-MsgGUID: o7x7m35ATMCthydddHKIZw==
X-ExtLoop1: 1
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 15:27:36 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: stuart.summers@intel.com
Subject: [PATCH v3 09/11] drm/xe: Add exec queue active vfunc
Date: Mon, 12 Jan 2026 15:27:28 -0800
Message-Id: <20260112232730.3347414-10-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260112232730.3347414-1-matthew.brost@intel.com>
References: <20260112232730.3347414-1-matthew.brost@intel.com>
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

If an exec queue is inactive (e.g., not registered or scheduling is
disabled), TLB invalidations are not issued for that queue. Add a
virtual function to determine the active state, which TLB invalidation
logic can hook into.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue_types.h | 2 ++
 drivers/gpu/drm/xe/xe_execlist.c         | 7 +++++++
 drivers/gpu/drm/xe/xe_guc_submit.c       | 6 ++++++
 3 files changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index d3e2789cf5bc..9cca558c5809 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -298,6 +298,8 @@ struct xe_exec_queue_ops {
 	void (*resume)(struct xe_exec_queue *q);
 	/** @reset_status: check exec queue reset status */
 	bool (*reset_status)(struct xe_exec_queue *q);
+	/** @active: check exec queue is active */
+	bool (*active)(struct xe_exec_queue *q);
 };
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
index 46c17a18a3f4..e4a2674f48c7 100644
--- a/drivers/gpu/drm/xe/xe_execlist.c
+++ b/drivers/gpu/drm/xe/xe_execlist.c
@@ -469,6 +469,12 @@ static bool execlist_exec_queue_reset_status(struct xe_exec_queue *q)
 	return false;
 }
 
+static bool execlist_exec_queue_active(struct xe_exec_queue *q)
+{
+	/* NIY */
+	return false;
+}
+
 static const struct xe_exec_queue_ops execlist_exec_queue_ops = {
 	.init = execlist_exec_queue_init,
 	.kill = execlist_exec_queue_kill,
@@ -481,6 +487,7 @@ static const struct xe_exec_queue_ops execlist_exec_queue_ops = {
 	.suspend_wait = execlist_exec_queue_suspend_wait,
 	.resume = execlist_exec_queue_resume,
 	.reset_status = execlist_exec_queue_reset_status,
+	.active = execlist_exec_queue_active,
 };
 
 int xe_execlist_init(struct xe_gt *gt)
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index be8fa76baf1d..19282e5ca897 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -2203,6 +2203,11 @@ static bool guc_exec_queue_reset_status(struct xe_exec_queue *q)
 	return exec_queue_reset(q) || exec_queue_killed_or_banned_or_wedged(q);
 }
 
+static bool guc_exec_queue_active(struct xe_exec_queue *q)
+{
+	return exec_queue_enabled(q) && !exec_queue_pending_disable(q);
+}
+
 /*
  * All of these functions are an abstraction layer which other parts of Xe can
  * use to trap into the GuC backend. All of these functions, aside from init,
@@ -2222,6 +2227,7 @@ static const struct xe_exec_queue_ops guc_exec_queue_ops = {
 	.suspend_wait = guc_exec_queue_suspend_wait,
 	.resume = guc_exec_queue_resume,
 	.reset_status = guc_exec_queue_reset_status,
+	.active = guc_exec_queue_active,
 };
 
 static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
-- 
2.34.1

