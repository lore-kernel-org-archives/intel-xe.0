Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B86EFCAC593
	for <intel-xe@archiver.kernel.org>; Tue, 17 Sep 2024 17:57:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B14910E4EE;
	Tue, 17 Sep 2024 17:57:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NPmeNsRU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25E3C10E4E6
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Sep 2024 17:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726595828; x=1758131828;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=66G2SZmku9FiMMXs6Yn4nfEvPsOztUtaGSvtx41Vb3Q=;
 b=NPmeNsRU2enmBSbF4WSbregep8zEoqIokKrLQkZXTOP0bc5ve3fAdEGV
 G99uVcokj57nE4v2jGuu7rkMFJgCXT8DVkXQ5kQKVx8aYrkr78VUo03kQ
 8a1GR4pZEWGkvqDTJF8isRMl1tDrL/MAxpMY4fXt8kFxzXHvCfyAsy0lg
 lNNb8n6dmkGlyeIusLCGTBkfwP/VnBB0X5Q2OBNEiUajs5L9zhe/XRbXc
 spevO4RHno1oy81/4S2dNvSLK0r4L8bmFE4n2x3NXziw0aa66G12de0LL
 al1Bn3j07t615bkkdlTsrLQ9IosJVyYnVF58cLJYk2v/TqEsvTCk5fYBI g==;
X-CSE-ConnectionGUID: nDg78BXkQdepoxAzqUv8Pw==
X-CSE-MsgGUID: uevtP+r5SIKPz7cnsqj8aQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="13562030"
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="13562030"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2024 10:57:07 -0700
X-CSE-ConnectionGUID: UufhpgpAQ765JHI0wBuarQ==
X-CSE-MsgGUID: rvOMIV7oRKadoFfW75G8xQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="68926556"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmviesa007.fm.intel.com with ESMTP; 17 Sep 2024 10:57:05 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Subject: [PATCH v4 23/23] drm/xe: Change return type to void for
 xe_force_wake_put
Date: Tue, 17 Sep 2024 23:44:25 +0530
Message-Id: <20240917181425.515871-24-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240917181425.515871-1-himal.prasad.ghimiray@intel.com>
References: <20240917181425.515871-1-himal.prasad.ghimiray@intel.com>
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

There is no need to return an error from xe_force_wake_put(), as a
failure implicitly indicates that the domain failed to sleep.

v3
- Move kernel-doc to this patch (Badal)

Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_force_wake.c | 20 ++++++++++++++++----
 drivers/gpu/drm/xe/xe_force_wake.h |  4 ++--
 2 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
index 48aa4fca34b5..c2def95ef744 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.c
+++ b/drivers/gpu/drm/xe/xe_force_wake.c
@@ -11,6 +11,7 @@
 #include "regs/xe_reg_defs.h"
 #include "xe_gt.h"
 #include "xe_gt_printk.h"
+#include "xe_macros.h"
 #include "xe_mmio.h"
 #include "xe_sriov.h"
 
@@ -196,8 +197,20 @@ xe_wakeref_t __must_check xe_force_wake_get(struct xe_force_wake *fw,
 	return ret;
 }
 
-int xe_force_wake_put(struct xe_force_wake *fw,
-		      xe_wakeref_t domains_mask)
+/**
+ * xe_force_wake_put - Decrement the refcount and put domain to sleep if refcount becomes 0
+ * @fw: Pointer to the force wake structure
+ * @domains_mask: forcewake domain mask to put reference
+ *
+ * This function reduces the reference counts for specified domain mask. If
+ * refcount for any of the specified domain reaches 0, it puts the domain to sleep
+ * and waits for acknowledgment for domain to sleep within specified timeout.
+ * Ensure this function is always called with return of xe_force_wake_get() as
+ * @domains_mask.
+ * Warns in case of timeout of ack from domain.
+ */
+void xe_force_wake_put(struct xe_force_wake *fw,
+		       xe_wakeref_t domains_mask)
 {
 	struct xe_gt *gt = fw->gt;
 	struct xe_force_wake_domain *domain;
@@ -210,7 +223,7 @@ int xe_force_wake_put(struct xe_force_wake *fw,
 	 * in error path of individual domains.
 	 */
 	if (!domains_mask)
-		return 0;
+		return;
 
 	spin_lock_irqsave(&fw->lock, flags);
 	for_each_fw_domain_masked(domain, domains_mask, fw, tmp) {
@@ -228,5 +241,4 @@ int xe_force_wake_put(struct xe_force_wake *fw,
 
 	xe_gt_WARN(gt, ret, "domain%s %#x failed to acknowledgment sleep\n",
 		   str_plural(hweight_long(ret)), ret);
-	return ret;
 }
diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
index 43e7aa7bead8..e5b3d450b396 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.h
+++ b/drivers/gpu/drm/xe/xe_force_wake.h
@@ -17,8 +17,8 @@ void xe_force_wake_init_engines(struct xe_gt *gt,
 				struct xe_force_wake *fw);
 xe_wakeref_t __must_check xe_force_wake_get(struct xe_force_wake *fw,
 					    enum xe_force_wake_domains domains);
-int xe_force_wake_put(struct xe_force_wake *fw,
-		      xe_wakeref_t domains_mask);
+void xe_force_wake_put(struct xe_force_wake *fw,
+		       xe_wakeref_t domains_mask);
 
 static inline int
 xe_force_wake_ref(struct xe_force_wake *fw,
-- 
2.34.1

