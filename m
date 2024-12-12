Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08841E77180
	for <intel-xe@archiver.kernel.org>; Thu, 12 Dec 2024 17:35:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB60C10E431;
	Thu, 12 Dec 2024 17:35:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q/4ZLrV2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC5AC10E431
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Dec 2024 17:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734024911; x=1765560911;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rq+KQ3VuQ6pQ39JLoebWnHfmizo/QbMi9JMJ5nXIMGo=;
 b=Q/4ZLrV2X8ciTRsapwC9f7Ny1UilX9Eg/qDvBz7vsADPYh1YPBXJ6dFz
 5NbLp1PaAnw/dox822Royk05f6dEA73IdBhy+WUcOtmFI9z7l9xvpi0AH
 fHQKTOCzST68zOXWwY74bjLFl/jTUuYKvck7yZwxyThkN/Hn7k/6dDG05
 rC9y4B51cxmH3v56fTy/7RWIAgD3kouUty0MxzcdS5Af8muSJkuETtjuk
 G8lTGr5zgvcvak77IJRN3qbYyjvuDOxbLJoz7sg/qWTYsg9Abq2z1B7tv
 dH0CM10qEPryiPAX6Iw+vGqB5WuW1+0nmalVdXGeTa/GTBkRHTdOJljW+ Q==;
X-CSE-ConnectionGUID: 91YLru/YQ4yeGgpOgo0XaA==
X-CSE-MsgGUID: B6ME3b69R9Ocy5p/Sj0WEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="38392199"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="38392199"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 09:35:10 -0800
X-CSE-ConnectionGUID: D1bBCyZ2Q6SWzgg3+fzuPA==
X-CSE-MsgGUID: TjlZq59OSf2/BM6IA9iyHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="96145196"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 09:35:10 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: matthew.brost@intel.com,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, stable@vger.kernel.org
Subject: [PATCH] drm/xe/client: Better correlate exec_queue and GT timestamps
Date: Thu, 12 Dec 2024 09:34:32 -0800
Message-ID: <20241212173432.1244440-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.47.0
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

This partially reverts commit fe4f5d4b6616 ("drm/xe: Clean up VM / exec
queue file lock usage."). While it's desired to have the mutex to
protect only the reference to the exec queue, getting and dropping each
mutex and then later getting the GPU timestamp, doesn't produce a
correct result: it introduces multiple opportunities for the task to be
scheduled out and thus wrecking havoc the deltas reported to userspace.

Also, to better correlate the timestamp from the exec queues with the
GPU, disable preemption so they can be updated without allowing the task
to be scheduled out. We leave interrupts enabled as that shouldn't be
enough disturbance for the deltas to matter to userspace.

Test scenario:

	* IGT'S `xe_drm_fdinfo --r --r utilization-single-full-load`
	* Platform: LNL, where CI occasionally reports failures
	* `stress -c $(nproc)` running in parallel to disturb the
	  system

This brings a first failure from "after ~150 executions" to "never
occurs after 1000 attempts".

Cc: stable@vger.kernel.org # v6.11+
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3512
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_drm_client.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
index 298a587da7f17..e307b4d6bab5a 100644
--- a/drivers/gpu/drm/xe/xe_drm_client.c
+++ b/drivers/gpu/drm/xe/xe_drm_client.c
@@ -338,15 +338,12 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
 
 	/* Accumulate all the exec queues from this client */
 	mutex_lock(&xef->exec_queue.lock);
-	xa_for_each(&xef->exec_queue.xa, i, q) {
-		xe_exec_queue_get(q);
-		mutex_unlock(&xef->exec_queue.lock);
+	preempt_disable();
 
+	xa_for_each(&xef->exec_queue.xa, i, q)
 		xe_exec_queue_update_run_ticks(q);
 
-		mutex_lock(&xef->exec_queue.lock);
-		xe_exec_queue_put(q);
-	}
+	preempt_enable();
 	mutex_unlock(&xef->exec_queue.lock);
 
 	gpu_timestamp = xe_hw_engine_read_timestamp(hwe);
-- 
2.47.0

