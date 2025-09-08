Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F5C0CAC586
	for <intel-xe@archiver.kernel.org>; Mon,  8 Sep 2025 12:30:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04DB310E508;
	Mon,  8 Sep 2025 12:30:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C9j1RkyJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F096D10E508
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Sep 2025 12:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757334642; x=1788870642;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QKdLXN1xv8qsiyUyvnrry6l1A2gHWGGIsOR9rIjZi/I=;
 b=C9j1RkyJ4FwGgH9/Yw/6mJKLQbl7D2lylaXvImMVcVyJrW/mqongLpxn
 pIqIYmIucjSw9+iRJDu3FQT7/YDP18AZBa/LrSvKvX4G+d9p6JN31I6/t
 0Y8VWKlP9EicJ0ArscHZDhUCnbXqy9gneVap+N8ey2kTGcGOGNmssIRzF
 5NPyX0AepiV0aOIbUZSdMcbWb20Z5vzGPd7YrMGyqIVqLYMZy1HOAWEzo
 pxhqkG5YrFIhcnmdhaLx5NT9KDBKza+yrC6JYufKj4aH8z7MWrkWkzpNQ
 Ivd5AIaqGQyO4z66n0GSpNqcyHS03hfoRzoCjFYTuT83iEYGpkhy1pHj1 w==;
X-CSE-ConnectionGUID: bEwGoM2AT6SDefqRqt3V8g==
X-CSE-MsgGUID: nwyJ6LKLTByKlONy2tkzBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11546"; a="59526302"
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; d="scan'208";a="59526302"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 05:30:42 -0700
X-CSE-ConnectionGUID: vslZMWQWQk2YdUT0ov1+oA==
X-CSE-MsgGUID: 4CJzCbDkTYW2BmQ2zFe8Mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; d="scan'208";a="172656395"
Received: from abaranow-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.83.253])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 05:30:40 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2 3/7] drm/xe/vf: Drop IS_VF_CCS_INIT_NEEDED macro
Date: Mon,  8 Sep 2025 14:30:20 +0200
Message-ID: <20250908123025.747-4-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250908123025.747-1-michal.wajdeczko@intel.com>
References: <20250908123025.747-1-michal.wajdeczko@intel.com>
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
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
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

