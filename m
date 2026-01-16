Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5F4EC98306
	for <intel-xe@archiver.kernel.org>; Fri, 16 Jan 2026 22:17:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A107310E289;
	Fri, 16 Jan 2026 22:17:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BEyrPJ/s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71DAD10E267
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Jan 2026 22:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768601867; x=1800137867;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NWL9xUSm/2UVhhkZJ6U4p1GXjtj/KaBFthp8Ugs9B0w=;
 b=BEyrPJ/s4K03FKj+IPjMD+lOkn56SwqSHhL4IsELFQEsTRSJnRVYltbT
 TIwdAxWCxnMkIdcfBteQ++PdpBZtWX0Ln3XDuVZc8PDSG3Q2prBDWemp/
 7So9aN2fYR1thaX6fJlth7EMBsBpDOPI4K+BaNlWtdjPjOTfGShQfLP4P
 QCYN/0yOwqpiwomycdnoiFGS0JAOUiPpUHzTDCfqXi7FRN7MxKWB1Fjv3
 IqvSLl8/G2Va7JYg9HuYpVBzAYGaemXSxoqc+OcsP26iiW+c8DbIza8v5
 +o/S3gupsiZ9N1kORgmrldBS7OJqUffctuTUd+Dv/QOaOgfugb92FN9hu A==;
X-CSE-ConnectionGUID: +CnK9ReyRx6glL5qLeaGjw==
X-CSE-MsgGUID: zECbvVErSn2v6zeN81WtbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="69123354"
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; d="scan'208";a="69123354"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 14:17:46 -0800
X-CSE-ConnectionGUID: s+Z4Ng4hRyy6Nx/XcB5iFA==
X-CSE-MsgGUID: ODHRJE7nRI2c6dwVvfhnhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; d="scan'208";a="204962720"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 14:17:37 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH v5 10/11] drm/xe: Add exec queue active vfunc
Date: Fri, 16 Jan 2026 14:17:30 -0800
Message-Id: <20260116221731.868657-11-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260116221731.868657-1-matthew.brost@intel.com>
References: <20260116221731.868657-1-matthew.brost@intel.com>
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

v5:
 - Operate on primary in active function

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Tested-by: Stuart Summers <stuart.summers@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue_types.h | 2 ++
 drivers/gpu/drm/xe/xe_execlist.c         | 7 +++++++
 drivers/gpu/drm/xe/xe_guc_submit.c       | 9 +++++++++
 3 files changed, 18 insertions(+)

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
index 8bf330aeaec0..005a5b2c36fe 100644
--- a/drivers/gpu/drm/xe/xe_execlist.c
+++ b/drivers/gpu/drm/xe/xe_execlist.c
@@ -468,6 +468,12 @@ static bool execlist_exec_queue_reset_status(struct xe_exec_queue *q)
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
@@ -480,6 +486,7 @@ static const struct xe_exec_queue_ops execlist_exec_queue_ops = {
 	.suspend_wait = execlist_exec_queue_suspend_wait,
 	.resume = execlist_exec_queue_resume,
 	.reset_status = execlist_exec_queue_reset_status,
+	.active = execlist_exec_queue_active,
 };
 
 int xe_execlist_init(struct xe_gt *gt)
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 1b2f66f4425b..e9f9f844d50e 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -2206,6 +2206,14 @@ static bool guc_exec_queue_reset_status(struct xe_exec_queue *q)
 	return exec_queue_reset(q) || exec_queue_killed_or_banned_or_wedged(q);
 }
 
+static bool guc_exec_queue_active(struct xe_exec_queue *q)
+{
+	struct xe_exec_queue *primary = xe_exec_queue_multi_queue_primary(q);
+
+	return exec_queue_enabled(primary) &&
+		!exec_queue_pending_disable(primary);
+}
+
 /*
  * All of these functions are an abstraction layer which other parts of Xe can
  * use to trap into the GuC backend. All of these functions, aside from init,
@@ -2225,6 +2233,7 @@ static const struct xe_exec_queue_ops guc_exec_queue_ops = {
 	.suspend_wait = guc_exec_queue_suspend_wait,
 	.resume = guc_exec_queue_resume,
 	.reset_status = guc_exec_queue_reset_status,
+	.active = guc_exec_queue_active,
 };
 
 static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
-- 
2.34.1

