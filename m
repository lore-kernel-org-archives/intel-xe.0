Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E4E4C55AB9
	for <intel-xe@archiver.kernel.org>; Mon,  3 Aug 2026 23:05:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 412B010E500;
	Mon,  3 Aug 2026 23:05:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ijt6nAMl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 097A210E071
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Aug 2026 23:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785798339; x=1817334339;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YbIhieKQ8n4wijPsog/Av4GkJDXWfm2p5WMJf057m1A=;
 b=Ijt6nAMlbhd88644PSM2yW7m3mTvtywFTDRqswQ9rJD3e0Ek0XuRhs+6
 SrRonHShAMq5sSeO9gdi3AnqhO0KEe8qyEHc6/tpYWmT0hozdpRx62Ahm
 X4xbXDqa2rkZ+JGY7GWzVs9YOxi1fB3G0bwewz3N4mBqpgqCrb2N6i9my
 yaDf0rsoC0SPu40+58blpCpBanMKATdQAhZOA6th/dQxrx1O3XKyxCfkF
 OLuVLQQTisJW81uB1Bsh/aD/zrbM25B98T2EZ3C2gCLXFCfTLoD4hSKkP
 gEsvXyK0k4vcay6QSvfdZhMyygdXoT0AZt5P9gjE/wUHIBsf+kBXSAG0a Q==;
X-CSE-ConnectionGUID: +T1hb+J6QFODYl6fi9pmBA==
X-CSE-MsgGUID: AUlS0FlMSb6DOGcXXNfEUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="111899767"
X-IronPort-AV: E=Sophos;i="6.25,203,1779174000"; d="scan'208";a="111899767"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2026 16:05:38 -0700
X-CSE-ConnectionGUID: K19XCb2DQ3iF5+rucuaxcg==
X-CSE-MsgGUID: dWWyveksQniInEJIfloVnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,203,1779174000"; d="scan'208";a="255054431"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.126])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2026 16:05:37 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com
Subject: [PATCH v3 2/4] drm/xe/multi_queue: handle CGP_SYNC wait timeout
 during VF recovery
Date: Mon,  3 Aug 2026 16:05:31 -0700
Message-ID: <20260803230528.3428029-8-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260803230528.3428029-6-niranjana.vishwanathapura@intel.com>
References: <20260803230528.3428029-6-niranjana.vishwanathapura@intel.com>
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
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
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

