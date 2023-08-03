Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D9F2C04A6A
	for <intel-xe@archiver.kernel.org>; Thu,  3 Aug 2023 17:39:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 391EF10E650;
	Thu,  3 Aug 2023 17:39:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DA8A10E11D
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Aug 2023 17:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691084350; x=1722620350;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9a/tV+zQkO2qHeYM5eQ+ZiN1e1wnQwINwfIHcP/mS8c=;
 b=BddwmX/8gEbkci6PBPvgXJ6hZ/I55a3ZfVHw+ClXGzA+ZskRRxjLv8lT
 z/VNkMTRXiz5d6PHG471WS0WU+IWtrPmU6ZAVQWjOShssdo2t3btRPXdT
 slUNGcIx+J2Qu6W233pPqqQGWe6PCieSA5mGhvNNXTt8i4gVU03YN+gqi
 tNv1Naktultn4FHsiBlKkbs0k4J3fv+yOCDk8O4X35KbM9heQ+2K0wFVe
 DnVtX46pmh059KHYqSoFkGe1KTEq8nnUYsLUWMvOQqvz3a1qeCgMLNaxT
 fKenlouljzT+62FcAYVWb35wRiepzT3O/WRlXCMrmbXomPDlqEaUQm02F w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="436271558"
X-IronPort-AV: E=Sophos;i="6.01,252,1684825200"; d="scan'208";a="436271558"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2023 10:39:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="853371064"
X-IronPort-AV: E=Sophos;i="6.01,252,1684825200"; d="scan'208";a="853371064"
Received: from aidanhen-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.0.165])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2023 10:39:09 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  3 Aug 2023 18:38:51 +0100
Message-ID: <20230803173849.285599-4-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230803173849.285599-3-matthew.auld@intel.com>
References: <20230803173849.285599-3-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 2/2] drm/xe/guc_submit: fixup deregister in
 job timeout
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

Rather check if the engine is still registered before proceeding with
deregister steps. Also the engine being marked as disabled doesn't mean
the engine has been disabled or deregistered from GuC pov, and here we
are signalling fences so we need to be sure GuC is not still using this
context.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index b88bfe7d8470..e499e6540ca5 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -881,15 +881,17 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	}
 
 	/* Engine state now stable, disable scheduling if needed */
-	if (exec_queue_enabled(q)) {
+	if (exec_queue_registered(q)) {
 		struct xe_guc *guc = exec_queue_to_guc(q);
 		int ret;
 
 		if (exec_queue_reset(q))
 			err = -EIO;
 		set_exec_queue_banned(q);
-		xe_exec_queue_get(q);
-		disable_scheduling_deregister(guc, q);
+		if (!exec_queue_destroyed(q)) {
+			xe_exec_queue_get(q);
+			disable_scheduling_deregister(guc, q);
+		}
 
 		/*
 		 * Must wait for scheduling to be disabled before signalling
-- 
2.41.0

