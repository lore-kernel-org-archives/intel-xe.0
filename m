Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07B1CCCFA11
	for <intel-xe@archiver.kernel.org>; Sat,  1 Nov 2025 01:02:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BBF110E332;
	Sat,  1 Nov 2025 01:02:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n89yLT9+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AF9410E110
 for <intel-xe@lists.freedesktop.org>; Sat,  1 Nov 2025 01:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761958954; x=1793494954;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OvKqXvrlnTSTyluRCPnaYifNdY+QYc6ySr2tHMjMOd0=;
 b=n89yLT9+d30gjNVrG/oqxpi4ITeLUyJ26kHSCRXfYfyTJRf004kZXI2J
 oHvlb382vSugEWkGsjg7JGtoJRpC4nejlF16A43T4qkn7yJmdtEaEXbNu
 uY+kmJ0fPyCq35tIiDa08Jez7O0tfE2WhPXbvePHzQOxjpLMVszqSg5fp
 rZjFYMqf1Sv9rcPCtnv+T86iG1pDHqw6hB4v/H1vxYFouLatFcOByLWOZ
 mHa9W7F+N92b7Iu3gGN1eULQgit37NquRWVzVHDppUki1OF/bz0DgfOVJ
 w3ImQ3fFDoEgUEJj42Ld0Xs3TDhsTYJdVK8Jtb3M6rvnYtHD3UVYtoKdf w==;
X-CSE-ConnectionGUID: 2ThjH7brSpaZUD+MSVH/4w==
X-CSE-MsgGUID: w4M89RMgTbCXhzmoWQdiwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="75575696"
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; d="scan'208";a="75575696"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 18:02:32 -0700
X-CSE-ConnectionGUID: zJdWZzO0Q4+C4SaR20FM3Q==
X-CSE-MsgGUID: howh5GjhRzCab4gVNihwUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; d="scan'208";a="217020193"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 18:02:31 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: stuart.summers@intel.com, lucas.demarchi@intel.com,
 matthew.d.roper@intel.com
Subject: [PATCH 10/12] drm/xe: Add exec queue active vfunc
Date: Fri, 31 Oct 2025 18:02:23 -0700
Message-Id: <20251101010225.3095457-11-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251101010225.3095457-1-matthew.brost@intel.com>
References: <20251101010225.3095457-1-matthew.brost@intel.com>
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
index a2281fcb55b1..4ffd55e39e6b 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -228,6 +228,8 @@ struct xe_exec_queue_ops {
 	void (*resume)(struct xe_exec_queue *q);
 	/** @reset_status: check exec queue reset status */
 	bool (*reset_status)(struct xe_exec_queue *q);
+	/** @active: check exec queue is active */
+	bool (*active)(struct xe_exec_queue *q);
 };
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
index 769d05517f93..07574ff6d53f 100644
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
index d4ffdb71ef3d..e0126ab12ac2 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1919,6 +1919,11 @@ static bool guc_exec_queue_reset_status(struct xe_exec_queue *q)
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
@@ -1937,6 +1942,7 @@ static const struct xe_exec_queue_ops guc_exec_queue_ops = {
 	.suspend_wait = guc_exec_queue_suspend_wait,
 	.resume = guc_exec_queue_resume,
 	.reset_status = guc_exec_queue_reset_status,
+	.active = guc_exec_queue_active,
 };
 
 static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
-- 
2.34.1

