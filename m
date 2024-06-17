Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D55DC2BA15
	for <intel-xe@archiver.kernel.org>; Mon, 17 Jun 2024 14:34:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D254B10E3FF;
	Mon, 17 Jun 2024 14:34:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fl/CD7xe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7E5110E3FD
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Jun 2024 14:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718634882; x=1750170882;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ofxz628TfNiJ0NJFvdCIAGbPuEtwKxCykPLJ+6CnZPs=;
 b=Fl/CD7xeYzYAwVr/jr0n253cLlrV+j/Nh34oA2ZYGltFQA+YHkE4Ayp/
 eCS1k6bTjDBD0H5ZC1nH3y4S4L9OHLYvTt/5DNtDPHTUAY38MMAGJWSyz
 RBRSq7U/bT4INxQq0QpTOzndMtz7ws7iYO7ZV6Pk9irz5vIr7xKlOrY1M
 LLRGueuyXLwrAR5X+cRPjv1wPa9yoVyqqlRZTLI+rWNU15yb62Vn5R4/R
 hze7YCA3K7Gv3l4mYKln5VN9Nnqjl/tWtv+7sJ8rfuED+QwDj/V2cMcY1
 kaM88QPVzCsJtuHAFv1vhbEZ4iNthqUzP7YvmBy4LKykInyU+vl7tyNdK w==;
X-CSE-ConnectionGUID: un/cI1V5QFSfxnkRhBCv8Q==
X-CSE-MsgGUID: taqtPYn1SeeeQ4CogAbzcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="19247200"
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; d="scan'208";a="19247200"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 07:34:42 -0700
X-CSE-ConnectionGUID: YvwOPD51SfW4LGwea3S3EA==
X-CSE-MsgGUID: V4li8mPsR5OiAsWrNVhpoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; d="scan'208";a="45647226"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.119.62])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 07:34:40 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [RFC 1/3] drm/xe: Introduce force-wake guard class
Date: Mon, 17 Jun 2024 16:34:28 +0200
Message-Id: <20240617143430.641-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240617143430.641-1-michal.wajdeczko@intel.com>
References: <20240617143430.641-1-michal.wajdeczko@intel.com>
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

There is support for 'classes' with constructor and destructor
semantics that can be used for any scope-based resource management,
like device force-wake management.

Add necessary definitions explicitly, since existing macros from
linux/cleanup.h can't deal with our specific requirements yet.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_force_wake.h       | 48 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_force_wake_types.h | 12 ++++++
 2 files changed, 60 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
index a2577672f4e3..0a09018b2a89 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.h
+++ b/drivers/gpu/drm/xe/xe_force_wake.h
@@ -6,6 +6,8 @@
 #ifndef _XE_FORCE_WAKE_H_
 #define _XE_FORCE_WAKE_H_
 
+#include <linux/cleanup.h>
+
 #include "xe_assert.h"
 #include "xe_force_wake_types.h"
 
@@ -46,4 +48,50 @@ xe_force_wake_assert_held(struct xe_force_wake *fw,
 	xe_gt_assert(fw->gt, fw->awake_domains & domain);
 }
 
+/**
+ * class_xe_fw_constructor - The FW guard constructor
+ * @fw : the &xe_force_wake which manages domains
+ * @domain: force wake domain to wake
+ *
+ * Implements constructor semantics for the FW guard.
+ * See scoped_guard() for more details.
+ */
+static inline class_xe_fw_t class_xe_fw_constructor(struct xe_force_wake *fw,
+						    enum xe_force_wake_domains domain)
+{
+	class_xe_fw_t guard = {
+		.fw = fw,
+		.domain = domain,
+	};
+
+	if (fw && xe_force_wake_get(fw, domain))
+		guard.fw = NULL;
+
+	return guard;
+}
+
+/**
+ * class_xe_fw_destructor - The FW guard destructor
+ * @guard : the &class_xe_fw_t to cleanup
+ *
+ * Implements destructor semantics for the FW guard.
+ * See scoped_guard() for more details.
+ */
+static inline void class_xe_fw_destructor(class_xe_fw_t *guard)
+{
+	if (guard->fw)
+		xe_force_wake_put(guard->fw, guard->domain);
+}
+
+/**
+ * class_xe_fw_lock_ptr - The FW guard helper
+ * @guard : the &class_xe_fw_t
+ *
+ * See scoped_guard() for more details.
+ */
+static inline void *class_xe_fw_lock_ptr(class_xe_fw_t *guard)
+{
+	return guard->fw;
+}
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_force_wake_types.h b/drivers/gpu/drm/xe/xe_force_wake_types.h
index ed0edc2cdf9f..39220d5fe0f7 100644
--- a/drivers/gpu/drm/xe/xe_force_wake_types.h
+++ b/drivers/gpu/drm/xe/xe_force_wake_types.h
@@ -83,4 +83,16 @@ struct xe_force_wake {
 	struct xe_force_wake_domain domains[XE_FW_DOMAIN_ID_COUNT];
 };
 
+/**
+ * struct xe_force_wake_guard - Xe force wake guard class
+ */
+struct xe_force_wake_guard {
+	/** @fw: force wake manager */
+	struct xe_force_wake *fw;
+	/** @domain: awake domain under guard */
+	enum xe_force_wake_domains domain;
+};
+
+typedef struct xe_force_wake_guard class_xe_fw_t;
+
 #endif
-- 
2.43.0

