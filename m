Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D2B9CD4F4A
	for <intel-xe@archiver.kernel.org>; Mon, 18 May 2026 19:16:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD7C910E095;
	Mon, 18 May 2026 19:16:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U6kCKIbq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7530310E095
 for <intel-xe@lists.freedesktop.org>; Mon, 18 May 2026 19:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779131805; x=1810667805;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=S7C7eJPdWbyYzi1y0iRxDjTLKCezy1qRMfa1IIPLOaw=;
 b=U6kCKIbqEYC5gbpxhys5pb1KcAFufdYS1QxAyescfj1oUqbJURKv4Hto
 EMft0gQQfnrEJfNly4G55XC26rDRzP4TKIKX3M7z+gIbl3R2YHGg9/30w
 71Hk2sgfVoO5RMDnoOfLgOX2b6lxkUV5tx5fRodsWT4FGqcXY6WiIMqOP
 3pvE/hsCFCCe3Y9aHIUChRTjDLRKAre2e9GPw6U6RVXuBHKGvwsF1xlPb
 GAgPJQnOtgM0exiNpPS3YJzg0wTT0PcDXJfwbtR7aF8gi0yv/7/vOfG8R
 jhQxyJrTqxwY5RweQgRPIFdF7AWN5N5GtUqqTi1oAf1BtXL5CyeVT+UBr w==;
X-CSE-ConnectionGUID: gXODscqiTISf9n/uE2VdSw==
X-CSE-MsgGUID: 8UhEL6v9QIeluR23bvt1mA==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="80028692"
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; d="scan'208";a="80028692"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 12:16:45 -0700
X-CSE-ConnectionGUID: WU9Yb9rKTJiy4WC2KA+EVg==
X-CSE-MsgGUID: JfqSrUIiRoS6GXDRSEfV1Q==
X-ExtLoop1: 1
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.126])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 12:16:45 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com
Subject: [PATCH v2] drm/xe/multi_queue: Fix secondary queue error case
Date: Mon, 18 May 2026 12:16:40 -0700
Message-ID: <20260518191639.320890-2-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

If xe_lrc_create() fails, the secondary queue added to the
multi-queue group list is not removed before freeing the
queue. Fix error path handling for secondary queues by
removing it from the multi-queue group list at the right
place.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/7979
Fixes: d716a5088c88 ("drm/xe/multi_queue: Handle tearing down of a multi queue")
Reported-by: Sebastian Österlund <sebastian.osterlund@intel.com>
Cc: stable@vger.kernel.org # v7.0+
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 4171eff4e8ad..afd8cc7bd231 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1665,6 +1665,14 @@ static void guc_exec_queue_fini(struct xe_exec_queue *q)
 	struct xe_guc_exec_queue *ge = q->guc;
 	struct xe_guc *guc = exec_queue_to_guc(q);
 
+	if (xe_exec_queue_is_multi_queue_secondary(q)) {
+		struct xe_exec_queue_group *group = q->multi_queue.group;
+
+		mutex_lock(&group->list_lock);
+		list_del(&q->multi_queue.link);
+		mutex_unlock(&group->list_lock);
+	}
+
 	release_guc_id(guc, q);
 	xe_sched_entity_fini(&ge->entity);
 	xe_sched_fini(&ge->sched);
@@ -1686,14 +1694,6 @@ static void __guc_exec_queue_destroy_async(struct work_struct *w)
 	guard(xe_pm_runtime)(guc_to_xe(guc));
 	trace_xe_exec_queue_destroy(q);
 
-	if (xe_exec_queue_is_multi_queue_secondary(q)) {
-		struct xe_exec_queue_group *group = q->multi_queue.group;
-
-		mutex_lock(&group->list_lock);
-		list_del(&q->multi_queue.link);
-		mutex_unlock(&group->list_lock);
-	}
-
 	/* Confirm no work left behind accessing device structures */
 	cancel_delayed_work_sync(&ge->sched.base.work_tdr);
 
-- 
2.43.0

