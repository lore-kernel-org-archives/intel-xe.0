Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2705E77183
	for <intel-xe@archiver.kernel.org>; Wed, 18 Dec 2024 05:31:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 723BE10E329;
	Wed, 18 Dec 2024 05:31:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XlStxm2+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF8C210EAC5
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Dec 2024 05:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734499899; x=1766035899;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ggH6P6rFOm4peC+CyYdcHnGgysl/7l5Ob21mdyjelVs=;
 b=XlStxm2+myy+uotTO3mzCOLKZ5NGJaXHS41Qe9LBWsm3cxHC45/+mf+f
 61lXi2SRy1Mt2C+MWgrwVMwPd3q0cZ8MPHrfZ+sdzCbuSHNqk5MK7CcYn
 k2QVUcNwBolVT4ERaXMQC0Q2iBo6ZIf19KKdQksOv628QM5FUFQHXWUP4
 6xZ4x/b6sF03VcaQsZbjEoJZ2BAw9DbgX26lNdtr9Ug38Kna7kbqkUMw7
 CiSDkb4Ec/CZxhZoHA+/c4WwWLTA3U5nOsUs3GoexFyPLyQ6kuZQd4SEA
 Pt7RTBI0cIc/5xj+y1Az4W7yrj5OOF3j+nXGaIzSA8DioFzJZHK/8VZJL A==;
X-CSE-ConnectionGUID: H5rg9/AbTvSEJMQV54gIdg==
X-CSE-MsgGUID: 2GHcmuTCS1OUDlOa+31QHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="46348429"
X-IronPort-AV: E=Sophos;i="6.12,243,1728975600"; d="scan'208";a="46348429"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 21:31:39 -0800
X-CSE-ConnectionGUID: hW/y5Q2OTCWpkVIL1zJcVA==
X-CSE-MsgGUID: ZX+O30bKScGJchNsklXYXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="102364050"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 21:31:38 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: matthew.brost@intel.com,
	Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 2/2] drm/xe: Use q->xef for accessing xe file
Date: Tue, 17 Dec 2024 21:31:22 -0800
Message-ID: <20241218053122.2730195-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241218053122.2730195-1-lucas.demarchi@intel.com>
References: <20241218053122.2730195-1-lucas.demarchi@intel.com>
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

No need to traverse through the vm object as each exec queue maintains a
reference to xe_file. Also improve/simplify the comment on why xef is
checked.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 8005530b5e51e..8948f50ee58ff 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -770,25 +770,21 @@ bool xe_exec_queue_is_idle(struct xe_exec_queue *q)
 void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q)
 {
 	struct xe_device *xe = gt_to_xe(q->gt);
-	struct xe_file *xef;
 	struct xe_lrc *lrc;
 	u32 old_ts, new_ts;
 	int idx;
 
 	/*
-	 * Jobs that are run during driver load may use an exec_queue, but are
-	 * not associated with a user xe file, so avoid accumulating busyness
-	 * for kernel specific work.
+	 * Jobs that are executed by kernel doesn't have a corresponding xe_file
+	 * and thus are not accounted.
 	 */
-	if (!q->vm || !q->vm->xef)
+	if (!q->xef)
 		return;
 
 	/* Synchronize with unbind while holding the xe file open */
 	if (!drm_dev_enter(&xe->drm, &idx))
 		return;
 
-	xef = q->vm->xef;
-
 	/*
 	 * Only sample the first LRC. For parallel submission, all of them are
 	 * scheduled together and we compensate that below by multiplying by
@@ -799,7 +795,7 @@ void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q)
 	 */
 	lrc = q->lrc[0];
 	new_ts = xe_lrc_update_timestamp(lrc, &old_ts);
-	xef->run_ticks[q->class] += (new_ts - old_ts) * q->width;
+	q->xef->run_ticks[q->class] += (new_ts - old_ts) * q->width;
 
 	drm_dev_exit(idx);
 }
-- 
2.47.0

