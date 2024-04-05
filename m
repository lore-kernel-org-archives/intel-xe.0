Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 113A7CD11C2
	for <intel-xe@archiver.kernel.org>; Fri,  5 Apr 2024 18:10:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E77810EC77;
	Fri,  5 Apr 2024 18:10:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qgu2reM9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95B3510EC77
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Apr 2024 18:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712340628; x=1743876628;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4eSz62lvjUkl8pRBIt1zR1G/RTACOgXjWdCx+tM4Rj0=;
 b=Qgu2reM9TlRwhbYTFmzKA1dRq5pP/coPNFuMXh5/GnMt3hfVp3cs2Idg
 1PRW5er7HPIAQa26xxn6NGTZPeZMUjcOlT5Kv5YCfrvkCnizHzI+GYrbB
 4/+ctEiwMdR2IqTLKE87fbc+QcmidpSf3KJfHrrHahxvE+cWAapXSuOPu
 VYr1TlhbHXqxM+cv8vqENo3sTRUGugzfxW8TxgOQvwpySgp+NyBZVMWs5
 RvWVD5UKOJIhDe3COxWRC4lSwjfkIdyLxoTmq2/7Cnof4CG+rvP2PbU75
 9qHcMefcyt0Lm+pao+PLz0FueyILUGHyYhxJoJckStQcH4qzTIbEJtR8b g==;
X-CSE-ConnectionGUID: eXHDtFVZS7O+pcFRqrZmZQ==
X-CSE-MsgGUID: KqB5GN6GS+KmGsdvr4G4pg==
X-IronPort-AV: E=McAfee;i="6600,9927,11035"; a="19116685"
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; d="scan'208";a="19116685"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 11:10:24 -0700
X-CSE-ConnectionGUID: GchO6yGgSCiYkcoI1D6tTw==
X-CSE-MsgGUID: XUdfSx/GRhq9pcNIdArnjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; d="scan'208";a="19273122"
Received: from dut-internal-9dd7.jf.intel.com ([10.165.21.194])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 11:10:23 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, jonathan.cavitt@intel.com,
 matthew.brost@intel.com, lucas.demarchi@intel.com,
 john.c.harrison@intel.com
Subject: [PATCH v4 1/3] drm/xe/xe_guc_submit: Fix exec queue stop race
 condition
Date: Fri,  5 Apr 2024 10:55:03 -0700
Message-Id: <20240405175505.1161756-1-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.25.1
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

Reorder the xe_sched_tdr_queue_imm and set_exec_queue_banned calls in
guc_exec_queue_stop.  This prevents a possible race condition between
the two events in which it's possible for xe_sched_tdr_queue_imm to
wake the ufence waiter before the exec queue is banned, causing the
ufence waiter to miss the banned state.

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---

v2: Expand on cause of race condition

 drivers/gpu/drm/xe/xe_guc_submit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 9c30bd9ac8c06..1a6abb10a960e 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1430,8 +1430,8 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
 			    !xe_sched_job_completed(job)) ||
 			    xe_sched_invalidate_job(job, 2)) {
 				trace_xe_sched_job_ban(job);
-				xe_sched_tdr_queue_imm(&q->guc->sched);
 				set_exec_queue_banned(q);
+				xe_sched_tdr_queue_imm(&q->guc->sched);
 			}
 		}
 	}
-- 
2.25.1

