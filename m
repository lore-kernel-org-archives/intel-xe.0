Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D222C7EE23
	for <intel-xe@archiver.kernel.org>; Tue, 16 May 2023 22:20:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 357D610E378;
	Tue, 16 May 2023 22:20:29 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48E5710E37E
 for <intel-xe@lists.freedesktop.org>; Tue, 16 May 2023 22:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684275627; x=1715811627;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ATFmp8FD1J7qcq62cleJkpQdK5BRSBA4qAHv4eDdSow=;
 b=L0Q77g3ECrycLKSdvWMAgIOTBsePghWrNz3uE2YJSQ0gJbF5Vybc9kCP
 qDET8729kR0aKLLv7zSnW/BbxeiZhG0mbs/9EbNonwJTbqAb8qIPevwfg
 zTLxkcXV1DkP3xZ0XD4d8cB4moj/LkqP96HuOiD/LQA9FKhbg4RoaZnnj
 TIACl9BYh0K4nOTDJYb0YDyfTarETa26HLHoICmWw9haqRh35uX2rqIz0
 NWuvQNniAOw0DBDxoZHVdr5X3ROyX8ANF15FIjBu4bHnIqR9jEoNGcWfy
 Qjd95+PILfrMMCvTbhoVavwxwcTWWKcT4xM29OY8/Ewti2U+vY6yK3RZ9 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="415013387"
X-IronPort-AV: E=Sophos;i="5.99,280,1677571200"; d="scan'208";a="415013387"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2023 15:20:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="766530863"
X-IronPort-AV: E=Sophos;i="5.99,280,1677571200"; d="scan'208";a="766530863"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2023 15:20:25 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 16 May 2023 15:19:46 -0700
Message-Id: <20230516221950.3512818-6-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230516221950.3512818-1-lucas.demarchi@intel.com>
References: <20230516221950.3512818-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 5/9] drm/xe/wa: Track gt/engine/lrc active
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
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Allocate the data to track workarounds on the device, and pass that to
RTP so the active workarounds are enabled. For later reporting purposes,
there's no need to differentiate the engine or gt in which the
workaround got enabled, so just use a per-device bitmap.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c       |  5 ++++
 drivers/gpu/drm/xe/xe_device_types.h | 10 ++++++++
 drivers/gpu/drm/xe/xe_rtp_types.h    |  2 ++
 drivers/gpu/drm/xe/xe_wa.c           | 36 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_wa.h           |  2 ++
 5 files changed, 55 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index f7f6a6a97757..ac6898a28411 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -31,6 +31,7 @@
 #include "xe_ttm_sys_mgr.h"
 #include "xe_vm.h"
 #include "xe_vm_madvise.h"
+#include "xe_wa.h"
 #include "xe_wait_user_fence.h"
 
 static int xe_file_open(struct drm_device *dev, struct drm_file *file)
@@ -251,6 +252,10 @@ int xe_device_probe(struct xe_device *xe)
 			return err;
 	}
 
+	err = xe_wa_init(xe);
+	if (err)
+		return err;
+
 	err = xe_mmio_init(xe);
 	if (err)
 		return err;
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 6490a04614ce..b8d7864950c4 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -265,6 +265,16 @@ struct xe_device {
 	/** @d3cold_allowed: Indicates if d3cold is a valid device state */
 	bool d3cold_allowed;
 
+	/** @wa_active: keep track of active workarounds */
+	struct {
+		/** @gt: bitmap with active GT workarounds */
+		unsigned long *gt;
+		/** @engine: bitmap with active engine workarounds */
+		unsigned long *engine;
+		/** @lrc: bitmap with active LRC workarounds */
+		unsigned long *lrc;
+	} wa_active;
+
 	/* private: */
 
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
diff --git a/drivers/gpu/drm/xe/xe_rtp_types.h b/drivers/gpu/drm/xe/xe_rtp_types.h
index a9e0153ff87d..b1e77055f9cd 100644
--- a/drivers/gpu/drm/xe/xe_rtp_types.h
+++ b/drivers/gpu/drm/xe/xe_rtp_types.h
@@ -108,6 +108,8 @@ struct xe_rtp_process_ctx {
 		struct xe_hw_engine *hwe;
 	};
 	enum xe_rtp_process_type type;
+	unsigned long *active_entries;
+	size_t n_entries;
 };
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 557e90d79f0b..fa37b1c0425a 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -5,6 +5,7 @@
 
 #include "xe_wa.h"
 
