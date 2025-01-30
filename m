Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76FAFC0218A
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jan 2025 11:03:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4387710E939;
	Thu, 30 Jan 2025 11:03:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="pOD4kFpc";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C130210E935
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Jan 2025 11:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=c0hjgQmyo4TT/UOe7kLgWwb8VTIdyXdTnAxR4B5LRlM=; b=pOD4kFpcGsoujdikMfi4owqVru
 53DiYSwh7d72xCKn70bcazjskf/PzmUyrxELmEITLgFO31o0ahgKwaCjgVga+hshynaAocoOk8NQs
 d95YUE06wdPjJ4DVMKu3QPmymxxpk4dflIpPTlgFFZuy6VUvkXGJiL3o+ayNBjofGnCng7c8EwFzG
 HtZZRnPUzPxNCjza5+FO3syfVxtJVPLowa+0Wyyhu1b6x9IUfjYNgySoldrpCorwOIo5sRZwrgl40
 dK4ApZvl/11dWvv/zt5rTG9RgnWMpM0he8LcY9WACOaQBshhxiiplDB23wa8Qpn47OxlOKP9eEzTg
 5kNvGtyQ==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tdSKf-000zzX-6Z; Thu, 30 Jan 2025 12:03:43 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH 4/4] drm/xe: Add performance tunings to debugfs
Date: Thu, 30 Jan 2025 11:03:37 +0000
Message-ID: <20250130110337.11237-5-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250130110337.11237-1-tvrtko.ursulin@igalia.com>
References: <20250130110337.11237-1-tvrtko.ursulin@igalia.com>
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

Add a list of active tuning workarounds to debugfs, analogous to the
existing "plain" workarounds list.

Rationale being that it seems to make sense to either have both or none.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c         |  4 ++
 drivers/gpu/drm/xe/xe_gt_debugfs.c | 11 ++++++
 drivers/gpu/drm/xe/xe_gt_types.h   | 10 +++++
 drivers/gpu/drm/xe/xe_tuning.c     | 59 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_tuning.h     |  3 ++
 5 files changed, 87 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index c3711987737e..c44fd5c5c0bd 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -380,6 +380,10 @@ int xe_gt_init_early(struct xe_gt *gt)
 	if (err)
 		return err;
 
+	err = xe_tuning_init(gt);
+	if (err)
+		return err;
+
 	xe_wa_process_oob(gt);
 
 	xe_force_wake_init_gt(gt, gt_to_fw(gt));
diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
index e7792858b1e4..2d63a69cbfa3 100644
--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
@@ -30,6 +30,7 @@
 #include "xe_reg_sr.h"
 #include "xe_reg_whitelist.h"
 #include "xe_sriov.h"
+#include "xe_tuning.h"
 #include "xe_uc_debugfs.h"
 #include "xe_wa.h"
 
@@ -217,6 +218,15 @@ static int workarounds(struct xe_gt *gt, struct drm_printer *p)
 	return 0;
 }
 
