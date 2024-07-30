Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FEF9C52D54
	for <intel-xe@archiver.kernel.org>; Tue, 30 Jul 2024 22:16:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1028510E3E4;
	Tue, 30 Jul 2024 22:16:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f6Wa7mms";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B8C110E311;
 Tue, 30 Jul 2024 22:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722377815; x=1753913815;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=y++SgnKsOkD1w3+gC/PYkBw3ruX/r97HkH5EBfT9tg0=;
 b=f6Wa7mmsgJmDxxpH+A9vYmh81B2VPqAs9kWvJZ7VbReipdXuh4GII79G
 eqY45eAO+FYT2NOn8HzCDV0MYydW/rsjbBF4jJM0iqmJ8TfZMVpOR3Iwz
 uwzcAvRpX8rrSAP+X5mAwJPJ/wC7B8v6QUTRZwsLusl2XiU+jV+O+KoTn
 GQbpWgRvSuOjfj6Y+Xah7xxuYy+R6wfcsnQHFdUqo0fTuispJODJe3FeZ
 lquAcIRpnNIx4k+tvROutsNYO5sw6ig2Nk2BYXVvuDJ8vsyhxRrjzUdjM
 0z1dwVT7xkzU/tgG9Xc3dPSM26DsIWkeUB2UlLJM/PJXPmjrRj8AoJGUp g==;
X-CSE-ConnectionGUID: XBwke5mRRuq+YKLwA1PO3w==
X-CSE-MsgGUID: 3PB0az0nSnC9JPGrtLkp/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="24094131"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="24094131"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 15:16:55 -0700
X-CSE-ConnectionGUID: UyTdp70ORjW+jKpD1cQbHQ==
X-CSE-MsgGUID: M+gAdEy3QNqg8wkpDRBsSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="58613344"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 15:16:56 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: tj@kernel.org, jiangshanlai@gmail.com, christian.koenig@amd.com,
 ltuikov89@gmail.com, daniel@ffwll.ch
Subject: [RFC PATCH 2/3] drm/sched: Use drm sched lockdep map for submit_wq
Date: Tue, 30 Jul 2024 15:17:41 -0700
Message-Id: <20240730221742.2248527-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240730221742.2248527-1-matthew.brost@intel.com>
References: <20240730221742.2248527-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Avoid leaking a lockdep map on each drm sched creation and destruction
by using a single lockdep map for all drm sched allocated submit_wq.

Cc: Luben Tuikov <ltuikov89@gmail.com>
Cc: Christian König <christian.koenig@amd.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index ab53ab486fe6..9849fd64aff9 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -87,6 +87,12 @@
 #define CREATE_TRACE_POINTS
 #include "gpu_scheduler_trace.h"
 
+#ifdef CONFIG_LOCKDEP
+static struct lockdep_map drm_sched_lockdep_map = {
+	.name = "drm_sched_lockdep_map"
+};
+#endif
+
 #define to_drm_sched_job(sched_job)		\
 		container_of((sched_job), struct drm_sched_job, queue_node)
 
@@ -1272,9 +1278,13 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
 		sched->submit_wq = submit_wq;
 		sched->own_submit_wq = false;
 	} else {
-		sched->submit_wq = alloc_ordered_workqueue(name, 0);
+		sched->submit_wq = alloc_ordered_workqueue(name, WQ_USER_OWNED_LOCKDEP);
 		if (!sched->submit_wq)
 			return -ENOMEM;
+#ifdef CONFIG_LOCKDEP
+		wq_init_user_lockdep_map(sched->submit_wq,
+					 &drm_sched_lockdep_map);
+#endif
 
 		sched->own_submit_wq = true;
 	}
-- 
2.34.1

