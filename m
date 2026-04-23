Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D220FFAD3F1
	for <intel-xe@archiver.kernel.org>; Thu, 23 Apr 2026 02:50:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 934D010E2E8;
	Thu, 23 Apr 2026 02:50:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MKUAeGte";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6B8010EAE0
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Apr 2026 02:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776912604; x=1808448604;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oQ0R0vvQleEJvKAziO63m3trN6HXb7EKT+F9e6RyBDs=;
 b=MKUAeGtemGyzgX8dJIX2drTZqq3FbOyfF/MpP95eAcw37EgbGlut2lIK
 bMtsJYBTQdglRms5wFTg0lsnRIUEsHoWFqOjdzgF2gj0AoyfjBS3Rb3Vz
 ISbQ9LfFPei4pEg8hyPxKdqDf54qSA/y24kULbgVqBXYgFm3/kfxa+Ol0
 oH6caeh781gQeO0svAACllWZehGOfhAAE3b6f5QBhsM6+0c+8tgNkqkeQ
 ozWQTg/kGXiVQbnKs+S6JemJYeswnvh0yjtuOq+jzi5qi/+104t4inV0t
 2zpBImzEsEPUHyZmWOFH3yAPpACkSeFuhtTbiiyVVHpjnmIzYIRW6v38s g==;
X-CSE-ConnectionGUID: VbTM3OnLQHG4H3Re1+Q6Og==
X-CSE-MsgGUID: dxTktt4vQZ2xIoXCu3N51A==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="88181152"
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; d="scan'208";a="88181152"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2026 19:50:03 -0700
X-CSE-ConnectionGUID: JvKBsYpeQTeqH1vQ7BfHlQ==
X-CSE-MsgGUID: O4YqRRK8Sp+9mGOAjFvBjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; d="scan'208";a="262917975"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.139])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2026 19:50:02 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com
Subject: [RFC 3/4] drm/xe/multi_queue: Handle VF recovery in CGP_SYNC and
 queue registration paths
Date: Wed, 22 Apr 2026 19:49:55 -0700
Message-ID: <20260423024954.1665095-9-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260423024954.1665095-6-niranjana.vishwanathapura@intel.com>
References: <20260423024954.1665095-6-niranjana.vishwanathapura@intel.com>
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

In xe_guc_exec_queue_group_cgp_sync(), add vf_recovery(guc) as a wake
condition on the wait_event_timeout() so VF migration does not cause a
spurious timeout. Adjust the error check to only treat a timeout as an
error when VF recovery is not in progress.

Assisted-by: GitHub Copilot:claude-sonnet-4.6
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 4171eff4e8ad..0e857ef06611 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -827,13 +827,12 @@ static void xe_guc_exec_queue_group_cgp_sync(struct xe_guc *guc,
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
+				 xe_guc_read_stopped(guc) ||
+				 vf_recovery(guc), HZ);
+	if ((!ret && !vf_recovery(guc)) || xe_guc_read_stopped(guc)) {
 		/* CGP_SYNC failed. Reset gt, cleanup the group */
 		xe_gt_warn(guc_to_gt(guc), "Wait for CGP_SYNC_DONE response failed!\n");
 		set_exec_queue_group_banned(q);
-- 
2.43.0

