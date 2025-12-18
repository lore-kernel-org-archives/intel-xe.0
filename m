Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF19BD711CA
	for <intel-xe@archiver.kernel.org>; Thu, 18 Dec 2025 21:44:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90BBE10EB97;
	Thu, 18 Dec 2025 21:44:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S94sRt+n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B776910EB95
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Dec 2025 21:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766094264; x=1797630264;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=5LRWzG/nnCJwG1QYLOCgS5OmrjPApZAe/QJenF9b1jw=;
 b=S94sRt+npFqYSV78dC2AGjuOys9SQSl+wxg/x/qI+zM26stzt/c+n131
 QNW1wTaDah8Mt8oyhwMkH9Xge9bE70iL6ipOEZQJz18N7vQuUlc+q+CtN
 vW24IPFWsjJuxbEaoOHdxJyBo6WbuZPcQZxH3g+2Td4hxALE9vYOSy/be
 uEkUfqRXw0kfthM/rn+t8QBvFH4u77jmkmrjdJyrJ35yaLlfR+s6zAozu
 ywV6PNIbMqLNyZ67h+DOAqEW4uPzdP2pPch2qpnLxjnCWGLye4tbeRH1t
 6QP/hNopJixzqB9UGH0eVpWFKP4vCa3TrEReQ5W06eUZ2CYpv5dng7U2X A==;
X-CSE-ConnectionGUID: gQ7Sfu9KRfeEpZnQyOh78g==
X-CSE-MsgGUID: zfXJY0EpQYKG7nhdC8SChA==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="68104131"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="68104131"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 13:44:24 -0800
X-CSE-ConnectionGUID: I9yj4iWCSb2Oa7rwOxiWww==
X-CSE-MsgGUID: dE8uHR9pSZmzGhpS3YI8fQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="199166555"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 13:44:24 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 3/3] drm/xe: Trigger queue cleanup if not in wedged mode 2
Date: Thu, 18 Dec 2025 13:44:18 -0800
Message-Id: <20251218214418.4037401-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251218214418.4037401-1-matthew.brost@intel.com>
References: <20251218214418.4037401-1-matthew.brost@intel.com>
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

The intent of wedging a device is to allow queues to continue running
only in wedged mode 2. In other modes, queues should initiate cleanup
and signal all remaining fences. Fix xe_guc_submit_wedge to correctly
clean up queues when wedge mode != 2.

Fixes: 7dbe8af13c18 ("drm/xe: Wedge the entire device")
Cc: stable@vger.kernel.org
Signed-off-by: Matthew Brost <matthew.brost@intel.com>

---

This fix will not apply outright to any stable kernel as it depeneds on
functions which have added in the KMD since the original commit. Likely
will have to manually send out patches to stable for kernel which we'd
like to fix.
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 31 ++++++++++++++++++------------
 1 file changed, 19 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 58ec94439df1..63b984f6d78d 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1313,6 +1313,7 @@ static void disable_scheduling_deregister(struct xe_guc *guc,
  */
 void xe_guc_submit_wedge(struct xe_guc *guc)
 {
+	struct xe_device *xe = guc_to_xe(guc);
 	struct xe_gt *gt = guc_to_gt(guc);
 	struct xe_exec_queue *q;
 	unsigned long index;
@@ -1327,19 +1328,25 @@ void xe_guc_submit_wedge(struct xe_guc *guc)
 	if (!guc->submission_state.initialized)
 		return;
 
-	err = devm_add_action_or_reset(guc_to_xe(guc)->drm.dev,
-				       guc_submit_wedged_fini, guc);
-	if (err) {
-		xe_gt_err(gt, "Failed to register clean-up on wedged.mode=2; "
-			  "Although device is wedged.\n");
-		return;
-	}
+	if (xe->wedged.mode == 2) {
+		err = devm_add_action_or_reset(guc_to_xe(guc)->drm.dev,
+					       guc_submit_wedged_fini, guc);
+		if (err) {
+			xe_gt_err(gt, "Failed to register clean-up on wedged.mode=2; "
+				  "Although device is wedged.\n");
+			return;
+		}
 
-	mutex_lock(&guc->submission_state.lock);
-	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q)
-		if (xe_exec_queue_get_unless_zero(q))
-			set_exec_queue_wedged(q);
-	mutex_unlock(&guc->submission_state.lock);
+		mutex_lock(&guc->submission_state.lock);
+		xa_for_each(&guc->submission_state.exec_queue_lookup, index, q)
+			if (xe_exec_queue_get_unless_zero(q))
+				set_exec_queue_wedged(q);
+		mutex_unlock(&guc->submission_state.lock);
+	} else {
+		/* Forcefully kill any remaining exec queues, signal fences */
+		xe_guc_submit_stop(guc);
+		xe_guc_submit_pause_abort(guc);
+	}
 }
 
 static bool guc_submit_hint_wedged(struct xe_guc *guc)
-- 
2.34.1

