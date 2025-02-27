Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC2ADC021B8
	for <intel-xe@archiver.kernel.org>; Thu, 27 Feb 2025 01:05:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 998C810EA03;
	Thu, 27 Feb 2025 01:05:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nl4G1uOo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCAF610E9F9
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Feb 2025 01:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740618348; x=1772154348;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iPSnJKChZgYB0jhoSNIrXplh7p0R9hXkOgvXslHboso=;
 b=Nl4G1uOoGLU0BzzKzHsMtsv3YVyPp9NDVNoicerFP0g4ch5CBx3IF/5x
 KzsRE5d14WhSz/Rj6CdlGWF8SgR/pSsPT/Iu+VBaI2xnOej336xGUOb1o
 fsVzUeiROks0jrQEpdfS+CnjxPZCBhYMq9inMWPpHd3PWkX6M5ATHVcA0
 NERF3DhBUgWLT6Pf6XTvOOqz4gJZEO3Gg8RcDl63TVzVtgQGK/bAmdtIK
 ej4FnHUv8x2vz9irxW6xZfz7mwBpZab1y/xap12IoXC+T0y34wxOLDG4g
 acBOupm0Km8iICk2VJYbBNpwjzWc967G+rLdQElmIo0MyUFP26Me0l2dS w==;
X-CSE-ConnectionGUID: O3Ci3TY0T/eMNOliaO7vpA==
X-CSE-MsgGUID: R+MOVWSuSkGEljPja3nQxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="41744773"
X-IronPort-AV: E=Sophos;i="6.13,318,1732608000"; d="scan'208";a="41744773"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 17:05:47 -0800
X-CSE-ConnectionGUID: Z8EBB2ZvQuqMkjkKgMax6Q==
X-CSE-MsgGUID: 41Fdb9E8QU2MVNBMUKVPyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,318,1732608000"; d="scan'208";a="116648825"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 17:05:47 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH 3/3] drm/xe/guc: Enable the Dynamic Inhibit Context Switch
 optimization
Date: Wed, 26 Feb 2025 17:05:30 -0800
Message-ID: <20250227010530.3002093-4-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250227010530.3002093-1-daniele.ceraolospurio@intel.com>
References: <20250227010530.3002093-1-daniele.ceraolospurio@intel.com>
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
lrcs to enable immediate switching out on an usatisfied semaphore wait
when multiple contexts are competing for time on the same engine.

This feature is available on recent HW from GuC 70.40.1 onwards and it
is enabled via a per-VF feature opt-in.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/xe/abi/guc_klvs_abi.h | 13 +++++++++++++
 drivers/gpu/drm/xe/xe_guc.c           | 11 +++++++++++
 2 files changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
index 4c2b5bfde8fe..b86a074887a6 100644
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
 
 #define GUC_KLV_GUC_OPT_IN_FEATURE_EXT_CAT_ERR_TYPE_KEY 0x4001
 #define GUC_KLV_GUC_OPT_IN_FEATURE_EXT_CAT_ERR_TYPE_LEN 0u
 
+#define GUC_KLV_OPT_IN_FEATURE_DYNAMIC_INHIBIT_CONTEXT_SWITCH_KEY 0x4003
+#define GUC_KLV_OPT_IN_FEATURE_DYNAMIC_INHIBIT_CONTEXT_SWITCH_LEN 0u
+
 /**
  * DOC: GuC VGT Policy KLVs
  *
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 7483aba713b7..b6704d0e1b40 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -606,6 +606,7 @@ static int __guc_opt_in_features_enable(struct xe_guc *guc, u64 addr, u32 num_dw
 
 int xe_guc_opt_in_features_enable(struct xe_guc *guc)
 {
+	struct xe_device *xe = guc_to_xe(guc);
 	struct xe_bo *bo = guc->opt_in_bo;
 	struct xe_uc_fw_version *compat = &guc->fw.versions.found[XE_UC_FW_VER_COMPATIBILITY];
 	u32 remain = bo->size;
@@ -627,6 +628,16 @@ int xe_guc_opt_in_features_enable(struct xe_guc *guc)
 					 GUC_KLV_GUC_OPT_IN_FEATURE_EXT_CAT_ERR_TYPE_KEY,
 					 &offset, &remain);
 
+	/*
+	 * Dynamic ICS is available for PVC and Xe2 and newer platforms. It
+	 * requires GuC 70.40.1, which maps to compatibility version 1.18.4
+	 */
+	if ((xe->info.platform == XE_PVC || GRAPHICS_VER(xe) >= 20) &&
+	    MAKE_GUC_VER_STRUCT(*compat) >= MAKE_GUC_VER(1, 18, 4))
+		xe_guc_klv_enable_simple(guc, &bo->vmap,
+					 GUC_KLV_OPT_IN_FEATURE_DYNAMIC_INHIBIT_CONTEXT_SWITCH_KEY,
+					 &offset, &remain);
+
 	if (offset) {
 		ret = __guc_opt_in_features_enable(guc, xe_bo_ggtt_addr(bo), offset / 4);
 		if (ret < 0) {
-- 
2.43.0