+#include <drm/drm_managed.h>
 #include <kunit/visibility.h>
 #include <linux/compiler_types.h>
 
@@ -580,7 +581,10 @@ __diag_pop();
 void xe_wa_process_gt(struct xe_gt *gt)
 {
 	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(gt);
+	struct xe_device *xe = gt_to_xe(gt);
 
+	xe_rtp_process_ctx_enable_active_tracking(&ctx, xe->wa_active.gt,
+						  ARRAY_SIZE(gt_was));
 	xe_rtp_process_to_sr(&ctx, gt_was, &gt->reg_sr);
 }
 EXPORT_SYMBOL_IF_KUNIT(xe_wa_process_gt);
@@ -596,7 +600,10 @@ EXPORT_SYMBOL_IF_KUNIT(xe_wa_process_gt);
 void xe_wa_process_engine(struct xe_hw_engine *hwe)
 {
 	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(hwe);
+	struct xe_device *xe = gt_to_xe(hwe->gt);
 
+	xe_rtp_process_ctx_enable_active_tracking(&ctx, xe->wa_active.engine,
+						  ARRAY_SIZE(engine_was));
 	xe_rtp_process_to_sr(&ctx, engine_was, &hwe->reg_sr);
 }
 
@@ -611,6 +618,35 @@ void xe_wa_process_engine(struct xe_hw_engine *hwe)
 void xe_wa_process_lrc(struct xe_hw_engine *hwe)
 {
 	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(hwe);
+	struct xe_device *xe = gt_to_xe(hwe->gt);
 
+	xe_rtp_process_ctx_enable_active_tracking(&ctx, xe->wa_active.lrc,
+						  ARRAY_SIZE(lrc_was));
 	xe_rtp_process_to_sr(&ctx, lrc_was, &hwe->reg_lrc);
 }
+
+/**
+ * xe_wa_init - initialize xe with workaround bookkeeping
+ * @xe: xe device instance
+ *
+ * Returns 0 for success, negative error code otherwise.
+ */
+int xe_wa_init(struct xe_device *xe)
+{
+	size_t n_lrc, n_engine, n_gt, total;
+
+	n_gt = BITS_TO_LONGS(ARRAY_SIZE(gt_was));
+	n_engine = BITS_TO_LONGS(ARRAY_SIZE(engine_was));
+	n_lrc = BITS_TO_LONGS(ARRAY_SIZE(lrc_was));
+	total = n_gt + n_engine + n_lrc;
+
+	xe->wa_active.gt = drmm_kzalloc(&xe->drm, sizeof(long) * total,
+					GFP_KERNEL);
+	if (!xe->wa_active.gt)
+		return -ENOMEM;
+
+	xe->wa_active.engine = xe->wa_active.gt + n_gt;
+	xe->wa_active.lrc = xe->wa_active.engine + n_engine;
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/xe/xe_wa.h b/drivers/gpu/drm/xe/xe_wa.h
index cd2307d58795..8edad4f92800 100644
--- a/drivers/gpu/drm/xe/xe_wa.h
+++ b/drivers/gpu/drm/xe/xe_wa.h
@@ -6,9 +6,11 @@
 #ifndef _XE_WA_
 #define _XE_WA_
 
+struct xe_device;
 struct xe_gt;
 struct xe_hw_engine;
 
+int xe_wa_init(struct xe_device *xe);
 void xe_wa_process_gt(struct xe_gt *gt);
 void xe_wa_process_engine(struct xe_hw_engine *hwe);
 void xe_wa_process_lrc(struct xe_hw_engine *hwe);
-- 
2.40.1

