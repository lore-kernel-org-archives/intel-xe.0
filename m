Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F575C52D7C
	for <intel-xe@archiver.kernel.org>; Fri,  9 Aug 2024 22:27:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B773A10EA17;
	Fri,  9 Aug 2024 22:27:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I/Wqy6v/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28BDD10EA11;
 Fri,  9 Aug 2024 22:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723242464; x=1754778464;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ptiJFpcxcUokqaP9PdFq+FGJm+jDe2svhscYd8NXJ0M=;
 b=I/Wqy6v/tSbmZhaxZ8oZQ2tuEMPCmUNd7Yq4agc4bVpVNI2+k/yeJCdD
 iFEsHgdFWm7XhBUJy7WCwyhcTeI+me1hPY9GIncAJtlUbHvuHZ5yXSOwJ
 kEQOjAKhBjO9RwywEuzSMqmLc+NipUhGJPdz/BXMMpciqxHhjNelwOvJL
 lCj/DWAppLabrZz8kYqY3YhXAoJDep6Mj/o8uMhFc38d5N96KoVXYlzz3
 CR/ejLUsyeDKy71UOrVwhyBps9ZbRVdXSChZgTtWxH3RtJt/9nMEPbgXK
 QgAuFMcf8I/J6PIwRypvg+pVgA0c7ji94InywXuuFhSvTeS+ROlSDRr8t Q==;
X-CSE-ConnectionGUID: m0ETTwv4Qfqc6/6BFNSqCA==
X-CSE-MsgGUID: bRLM+zYRQl2BBzO3d25AzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11159"; a="25229663"
X-IronPort-AV: E=Sophos;i="6.09,277,1716274800"; d="scan'208";a="25229663"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 15:27:43 -0700
X-CSE-ConnectionGUID: s8KxR0Z2R42/B+NEObfnew==
X-CSE-MsgGUID: PT9E3ignQ3m6u8bx2QvGBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,277,1716274800"; d="scan'208";a="62641785"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 15:27:43 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: tj@kernel.org, jiangshanlai@gmail.com, christian.koenig@amd.com,
 ltuikov89@gmail.com, daniel@ffwll.ch
Subject: [PATCH v3 4/5] drm/sched: Use drm sched lockdep map for submit_wq
Date: Fri,  9 Aug 2024 15:28:26 -0700
Message-Id: <20240809222827.3211998-5-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240809222827.3211998-1-matthew.brost@intel.com>
References: <20240809222827.3211998-1-matthew.brost@intel.com>
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

v2:
 - Use alloc_ordered_workqueue_lockdep_map (Tejun)

Cc: Luben Tuikov <ltuikov89@gmail.com>
Cc: Christian König <christian.koenig@amd.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index ab53ab486fe6..cf79d348cb32 100644
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
 
@@ -1272,7 +1278,12 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
 		sched->submit_wq = submit_wq;
 		sched->own_submit_wq = false;
 	} else {
+#ifdef CONFIG_LOCKDEP
+		sched->submit_wq = alloc_ordered_workqueue_lockdep_map(name, 0,
+								       &drm_sched_lockdep_map);
+#else
 		sched->submit_wq = alloc_ordered_workqueue(name, 0);
+#endif
 		if (!sched->submit_wq)
 			return -ENOMEM;
 
-- 
2.34.1

