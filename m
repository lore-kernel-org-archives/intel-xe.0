Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68454C3DA59
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jul 2024 17:28:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37FA810EC74;
	Fri, 19 Jul 2024 17:28:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S48fEDg2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E2FE10EC70
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Jul 2024 17:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721410100; x=1752946100;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=ijS3lJJRCwbk2s85tQih0CADH5RA/iWP7XUYoH/85Jc=;
 b=S48fEDg2zsZVm8G0qj+2Nu3YMbwh2Uwxx0NZBefSUVVLP9jEPDrPVWZe
 YOq0Ko0Vxzaon7Yy6qhE2jA5SDlBLuxLBVqEUJPdmU3gqU2ESg19E5swE
 HNzEgiUo06Y+N9c2zR/tBORXGXmcHmKQzNPdIkbLojL2B0AyKAiK9UNtd
 daG4nsKJnbH7WWpSs0qZDNnxaUDltEiG+rWnhTC0e2Zb+tOXoTuH2GdAC
 zxFYNhHniGJsDlgeFVSKsAxgjXQOT3Hs7a0C6hq4ACGZuJ3eVS4BYpxn5
 9u22qQ5tKqv3k6RWvxtkV6DnbqPzUc4/YvFnFBBJT08reyLuZMVlWWliD w==;
X-CSE-ConnectionGUID: hl+mWLIaQ8qY9NzIVY3ZyQ==
X-CSE-MsgGUID: BVtS2I/LS9absSdMvG0FmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11138"; a="18854010"
X-IronPort-AV: E=Sophos;i="6.09,221,1716274800"; d="scan'208";a="18854010"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2024 10:28:20 -0700
X-CSE-ConnectionGUID: o9mSLOVATY2g6oVDndFfsQ==
X-CSE-MsgGUID: V52XvpQ/TrODUov1e8lS5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,221,1716274800"; d="scan'208";a="55458678"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2024 10:28:20 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v6 4/4] drm/xe: Build PM into GuC CT layer
Date: Fri, 19 Jul 2024 10:29:05 -0700
Message-Id: <20240719172905.1527927-5-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240719172905.1527927-1-matthew.brost@intel.com>
References: <20240719172905.1527927-1-matthew.brost@intel.com>
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

Take PM ref when any G2H are outstanding, drop when none are
outstanding.

To safely ensure we have PM ref when in the GuC CT layer, a PM ref needs
to be held when scheduler messages are pending too.

v2:
 - Add outer PM protections to xe_file_close (CI)
v3:
 - Only take PM ref 0->1 and drop on 1->0 (Matthew Auld)
v4:
 - Add assert to G2H increment function
v5:
 - Rebase
v6:
 - Declare xe as local variable in xe_file_close (CI)

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c     |  5 +++++
 drivers/gpu/drm/xe/xe_guc_ct.c     | 10 +++++++++-
 drivers/gpu/drm/xe/xe_guc_submit.c |  4 ++++
 3 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 50c302cf3249..b677608eb592 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -141,11 +141,14 @@ void xe_file_put(struct xe_file *xef)
 
 static void xe_file_close(struct drm_device *dev, struct drm_file *file)
 {
+	struct xe_device *xe = to_xe_device(dev);
 	struct xe_file *xef = file->driver_priv;
 	struct xe_vm *vm;
 	struct xe_exec_queue *q;
 	unsigned long idx;
 
+	xe_pm_runtime_get(xe);
+
 	/*
 	 * No need for exec_queue.lock here as there is no contention for it
 	 * when FD is closing as IOCTLs presumably can't be modifying the
@@ -162,6 +165,8 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
 	mutex_unlock(&xef->vm.lock);
 
 	xe_file_put(xef);
+
+	xe_pm_runtime_put(xe);
 }
 
 static const struct drm_ioctl_desc xe_ioctls[] = {
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 7d2e937da1d8..64afc90ad2c5 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -327,6 +327,8 @@ static void xe_guc_ct_set_state(struct xe_guc_ct *ct,
 	xe_gt_assert(ct_to_gt(ct), ct->g2h_outstanding == 0 ||
 		     state == XE_GUC_CT_STATE_STOPPED);
 
+	if (ct->g2h_outstanding)
+		xe_pm_runtime_put(ct_to_xe(ct));
 	ct->g2h_outstanding = 0;
 	ct->state = state;
 
@@ -495,10 +497,15 @@ static void h2g_reserve_space(struct xe_guc_ct *ct, u32 cmd_len)
 static void __g2h_reserve_space(struct xe_guc_ct *ct, u32 g2h_len, u32 num_g2h)
 {
 	xe_gt_assert(ct_to_gt(ct), g2h_len <= ct->ctbs.g2h.info.space);
+	xe_gt_assert(ct_to_gt(ct), (!g2h_len && !num_g2h) ||
+		     (g2h_len && num_g2h));
 
 	if (g2h_len) {
 		lockdep_assert_held(&ct->fast_lock);
 
+		if (!ct->g2h_outstanding)
+			xe_pm_runtime_get_noresume(ct_to_xe(ct));
+
 		ct->ctbs.g2h.info.space -= g2h_len;
 		ct->g2h_outstanding += num_g2h;
 	}
@@ -511,7 +518,8 @@ static void __g2h_release_space(struct xe_guc_ct *ct, u32 g2h_len)
 		     ct->ctbs.g2h.info.size - ct->ctbs.g2h.info.resv_space);
 
 	ct->ctbs.g2h.info.space += g2h_len;
-	--ct->g2h_outstanding;
+	if (!--ct->g2h_outstanding)
+		xe_pm_runtime_put(ct_to_xe(ct));
 }
 
 static void g2h_release_space(struct xe_guc_ct *ct, u32 g2h_len)
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 26f8c6a4f665..da2ead86b9ae 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1413,6 +1413,8 @@ static void guc_exec_queue_process_msg(struct xe_sched_msg *msg)
 	default:
 		XE_WARN_ON("Unknown message type");
 	}
+
+	xe_pm_runtime_put(guc_to_xe(exec_queue_to_guc(msg->private_data)));
 }
 
 static const struct drm_sched_backend_ops drm_sched_ops = {
@@ -1503,6 +1505,8 @@ static void guc_exec_queue_kill(struct xe_exec_queue *q)
 static void guc_exec_queue_add_msg(struct xe_exec_queue *q, struct xe_sched_msg *msg,
 				   u32 opcode)
 {
+	xe_pm_runtime_get_noresume(guc_to_xe(exec_queue_to_guc(q)));
+
 	INIT_LIST_HEAD(&msg->link);
 	msg->opcode = opcode;
 	msg->private_data = q;
-- 
2.34.1

