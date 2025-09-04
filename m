Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8DCECA1013
	for <intel-xe@archiver.kernel.org>; Thu,  4 Sep 2025 19:29:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0F1B10EAC4;
	Thu,  4 Sep 2025 19:29:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ewbS6NQN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED0DF10EAC4
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Sep 2025 19:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757014173; x=1788550173;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fJbEQufaz49ilMybS7XYXwqAY60OdYl4MRUVY1wx0so=;
 b=ewbS6NQNMZ4Txz2BWzEe3kk0cslD9Qkrtv2kKK+baCsqjjB8J6iMOWrk
 /FpYCz9Lwbm5iF6DtZTzzov56mL0JS5/5L1PCiuxAs6rWBjnPk7UMtQFc
 iw9cII9S1MxhwCLhBYdhZBMstlPkC/WPFkBcCNyS8VkNUr7fq2koAQPFC
 ufl1hZrUEe84wr70VITr5KotHKwkzZge/wyZ6JWLZ06LuBdxF0RfjZHVp
 zcewg16JK++NmRmqHu71ktg6nrJL6/kOD3HoRYj5x4L8ZIDOR6L0B5e/x
 Rep3IvMsqVd5PkP3MinSvzpNUpXMT8DFL5R5j6xJlRU0Jh/AQfjLCG+2D Q==;
X-CSE-ConnectionGUID: iX0IfWx+TleBBJfT/dgEQg==
X-CSE-MsgGUID: 1AlPUo8ISZWGz2DmR9VB2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11543"; a="70793971"
X-IronPort-AV: E=Sophos;i="6.18,239,1751266800"; d="scan'208";a="70793971"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 12:29:33 -0700
X-CSE-ConnectionGUID: +hnksa3pRm2lFowciQwz7A==
X-CSE-MsgGUID: 6mD+aQ6ARjeoKV9rfpUOpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,239,1751266800"; d="scan'208";a="209153137"
Received: from ruymanre-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.252.70])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 12:29:32 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH 3/5] drm/xe/vf: Drop IS_VF_CCS_INIT_NEEDED macro
Date: Thu,  4 Sep 2025 21:29:15 +0200
Message-ID: <20250904192918.7346-4-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250904192918.7346-1-michal.wajdeczko@intel.com>
References: <20250904192918.7346-1-michal.wajdeczko@intel.com>
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

We only use this macro once and we can open-code it to explicitly
show relevant conditions and avoid duplications.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
---
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c       | 6 +++++-
 drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h | 6 ------
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
index 19786f64a7da..b01bb3660fb1 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
@@ -15,6 +15,7 @@
 #include "xe_migrate.h"
 #include "xe_sa.h"
 #include "xe_sriov_printk.h"
+#include "xe_sriov_vf.h"
 #include "xe_sriov_vf_ccs.h"
 #include "xe_sriov_vf_ccs_types.h"
 
@@ -263,7 +264,10 @@ int xe_sriov_vf_ccs_init(struct xe_device *xe)
 	u32 flags;
 	int err;
 
-	if (!IS_VF_CCS_INIT_NEEDED(xe))
+	xe_assert(xe, IS_SRIOV_VF(xe));
+	xe_assert(xe, xe_sriov_vf_migration_supported(xe));
+
+	if (IS_DGFX(xe) || !xe_device_has_flat_ccs(xe))
 		return 0;
 
 	for_each_ccs_rw_ctx(ctx_id) {
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h b/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
index 93435a6f4cb6..0df6b4130e7c 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
+++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
@@ -15,12 +15,6 @@
 		___xe->sriov.vf.ccs.initialized; \
 		})
 
-#define IS_VF_CCS_INIT_NEEDED(xe) ({\
-		struct xe_device *___xe = (xe); \
-		IS_SRIOV_VF(___xe) && !IS_DGFX(___xe) && \
-		xe_device_has_flat_ccs(___xe) && GRAPHICS_VER(___xe) >= 20; \
-		})
-
 enum xe_sriov_vf_ccs_rw_ctxs {
 	XE_SRIOV_VF_CCS_READ_CTX,
 	XE_SRIOV_VF_CCS_WRITE_CTX,
-- 
2.47.1

