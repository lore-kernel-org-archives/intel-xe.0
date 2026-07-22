Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5369EC4452D
	for <intel-xe@archiver.kernel.org>; Wed, 22 Jul 2026 00:56:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAF1A10EBC3;
	Wed, 22 Jul 2026 00:56:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jwt0eucT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51A4110EBC3
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Jul 2026 00:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784681785; x=1816217785;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Dz5BxLoKV5U5Lae428ZHCjQHS/C1vdrGdhSSVdddDa8=;
 b=jwt0eucTMREdyGO4uta6ygbgxyUbGJJW8sEC+aF9z7dKTbQV/2I4r/Bn
 ty15G5fr0SU6axhpXxyoojZviO1kXPYY8CtHgHbRPq8OPWCLl5ZfVXR5j
 8r3aig+s2bjUVuS9+z14eJM/5b4rCZ8bkzd1m7EmM26in4ZqrB3XJ1Tzj
 jVdZZX/i+/A0q1oNPJqn+ULdub0Hu6tL2oGQ0CUfXWDg4ZBNNJBFom3lP
 SFw2gJL73SvBsi62pEF/VIfhN6+TNAC54IgVeSL7m1H+Wv7qhJNUofrmk
 ZsYDQWAd9vjQu52pNni9OKvBh6LXU1TLjyXbc8iMUsjht50QTCAojxx3J w==;
X-CSE-ConnectionGUID: HWpTQM4DReGzff0RDpzYuQ==
X-CSE-MsgGUID: 4TjDSLfBQZiZikKQPfjvcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="84429659"
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; d="scan'208";a="84429659"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 17:56:24 -0700
X-CSE-ConnectionGUID: LtVwt7mNSqO8fVlSyGBJGg==
X-CSE-MsgGUID: JWKtMN3uS3yZM1NjIZqodg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; d="scan'208";a="258003179"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.126])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 17:56:24 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com
Subject: [PATCH 1/2] drm/xe/multi_queue: Handle VF recovery in CGP_SYNC and
 queue registration paths
Date: Tue, 21 Jul 2026 17:56:16 -0700
Message-ID: <20260722005617.2912343-5-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260722005617.2912343-4-niranjana.vishwanathapura@intel.com>
References: <20260722005617.2912343-4-niranjana.vishwanathapura@intel.com>
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
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 8aaed4fd13ea..213e5be1e775 100644
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
+				 xe_guc_read_stopped(guc) ||
+				 vf_recovery(guc), HZ);
+	if ((!ret && !vf_recovery(guc)) || xe_guc_read_stopped(guc)) {
 		/* CGP_SYNC failed. Reset gt, cleanup the group */
 		xe_gt_warn(guc_to_gt(guc), "Wait for CGP_SYNC_DONE response failed!\n");
 		set_exec_queue_group_banned(q);
-- 
2.43.0

