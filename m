Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB9FCE77187
	for <intel-xe@archiver.kernel.org>; Wed, 18 Dec 2024 05:31:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A10810EAC5;
	Wed, 18 Dec 2024 05:31:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZHyUPrvy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8330F10E329
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Dec 2024 05:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734499899; x=1766035899;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=X2CwTVNsbtGDmTm5rBfFksMll8wxK3NMB2l6rLnM9oA=;
 b=ZHyUPrvyx5/Lvo3YDghiNL260rQ+WjooXXx6PtAFMWYHkftyh8MgN8sI
 hpsyXg3QTEjUeh2mbjtlMlm+RnGVlrgroCcU7h138asGfkroD6BtvGRQL
 CASUj9bo1yEfRvoBgooCAOANgUQjDg0zqugYCaru8FVJdffO0Mf4naa5C
 sSoGt5GAPWFWalOAsTIryBG+ow9ayYzx+7xy9M2ANLqAtHrawK1wQk6t/
 ojfAwN90c40WP3CwWDBrXUvs+M1lexkx8FnPJXWn+WPW27OIplrVeonsf
 NnrMewHyqujdrk06cuWtAA0vXFfOMz4iQZ9Q1+fAUbuChNru5Bbh0baLI g==;
X-CSE-ConnectionGUID: cL3n+35lTvS1+C43U1jurA==
X-CSE-MsgGUID: vmVlw2JVRP2zS95sYQjP/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="46348428"
X-IronPort-AV: E=Sophos;i="6.12,243,1728975600"; d="scan'208";a="46348428"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 21:31:38 -0800
X-CSE-ConnectionGUID: gKRh4PM4RPKoQtAgBZi8Mw==
X-CSE-MsgGUID: OqYMiO0gTRWM5MJ4jtpybA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="102364047"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 21:31:38 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: matthew.brost@intel.com,
	Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 1/2] drm/xe: Fix fault on fd close after unbind
Date: Tue, 17 Dec 2024 21:31:21 -0800
Message-ID: <20241218053122.2730195-1-lucas.demarchi@intel.com>
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

If userspace holds an fd open, unbinds the device and then closes it,
the driver shouldn't try to access the hardware. Protect it by using
drm_dev_enter()/drm_dev_exit(). This fixes the following page fault:

<6> [IGT] xe_wedged: exiting, ret=98
<1> BUG: unable to handle page fault for address: ffffc901bc5e508c
<1> #PF: supervisor read access in kernel mode
<1> #PF: error_code(0x0000) - not-present page
...
<4>   xe_lrc_update_timestamp+0x1c/0xd0 [xe]
<4>   xe_exec_queue_update_run_ticks+0x50/0xb0 [xe]
<4>   xe_exec_queue_fini+0x16/0xb0 [xe]
<4>   __guc_exec_queue_fini_async+0xc4/0x190 [xe]
<4>   guc_exec_queue_fini_async+0xa0/0xe0 [xe]
<4>   guc_exec_queue_fini+0x23/0x40 [xe]
<4>   xe_exec_queue_destroy+0xb3/0xf0 [xe]
<4>   xe_file_close+0xd4/0x1a0 [xe]
<4>   drm_file_free+0x210/0x280 [drm]
<4>   drm_close_helper.isra.0+0x6d/0x80 [drm]
<4>   drm_release_noglobal+0x20/0x90 [drm]

Fixes: 83db047d9425 ("drm/xe: Stop accumulating LRC timestamp on job_free")
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3421
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 9c94be5719008..8005530b5e51e 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -8,6 +8,7 @@
 #include <linux/nospec.h>
 
 #include <drm/drm_device.h>
+#include <drm/drm_drv.h>
 #include <drm/drm_file.h>
 #include <uapi/drm/xe_drm.h>
 
@@ -768,9 +769,11 @@ bool xe_exec_queue_is_idle(struct xe_exec_queue *q)
  */
 void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q)
 {
+	struct xe_device *xe = gt_to_xe(q->gt);
 	struct xe_file *xef;
 	struct xe_lrc *lrc;
 	u32 old_ts, new_ts;
+	int idx;
 
 	/*
 	 * Jobs that are run during driver load may use an exec_queue, but are
@@ -780,6 +783,10 @@ void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q)
 	if (!q->vm || !q->vm->xef)
 		return;
 
+	/* Synchronize with unbind while holding the xe file open */
+	if (!drm_dev_enter(&xe->drm, &idx))
+		return;
+
 	xef = q->vm->xef;
 
 	/*
@@ -793,6 +800,8 @@ void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q)
 	lrc = q->lrc[0];
 	new_ts = xe_lrc_update_timestamp(lrc, &old_ts);
 	xef->run_ticks[q->class] += (new_ts - old_ts) * q->width;
+
+	drm_dev_exit(idx);
 }
 
 /**
-- 
2.47.0

