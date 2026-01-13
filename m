Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF0D2D29DC2
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jan 2026 02:52:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8423810E454;
	Tue, 13 Jan 2026 02:52:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EUsV5Y6C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F90910E44D
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jan 2026 02:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768272759; x=1799808759;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hevKHwZHWaYD2u5GrMgvwlzv6cL2D183j6BF7RDe4a4=;
 b=EUsV5Y6CQ0RumdIWU9pEiAe9K15aBNdlA3wGdcUt0KML9ZPtlNVa9KmE
 nW5Yk1oX5bkXrpIZpM2OUCam61Odkr+AbiGuNUaJEw6RfyYOzT6RbMcPl
 dBryIOrPeAKMOUp4eKHTVyjV+x6iWRnH0h/WdzhoiAVqAFwS8JHLCXJaU
 QmTJdDQKbkL83PG4q2AHkBDoj+IJt0SbW+R71+P+gOtMR3l2Yv2g6yVih
 xOTs1eWv8bN3FMzBJyBtaxoDzDj8uUvjBnT3pZPvkMNuJjgESHAbOznkm
 bVz1jOBJ+Vwc1/EJyXQmi0tvSEKc7JY6clS5wPLs9K+BQ2MEbZpB84/3c Q==;
X-CSE-ConnectionGUID: ILOtBuTIQBGQ1mY5bbfS2w==
X-CSE-MsgGUID: lwDhLm+PR7+dpMWUtQAqeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69714533"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="69714533"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 18:52:38 -0800
X-CSE-ConnectionGUID: NYMV+5GrS4GHu28+2dP3Ng==
X-CSE-MsgGUID: wQUVLhD1TC+56+L63DxhXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="204070336"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 18:52:38 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: stuart.summers@intel.com
Subject: [PATCH v4 10/12] drm/xe: Add exec queue active vfunc
Date: Mon, 12 Jan 2026 18:52:30 -0800
Message-Id: <20260113025232.3504648-11-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260113025232.3504648-1-matthew.brost@intel.com>
References: <20260113025232.3504648-1-matthew.brost@intel.com>
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

