Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82E3BC5475B
	for <intel-xe@archiver.kernel.org>; Thu, 14 Mar 2024 12:16:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2340310E4FF;
	Thu, 14 Mar 2024 12:16:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GxJaZA/g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 671A510E4FF
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Mar 2024 12:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710418569; x=1741954569;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WcYs4emD/Zt7MyklsByCKvprVWbpEcv07K373J1dD70=;
 b=GxJaZA/gqiqLTR21zy6H3eX5hCmgMgYfNgUMAtoMSwZzPth9QXMhiU+C
 IUxJJ7syUrsreRqImZL3dA7lJuTdUVu+z7FKvZfxWdZU/O++sFPVU8yy/
 Duk82jLV2sxXQ1SacDZlA7dH4XpcsC9tbBKSUdSOdekFhjF8Vl8eMx/g0
 gZw38r0KChAPoJ2y6wu4alOOKHCIV/CWbQT1PeisLtWLpX3EPll4J+Jsv
 EqGyosxMe8UmmPZvsyCVpTCj5nidZeqRP3xT1L/kLfCu+5MSbMTH9ksY9
 +Q2i/wh5y1ajwRmPa4JQYKVpqVmhx6LcrARBZIxRsk7ck2hnpcmETdRkJ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="5097763"
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; 
   d="scan'208";a="5097763"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 05:16:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; d="scan'208";a="16738284"
Received: from unknown (HELO mwauld-mobl1.intel.com) ([10.245.244.240])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 05:16:06 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe/guc_submit: use jiffies for job timeout
Date: Thu, 14 Mar 2024 12:15:55 +0000
Message-ID: <20240314121554.223229-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.44.0
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

drm_sched_init() expects jiffies for the timeout, but here we are
passing the timeout in ms. Convert to jiffies instead.

Fixes: eef55700f302 ("drm/xe: Add sysfs for default engine scheduler properties")
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 19efdb2f881f..82c955a2a15c 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1226,7 +1226,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
 	init_waitqueue_head(&ge->suspend_wait);
 
 	timeout = (q->vm && xe_vm_in_lr_mode(q->vm)) ? MAX_SCHEDULE_TIMEOUT :
-		  q->sched_props.job_timeout_ms;
+		  msecs_to_jiffies(q->sched_props.job_timeout_ms);
 	err = xe_sched_init(&ge->sched, &drm_sched_ops, &xe_sched_ops,
 			    get_submit_wq(guc),
 			    q->lrc[0].ring.size / MAX_JOB_SIZE_BYTES, 64,
-- 
2.44.0

