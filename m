Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16128C5AE59
	for <intel-xe@archiver.kernel.org>; Wed,  4 Jun 2025 00:25:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ED1D89EAE;
	Wed,  4 Jun 2025 00:25:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HEoiWala";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CD7089EAE
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Jun 2025 00:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748996704; x=1780532704;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cMRqw0+SCz6Tup32gzzmCKa6vPEbVtWBwvqWXAHaLds=;
 b=HEoiWalaRZe5RcHufHgoYiUcH4LsW3ryxKGsXAntUukmNvMA6PhyG/0s
 z4OA3AxhAO6YHvDbO/9Y5MVQVFWOwitPYb7KrjidSVUQSv0bAsd/n7mOo
 2ujzuNcMRy4ckvC0fL3N/EfM2TDYKSUFGs1mx33FEgV2hCeLdXP9IYYxO
 L00nJa2OCkeAlN78QaCIa8zf+I5fJvxE8W8GVHQ21OrbK9hOctJsnY2sw
 NfvbQFjt+ivDo9PojzPCbORTrYURRmIGJq21jfTnJXpsnhTVFAS0NV0RA
 xIQLaCZFYb1BP7/ClFc7NX5nFmqDzSeFl1r9edfzjkmVjWCGaudzqb4Dt w==;
X-CSE-ConnectionGUID: chVH4nZnRBWNT6h5YVzFfg==
X-CSE-MsgGUID: IF9/tAw9Qra1Fs1Q+LUoPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="61324106"
X-IronPort-AV: E=Sophos;i="6.16,207,1744095600"; d="scan'208";a="61324106"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 17:25:04 -0700
X-CSE-ConnectionGUID: 5RO03ibHSuqIuuPz4Hac4Q==
X-CSE-MsgGUID: JG8PoPUtT56Kq73OsbKHsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,207,1744095600"; d="scan'208";a="150168603"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 17:25:04 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v4 2/2] drm/xe/guc: Enable the Dynamic Inhibit Context Switch
 optimization
Date: Tue,  3 Jun 2025 17:24:57 -0700
Message-ID: <20250604002454.743404-6-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250604002454.743404-4-daniele.ceraolospurio@intel.com>
References: <20250604002454.743404-4-daniele.ceraolospurio@intel.com>
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

The Dynamic Inhibit Context Switch is an optimization aimed at reducing
the amount of time the HW is stuck waiting on an unsatisfied semaphore.
When this optimization is enabled, the GuC will dynamically modify the
CTX_CTRL_INHIBIT_SYN_CTX_SWITCH in the CTX_CONTEXT_CONTROL register of
LRCs to enable immediate switching out on an unsatisfied semaphore wait
when multiple contexts are competing for time on the same engine.

This feature is available on recent HW from GuC 70.40.1 onwards and it
is enabled via a per-VF feature opt-in.

v2: rebase
v3: switch to using guc_buf_cache instead of dedicated alloc
v4: add helper to check for feature availability (Michal), don't enable
if multi-lrc is possible.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/abi/guc_klvs_abi.h | 13 ++++++++++++
 drivers/gpu/drm/xe/xe_guc.c           | 30 +++++++++++++++++++++++++++
 2 files changed, 43 insertions(+)

diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
index 5b2502bec2dc..0366a9da5977 100644
--- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
@@ -134,11 +134,24 @@ enum  {
  *      Adds an extra dword to the XE_GUC_ACTION_NOTIFY_MEMORY_CAT_ERROR G2H
  *      containing the type of the CAT error. On HW that does not support
  *      reporting the CAT error type, the extra dword is set to 0xdeadbeef.
+ *
+ * _`GUC_KLV_OPT_IN_FEATURE_DYNAMIC_INHIBIT_CONTEXT_SWITCH` : 0x4003
+ *      This KLV enables the Dynamic Inhibit Context Switch optimization, which
+ *      consists in the GuC setting the CTX_CTRL_INHIBIT_SYN_CTX_SWITCH bit to
+ *      zero in the CTX_CONTEXT_CONTROL register of LRCs that are submitted
+ *      to an oversubscribed engine. This will cause those contexts to be
+ *      switched out immediately if they hit an unsatisfied semaphore wait
+ *      (instead of waiting the full timeslice duration). The bit is instead set
+ *      to one if a single context is queued on the engine, to avoid it being
+ *      switched out if there isn't another context that can run in its place.
  */
 
 #define GUC_KLV_OPT_IN_FEATURE_EXT_CAT_ERR_TYPE_KEY 0x4001
 #define GUC_KLV_OPT_IN_FEATURE_EXT_CAT_ERR_TYPE_LEN 0u
 
+#define GUC_KLV_OPT_IN_FEATURE_DYNAMIC_INHIBIT_CONTEXT_SWITCH_KEY 0x4003
+#define GUC_KLV_OPT_IN_FEATURE_DYNAMIC_INHIBIT_CONTEXT_SWITCH_LEN 0u
+
 /**
  * DOC: GuC VGT Policy KLVs
  *
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 46419861bfcd..b94e7bd865d5 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -583,6 +583,32 @@ static int __guc_opt_in_features_enable(struct xe_guc *guc, u64 addr, u32 num_dw
 	return xe_guc_ct_send_block(&guc->ct, action, ARRAY_SIZE(action));
 }
 
+static bool supports_dynamic_ics(struct xe_guc *guc)
+{
+	struct xe_device *xe = guc_to_xe(guc);
+	struct xe_gt *gt = guc_to_gt(guc);
+
+	/* Dynamic ICS is available for PVC and Xe2 and newer platforms. */
+	if (xe->info.platform != XE_PVC && GRAPHICS_VER(xe) < 20)
+		return false;
+
+	/*
+	 * The feature is currently not compatible with multi-lrc, so the GuC
+	 * does not support it at all on the media engines (which are the main
+	 * users of mlrc). On the primary GT side, to avoid it being used in
+	 * conjunction with mlrc, we only enable it if we are in single CCS
+	 * mode.
+	 */
+	if (xe_gt_is_media_type(gt) || gt->ccs_mode > 1)
+		return false;
+
+	/*
+	 * Dynamic ICS requires GuC v70.40.1, which maps to compatibility
+	 * version v1.18.4.
+	 */
+	return GUC_SUBMIT_VER(guc) >= MAKE_GUC_VER(1, 18, 4);
+}
+
 #define OPT_IN_MAX_DWORDS 16
 int xe_guc_opt_in_features_enable(struct xe_guc *guc)
 {
@@ -607,6 +633,10 @@ int xe_guc_opt_in_features_enable(struct xe_guc *guc)
 	if (GUC_SUBMIT_VER(guc) >= MAKE_GUC_VER(1, 7, 0))
 		klvs[count++] = PREP_GUC_KLV_TAG(OPT_IN_FEATURE_EXT_CAT_ERR_TYPE);
 
+
+	if (supports_dynamic_ics(guc))
+		klvs[count++] = PREP_GUC_KLV_TAG(OPT_IN_FEATURE_DYNAMIC_INHIBIT_CONTEXT_SWITCH);
+
 	if (count) {
 		xe_assert(xe, count <= OPT_IN_MAX_DWORDS);
 
-- 
2.43.0

