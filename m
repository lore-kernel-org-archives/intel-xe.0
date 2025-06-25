Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 102D9C77B7C
	for <intel-xe@archiver.kernel.org>; Wed, 25 Jun 2025 19:33:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4EAF10E7DF;
	Wed, 25 Jun 2025 19:33:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a6OM4s9j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C48F810E121
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Jun 2025 19:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750880026; x=1782416026;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RaOjHtF2WOkMguSjzHnqKMzJNZC9q+sap3rVJjpnTMQ=;
 b=a6OM4s9jonGJvOK4gTmlY2P08Ah7clZ6MTUo1s9J8+CGzUxybBvk6CQb
 bdedJiR+aEwgV0070YutFkFqoVM8NcEReqd/PqUUC3b6KaYFoq7OpE+3F
 56zyFM8o2n/LthKOO5ls0aP4J608FODcKv1/WVz6jA4AzvlDYh20lewR4
 Bto17cBqwtQHQFztpd688Kzqolu0dGsXnH2SZrBUvgz2esDkRS4q5qZDR
 a+yzkgaNRoW42KeVfXNWBNmMK2PmUQMBk2GxKJNGPYKL+AN9xW/h4v1rG
 HmlvLGSiqTYW1OaM5uf/Mhg1rteks0iTNUmK2s5rby5bW2ZwoJcOywiWH Q==;
X-CSE-ConnectionGUID: 3PzsJyKtQhmRRR72jdK0Tg==
X-CSE-MsgGUID: KsOM/AJUQSCC6Dz23RH9vQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="53305189"
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; d="scan'208";a="53305189"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 12:33:46 -0700
X-CSE-ConnectionGUID: gCmazTwYSICo7eh7EkGSPQ==
X-CSE-MsgGUID: f3wqoHEwTViTbuYxe/PW2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; d="scan'208";a="156697200"
Received: from msatwood-mobl.jf.intel.com ([10.24.13.181])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 12:33:46 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: lucas.demarchi@intel.com, matthew.d.roper@intel.com,
 rodrigo.vivi@intel.com, Matt Atwood <matthew.s.atwood@intel.com>
Subject: [PATCH v3 2/5] drm/xe: Add infrastructure for Device OOB workarounds
Date: Wed, 25 Jun 2025 12:33:37 -0700
Message-ID: <20250625193340.38971-3-matthew.s.atwood@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625193340.38971-1-matthew.s.atwood@intel.com>
References: <20250625193340.38971-1-matthew.s.atwood@intel.com>
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

Some workarounds need to be able to be applied ahead of any GT
initialization for example 15015404425. This patch creates XE_DEVICE_WA
macro, in the same vein as XE_WA. This macro can be used ahead of GT
initialization, and can be tracked in sysfs. This should alleviate some
of the complexities that exist in i915.

v2: name change SoC to Device, address style issues

Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h |  9 ++++++
 drivers/gpu/drm/xe/xe_pci.c          |  4 +++
 drivers/gpu/drm/xe/xe_rtp.c          |  5 +++
 drivers/gpu/drm/xe/xe_rtp.h          |  3 +-
 drivers/gpu/drm/xe/xe_rtp_types.h    |  2 ++
 drivers/gpu/drm/xe/xe_wa.c           | 46 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_wa.h           | 18 +++++++++--
 7 files changed, 83 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 6aca4b1a2824..62f09d2923c3 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -360,6 +360,15 @@ struct xe_device {
 		u8 skip_pcode:1;
 	} info;
 
+	/** @xe_active.oob: bitmap with active OOB workarounds */
+	unsigned long *oob;
+	/**
+	 *  @xe_active.oob_initialized: mark oob as initialized to help
+	 *  detecting misuse of XE_SOC_WA() - it can only be called on
+	 *  initialization after SOC OOB WAs have been processed
+	 */
+	bool oob_initialized;
+
 	/** @survivability: survivability information for device */
 	struct xe_survivability survivability;
 
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 824461c31288..a9f708608f3e 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -32,6 +32,7 @@
 #include "xe_step.h"
 #include "xe_survivability_mode.h"
 #include "xe_tile.h"
