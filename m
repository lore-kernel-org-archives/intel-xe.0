Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DA5ECAC597
	for <intel-xe@archiver.kernel.org>; Tue, 16 Sep 2025 02:10:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DD1110E196;
	Tue, 16 Sep 2025 02:10:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="Fugi7cRn";
	dkim-atps=neutral
Received: from out30-133.freemail.mail.aliyun.com
 (out30-133.freemail.mail.aliyun.com [115.124.30.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E396C10E196;
 Tue, 16 Sep 2025 02:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux.alibaba.com; s=default;
 t=1757988642; h=From:To:Subject:Date:Message-ID:MIME-Version;
 bh=ace3VQl9Qd7WAPxbz6HMw52CfIbRMCyc/gIuBLwG5oU=;
 b=Fugi7cRng6knv2/1IaGkMwivKgGcXVfwvPVkp6Anzd9NKHggKKOfp9i+e3zm9hUSRPolaH5FMzv82pdXSSSpwXdO7jSQebedu9L5AY6RvDSdvVrM2/e0AxYw/97YGU4IbnJ8/QJj4rRkyQ5de/mBNgE6s//WfL0eSltU8GuLNu8=
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com
 fp:SMTPD_---0Wo6baSE_1757988641 cluster:ay36) by smtp.aliyun-inc.com;
 Tue, 16 Sep 2025 10:10:41 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@gmail.com, simona@ffwll.ch
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Yang Li <yang.lee@linux.alibaba.com>,
 Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH -next] drm/xe: Remove duplicate header files
Date: Tue, 16 Sep 2025 10:10:39 +0800
Message-ID: <20250916021039.1632766-1-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
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

./drivers/gpu/drm/xe/xe_tlb_inval.c: xe_tlb_inval.h is included more than once.
./drivers/gpu/drm/xe/xe_pt.c: xe_tlb_inval_job.h is included more than once.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=24705
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=24706
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/gpu/drm/xe/xe_pt.c        | 3 +--
 drivers/gpu/drm/xe/xe_tlb_inval.c | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 01eea8eb1779..a1c88f9a6c76 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -13,14 +13,13 @@
 #include "xe_drm_client.h"
 #include "xe_exec_queue.h"
 #include "xe_gt.h"
-#include "xe_tlb_inval_job.h"
 #include "xe_migrate.h"
 #include "xe_pt_types.h"
 #include "xe_pt_walk.h"
 #include "xe_res_cursor.h"
 #include "xe_sched_job.h"
-#include "xe_sync.h"
 #include "xe_svm.h"
+#include "xe_sync.h"
 #include "xe_tlb_inval_job.h"
 #include "xe_trace.h"
 #include "xe_ttm_stolen_mgr.h"
diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.c b/drivers/gpu/drm/xe/xe_tlb_inval.c
index e6e97b5a7b5c..918a59e686ea 100644
--- a/drivers/gpu/drm/xe/xe_tlb_inval.c
+++ b/drivers/gpu/drm/xe/xe_tlb_inval.c
@@ -10,11 +10,10 @@
 #include "xe_force_wake.h"
 #include "xe_gt.h"
 #include "xe_gt_printk.h"
+#include "xe_gt_stats.h"
 #include "xe_guc.h"
 #include "xe_guc_ct.h"
 #include "xe_guc_tlb_inval.h"
-#include "xe_gt_stats.h"
-#include "xe_tlb_inval.h"
 #include "xe_mmio.h"
 #include "xe_pm.h"
 #include "xe_tlb_inval.h"
-- 
2.43.7

