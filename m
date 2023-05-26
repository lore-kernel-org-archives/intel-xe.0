Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33F2AC7EE2E
	for <intel-xe@archiver.kernel.org>; Fri, 26 May 2023 16:44:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0244910E820;
	Fri, 26 May 2023 16:44:24 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCA4C10E81A
 for <intel-xe@lists.freedesktop.org>; Fri, 26 May 2023 16:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685119453; x=1716655453;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+7oIGE4np3tPRywkplruqbdOt0k2RA/xD5MYNL7Mk4o=;
 b=WhQINlsndjGLDoM775jzyuo9XQFuczg/iSjFihFdIM5R+69gzM4dYdbx
 Ire5wbh4zDQ5FPHJ+496FN2aP0ep9E19y/uXh6dVxQODqcnJ70i5kEioq
 /zC26WsCk2tPU8W9FRZRjaMgKhZ3Voe4yUGi73iW3TuWJHqiHU1hEUoAM
 /qdOlzpF4A7Ue8c2AT289NOeIlrrzsxavxVTmEV/6h7y5oL6rMYxNlHpV
 vWRDUsiJMEMlpbjE9K41R/doZrZEteYK7LOWeyL+1kiKegvxv+uqnbIJU
 2yVuYBnIBU7IpBCxC0P75KXAgFZUz87shpR9U/drOwcugwXPKzPQBngMx g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="356628378"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; d="scan'208";a="356628378"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 09:44:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="795151463"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; d="scan'208";a="795151463"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 09:44:12 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 26 May 2023 09:43:43 -0700
Message-Id: <20230526164358.86393-7-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230526164358.86393-1-lucas.demarchi@intel.com>
References: <20230526164358.86393-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v5 06/21] drm/xe/wa: Track gt/engine/lrc active
 workarounds
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Allocate the data to track workarounds on each gt of the device,
and pass that to RTP so the active workarounds are tracked.

Even if the workarounds available until now are mostly device
or platform centric, with the different IP versions for media and
graphics starting with MTL, it's possible that some workarounds
need to be applied only on select GTs. Also, given the workaround
database is per IP block, for tracking purposes there is no need to
differentiate the workarounds per engine class. Hence the bitmask
to track active workarounds can be tracked per GT.

v2: Move the tracking from per-device to per-GT basis (Matt Roper)

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c       |  5 +++++
 drivers/gpu/drm/xe/xe_gt_types.h | 10 +++++++++
 drivers/gpu/drm/xe/xe_wa.c       | 37 ++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_wa.h       |  1 +
 4 files changed, 53 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 80d42c7c7cfa..d139554316d4 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -315,6 +315,11 @@ int xe_gt_init_early(struct xe_gt *gt)
 		return err;
 
 	xe_reg_sr_init(&gt->reg_sr, "GT", gt_to_xe(gt));
+
+	err = xe_wa_init(gt);
+	if (err)
+		return err;
+
 	xe_wa_process_gt(gt);
 	xe_tuning_process_gt(gt);
 
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index 7c47d67aa8be..017ab60f2498 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -359,6 +359,16 @@ struct xe_gt {
 	 *    of a steered operation
 	 */
 	spinlock_t mcr_lock;
+
+	/** @wa_active: keep track of active workarounds */
+	struct {
+		/** @gt: bitmap with active GT workarounds */
+		unsigned long *gt;
+		/** @engine: bitmap with active engine workarounds */
+		unsigned long *engine;
+		/** @lrc: bitmap with active LRC workarounds */
+		unsigned long *lrc;
+	} wa_active;
 };
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 557e90d79f0b..665714abc5f0 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -5,6 +5,7 @@
 
 #include "xe_wa.h"
 
+#include <drm/drm_managed.h>
 #include <kunit/visibility.h>
 #include <linux/compiler_types.h>
 
@@ -581,6 +582,8 @@ void xe_wa_process_gt(struct xe_gt *gt)
 {
 	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(gt);
 
+	xe_rtp_process_ctx_enable_active_tracking(&ctx, gt->wa_active.gt,
+						  ARRAY_SIZE(gt_was));
 	xe_rtp_process_to_sr(&ctx, gt_was, &gt->reg_sr);
 }
 EXPORT_SYMBOL_IF_KUNIT(xe_wa_process_gt);
@@ -597,6 +600,8 @@ void xe_wa_process_engine(struct xe_hw_engine *hwe)
 {
 	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(hwe);
 
+	xe_rtp_process_ctx_enable_active_tracking(&ctx, hwe->gt->wa_active.engine,
+						  ARRAY_SIZE(engine_was));
 	xe_rtp_process_to_sr(&ctx, engine_was, &hwe->reg_sr);
 }
 
@@ -612,5 +617,37 @@ void xe_wa_process_lrc(struct xe_hw_engine *hwe)
 {
 	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(hwe);
 
+	xe_rtp_process_ctx_enable_active_tracking(&ctx, hwe->gt->wa_active.lrc,
+						  ARRAY_SIZE(lrc_was));
 	xe_rtp_process_to_sr(&ctx, lrc_was, &hwe->reg_lrc);
 }
+
+/**
+ * xe_wa_init - initialize gt with workaround bookkeeping
+ * @gt: GT instance to initialize
+ *
+ * Returns 0 for success, negative error code otherwise.
+ */
+int xe_wa_init(struct xe_gt *gt)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+	size_t n_lrc, n_engine, n_gt, total;
+	unsigned long *p;
+
+	n_gt = BITS_TO_LONGS(ARRAY_SIZE(gt_was));
+	n_engine = BITS_TO_LONGS(ARRAY_SIZE(engine_was));
+	n_lrc = BITS_TO_LONGS(ARRAY_SIZE(lrc_was));
+	total = n_gt + n_engine + n_lrc;
+
+	p = drmm_kzalloc(&xe->drm, sizeof(*p) * total, GFP_KERNEL);
+	if (!p)
+		return -ENOMEM;
+
+	gt->wa_active.gt = p;
+	p += n_gt;
+	gt->wa_active.engine = p;
+	p += n_engine;
+	gt->wa_active.lrc = p;
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/xe/xe_wa.h b/drivers/gpu/drm/xe/xe_wa.h
index cd2307d58795..eae05bcecc68 100644
--- a/drivers/gpu/drm/xe/xe_wa.h
+++ b/drivers/gpu/drm/xe/xe_wa.h
@@ -9,6 +9,7 @@
 struct xe_gt;
 struct xe_hw_engine;
 
+int xe_wa_init(struct xe_gt *gt);
 void xe_wa_process_gt(struct xe_gt *gt);
 void xe_wa_process_engine(struct xe_hw_engine *hwe);
 void xe_wa_process_lrc(struct xe_hw_engine *hwe);
-- 
2.40.1

