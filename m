Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05CD6C77B7C
	for <intel-xe@archiver.kernel.org>; Fri, 20 Jun 2025 21:49:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D47B10EBDC;
	Fri, 20 Jun 2025 21:49:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HnvRf6A/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BFE810EBDC
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Jun 2025 21:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750456166; x=1781992166;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=c0ng/NHNIR76wEe6fLCJqPIo7u8aZ0szk/rhRwT+NY0=;
 b=HnvRf6A/0KCv4BDx6oLyaJuBfr29xApzPzYYOT+QxoB6iHThDSsnnD6l
 sfWqgaFXE1f8Z8V8IPjGjCBkhSWkA0etPSYzuKdTD7hGIiMlhaY9EL1jo
 ipeIeFHT4Md6OfvUj/LZ3NTcuQgu05AskFqFmNhe1u4Jab3KRAGrnYFF6
 atKCcSVxe+pCqyx30oOWF/sLaNTZJLH4jaxPNNrgmvhyCq8wD5exQlW1/
 au1SFK4sw/5VpMZwhW4BiP/BprBqZ026Bt9oSRsTbTUul+64dt90X2Cr6
 szHy5+ddIxk5PGgpvYzAoH0eO0cCqUkxr8+BDoLr0ZTK2vVEiaaRTooo7 Q==;
X-CSE-ConnectionGUID: BmckuNk1QV2wEVUToKwHsw==
X-CSE-MsgGUID: bhoO6L0FRcGbw4KPJPA6uQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="40336501"
X-IronPort-AV: E=Sophos;i="6.16,252,1744095600"; d="scan'208";a="40336501"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2025 14:49:25 -0700
X-CSE-ConnectionGUID: U/nSVq6mRDyrAJKlxvC6ag==
X-CSE-MsgGUID: uWUWgJTaQQagTe0ZPJqd/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,252,1744095600"; d="scan'208";a="151158396"
Received: from msatwood-mobl.jf.intel.com ([10.24.13.181])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2025 14:49:25 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Matt Atwood <matthew.s.atwood@intel.com>
Subject: [PATCH 2/5] drm/xe: Add infrastructure for SoC OOB workarounds
Date: Fri, 20 Jun 2025 14:49:17 -0700
Message-ID: <20250620214920.718179-3-matthew.s.atwood@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250620214920.718179-1-matthew.s.atwood@intel.com>
References: <20250620214920.718179-1-matthew.s.atwood@intel.com>
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
initialization, for example 15015404425. This patches creates a
mechanism simlar to the GT related OOB workarounds where we can more
easily track them, and query them. This should alleviate some of the
complexity that existed in i915, as these types of workarounds were
added overtime.

Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h |  8 +++++
 drivers/gpu/drm/xe/xe_pci.c          |  4 +++
 drivers/gpu/drm/xe/xe_rtp.c          |  5 +++
 drivers/gpu/drm/xe/xe_rtp.h          |  3 +-
 drivers/gpu/drm/xe/xe_rtp_types.h    |  2 ++
 drivers/gpu/drm/xe/xe_wa.c           | 46 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_wa.h           | 18 +++++++++--
 7 files changed, 82 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 003afb279a5e..aa1558369100 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -357,6 +357,14 @@ struct xe_device {
 		u8 skip_pcode:1;
 	} info;
 
+	/** @xe_active.oob: bitmap with active OOB workarounds */
+	unsigned long *oob;
+	/**
+	 *  @xe_active.oob_initialized: mark oob as initialized to help
+	 *  detecting misuse of XE_SOC_WA() - it can only be called on
+	 *  initialization after SOC OOB WAs have been processed */
+	bool oob_initialized;
+
 	/** @survivability: survivability information for device */
 	struct xe_survivability survivability;
 
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 5ff2169019ed..ded0f3dc8d73 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -32,6 +32,7 @@
 #include "xe_step.h"
 #include "xe_survivability_mode.h"
 #include "xe_tile.h"