+#include "xe_wa.h"
 
 enum toggle_d3cold {
 	D3COLD_DISABLE,
@@ -832,6 +833,9 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (err)
 		return err;
 
+	xe_device_wa_init(xe);
+	xe_device_wa_process_oob(xe);
+
 	err = xe_device_probe_early(xe);
 	/*
 	 * In Boot Survivability mode, no drm card is exposed and driver
diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
index 29e694bb1219..2a0b0a1a8969 100644
--- a/drivers/gpu/drm/xe/xe_rtp.c
+++ b/drivers/gpu/drm/xe/xe_rtp.c
@@ -196,6 +196,11 @@ static void rtp_get_context(struct xe_rtp_process_ctx *ctx,
 		*gt = (*hwe)->gt;
 		*xe = gt_to_xe(*gt);
 		break;
+	case XE_RTP_PROCESS_TYPE_DEVICE:
+		*hwe = NULL;
+		*gt = NULL;
+		*xe = ctx->xe;
+		break;
 	}
 }
 
diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
index 4fe736a11c42..ac260feaabef 100644
--- a/drivers/gpu/drm/xe/xe_rtp.h
+++ b/drivers/gpu/drm/xe/xe_rtp.h
@@ -422,7 +422,8 @@ struct xe_reg_sr;
 
 #define XE_RTP_PROCESS_CTX_INITIALIZER(arg__) _Generic((arg__),							\
 	struct xe_hw_engine * :	(struct xe_rtp_process_ctx){ { (void *)(arg__) }, XE_RTP_PROCESS_TYPE_ENGINE },	\
-	struct xe_gt * :	(struct xe_rtp_process_ctx){ { (void *)(arg__) }, XE_RTP_PROCESS_TYPE_GT })
+	struct xe_gt * :	(struct xe_rtp_process_ctx){ { (void *)(arg__) }, XE_RTP_PROCESS_TYPE_GT },	\
+	struct xe_device * :	(struct xe_rtp_process_ctx){ { (void *)(arg__) }, XE_RTP_PROCESS_TYPE_DEVICE })
 
 void xe_rtp_process_ctx_enable_active_tracking(struct xe_rtp_process_ctx *ctx,
 					       unsigned long *active_entries,
diff --git a/drivers/gpu/drm/xe/xe_rtp_types.h b/drivers/gpu/drm/xe/xe_rtp_types.h
index 1b76b947c706..123579ebf2cf 100644
--- a/drivers/gpu/drm/xe/xe_rtp_types.h
+++ b/drivers/gpu/drm/xe/xe_rtp_types.h
@@ -112,12 +112,14 @@ struct xe_rtp_entry {
 enum xe_rtp_process_type {
 	XE_RTP_PROCESS_TYPE_GT,
 	XE_RTP_PROCESS_TYPE_ENGINE,
+	XE_RTP_PROCESS_TYPE_DEVICE,
 };
 
 struct xe_rtp_process_ctx {
 	union {
 		struct xe_gt *gt;
 		struct xe_hw_engine *hwe;
+		struct xe_device *xe;
 	};
 	enum xe_rtp_process_type type;
 	unsigned long *active_entries;
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index f51218a7a580..2cb2fab20070 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -11,6 +11,7 @@
 #include <linux/fault-inject.h>
 
 #include <generated/xe_wa_oob.h>
+#include <generated/xe_device_wa_oob.h>
 
 #include "regs/xe_engine_regs.h"
 #include "regs/xe_gt_regs.h"
@@ -876,6 +877,13 @@ static __maybe_unused const struct xe_rtp_entry oob_was[] = {
 
 static_assert(ARRAY_SIZE(oob_was) - 1 == _XE_WA_OOB_COUNT);
 
+static __maybe_unused const struct xe_rtp_entry device_oob_was[] = {
+#include <generated/xe_device_wa_oob.c>
+	{}
+};
+
+static_assert(ARRAY_SIZE(device_oob_was) - 1 == _XE_DEVICE_WA_OOB_COUNT);
+
 __diag_pop();
 
 /**
@@ -895,6 +903,39 @@ void xe_wa_process_oob(struct xe_gt *gt)
 	xe_rtp_process(&ctx, oob_was);
 }
 
+int xe_device_wa_init(struct xe_device *xe)
+{
+	unsigned long *p;
+
+	p = drmm_kzalloc(&xe->drm,
+			 sizeof(xe->oob) * BITS_TO_LONGS(ARRAY_SIZE(device_oob_was)),
+			 GFP_KERNEL);
+
+	if (!p)
+		return -ENOMEM;
+
+	xe->oob = p;
+
+	return 0;
+}
+
+/**
+ * xe_device_wa_process_oob - process OOB workaround table
+ * @xe: xe device instance process workarounds for
+ *
+ * Process OOB workaround table for this platform, marking in @xe the
+ * workarounds that are active.
+ */
+void xe_device_wa_process_oob(struct xe_device *xe)
+{
+	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(xe);
+
+	xe_rtp_process_ctx_enable_active_tracking(&ctx, xe->oob, ARRAY_SIZE(device_oob_was));
+
+	xe->oob_initialized = true;
+	xe_rtp_process(&ctx, device_oob_was);
+}
+
 /**
  * xe_wa_process_gt - process GT workaround table
  * @gt: GT instance to process workarounds for
@@ -1000,6 +1041,11 @@ void xe_wa_dump(struct xe_gt *gt, struct drm_printer *p)
 	for_each_set_bit(idx, gt->wa_active.oob, ARRAY_SIZE(oob_was))
 		if (oob_was[idx].name)
 			drm_printf_indent(p, 1, "%s\n", oob_was[idx].name);
+
+	drm_printf(p, "\nDevice OOB Workarounds\n");
+	for_each_set_bit(idx, gt_to_xe(gt)->oob, ARRAY_SIZE(device_oob_was))
+		if (device_oob_was[idx].name)
+			drm_printf_indent(p, 1, "%s\n", device_oob_was[idx].name);
 }
 
 /*
diff --git a/drivers/gpu/drm/xe/xe_wa.h b/drivers/gpu/drm/xe/xe_wa.h
index 52337405b5bc..09d065e0abb5 100644
--- a/drivers/gpu/drm/xe/xe_wa.h
+++ b/drivers/gpu/drm/xe/xe_wa.h
@@ -14,7 +14,9 @@ struct xe_hw_engine;
 struct xe_tile;
 
 int xe_wa_init(struct xe_gt *gt);
+int xe_device_wa_init(struct xe_device *xe);
 void xe_wa_process_oob(struct xe_gt *gt);
+void xe_device_wa_process_oob(struct xe_device *xe);
 void xe_wa_process_gt(struct xe_gt *gt);
 void xe_wa_process_engine(struct xe_hw_engine *hwe);
 void xe_wa_process_lrc(struct xe_hw_engine *hwe);
@@ -22,14 +24,24 @@ void xe_wa_apply_tile_workarounds(struct xe_tile *tile);
 void xe_wa_dump(struct xe_gt *gt, struct drm_printer *p);
 
 /**
- * XE_WA - Out-of-band workarounds, that don't fit the lifecycle any
- *         other more specific type
+ * XE_WA - Out-of-band GT workarounds, that don't fit the lifecycle any
+ *         other more specific type,
  * @gt__: gt instance
- * @id__: XE_OOB_<id__>, as generated by build system in generated/xe_wa_oob.h
+ * @id__: XE_WA_OOB_<id__>, as generated by build system in generated/xe_wa_oob.h
  */
 #define XE_WA(gt__, id__) ({						\
 	xe_gt_assert(gt__, (gt__)->wa_active.oob_initialized);		\
 	test_bit(XE_WA_OOB_ ## id__, (gt__)->wa_active.oob);		\
 })
 
+/**
+ * XE_DEVICE_WA - Out-of-band Device workarounds, that don't fit the lifecycle any
+ *         other more specific type
+ * @xe__: xe_device
+ * @id__: XE_SOC_WA_OOB_<id__>, as generated by build system in generated/xe_wa_oob.h
+ */
+#define XE_DEVICE_WA(xe__, id__) ({					\
+	xe_assert(xe__, (xe__)->oob_initialized);			\
+	test_bit(XE_DEVICE_WA_OOB_ ## id__, (xe__)->oob);			\
+})
 #endif
-- 
2.49.0

