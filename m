Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 449F4C52D7C
	for <intel-xe@archiver.kernel.org>; Fri, 23 Aug 2024 07:48:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA8D710EC35;
	Fri, 23 Aug 2024 07:48:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UHCQsw/Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7051810EC35
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Aug 2024 07:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724399329; x=1755935329;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Bg8wxvMGwHMLvqsVTDLZU77xKfigySylLtPozEUp4r0=;
 b=UHCQsw/YIXUpm66FPq0MAzG73BGKxRGOlbZ6+baNOeuz0r2/la/U+9ix
 6G8dd/P2Bo98QAGpz0VFrizOTIJxaA0gz/cmihSV9A6FIQSP3gzSCEW+u
 las4Y+iNXVzhbwFPltmiqYGLCLwow83Drgb43777nF73NXY0PGqTbI04a
 zDdyk6ceLVB/JwiXEENQ72fWzwKrg6fSmEHdxlzyXguU2EuJSns5nKksH
 RHcjBClw5Uhnfr/49mLzAJBBghol+0GDaxjJX1mnZ9yFFClX8HabApBJv
 QOqyf5YU9/JSYoID9d9JbbzA0NpkL/JBv5iDng19CVHusAtlpsBZPqd+B w==;
X-CSE-ConnectionGUID: ZBS/NvsGTNmxyJMkVqolGQ==
X-CSE-MsgGUID: 6QsJF3t4RDWZ6nsKuqGuRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="26610057"
X-IronPort-AV: E=Sophos;i="6.10,169,1719903600"; d="scan'208";a="26610057"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 00:48:48 -0700
X-CSE-ConnectionGUID: oKehUYCRRumt85+ebRaa7w==
X-CSE-MsgGUID: VG/cEiZOScWCKjjwyS4BLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,169,1719903600"; d="scan'208";a="61738707"
Received: from nitin-super-server.iind.intel.com ([10.145.169.70])
 by fmviesa009.fm.intel.com with ESMTP; 23 Aug 2024 00:48:46 -0700
From: Nitin Gote <nitin.r.gote@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: nirmoy.das@intel.com,
	andi.shyti@intel.com,
	nitin.r.gote@intel.com
Subject: [PATCH] drm/xe: Replace double space with single space after comma
Date: Fri, 23 Aug 2024 13:36:43 +0530
Message-Id: <20240823080643.2461992-1-nitin.r.gote@intel.com>
X-Mailer: git-send-email 2.25.1
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

Avoid using double space, ",  " in function or macro parameters
where it's not required by any alignment purpose. Replace it with
a single space, ", ".

Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_reg_defs.h | 2 +-
 drivers/gpu/drm/xe/xe_guc.c           | 2 +-
 drivers/gpu/drm/xe/xe_guc_ct.c        | 4 ++--
 drivers/gpu/drm/xe/xe_irq.c           | 4 ++--
 drivers/gpu/drm/xe/xe_trace_bo.h      | 2 +-
 5 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_reg_defs.h b/drivers/gpu/drm/xe/regs/xe_reg_defs.h
