Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3700D637D6
	for <intel-xe@archiver.kernel.org>; Thu, 14 Nov 2024 02:25:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 743FA10E799;
	Thu, 14 Nov 2024 02:25:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="haXIw5dp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DA5010E31C
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Nov 2024 02:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731551091; x=1763087091;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=GKGWo9H1PHIze6d7u8jLbsKF3PSGKz5MiVOHaS+X2so=;
 b=haXIw5dpXua8tC3+msa37K09PVnAxfZQG7AL3TjWKwdcfrhAuaYGZQ6y
 BZkR2CuzAjR0XowHptUsbhY0FS8ey4rCqZhuwCUejh8poqHuQYvlPQBr1
 GbLNdzwnkxy4gNI/7iqM97Z57bwIIZhO8/I0X7joWq6sOl5z8U14bn45z
 ITI1R4SYxZTRWhltWHaFBHFs7WHFe/D/Fq5K0kerjs04H/hRH32VTB/2w
 blmq9XdrR2fHTKnKqZwp28psqKe1Md9l2IWuRYYyMgehdC4RjjYkioFgR
 nl62B/KoTjPjPMMvlFZyq2/a8Avju27XMu0RvdmrBSc76hsfQRMuNz5hx w==;
X-CSE-ConnectionGUID: DRWmMIQHQ4KOkjJNyN//bw==
X-CSE-MsgGUID: 1i83OHQbSUiDovibXEfilg==
X-IronPort-AV: E=McAfee;i="6700,10204,11255"; a="31576664"
X-IronPort-AV: E=Sophos;i="6.12,152,1728975600"; d="scan'208";a="31576664"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 18:24:50 -0800
X-CSE-ConnectionGUID: idc/gJ+TQNOvh0jVhfSlBg==
X-CSE-MsgGUID: WGPB42qxTMm+CfI0yt2jXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,152,1728975600"; d="scan'208";a="93110576"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 18:24:50 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v4 7/7] drm/xe: Wire devcoredump to LR TDR
Date: Wed, 13 Nov 2024 18:25:22 -0800
Message-Id: <20241114022522.1951351-8-matthew.brost@intel.com>
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

LR queues can hang, cause engine reset, or cause IOMMU CAT errors.
Collect an error capture when this occurs.

v2:
 - s/queue's/queues (Jonathan)
v4:
 - Fix build (CI)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 985a21a72da4..f9ecee5364d8 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -896,13 +896,18 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
 					 !exec_queue_pending_disable(q) ||
 					 xe_guc_read_stopped(guc), HZ * 5);
 		if (!ret) {
-			xe_gt_warn(q->gt, "Schedule disable failed to respond\n");
+			xe_gt_warn(q->gt, "Schedule disable failed to respond, guc_id=%d\n",
+				   q->guc->id);
+			xe_devcoredump(q, NULL);
 			xe_sched_submission_start(sched);
 			xe_gt_reset_async(q->gt);
 			return;
 		}
 	}
 
+	if (!exec_queue_killed(q) && !xe_lrc_ring_is_idle(q->lrc[0]))
+		xe_devcoredump(q, NULL);
+
 	xe_sched_submission_start(sched);
 }
 
-- 
2.34.1

