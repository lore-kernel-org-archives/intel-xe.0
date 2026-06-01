Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88835CD5BD1
	for <intel-xe@archiver.kernel.org>; Mon,  1 Jun 2026 23:46:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40C4C10EA81;
	Mon,  1 Jun 2026 23:46:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j+RZ/6iD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F57210EA81
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Jun 2026 23:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780357608; x=1811893608;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tduA3fvgKnVTfonOOJEDsn2pc7Ju8THIx0TSRTgOF5g=;
 b=j+RZ/6iDFOfD2O17yqqn47MYH029ZRt8aiZWyk8bp4o97K7pYwwp5arP
 nGHCwVLpge4cSVtpUEBD3KFI1tuuQaEvyYGCEAUMkReg6ZN63RDpEcNVV
 Rh2BLJevqeJoMiQppoqruvQ4eZJVKLEnQWLu0wx0HDSEU/24mhAjxM2lB
 jJl9W8hu1QLh2q9KdMeTtG8B+UsptTvHqffA5j1aTFSC13mttKdrStm4X
 dN6ztWd7WqCwYH9NEM2Nic9Fdwc4fsXFccXFZfvp4H1LuV4+xG8eXgmhE
 HkWvhm/C72ZgqY69NHXIVbJKYRrPV6gAeCB2OAm6FHe+raj6VacEtCB/v Q==;
X-CSE-ConnectionGUID: iviu8VTMR6SvwxFnkUamCg==
X-CSE-MsgGUID: Q6uASMKGTZqBySDo6zLvWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="92239698"
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; d="scan'208";a="92239698"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2026 16:46:47 -0700
X-CSE-ConnectionGUID: mbEokSctSwS6DKh59+M/Lw==
X-CSE-MsgGUID: e1wYhcgFRbiKblqADfkVXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; d="scan'208";a="247994722"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.126])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2026 16:46:48 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2] drm/xe/multi_queue: skip submit when primary queue is
 suspended
Date: Mon,  1 Jun 2026 16:46:43 -0700
Message-ID: <20260601234642.817231-2-niranjana.vishwanathapura@intel.com>
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

Return early in submit path when the multi-queue primary exec
queue is suspended to avoid submitting while suspended.

v2: Remove idle_skip_suspend fix as that feature is being
reverted here https://patchwork.freedesktop.org/series/167262/

Fixes: bc5775c59258 ("drm/xe/multi_queue: Add GuC interface for multi queue support")
Cc: stable@vger.kernel.org # v7.0+
Assisted-by: GitHub-Copilot:claude-sonnet-4.6
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index ab501513d806..30595ecc7f92 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1167,9 +1167,12 @@ static void submit_exec_queue(struct xe_exec_queue *q, struct xe_sched_job *job)
 
 	/*
 	 * All queues in a multi-queue group will use the primary queue
-	 * of the group to interface with GuC.
+	 * of the group to interface with GuC. If primay is suspended,
+	 * just return. Jobs will get scheduled once primary is resumed.
 	 */
 	q = xe_exec_queue_multi_queue_primary(q);
+	if (exec_queue_suspended(q))
+		return;
 
 	if (!exec_queue_enabled(q) && !exec_queue_suspended(q)) {
 		action[len++] = XE_GUC_ACTION_SCHED_CONTEXT_MODE_SET;
-- 
2.43.0

