Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55FF9C282D1
	for <intel-xe@archiver.kernel.org>; Thu,  6 Mar 2025 12:48:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19BD710E195;
	Thu,  6 Mar 2025 12:48:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CQzMugKC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84D3810E195
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Mar 2025 12:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741265301; x=1772801301;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OOOMMwBBofOEnUQUFQUmAmMKhoPrWQrG0MGm7UireI8=;
 b=CQzMugKCaKahDTGo6KCL6ufTo2HbxnSkxiLkpE1eryXqbBAyGzcbMIvJ
 VVknbebdZrsAyd1bgkmCzMBG464Oa5OtwzimbpIvnZUoRFbkfjISdNqHR
 /nnoz1yve2r0Lbh40i2qJuUX6CYJA6qktqo+fEn/O3ZizYa4G41ujiDtw
 k9XtyDFcd58dwdBZ/PQZ9Vtpghs6peOAHTQ9GaskwF0J7h4iz3yyhxXkv
 Dj0R29GAFVEaUcOQ47XEi3R9Lh7cyDcACLsP9ep/7Z4mRIpTEk9dek/rO
 fomHE2yn00fuda5CovdTshOLMzjlcky7KsiOrUtqCmaASQyVaT80u2IgV g==;
X-CSE-ConnectionGUID: VziEWVDFQXKBVd9ZBRKYnQ==
X-CSE-MsgGUID: dkznrqwXTQ64JLyWgD04nw==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="59679501"
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; d="scan'208";a="59679501"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 04:48:21 -0800
X-CSE-ConnectionGUID: MewDuFK8R+m+eaNO8wP+jA==
X-CSE-MsgGUID: UcnhvayYTTqaLM1WLPCDxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="119925733"
Received: from unknown (HELO tejas-super-server..) ([10.190.239.37])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 04:48:18 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH] drm/xe: Release gud ids before cancelling work
Date: Thu,  6 Mar 2025 18:24:59 +0530
Message-Id: <20250306125459.975071-1-tejas.upadhyay@intel.com>
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

A GT reset can be occuring in parallel while cancelling
work in async call  which can requeue these workers.
To avoid that lets first release guc ids and then cancle
work so they dont requeued.

Fixes: 8ae8a2e8dd21 ("drm/xe: Long running job update")
Fixes: 18fbd567e75f ("drm/xe: cancel pending job timer before freeing scheduler")
Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index b95934055f72..31bc2022bfc2 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1254,11 +1254,11 @@ static void __guc_exec_queue_fini_async(struct work_struct *w)
 	xe_pm_runtime_get(guc_to_xe(guc));
 	trace_xe_exec_queue_destroy(q);
 
+	release_guc_id(guc, q);
 	if (xe_exec_queue_is_lr(q))
 		cancel_work_sync(&ge->lr_tdr);
 	/* Confirm no work left behind accessing device structures */
 	cancel_delayed_work_sync(&ge->sched.base.work_tdr);
-	release_guc_id(guc, q);
 	xe_sched_entity_fini(&ge->entity);
 	xe_sched_fini(&ge->sched);
 
-- 
2.34.1

