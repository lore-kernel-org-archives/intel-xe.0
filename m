Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7E8AC001DF
	for <intel-xe@archiver.kernel.org>; Wed,  2 Aug 2023 14:04:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84E2B10E1A2;
	Wed,  2 Aug 2023 14:04:11 +0000 (UTC)
Received: from mgamail.intel.com (unknown [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFAD610E1A2
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Aug 2023 14:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690985049; x=1722521049;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=iyPNk3ZpiPg25uMbr/qNORo6+xTMoSmfojw1r/w0Cag=;
 b=cB1RH5yaITjJsLZBAcLTGsb/JhDwqtbgJ78otm/Gpqwe7IXIdfNPOrlj
 lbMhvS6aQ3j4KHVb8mZ0HzLFGeKCACYZS+WjR3EnjHxADH6kJph8FzI5D
 tcodqmDdcYIGnAc7ySEi+kbCE0bZQr4mUbBJmxloEA9vbCFS9aN60KUDH
 EhSfZeCQbnHKV5T/D5/BvpqyEgwZqadOMLEbb/qXVeddqlEhgzPMpHdS/
 bNaJm6pQF2M+YOlN69sPI9Qo249aXNVSfQtmsGs0DcQ2GQaxGYl/gHOV/
 Mp6FLtf+G2LwXnSe6JbVCJKSA0bd2FWgzeBI//tjgmqjJ+9fICs7h7tPd w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="367055149"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200"; d="scan'208";a="367055149"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2023 07:03:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="819237884"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200"; d="scan'208";a="819237884"
Received: from iocarrol-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.16.135])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2023 07:03:35 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  2 Aug 2023 15:03:16 +0100
Message-ID: <20230802140315.193700-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe/guc_submit: prevent repeated unregister
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
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 8d2b50e03ed2..2459e9dd95e8 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -802,8 +802,18 @@ static void xe_guc_engine_lr_cleanup(struct work_struct *w)
 	/* Kill the run_job / process_msg entry points */
 	drm_sched_run_wq_stop(sched);
 
-	/* Engine state now stable, disable scheduling / deregister if needed */
-	if (engine_registered(e)) {
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
+	if (engine_registered(e) && !engine_destroyed(e)) {
 		struct xe_guc *guc = engine_to_guc(e);
 		int ret;
 
-- 
2.41.0

