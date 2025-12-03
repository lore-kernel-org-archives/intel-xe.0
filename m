Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82E09D12688
	for <intel-xe@archiver.kernel.org>; Wed,  3 Dec 2025 01:18:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F42710E0B9;
	Wed,  3 Dec 2025 01:18:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mDMAj1nI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9A5810E0B9
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Dec 2025 01:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764724694; x=1796260694;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yPBl7hTkd5uFDpQ5FWdwzww9TOufO2eQc/ELNlABP98=;
 b=mDMAj1nIWScF+eJ/K6sT6K4O8W+Wi+2TwR+4+J9M7YqPLNc8VhK8MHk5
 1NtoB4q+lHYeAdW2HLUWiFjt3cNDOmj2iYCRNHR6ArSkzKMAbFAFanYFo
 HoMD160pj4LxDAKaNNYftgHyamRKxo93l7qofo+Nns2n7pkKQKKRSYKyV
 5nGBK1TJLdBNSmXKKya69FMCUE2bKH6DbMl/2eaVxmD4Gnk52K3Fmv9IK
 RSB8zRabapOfjJZIoTeHtVtickyIrIyAYU1K9VO1G4MM6GgImiGiEIAzO
 nQ+kVd7DTeVeJNqKGvD+zyB2cPws91Nso83RnjGw4VNBWygjr5356lPZ5 w==;
X-CSE-ConnectionGUID: 3nwVzRazTTW8FCcNF1YZpQ==
X-CSE-MsgGUID: F07CjEQgTGSitm4jXMfPfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="89363683"
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; d="scan'208";a="89363683"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 17:18:14 -0800
X-CSE-ConnectionGUID: wNP1O9P5Q/+CalU/uimM+A==
X-CSE-MsgGUID: IHdVlIXZSMy28sIgbP4pEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; d="scan'208";a="199652950"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 17:18:14 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: Do not reference loop variable directly
Date: Tue,  2 Dec 2025 17:18:09 -0800
Message-Id: <20251203011809.968893-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

Do not reference the loop variable job after the loop has exited.
Instead, save the job from the last iteration of the loop.

Fixes: 3d98a7164da6 ("drm/xe/vf: Start re-emission from first unsignaled job during VF migration")
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 3ca2558c8c96..f3f2c8556a66 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -2264,10 +2264,11 @@ static void guc_exec_queue_unpause_prepare(struct xe_guc *guc,
 					   struct xe_exec_queue *q)
 {
 	struct xe_gpu_scheduler *sched = &q->guc->sched;
-	struct xe_sched_job *job = NULL;
+	struct xe_sched_job *job = NULL, *__job;
 	bool restore_replay = false;
 
-	list_for_each_entry(job, &sched->base.pending_list, drm.list) {
+	list_for_each_entry(__job, &sched->base.pending_list, drm.list) {
+		job = __job;
 		restore_replay |= job->restore_replay;
 		if (restore_replay) {
 			xe_gt_dbg(guc_to_gt(guc), "Replay JOB - guc_id=%d, seqno=%d",
-- 
2.34.1

