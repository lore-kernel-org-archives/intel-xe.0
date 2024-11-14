Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A00AD637D8
	for <intel-xe@archiver.kernel.org>; Thu, 14 Nov 2024 02:24:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36BD410E31C;
	Thu, 14 Nov 2024 02:24:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PoJVv7b8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E47810E0E6
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Nov 2024 02:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731551091; x=1763087091;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=TNDEUQWuiUeknhg1nnezobJVAcIIE42HdLSRic6m7Yc=;
 b=PoJVv7b8Rib2vNg/mpDAbPVdr3DjNU5sgqTZhLXFq23EwNrO11CoZEud
 DyS8XR/KS1+d3D0Y6UI5wzTl5xoQdZ0ZUIVKW/I5Z5L68vyNNNuCt291U
 j2/iC4VrmCvhpSr8Es/RaXz4IWinHGKX5wBmyYysCgnfC8aVb/daqBHx2
 Qu7tr45XtLrjMv4a48aTFyto5CEfPaUb0WS0EKT7ChuTgHSZtveFWZKtm
 JKO6Jxr2odrSPZhYll/nOQrsPfv+pY3YGUux/qqJEggKxMFfHe7WTFJoo
 nVSW96QzE+Bw8exwPiRaldPP0uLPebV6HWNVxfmQ3vdZlMSFe/dH6FrxW w==;
X-CSE-ConnectionGUID: Z34srOexRG63/p+1R8d80A==
X-CSE-MsgGUID: WCgJg8G/SNKKYCrRzCPvkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11255"; a="31576662"
X-IronPort-AV: E=Sophos;i="6.12,152,1728975600"; d="scan'208";a="31576662"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 18:24:50 -0800
X-CSE-ConnectionGUID: bJmhm2o4R4ei+rDKQfVG5Q==
X-CSE-MsgGUID: IO6elLHVRFugzT8TggTPuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,152,1728975600"; d="scan'208";a="93110574"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 18:24:50 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v4 5/7] drm/xe: Improve schedule disable response failure
Date: Wed, 13 Nov 2024 18:25:20 -0800
Message-Id: <20241114022522.1951351-6-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241114022522.1951351-1-matthew.brost@intel.com>
References: <20241114022522.1951351-1-matthew.brost@intel.com>
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

Print Guc ID and take devcoredump on schedule disable response failure.
GuC ID is useful information and a schedule disable response failure is
possible the LRC state is corrupted so a devcoredump is helpful to debug.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 08a6578ee104..46fd4621bfca 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1124,7 +1124,10 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 		if (!ret || xe_guc_read_stopped(guc)) {
 trigger_reset:
 			if (!ret)
-				xe_gt_warn(guc_to_gt(guc), "Schedule disable failed to respond");
+				xe_gt_warn(guc_to_gt(guc),
+					   "Schedule disable failed to respond, guc_id=%d",
+					   q->guc->id);
+			xe_devcoredump(q, job);
 			set_exec_queue_extra_ref(q);
 			xe_exec_queue_get(q);	/* GT reset owns this */
 			set_exec_queue_banned(q);
-- 
2.34.1

