Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AB2CCF9C6F
	for <intel-xe@archiver.kernel.org>; Tue, 24 Sep 2024 11:59:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08E5B10E899;
	Tue, 24 Sep 2024 11:59:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AIsWa2a+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF96010E899
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Sep 2024 11:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727179156; x=1758715156;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8iKwZJr7D8jUJ59ulRZOLGPj5QwJ3pKRoApp4hMGYj0=;
 b=AIsWa2a+4FIL41bP47156DpUVSV6Ykl2d1kUhz6D0b90fMtPNj1gz6aW
 W+ngwJrh6o0w9EmCwiCFcLtk/xCAN/t9g3bPvN6NtyH3GzgqDJvz6LcnJ
 rNavLStj9FSh/79nS/CGg/PTgX5oWXdD5YXFuwrmk+r9GeeGX97w1iK+V
 PQBksEKdf9sMjK82VcMfN4nnOgLqDvqSg7bNleXXg+TKIr7OpdaoelQYr
 GNL48shbgyfRZXp9qbtE0c0JA1TLtmf4Al/4LjyV4jYDKZOPB5FyPqRVK
 11NiM/UmSM7qa5YP+kz2jyaqLie0V2ZQAUA86G+oTt06bvJJ9SG7Fzyi5 Q==;
X-CSE-ConnectionGUID: pEpTIRIESPqMH9qab+MRIw==
X-CSE-MsgGUID: e0/NOyA7QMqSOZdMZkpaKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="29957089"
X-IronPort-AV: E=Sophos;i="6.10,254,1719903600"; d="scan'208";a="29957089"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 04:59:15 -0700
X-CSE-ConnectionGUID: x9kHeQrVRGCLsMeqXqnq1g==
X-CSE-MsgGUID: UaxJAh6zQd++3I50X61NAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,254,1719903600"; d="scan'208";a="76319381"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orviesa004.jf.intel.com with ESMTP; 24 Sep 2024 04:59:13 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Subject: [PATCH v5 23/23] drm/xe: Change return type to void for
 xe_force_wake_put
Date: Tue, 24 Sep 2024 17:46:41 +0530
Message-Id: <20240924121641.1045763-24-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240924121641.1045763-1-himal.prasad.ghimiray@intel.com>
References: <20240924121641.1045763-1-himal.prasad.ghimiray@intel.com>
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

v5
- change parameter to unsigned int in xe_force_wake_put()

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
index d2eb367da7c1..c2c55d3de36f 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.c
+++ b/drivers/gpu/drm/xe/xe_force_wake.c
@@ -11,6 +11,7 @@
 #include "regs/xe_reg_defs.h"
 #include "xe_gt.h"
 #include "xe_gt_printk.h"
+#include "xe_macros.h"
 #include "xe_mmio.h"
 #include "xe_sriov.h"
 
@@ -196,8 +197,20 @@ unsigned int __must_check xe_force_wake_get(struct xe_force_wake *fw,
 	return ret;
 }
 
-int xe_force_wake_put(struct xe_force_wake *fw,
-		      unsigned int domains_mask)
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
+		       unsigned int domains_mask)
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
@@ -229,5 +242,4 @@ int xe_force_wake_put(struct xe_force_wake *fw,
 
 	xe_gt_WARN(gt, ret, "domain%s %#x failed to acknowledgment sleep\n",
 		   str_plural(hweight_long(ret)), ret);
-	return ret;
 }
diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
index 0b676462c97b..a79c98ed6d2f 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.h
+++ b/drivers/gpu/drm/xe/xe_force_wake.h
@@ -17,8 +17,8 @@ void xe_force_wake_init_engines(struct xe_gt *gt,
 				struct xe_force_wake *fw);
 unsigned int __must_check xe_force_wake_get(struct xe_force_wake *fw,
 					    enum xe_force_wake_domains domains);
-int xe_force_wake_put(struct xe_force_wake *fw,
-		      unsigned int domains_mask);
+void xe_force_wake_put(struct xe_force_wake *fw,
+		       unsigned int domains_mask);
 
 static inline int
 xe_force_wake_ref(struct xe_force_wake *fw,
-- 
2.34.1

