Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71F27D591A9
	for <intel-xe@archiver.kernel.org>; Mon, 18 Nov 2024 18:45:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 433C810E559;
	Mon, 18 Nov 2024 18:45:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EzJ1V0Q3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDC8C10E111
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Nov 2024 18:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731955526; x=1763491526;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gpDQ8wii4El+Hj7UaILR8tJSNUXwdzzrQEQiBhx7cFI=;
 b=EzJ1V0Q3tWtzJCLE8RqPNyftiAqe2EEENhu3krirKYTocaiYgL0FVWso
 q7ayr6pHkvXTLSY6oRWFwmigud3uC90esRRGuEJ1hNnkPq3HULcgzl1dd
 luZytK4sOqIdV9QOVX4DmL/FMFpO5iOpXO6vi7ylG936pLLGEcKMQ5xVR
 wgSvZ8jtj1UTmp3sw0aIfEXM6E9E6HBfWYKL7mtYgSdIhvHLLFuk7JJpT
 flgPuuOn56cD6qgQPCkxS2Xe0dCaGT7wVxrIApPPxtt6TVLMu8jFQt4xi
 Jl4mTtAOuc6WgikvQr0qbvfdou40vtuJ8y5gkk9AUMmFynwiZ8Z1FoM1W Q==;
X-CSE-ConnectionGUID: vCzZ/anXRV2aWBRDGjXf+g==
X-CSE-MsgGUID: LisM8hwmR2q6FEDbtUEx6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="32027856"
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; d="scan'208";a="32027856"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 10:45:25 -0800
X-CSE-ConnectionGUID: SWLJXqk7SC+HEILPCJKz/Q==
X-CSE-MsgGUID: Fu3+ArCfTUqZK1dEp4a5CQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; d="scan'208";a="94391404"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.80.89])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 10:45:24 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v2 1/2] drm/xe: Introduce force-wake guard class
Date: Mon, 18 Nov 2024 19:45:10 +0100
Message-Id: <20241118184511.258-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20241118184511.258-1-michal.wajdeczko@intel.com>
References: <20241118184511.258-1-michal.wajdeczko@intel.com>
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
like our domain force-wake management.

Define xe_fw class that can be used for force-wake management.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
v2: aligned to new force-wake usage model (Michal)
---
 drivers/gpu/drm/xe/xe_force_wake.h       | 12 ++++++++++++
 drivers/gpu/drm/xe/xe_force_wake_types.h | 10 ++++++++++
 2 files changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
index 0e3e84bfa51c..e46e44f7eb70 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.h
+++ b/drivers/gpu/drm/xe/xe_force_wake.h
@@ -6,6 +6,8 @@
 #ifndef _XE_FORCE_WAKE_H_
 #define _XE_FORCE_WAKE_H_
 
+#include <linux/cleanup.h>
+
 #include "xe_assert.h"
 #include "xe_force_wake_types.h"
 
@@ -61,4 +63,14 @@ xe_force_wake_ref_has_domain(unsigned int fw_ref, enum xe_force_wake_domains dom
 	return fw_ref & domain;
 }
 
+DEFINE_CLASS(xe_fw, struct xe_force_wake_guard,
+	     xe_force_wake_put(_T.fw, _T.ref),
+	     ({ (struct xe_force_wake_guard){ fw, xe_force_wake_get(fw, domains) }; }),
+	     struct xe_force_wake *fw, enum xe_force_wake_domains domains);
+
+static inline void *class_xe_fw_lock_ptr(class_xe_fw_t *_T)
+{
+	return _T->ref ? _T : NULL;
+}
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_force_wake_types.h b/drivers/gpu/drm/xe/xe_force_wake_types.h
index 899fbbcb3ea9..15456a24f707 100644
--- a/drivers/gpu/drm/xe/xe_force_wake_types.h
+++ b/drivers/gpu/drm/xe/xe_force_wake_types.h
@@ -85,4 +85,14 @@ struct xe_force_wake {
 	struct xe_force_wake_domain domains[XE_FW_DOMAIN_ID_COUNT];
 };
 
+/**
+ * struct xe_force_wake_guard - Xe force wake guard
+ */
+struct xe_force_wake_guard {
+	/** @fw: force wake manager */
+	struct xe_force_wake *fw;
+	/** @ref: opaque reference to woken domains */
+	unsigned int ref;
+};
+
 #endif
-- 
2.43.0

