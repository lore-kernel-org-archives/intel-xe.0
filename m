Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E616ED597AA
	for <intel-xe@archiver.kernel.org>; Tue, 12 Nov 2024 22:01:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF75F10E676;
	Tue, 12 Nov 2024 22:01:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aYLQrxRU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89B6410E671
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Nov 2024 22:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731448857; x=1762984857;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=HD94aRZNHHzBQgyHfHawtfzy1h9kEF3BGBpM5A/mjrM=;
 b=aYLQrxRUBo+fdKmgTyYuH8rMySD/xp66KYdfpIQalVb4xsY81BDr2NkK
 qPgx8lo+bHRqPgtfQGvaMPibUT9xNQmS3MVUaYQgKiYNBkG4jhl5tIoTf
 f7BB1rECDdQdKWGw5Cg2iqBV0bTk7G++AflPfdK313MQeCaIaEyKqfcBw
 8oyJ+ivYtvOZVM+ccU9cf3k2W1pxujUCHkQFeNmlEUlV/vGItC691mpUV
 TMk9nhxCCne712icMv4sQo/O0rGbikpLyRovK0HoAtj46n0eD628ONSmo
 SQJ3VCS+AtrJ7WdZDUmCz8VrUCG+x1vVbxtGs816LIjRa5FPR6p99n5l6 g==;
X-CSE-ConnectionGUID: cgytn7ylS3K9+tdHB8YIIA==
X-CSE-MsgGUID: xBVLi0FKSIOtjYsHwnLDwA==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="31403996"
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; d="scan'208";a="31403996"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 14:00:57 -0800
X-CSE-ConnectionGUID: a4//zGaASxKlsCHTQvjpSQ==
X-CSE-MsgGUID: Nhzdy1UNSHWZqLhcDMzJng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; d="scan'208";a="118605699"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 14:00:56 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v3 4/7] drm/xe: Improve schedule disable response failure
Date: Tue, 12 Nov 2024 14:01:24 -0800
Message-Id: <20241112220127.1369527-5-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241112220127.1369527-1-matthew.brost@intel.com>
References: <20241112220127.1369527-1-matthew.brost@intel.com>
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
index 663ad4d97b34..3d61c650c0d2 100644
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

