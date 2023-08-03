Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0416CEB64DD
	for <intel-xe@archiver.kernel.org>; Thu,  3 Aug 2023 17:39:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2AB010E651;
	Thu,  3 Aug 2023 17:39:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D917810E648
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Aug 2023 17:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691084349; x=1722620349;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ylGRcQ37DmJf8+0Bui0ay8bwlyNusrYO01mInbuGll8=;
 b=V4vv5LTcQHYlWeLxtkq/D0Tb1nUMl1+53zzbYLhTjChhCLI5bjqQ5q7O
 32Q8Jmlw66W1WC8jyROek/eyePFeP88Jqg/2pNkDQSxLANotCOfwB0u48
 YLSvMJqNYUpjRUE+2c27No9JIuUtWTvrIIbCrit+ag2jke6fFZO78v5UG
 WVSFAYaybvVUbaA2pjSZQUe83HNhaaATfbr+CxRwOFZwFCVEnRR+V0uyt
 rbr5SD7mzMNLNCRhfwzmRrSj4JiPsuK3DnrYCFosv6jVrDavlavhHX//f
 eCOMV3dmVnNrdbBaR8HbJq/t3DZllClxcELRQuEQ/D7e1KvOapT3wYVHE Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="436271546"
X-IronPort-AV: E=Sophos;i="6.01,252,1684825200"; d="scan'208";a="436271546"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2023 10:39:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="853371021"
X-IronPort-AV: E=Sophos;i="6.01,252,1684825200"; d="scan'208";a="853371021"
Received: from aidanhen-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.0.165])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2023 10:39:08 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  3 Aug 2023 18:38:50 +0100
Message-ID: <20230803173849.285599-3-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 1/2] drm/xe/guc_submit: prevent repeated
 unregister
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

It seems that various things can trigger the lr cleanup worker,
including CAT error, engine reset and destroying the actual engine, so
seems plausible to end up triggering the worker more than once in some
cases. If that does happen we can race with an ongoing engine deregister
before it has completed, thus triggering it again and also changing the
state back into pending_disable. Checking if the engine has been marked
as destroyed looks like it should prevent this.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 193362518a62..b88bfe7d8470 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -802,8 +802,18 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
 	/* Kill the run_job / process_msg entry points */
 	drm_sched_run_wq_stop(sched);
 
-	/* Engine state now stable, disable scheduling / deregister if needed */
-	if (exec_queue_registered(q)) {
+	/*
+	 * Engine state now mostly stable, disable scheduling / deregister if
+	 * needed. This cleanup routine might be called multiple times, where
+	 * the actual async engine deregister drops the final engine ref.
+	 * Calling disable_scheduling_deregister will mark the engine as
+	 * destroyed and fire off the CT requests to disable scheduling /
+	 * deregister, which we only want to do once. We also don't want to mark
+	 * the engine as pending_disable again as this may race with the
+	 * xe_guc_deregister_done_handler() which treats it as an unexpected
+	 * state.
+	 */
+	if (exec_queue_registered(q) && !exec_queue_destroyed(q)) {
 		struct xe_guc *guc = exec_queue_to_guc(q);
 		int ret;
 
-- 
2.41.0