+static int tunings(struct xe_gt *gt, struct drm_printer *p)
+{
+	xe_pm_runtime_get(gt_to_xe(gt));
+	xe_tuning_dump(gt, p);
+	xe_pm_runtime_put(gt_to_xe(gt));
+
+	return 0;
+}
+
 static int pat(struct xe_gt *gt, struct drm_printer *p)
 {
 	xe_pm_runtime_get(gt_to_xe(gt));
@@ -300,6 +310,7 @@ static const struct drm_info_list debugfs_list[] = {
 	{"powergate_info", .show = xe_gt_debugfs_simple_show, .data = powergate_info},
 	{"register-save-restore", .show = xe_gt_debugfs_simple_show, .data = register_save_restore},
 	{"workarounds", .show = xe_gt_debugfs_simple_show, .data = workarounds},
+	{"tunings", .show = xe_gt_debugfs_simple_show, .data = tunings},
 	{"pat", .show = xe_gt_debugfs_simple_show, .data = pat},
 	{"mocs", .show = xe_gt_debugfs_simple_show, .data = mocs},
 	{"default_lrc_rcs", .show = xe_gt_debugfs_simple_show, .data = rcs_default_lrc},
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index 6e66bf0e8b3f..dd2969a1846d 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -413,6 +413,16 @@ struct xe_gt {
 		bool oob_initialized;
 	} wa_active;
 
+	/** @tuning_active: keep track of active tunings */
+	struct {
+		/** @tuning_active.gt: bitmap with active GT tunings */
+		unsigned long *gt;
+		/** @tuning_active.engine: bitmap with active engine tunings */
+		unsigned long *engine;
+		/** @tuning_active.lrc: bitmap with active LRC tunings */
+		unsigned long *lrc;
+	} tuning_active;
+
 	/** @user_engines: engines present in GT and available to userspace */
 	struct {
 		/**
diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
index f108f26e5b2a..f059690c7062 100644
--- a/drivers/gpu/drm/xe/xe_tuning.c
+++ b/drivers/gpu/drm/xe/xe_tuning.c
@@ -7,6 +7,8 @@
 
 #include <kunit/visibility.h>
 
+#include <drm/drm_managed.h>
+
 #include "regs/xe_gt_regs.h"
 #include "xe_gt_types.h"
 #include "xe_platform_types.h"
@@ -151,10 +153,44 @@ static const struct xe_rtp_entry_sr lrc_tunings[] = {
 	{}
 };
 
+/**
+ * xe_tuning_init - initialize gt with tunings bookkeeping
+ * @gt: GT instance to initialize
+ *
+ * Returns 0 for success, negative error code otherwise.
+ */
+int xe_tuning_init(struct xe_gt *gt)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+	size_t n_lrc, n_engine, n_gt, total;
+	unsigned long *p;
+
+	n_gt = BITS_TO_LONGS(ARRAY_SIZE(gt_tunings));
+	n_engine = BITS_TO_LONGS(ARRAY_SIZE(engine_tunings));
+	n_lrc = BITS_TO_LONGS(ARRAY_SIZE(lrc_tunings));
+	total = n_gt + n_engine + n_lrc;
+
+	p = drmm_kzalloc(&xe->drm, sizeof(*p) * total, GFP_KERNEL);
+	if (!p)
+		return -ENOMEM;
+
+	gt->tuning_active.gt = p;
+	p += n_gt;
+	gt->tuning_active.engine = p;
+	p += n_engine;
+	gt->tuning_active.lrc = p;
+
+	return 0;
+}
+ALLOW_ERROR_INJECTION(xe_tuning_init, ERRNO); /* See xe_pci_probe() */
+
 void xe_tuning_process_gt(struct xe_gt *gt)
 {
 	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(gt);
 
+	xe_rtp_process_ctx_enable_active_tracking(&ctx,
+						  gt->tuning_active.gt,
+						  ARRAY_SIZE(gt_tunings));
 	xe_rtp_process_to_sr(&ctx, gt_tunings, &gt->reg_sr);
 }
 EXPORT_SYMBOL_IF_KUNIT(xe_tuning_process_gt);
@@ -163,6 +199,9 @@ void xe_tuning_process_engine(struct xe_hw_engine *hwe)
 {
 	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(hwe);
 
+	xe_rtp_process_ctx_enable_active_tracking(&ctx,
+						  hwe->gt->tuning_active.engine,
+						  ARRAY_SIZE(engine_tunings));
 	xe_rtp_process_to_sr(&ctx, engine_tunings, &hwe->reg_sr);
 }
 EXPORT_SYMBOL_IF_KUNIT(xe_tuning_process_engine);
@@ -179,5 +218,25 @@ void xe_tuning_process_lrc(struct xe_hw_engine *hwe)
 {
 	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(hwe);
 
+	xe_rtp_process_ctx_enable_active_tracking(&ctx,
+						  hwe->gt->tuning_active.lrc,
+						  ARRAY_SIZE(lrc_tunings));
 	xe_rtp_process_to_sr(&ctx, lrc_tunings, &hwe->reg_lrc);
 }
+
+void xe_tuning_dump(struct xe_gt *gt, struct drm_printer *p)
+{
+	size_t idx;
+
+	drm_printf(p, "GT Tunings\n");
+	for_each_set_bit(idx, gt->tuning_active.gt, ARRAY_SIZE(gt_tunings))
+		drm_printf_indent(p, 1, "%s\n", gt_tunings[idx].name);
+
+	drm_printf(p, "\nEngine Tunings\n");
+	for_each_set_bit(idx, gt->tuning_active.engine, ARRAY_SIZE(engine_tunings))
+		drm_printf_indent(p, 1, "%s\n", engine_tunings[idx].name);
+
+	drm_printf(p, "\nLRC Tunings\n");
+	for_each_set_bit(idx, gt->tuning_active.lrc, ARRAY_SIZE(lrc_tunings))
+		drm_printf_indent(p, 1, "%s\n", lrc_tunings[idx].name);
+}
diff --git a/drivers/gpu/drm/xe/xe_tuning.h b/drivers/gpu/drm/xe/xe_tuning.h
index 4f9c3ac3b516..dd0d3ccc9c65 100644
--- a/drivers/gpu/drm/xe/xe_tuning.h
+++ b/drivers/gpu/drm/xe/xe_tuning.h
@@ -6,11 +6,14 @@
 #ifndef _XE_TUNING_
 #define _XE_TUNING_
 
+struct drm_printer;
 struct xe_gt;
 struct xe_hw_engine;
 
+int xe_tuning_init(struct xe_gt *gt);
 void xe_tuning_process_gt(struct xe_gt *gt);
 void xe_tuning_process_engine(struct xe_hw_engine *hwe);
 void xe_tuning_process_lrc(struct xe_hw_engine *hwe);
+void xe_tuning_dump(struct xe_gt *gt, struct drm_printer *p);
 
 #endif
-- 
2.48.0

