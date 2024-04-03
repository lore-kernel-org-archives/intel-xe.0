Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE50CCD1299
	for <intel-xe@archiver.kernel.org>; Wed,  3 Apr 2024 19:35:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B446112E67;
	Wed,  3 Apr 2024 19:35:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OMIQDOcj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA7DD112E66
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Apr 2024 19:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712172910; x=1743708910;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=z5lD/34h9j/utkEymQHXxaqkkqeEtEXMxH0fHBMU5EY=;
 b=OMIQDOcjQUcMNOMbQXxvnnMJyHBlTmKQ5w7knarvkPAUk+4IrZb+TgPy
 zyVDtUQqMRc4EI81Y+MiajXBWIELzZPxHC+2W6YOex/NYM65iMRLDSVxQ
 4x1Vj6sJaFFhOSGCZPTHAzRZyrH6UHlMAOGG/QLeZx0s5StpT37MVOlvA
 +njS7LBcjXd/Q2qJ9mLZrjoX5H4e1J++M9MOZ5w77gMX5yUwdCEKkRWwM
 ninSPUyhIaqv1N/d4fF9/mE4yt5SWdqhYgUCbh9PhdKvnsvIB+gG6injG
 t8rNk5FuLUcv0UIMiGioXuhyPurbCXZMlOTm4vNuNcRajw9o7/DuaDBLW g==;
X-CSE-ConnectionGUID: zo5pZqH0Tf6L7oFzhy5gwQ==
X-CSE-MsgGUID: v3BzchQ6S8uIBhgqvauVZQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="7296484"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="7296484"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 12:35:09 -0700
X-CSE-ConnectionGUID: DxPLGKILSQmKxQvqGc8umA==
X-CSE-MsgGUID: 2cJgNlmXRYSuzNi0Fu+jFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; d="scan'208";a="23030545"
Received: from dut-internal-9dd7.jf.intel.com ([10.165.21.194])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 12:35:08 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, jonathan.cavitt@intel.com,
 matthew.brost@intel.com, lucas.demarchi@intel.com,
 john.c.harrison@intel.com
Subject: [PATCH v2 1/3] drm/xe/xe_guc_submit: Fix exec queue stop race
 condition
Date: Wed,  3 Apr 2024 12:19:48 -0700
Message-Id: <20240403191950.242642-1-jonathan.cavitt@intel.com>
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
index 13b7e195c7b57..294f40ab6aaf1 100644
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

