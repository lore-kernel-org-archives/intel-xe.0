Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35202CD4851
	for <intel-xe@archiver.kernel.org>; Fri, 15 May 2026 21:05:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDBA610F5E1;
	Fri, 15 May 2026 21:05:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pq/OY1yQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01D0510F5E1
 for <intel-xe@lists.freedesktop.org>; Fri, 15 May 2026 21:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778879101; x=1810415101;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=B8hOv26yPcAUPq4pBiPQmIYboRFVHMm25q6K8lMehVM=;
 b=Pq/OY1yQvjl7dCIVAJa9EUkzHymvb5sCjF+FTzYWEsHpSG93ypLoJq60
 GzC7x6OQjLnDsEzGiTYKMFL8rUPxPGnJKQ2Ivz3YK4fUPxY8OxYPWpn2m
 zKcdCr2k/sFyXwILpGJkLY0W9IU3yj+h1CmWg1O2k7cpS+aKVf2doy7Ei
 MiRCVmoZEeBXkYBHFpuqG4oMOf9GiMtFCLG5w5zSkCkW/tPt1+7Cvk3yF
 zn+h06l/Mzzy7OcBi2IsLX7QXioB5AIykbMwDFmcwt+KAWoyEidT5OPeo
 omBHNkgy2AudzO4ptjtCgiz23wlV4523xpxtf338y3okdITkksslzAwFT g==;
X-CSE-ConnectionGUID: UZBIzPB0TN2BR2dbgR+5yA==
X-CSE-MsgGUID: 7Jx+WMclSbmigSbu5L8M2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="83697809"
X-IronPort-AV: E=Sophos;i="6.23,237,1770624000"; d="scan'208";a="83697809"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2026 14:05:00 -0700
X-CSE-ConnectionGUID: A/ZKIR0/QgasBBFQ8JJkRA==
X-CSE-MsgGUID: zJjbKDOiSCKBmUA2yOn06A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,237,1770624000"; d="scan'208";a="235751536"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.126])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2026 14:05:01 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe/multi_queue: Fix secondary queue error case
Date: Fri, 15 May 2026 14:04:51 -0700
Message-ID: <20260515210450.249621-2-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
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

If xe_lrc_create() fails, the secondary queue added to the
multi-queue group list is not removed before freeing the
queue. Fix error path handling for secondary queues by
removing it from the multi-queue group list at the right
place.

Fixes: d716a5088c88 ("drm/xe/multi_queue: Handle tearing down of a multi queue")

Cc: stable@vger.kernel.org # v7.0+
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
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

