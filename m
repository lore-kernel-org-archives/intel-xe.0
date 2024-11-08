Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8482D64075
	for <intel-xe@archiver.kernel.org>; Fri,  8 Nov 2024 17:42:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B91810EA22;
	Fri,  8 Nov 2024 17:42:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GWc0BveK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4DED10EA22
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Nov 2024 17:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731087764; x=1762623764;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BJLFDE2+dj+PaSdboUGOnbeutZxpYXzybeeqv16V7vU=;
 b=GWc0BveKF52AHQNwO5QlWRDZhJLzQa+D5mEDfFOVfTdmwzhkvrzt19wK
 J4fgW+6XzFfGYS3Lzw6J4sLXllePv//+3rG9JERDZeLmEvYN7yuIFTaxB
 oNdAvb48xFDqK965etk1bDraHhzBciTrgFhWfMLknN/oKy1/qD/gBOElc
 /LsQ+6Ml+nm5UaJv3AXDdgKzuROvKTKOUVrnA+pzA8CwTRuk4MhtUvnsA
 aOwl26cWhSj0evcRL2fDpSIsZmc/RBt2TVl+IOHeJEEcklxyzNvTHSSD0
 a0vRXYwX+RQm1zRAyGX/LBoCwEFk/jhEV1A+Q1+HnKI6ganWEa59R0S6G g==;
X-CSE-ConnectionGUID: W1yY2aPMTM+PLrJGKDxp3Q==
X-CSE-MsgGUID: 2vi4nIdyRzCEV/HciVAz0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11250"; a="41598614"
X-IronPort-AV: E=Sophos;i="6.12,138,1728975600"; d="scan'208";a="41598614"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 09:42:43 -0800
X-CSE-ConnectionGUID: +CJbrF2FQPSxXuJLIFSQGw==
X-CSE-MsgGUID: Gz1OUYfZQbOZ899r+SoxaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,138,1728975600"; d="scan'208";a="86001304"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 09:42:42 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: alan.previn.teres.alexis@intel.com, zhanjun.dong@intel.com,
 rodrigo.vivi@intel.com
Subject: [PATCH 7/7] drm/xe: Wire devcoredump to LR TDR
Date: Fri,  8 Nov 2024 09:43:12 -0800
Message-Id: <20241108174312.272792-8-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241108174312.272792-1-matthew.brost@intel.com>
References: <20241108174312.272792-1-matthew.brost@intel.com>
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

LR queue's can hang, cause engine reset, or cause IOMMU CAT errors.
Collect an error capture when this occurs.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 3df8543deec1..a52e56ea42df 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -901,6 +901,7 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
 					 !exec_queue_pending_disable(q) ||
 					 xe_guc_read_stopped(guc), HZ * 5);
 		if (!ret) {
+			xe_devcoredump(q, NULL);
 			drm_warn(&xe->drm, "Schedule disable failed to respond");
 			xe_sched_submission_start(sched);
 			xe_gt_reset_async(q->gt);
@@ -908,6 +909,9 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
 		}
 	}
 
+	if (!exec_queue_killed(q) && !xe_lrc_ring_is_idle(q->lrc[0]))
+		xe_devcoredump(q, NULL);
+
 	xe_sched_submission_start(sched);
 }
 
-- 
2.34.1

