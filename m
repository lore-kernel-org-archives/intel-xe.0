Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C4FAC28B23
	for <intel-xe@archiver.kernel.org>; Thu,  6 Mar 2025 00:58:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 134C510E87E;
	Thu,  6 Mar 2025 00:58:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SiTdRVYG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB8C110E87E
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Mar 2025 00:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741222678; x=1772758678;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UF7f3lbvEKOLW5wb8Ij6uAHPFUdyfolzRVxnG7z9ho0=;
 b=SiTdRVYGe+QaP5kp4UpmZ3j7Y+R4mk9GQoYconZ7k53aRA24IDNQEpla
 NFMvbfr+dfDgVgqa/L46mWP9k3E3rl53QPP1g6ZT6WrDSpo9eNM4MMzHw
 d4MprtbGV0EUYVRNn9vPso0wKXsq2m9fyELLjuo4DzNXCYEzwFOFoH04J
 xLjEglva1IdGYqA+wj7x1EFM9msqFYFQIKLdI8FGgYXoonPY6cA2q2HIJ
 AHJk63eFvYCbaLaxR32rWd1RrCP9/40qnirL2cIEtBIFe68Pz4qbb/j72
 BCSpsH6SxHLoUbKukA4aaXTkKsq/7GZe1EJlsves/DQAjBUZgFy7EfWR/ Q==;
X-CSE-ConnectionGUID: gEsPdhn6SM63ut36Ql0wkw==
X-CSE-MsgGUID: yrJcS3w8QaOmI6gcwb60zA==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="41465294"
X-IronPort-AV: E=Sophos;i="6.14,224,1736841600"; d="scan'208";a="41465294"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 16:57:58 -0800
X-CSE-ConnectionGUID: 9/EQ3oAiTHqUqwYC4B/hfA==
X-CSE-MsgGUID: jxqh505rRFOz6vDaeEltOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,224,1736841600"; d="scan'208";a="123444033"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 16:57:58 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH v2 3/3] drm/xe/guc: Enable the Dynamic Inhibit Context Switch
 optimization
Date: Wed,  5 Mar 2025 16:57:45 -0800
Message-ID: <20250306005745.3520231-4-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250306005745.3520231-1-daniele.ceraolospurio@intel.com>
References: <20250306005745.3520231-1-daniele.ceraolospurio@intel.com>
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

v2: rebase

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
index 7e9638ef65bf..18b665b992c0 100644
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
+		xe_guc_klv_emit_nodata(guc, &bo->vmap,
+				       GUC_KLV_OPT_IN_FEATURE_DYNAMIC_INHIBIT_CONTEXT_SWITCH_KEY,
+				       &offset, &remain);
+
 	if (offset) {
 		ret = __guc_opt_in_features_enable(guc, xe_bo_ggtt_addr(bo), offset / 4);
 		if (ret < 0) {
-- 
2.43.0

