Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 075B6C28B20
	for <intel-xe@archiver.kernel.org>; Fri, 28 Mar 2025 17:28:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ED5589C5E;
	Fri, 28 Mar 2025 17:28:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G1MVqfAz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9303C89C5E
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Mar 2025 17:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743182930; x=1774718930;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=glYjK3NB7M/LrxUcHuSwylEAZTmoVpiTQ2F4Fvk+bJY=;
 b=G1MVqfAz61apEfg9kjqOg6mwETtAZ5SHY4fNii5XEZ1tRQuIkIoN4qI1
 tNc49fTpcAUBfGCzkqD2gWv6wQNKzMUcTWl+2NLS5AENowE0fEWsqzA02
 iZlpJ9zvQj37lVr2o5lnr4AdiL1UcZTGyO7UhbNGRIlCfUHDBSM5ScjnA
 vXnVI6bBjjLiAuTCRmMz7O1eetwMGq1ZoCUK7PmigDpy3VH3zw7ujiNVF
 qIm/xsI9Z/LcPz7V1ASQb8EKb+QxaIVPJfVwmayr4n0iVPIv665Seh/6/
 oo6Yze6sgEhgzA7aUczcsyklI5ekEZrWYTTZ+bP1pQ/GZysDuuVTBGYpO Q==;
X-CSE-ConnectionGUID: SjRWr2lyRF6FvmRmLWLMjw==
X-CSE-MsgGUID: 1BR2Y1y0TXmAqyamKyJeBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="55198120"
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; d="scan'208";a="55198120"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 10:28:50 -0700
X-CSE-ConnectionGUID: fQ5oof4zREWbvCvsNRnQrA==
X-CSE-MsgGUID: QDC0vevGRSWtT8Tc3yp5HA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; d="scan'208";a="162734653"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 10:28:50 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH v3 2/2] drm/xe/guc: Enable the Dynamic Inhibit Context Switch
 optimization
Date: Fri, 28 Mar 2025 10:28:37 -0700
Message-ID: <20250328172837.2607990-3-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250328172837.2607990-1-daniele.ceraolospurio@intel.com>
References: <20250328172837.2607990-1-daniele.ceraolospurio@intel.com>
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
v3: switch to using guc_buf_cache instead of dedicated alloc

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/xe/abi/guc_klvs_abi.h | 13 +++++++++++++
 drivers/gpu/drm/xe/xe_guc.c           |  8 ++++++++
 2 files changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
index 7d142c70b811..185d46f6c46a 100644
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
index efb1afa1d42d..c13ef2cb2d9a 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -606,6 +606,14 @@ int xe_guc_opt_in_features_enable(struct xe_guc *guc)
 	if (GUC_SUBMIT_VER(guc) >= MAKE_GUC_VER(1, 7, 0))
 		klvs[count++] = PREP_GUC_KLV_TAG(OPT_IN_FEATURE_EXT_CAT_ERR_TYPE);
 
+	/*
+	 * Dynamic ICS is available for PVC and Xe2 and newer platforms. It
+	 * requires GuC v70.40.1, which maps to compatibility version v1.18.4
+	 */
+	if ((xe->info.platform == XE_PVC || GRAPHICS_VER(xe) >= 20) &&
+	    GUC_SUBMIT_VER(guc) >= MAKE_GUC_VER(1, 18, 4))
+		klvs[count++] = PREP_GUC_KLV_TAG(OPT_IN_FEATURE_DYNAMIC_INHIBIT_CONTEXT_SWITCH);
+
 	if (count) {
 		xe_assert(xe, count <= OPT_IN_MAX_DWORDS);
 
-- 
2.43.0