+#include "xe_wa.h"
 
 enum toggle_d3cold {
 	D3COLD_DISABLE,
@@ -826,6 +827,9 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (err)
 		return err;
 
+	xe_soc_wa_init(xe);
+	xe_soc_wa_process_oob(xe);
+
 	err = xe_device_probe_early(xe);
 	/*
 	 * In Boot Survivability mode, no drm card is exposed and driver
diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
index 29e694bb1219..b074d8b285ab 100644
--- a/drivers/gpu/drm/xe/xe_rtp.c
+++ b/drivers/gpu/drm/xe/xe_rtp.c
@@ -196,6 +196,11 @@ static void rtp_get_context(struct xe_rtp_process_ctx *ctx,
 		*gt = (*hwe)->gt;
 		*xe = gt_to_xe(*gt);
 		break;
+	case XE_RTP_PROCESS_TYPE_SOC:
+		*hwe = NULL;
+		*gt = NULL;
+		*xe = ctx->xe;
+		break;
 	}
 }
 
diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
index 4fe736a11c42..7b23c3c8c24c 100644
--- a/drivers/gpu/drm/xe/xe_rtp.h
+++ b/drivers/gpu/drm/xe/xe_rtp.h
@@ -422,7 +422,8 @@ struct xe_reg_sr;
 
 #define XE_RTP_PROCESS_CTX_INITIALIZER(arg__) _Generic((arg__),							\
 	struct xe_hw_engine * :	(struct xe_rtp_process_ctx){ { (void *)(arg__) }, XE_RTP_PROCESS_TYPE_ENGINE },	\
-	struct xe_gt * :	(struct xe_rtp_process_ctx){ { (void *)(arg__) }, XE_RTP_PROCESS_TYPE_GT })
+	struct xe_gt * :	(struct xe_rtp_process_ctx){ { (void *)(arg__) }, XE_RTP_PROCESS_TYPE_GT },	\
+	struct xe_device * :	(struct xe_rtp_process_ctx){ { (void *)(arg__) }, XE_RTP_PROCESS_TYPE_SOC })
 
 void xe_rtp_process_ctx_enable_active_tracking(struct xe_rtp_process_ctx *ctx,
 					       unsigned long *active_entries,
diff --git a/drivers/gpu/drm/xe/xe_rtp_types.h b/drivers/gpu/drm/xe/xe_rtp_types.h
index 1b76b947c706..0a36a42fb0c0 100644
--- a/drivers/gpu/drm/xe/xe_rtp_types.h
+++ b/drivers/gpu/drm/xe/xe_rtp_types.h
@@ -112,12 +112,14 @@ struct xe_rtp_entry {
 enum xe_rtp_process_type {
 	XE_RTP_PROCESS_TYPE_GT,
 	XE_RTP_PROCESS_TYPE_ENGINE,
+	XE_RTP_PROCESS_TYPE_SOC,
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
index f51218a7a580..5f4af23b11f3 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -11,6 +11,7 @@
 #include <linux/fault-inject.h>
 
 #include <generated/xe_wa_oob.h>
+#include <generated/xe_soc_wa_oob.h>
 
 #include "regs/xe_engine_regs.h"
 #include "regs/xe_gt_regs.h"
@@ -876,6 +877,13 @@ static __maybe_unused const struct xe_rtp_entry oob_was[] = {
 
 static_assert(ARRAY_SIZE(oob_was) - 1 == _XE_WA_OOB_COUNT);
 
+static __maybe_unused const struct xe_rtp_entry soc_oob_was[] = {
+#include <generated/xe_soc_wa_oob.c>
+	{}
+};
+
+static_assert(ARRAY_SIZE(soc_oob_was) -1 == _XE_SOC_WA_OOB_COUNT);
+
 __diag_pop();
 
 /**
@@ -895,6 +903,39 @@ void xe_wa_process_oob(struct xe_gt *gt)
 	xe_rtp_process(&ctx, oob_was);
 }
 
+int xe_soc_wa_init(struct xe_device *xe)
+{
+	unsigned long *p;
+
+	p = drmm_kzalloc(&xe->drm,
+			sizeof(xe->oob) * BITS_TO_LONGS(ARRAY_SIZE(soc_oob_was)),
+			GFP_KERNEL);
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
+ * xe_soc_wa_process_oob - process OOB workaround table
+ * @xe: xe device instance process workarounds for
+ *
+ * Process OOB workaround tbale for this platform, marking in @xe the
+ * workardounds that are active.
+ */
+void xe_soc_wa_process_oob(struct xe_device *xe)
+{
+	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(xe);
+
+	xe_rtp_process_ctx_enable_active_tracking(&ctx, xe->oob, ARRAY_SIZE(soc_oob_was));
+
+	xe->oob_initialized = true;
+	xe_rtp_process(&ctx, soc_oob_was);
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
+	drm_printf(p, "\nSoC OOB Workarounds\n");
+	for_each_set_bit(idx, gt_to_xe(gt)->oob, ARRAY_SIZE(soc_oob_was))
+		if (soc_oob_was[idx].name)
+			drm_printf_indent(p, 1, "%s\n", soc_oob_was[idx].name);
 }
 
 /*
diff --git a/drivers/gpu/drm/xe/xe_wa.h b/drivers/gpu/drm/xe/xe_wa.h
index 52337405b5bc..2a609bbc8600 100644
--- a/drivers/gpu/drm/xe/xe_wa.h
+++ b/drivers/gpu/drm/xe/xe_wa.h
@@ -14,7 +14,9 @@ struct xe_hw_engine;
 struct xe_tile;
 
 int xe_wa_init(struct xe_gt *gt);
+int xe_soc_wa_init(struct xe_device *xe);
 void xe_wa_process_oob(struct xe_gt *gt);
+void xe_soc_wa_process_oob(struct xe_device *xe);
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
+ * XE_SOC_WA - Out-of-band SoC workarounds, that don't fit the lifecycle any
+ *         other more specific type
+ * @xe__: xe_device
+ * @id__: XE_SOC_WA_OOB_<id__>, as generated by build system in generated/xe_wa_oob.h
+ */
+#define XE_SOC_WA(xe__, id__) ({					\
+	xe_assert(xe__, (xe__)->oob_initialized);			\
+	test_bit(XE_SOC_WA_OOB_ ## id__, (xe__)->oob);			\
+})
 #endif
-- 
2.49.0

