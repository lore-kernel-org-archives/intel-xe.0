Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F19CC30653
	for <intel-xe@archiver.kernel.org>; Mon,  1 Jul 2024 10:27:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15EC310E38E;
	Mon,  1 Jul 2024 10:27:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eJw3pEKT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A90FE10E38B
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Jul 2024 10:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719829669; x=1751365669;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=g1UeddiTBZMO9R7lBnM6aqgPYAQerRdPGD5Tgzu3jVI=;
 b=eJw3pEKT2uXUcF9c+RljPT8sQTkPt1wGOKGcFPJWz8jmabOAf9/2rU/v
 gCDjYUdUBLLuKRrmzgccpB1eJphokRyWQFzU9C4H5NsKkgx+aYjt7XpKJ
 SmuPhID1sc+AxdeSe9HLve4X/BFkVKa6yDm1uEEx1BI2ckP5GpFGOqGN4
 WeS+8ltlcO7grbWpDccqXpgicWIi3JyJiHNZC2JK+S+p3z+5l7N1cimEt
 y9uN24Pby9MvdDXNRx29zju54pncHCCUnpQgV2qc0FAu6r9GIJIpsQ3E2
 T7Vs7K6Okpd6EhTx9tgvKqdQXVZtvkLoyRfAPZVRQhbM/w94ASfflgbYO g==;
X-CSE-ConnectionGUID: tc5I4xlbSLuLSZbxGvMiFw==
X-CSE-MsgGUID: nTG7uic0QO6a3KUifgZhXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11119"; a="28341417"
X-IronPort-AV: E=Sophos;i="6.09,176,1716274800"; d="scan'208";a="28341417"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2024 03:27:49 -0700
X-CSE-ConnectionGUID: 6rNWZlHhSZqzHYAjZPWWuw==
X-CSE-MsgGUID: zRVUvrihSVaEqPWuSxQ+xQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,176,1716274800"; d="scan'208";a="76665650"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.82.99])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2024 03:27:48 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 2/3] drm/xe/pf: Restart VFs provisioning after GT reset
Date: Mon,  1 Jul 2024 12:27:37 +0200
Message-Id: <20240701102738.934-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240701102738.934-1-michal.wajdeczko@intel.com>
References: <20240701102738.934-1-michal.wajdeczko@intel.com>
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

Any prior configurations pushed to the GuC are lost when the GT
is reset. Push again all non-empty VF configurations to the GuC
as part of the GuC reset procedure.

This will also help restore early manual provisioning, when the
PF was in the meantime suspended and then resumed.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c                 |  3 +++
 drivers/gpu/drm/xe/xe_gt_sriov_pf.c        | 12 +++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf.h        |  5 ++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 30 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h |  2 ++
 5 files changed, 52 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 759634cff1d8..29e8ea94d05e 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -683,6 +683,9 @@ static int do_gt_restart(struct xe_gt *gt)
 	/* Restore GT freq to expected values */
 	xe_gt_sanitize_freq(gt);
 
+	if (IS_SRIOV_PF(gt_to_xe(gt)))
+		xe_gt_sriov_pf_restart(gt);
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
index 7decf71c2b7d..9dbba9ab7a9a 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
@@ -8,6 +8,7 @@
 #include "regs/xe_sriov_regs.h"
 
 #include "xe_gt_sriov_pf.h"
+#include "xe_gt_sriov_pf_config.h"
 #include "xe_gt_sriov_pf_helpers.h"
 #include "xe_gt_sriov_pf_service.h"
 #include "xe_mmio.h"
@@ -82,3 +83,14 @@ void xe_gt_sriov_pf_init_hw(struct xe_gt *gt)
 
 	xe_gt_sriov_pf_service_update(gt);
 }
+
+/**
+ * xe_gt_sriov_pf_restart - Restart SR-IOV support after a GT reset.
+ * @gt: the &xe_gt
+ *
+ * This function can only be called on PF.
+ */
+void xe_gt_sriov_pf_restart(struct xe_gt *gt)
+{
+	xe_gt_sriov_pf_config_restart(gt);
+}
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf.h
index 37d7d6c3df03..f0cb726a6919 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf.h
@@ -11,6 +11,7 @@ struct xe_gt;
 #ifdef CONFIG_PCI_IOV
 int xe_gt_sriov_pf_init_early(struct xe_gt *gt);
 void xe_gt_sriov_pf_init_hw(struct xe_gt *gt);
+void xe_gt_sriov_pf_restart(struct xe_gt *gt);
 #else
 static inline int xe_gt_sriov_pf_init_early(struct xe_gt *gt)
 {
@@ -20,6 +21,10 @@ static inline int xe_gt_sriov_pf_init_early(struct xe_gt *gt)
 static inline void xe_gt_sriov_pf_init_hw(struct xe_gt *gt)
 {
 }
+
+static inline void xe_gt_sriov_pf_restart(struct xe_gt *gt)
+{
+}
 #endif
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 810b579a0025..db6c213da847 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -1970,6 +1970,36 @@ bool xe_gt_sriov_pf_config_is_empty(struct xe_gt *gt, unsigned int vfid)
 	return empty;
 }
 
+/**
+ * xe_gt_sriov_pf_config_restart - Restart SR-IOV configurations after a GT reset.
+ * @gt: the &xe_gt
+ *
+ * Any prior configurations pushed to GuC are lost when the GT is reset.
+ * Push again all non-empty VF configurations to the GuC.
+ *
+ * This function can only be called on PF.
+ */
+void xe_gt_sriov_pf_config_restart(struct xe_gt *gt)
+{
+	unsigned int n, total_vfs = xe_sriov_pf_get_totalvfs(gt_to_xe(gt));
+	unsigned int fail = 0, skip = 0;
+
+	for (n = 1; n <= total_vfs; n++) {
+		if (xe_gt_sriov_pf_config_is_empty(gt, n))
+			skip++;
+		else if (xe_gt_sriov_pf_config_push(gt, n, false))
+			fail++;
+	}
+
+	if (fail)
+		xe_gt_sriov_notice(gt, "Failed to push %u of %u VF%s configurations\n",
+				   fail, total_vfs - skip, str_plural(total_vfs));
+
+	if (fail != total_vfs)
+		xe_gt_sriov_dbg(gt, "pushed %u skip %u of %u VF%s configurations\n",
+				total_vfs - skip - fail, skip, total_vfs, str_plural(total_vfs));
+}
+
 /**
  * xe_gt_sriov_pf_config_print_ggtt - Print GGTT configurations.
  * @gt: the &xe_gt
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
index 58c8f879d7ab..c0e6e4743dc2 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
@@ -55,6 +55,8 @@ int xe_gt_sriov_pf_config_push(struct xe_gt *gt, unsigned int vfid, bool refresh
 
 bool xe_gt_sriov_pf_config_is_empty(struct xe_gt *gt, unsigned int vfid);
 
+void xe_gt_sriov_pf_config_restart(struct xe_gt *gt);
+
 int xe_gt_sriov_pf_config_print_ggtt(struct xe_gt *gt, struct drm_printer *p);
 int xe_gt_sriov_pf_config_print_ctxs(struct xe_gt *gt, struct drm_printer *p);
 int xe_gt_sriov_pf_config_print_dbs(struct xe_gt *gt, struct drm_printer *p);
-- 
2.43.0

