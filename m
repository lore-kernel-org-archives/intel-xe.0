Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 866AEC5516F
	for <intel-xe@archiver.kernel.org>; Fri, 31 Jul 2026 23:26:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4271610E272;
	Fri, 31 Jul 2026 23:26:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kyPaa6QK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C77B10E26D
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Jul 2026 23:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785540392; x=1817076392;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fwVife8SsEaSAnkCfnRUfNU1HtWriCzkA/Q3EyCvObs=;
 b=kyPaa6QKG92uUUNWJVD41pU15BDdAaU1KTj1kOtT4Fg8sJEbjcnHwBnZ
 LuXuH2cRYjxxUYrIJ0rJfFzSuhPnZcw6xa75cCHslOA+JtMtZMwquoa3U
 WlAq1fyaskHRDqJ0eEpnGnZE7a4A2jeA5LS1ncUSEIazWQu1dJqNEcY7X
 iLLTJ+MVlOhAypWsAwjjjSNJcq0m1UElT2e1AE+4eY8Ik7PsvnJFO5Pxc
 SioFbdUJIUkW9AkEWeow9xtuGtAAakpPFn3v37LUV+XJSBcB41wveqZu9
 rFtneWujbCbBwIf4Yz91zMkMTS0GcVLEEwSrN//GhwskkLNxUnvXn5zNl A==;
X-CSE-ConnectionGUID: y87Jp0MzScmK3UyUS6yUQQ==
X-CSE-MsgGUID: VoyH4LKXQp6G3Q3eiZ/2WQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11861"; a="86120835"
X-IronPort-AV: E=Sophos;i="6.25,197,1779174000"; d="scan'208";a="86120835"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2026 16:26:32 -0700
X-CSE-ConnectionGUID: p2J+WzxHThaaH99rXOrnAA==
X-CSE-MsgGUID: Up9ROKBBTTed6UPIL02khQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,197,1779174000"; d="scan'208";a="260112414"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.126])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2026 16:26:31 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com
Subject: [PATCH v2 2/4] drm/xe/multi_queue: handle CGP_SYNC wait timeout
 during VF recovery
Date: Fri, 31 Jul 2026 16:26:25 -0700
Message-ID: <20260731232625.3313657-8-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260731232625.3313657-6-niranjana.vishwanathapura@intel.com>
References: <20260731232625.3313657-6-niranjana.vishwanathapura@intel.com>
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

The CGP_SYNC wait in xe_guc_exec_queue_group_cgp_sync() only woke on
sync_pending clearing or GuC stop. During VF migration the CT wakes all
waiters but sync_pending may still be set (the GuC lost the in-flight
message), causing the timeout path to fire and ban the group.

Add vf_recovery() as a third wake condition and exclude it from the
error path so a migration-woken wait returns success rather than
triggering a GT reset.

Assisted-by: Github-Copilot:Claude-opus-4.8
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 314747336fb9..13d0ab8052e5 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -815,13 +815,12 @@ static void xe_guc_exec_queue_group_cgp_sync(struct xe_guc *guc,
 	 * Hence, no locking is required here.
 	 * Wait for any pending CGP_SYNC_DONE response before updating the
 	 * CGP page and sending CGP_SYNC message.
-	 *
-	 * FIXME: Support VF migration
 	 */
 	ret = wait_event_timeout(guc->ct.wq,
 				 !READ_ONCE(group->sync_pending) ||
-				 xe_guc_read_stopped(guc), HZ);
-	if (!ret || xe_guc_read_stopped(guc)) {
+				 xe_guc_read_stopped(guc) || vf_recovery(guc),
+				 HZ);
+	if ((!ret && !vf_recovery(guc)) || xe_guc_read_stopped(guc)) {
 		/* CGP_SYNC failed. Reset gt, cleanup the group */
 		xe_gt_warn(guc_to_gt(guc), "Wait for CGP_SYNC_DONE response failed!\n");
 		set_exec_queue_group_banned(q);
-- 
2.43.0

