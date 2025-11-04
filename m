Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE273CCFA07
	for <intel-xe@archiver.kernel.org>; Tue,  4 Nov 2025 19:56:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A914010E326;
	Tue,  4 Nov 2025 19:56:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xt7stQC+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2EF510E668
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Nov 2025 19:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762286183; x=1793822183;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OvKqXvrlnTSTyluRCPnaYifNdY+QYc6ySr2tHMjMOd0=;
 b=Xt7stQC+pjnWaVq4isOkh5GnD/2FRtnJib9tIfOpg6ZrTUtxrCyt24ey
 sAeC3if0tLulgixVjYLTisuGL8fgCf1o/rslgNYpejuKMlYRZ7xjgf97J
 3HEAYjZtIeiN0xFyolKX+g7YuHDbUlWggU41CKL8XY4ta6/B2leRLPCR+
 xUGVdbmCKwVpmGn753zwplDap888vG4mUIT/1u1+t5bX93e2cSuCEDwFV
 eSTSObJazAAS3TitmRWBJ+YvRzDgZF0pIeDl6hfygO5eOxclZNFYaKYpp
 bp3lC/1AT7t3rCv07r6Eh99uBXJMmMx3Mp+OqvEtFUa8Gq7Bbf8+brNqL Q==;
X-CSE-ConnectionGUID: TxvlmZ/9Rg+NV/o5GQlVjA==
X-CSE-MsgGUID: 5GS2aNWQQSa1AoKu6C6g9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="74686115"
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="74686115"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 11:56:22 -0800
X-CSE-ConnectionGUID: Qfn/YLCCQz6T05lrRLfZiQ==
X-CSE-MsgGUID: QN/IX/KnR0+sO3BG7ZERHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="218051152"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 11:56:22 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: stuart.summers@intel.com, lucas.demarchi@intel.com,
 matthew.d.roper@intel.com
Subject: [PATCH v2 10/12] drm/xe: Add exec queue active vfunc
Date: Tue,  4 Nov 2025 11:56:14 -0800
Message-Id: <20251104195616.3339137-11-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251104195616.3339137-1-matthew.brost@intel.com>
References: <20251104195616.3339137-1-matthew.brost@intel.com>
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