index 23f7dc5bbe99..51fd40ffafcb 100644
--- a/drivers/gpu/drm/xe/regs/xe_reg_defs.h
+++ b/drivers/gpu/drm/xe/regs/xe_reg_defs.h
@@ -128,7 +128,7 @@ struct xe_reg_mcr {
  *       options.
  */
 #define XE_REG_MCR(r_, ...)	((const struct xe_reg_mcr){					\
-				 .__reg = XE_REG_INITIALIZER(r_,  ##__VA_ARGS__, .mcr = 1)	\
+				 .__reg = XE_REG_INITIALIZER(r_, ##__VA_ARGS__, .mcr = 1)	\
 				 })
 
 static inline bool xe_reg_is_valid(struct xe_reg r)
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index de0fe9e65746..76c61ef1160f 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -985,7 +985,7 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
 		BUILD_BUG_ON(FIELD_MAX(GUC_HXG_MSG_0_TYPE) != GUC_HXG_TYPE_RESPONSE_SUCCESS);
 		BUILD_BUG_ON((GUC_HXG_TYPE_RESPONSE_SUCCESS ^ GUC_HXG_TYPE_RESPONSE_FAILURE) != 1);
 
-		ret = xe_mmio_wait32(gt, reply_reg,  resp_mask, resp_mask,
+		ret = xe_mmio_wait32(gt, reply_reg, resp_mask, resp_mask,
 				     1000000, &header, false);
 
 		if (unlikely(FIELD_GET(GUC_HXG_MSG_0_ORIGIN, header) !=
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index f24dd5223926..4b95f75b1546 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -182,7 +182,7 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
 	spin_lock_init(&ct->fast_lock);
 	xa_init(&ct->fence_lookup);
 	INIT_WORK(&ct->g2h_worker, g2h_worker_func);
-	INIT_DELAYED_WORK(&ct->safe_mode_worker,  safe_mode_worker_func);
+	INIT_DELAYED_WORK(&ct->safe_mode_worker, safe_mode_worker_func);
 	init_waitqueue_head(&ct->wq);
 	init_waitqueue_head(&ct->g2h_fence_wq);
 
@@ -852,7 +852,7 @@ static bool retry_failure(struct xe_guc_ct *ct, int ret)
 #define ct_alive(ct)	\
 	(xe_guc_ct_enabled(ct) && !ct->ctbs.h2g.info.broken && \
 	 !ct->ctbs.g2h.info.broken)
-	if (!wait_event_interruptible_timeout(ct->wq, ct_alive(ct),  HZ * 5))
+	if (!wait_event_interruptible_timeout(ct->wq, ct_alive(ct), HZ * 5))
 		return false;
 #undef ct_alive
 
diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 5f2c368c35ad..14c3a476597a 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -173,7 +173,7 @@ void xe_irq_enable_hwe(struct xe_gt *gt)
 		if (ccs_mask & (BIT(0)|BIT(1)))
 			xe_mmio_write32(gt, CCS0_CCS1_INTR_MASK, ~dmask);
 		if (ccs_mask & (BIT(2)|BIT(3)))
-			xe_mmio_write32(gt,  CCS2_CCS3_INTR_MASK, ~dmask);
+			xe_mmio_write32(gt, CCS2_CCS3_INTR_MASK, ~dmask);
 	}
 
 	if (xe_gt_is_media_type(gt) || MEDIA_VER(xe) < 13) {
@@ -504,7 +504,7 @@ static void gt_irq_reset(struct xe_tile *tile)
 	if (ccs_mask & (BIT(0)|BIT(1)))
 		xe_mmio_write32(mmio, CCS0_CCS1_INTR_MASK, ~0);
 	if (ccs_mask & (BIT(2)|BIT(3)))
-		xe_mmio_write32(mmio,  CCS2_CCS3_INTR_MASK, ~0);
+		xe_mmio_write32(mmio, CCS2_CCS3_INTR_MASK, ~0);
 
 	if ((tile->media_gt &&
 	     xe_hw_engine_mask_per_class(tile->media_gt, XE_ENGINE_CLASS_OTHER)) ||
diff --git a/drivers/gpu/drm/xe/xe_trace_bo.h b/drivers/gpu/drm/xe/xe_trace_bo.h
index 9b1a1d4304ae..30a3cfbaaa09 100644
--- a/drivers/gpu/drm/xe/xe_trace_bo.h
+++ b/drivers/gpu/drm/xe/xe_trace_bo.h
@@ -189,7 +189,7 @@ DECLARE_EVENT_CLASS(xe_vm,
 			   ),
 
 		    TP_printk("dev=%s, vm=%p, asid=0x%05x", __get_str(dev),
-			      __entry->vm,  __entry->asid)
+			      __entry->vm, __entry->asid)
 );
 
 DEFINE_EVENT(xe_vm, xe_vm_kill,
-- 
2.25.1

