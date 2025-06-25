Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDB56C7EE2A
	for <intel-xe@archiver.kernel.org>; Wed, 25 Jun 2025 20:54:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAD4210E134;
	Wed, 25 Jun 2025 20:54:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="moIlcv4R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCBCF10E134
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Jun 2025 20:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750884858; x=1782420858;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=XP2ocIIHeoqul34OkwsfzC2bN/b1FslxoC+ohFApeJw=;
 b=moIlcv4RUl6zCpfDerAdNenhFP4UyZZJiMcNsd+y6EC4K7B31lbj2gRV
 s9ICzJzHL6xndXnCEc7wgmjUxOwC71fm0WGyK0Z7MwUHwWxcV/E5Laz7y
 JXpAAfNlOFGKMJbjQ5UkAQAFQZ7Qew2AuorhE9pu1ZAIo7IFt8YMaeUEp
 F8POPF7G2ZWn0jlCu2+EEFeHjcrjG/HfA/MeQS7pPJpOlVvpXjTvQXiAz
 ipylTLHhwaIV3oxOzT8JoczfAn7TMwHTnR/wmkusBhg9LhLxyJrKhBg8G
 8mjvoA3Bw9kLSD63V/g/A8uSVc0+S9jW60+isXMo/eyUua81XKupMELBz A==;
X-CSE-ConnectionGUID: 1zsA/PQiQ6CXjRSFW/Z57w==
X-CSE-MsgGUID: fDCu5wmDTUmimLXSqy7YiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="64228317"
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; d="scan'208";a="64228317"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 13:54:18 -0700
X-CSE-ConnectionGUID: c95o8O4ZSTyYSe1bZ0EprA==
X-CSE-MsgGUID: P3E4Ch6kQQm7Oqd07DIOag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; d="scan'208";a="152810244"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 13:54:18 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 2/2] drm/xe/guc: Enable the Dynamic Inhibit Context Switch
 optimization
Date: Wed, 25 Jun 2025 13:54:07 -0700
Message-ID: <20250625205405.1653212-4-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250625205405.1653212-3-daniele.ceraolospurio@intel.com>
References: <20250625205405.1653212-3-daniele.ceraolospurio@intel.com>
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
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/abi/guc_klvs_abi.h | 13 ++++++++++++
 drivers/gpu/drm/xe/xe_guc.c           | 29 +++++++++++++++++++++++++++
 2 files changed, 42 insertions(+)

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
index 4a7c467ad669..ebd70f98bb39 100644
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
@@ -607,6 +633,9 @@ int xe_guc_opt_in_features_enable(struct xe_guc *guc)
 	if (GUC_SUBMIT_VER(guc) >= MAKE_GUC_VER(1, 7, 0))
 		klvs[count++] = PREP_GUC_KLV_TAG(OPT_IN_FEATURE_EXT_CAT_ERR_TYPE);
 
+	if (supports_dynamic_ics(guc))
+		klvs[count++] = PREP_GUC_KLV_TAG(OPT_IN_FEATURE_DYNAMIC_INHIBIT_CONTEXT_SWITCH);
+
 	if (count) {
 		xe_assert(xe, count <= OPT_IN_MAX_DWORDS);
 
-- 
2.43.0

