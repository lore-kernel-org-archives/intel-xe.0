Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 641AAE7717D
	for <intel-xe@archiver.kernel.org>; Thu, 12 Dec 2024 01:02:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 320CF10ECA3;
	Thu, 12 Dec 2024 01:02:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ChE+CNin";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D381A10ECA3
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Dec 2024 01:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733965327; x=1765501327;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=G+rdGYf/7dKx/99wkVImOsJU0XXeln1RoHThRKiPfG0=;
 b=ChE+CNinST106lOWYWaSpxzsx2iZ5MDixKBMbhl40nV9sITmiy4kkVec
 G+/wnGsMp9ugGlNqe4Spc2z15xRmdUiBpksKw1pfi0CZyb+0qIL0DnDiY
 XnVJAs/Do6Qpo61vHItixN+9DQF50IY0GLLwiGTDykk7Z/l0jgdqTiflz
 rN5eQbIL5BYk5xq34jYdzbgoKHDoqMFGm+jkJ9n4F+YVGxLR4PxfaCdxl
 wuFsrRszlJ8tj7metR9PXj8AikTZ48rJSyH6rzOfwJoFkO7Nv2aoWD85A
 0T2yyX3DtjHrdWuPg1mexnkKTJjoQdQ5JWqHle/qpUrS6PHvxQdWwqkIW A==;
X-CSE-ConnectionGUID: 7U/1BYrZToeKOdqTGWybAQ==
X-CSE-MsgGUID: CvmB3dHbQ2uu0rM67zbmcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="45379797"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="45379797"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 17:02:06 -0800
X-CSE-ConnectionGUID: TXqJUcWWTFiZAfRk4T0lpg==
X-CSE-MsgGUID: VrCdo6jzS9asJA+Mg/uKVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,227,1728975600"; d="scan'208";a="126856553"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.80.89])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 17:02:06 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 07/13] drm/xe/sa: Allow making suballocations using custom gfp
 flags
Date: Thu, 12 Dec 2024 02:01:35 +0100
Message-Id: <20241212010141.389-8-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20241212010141.389-1-michal.wajdeczko@intel.com>
References: <20241212010141.389-1-michal.wajdeczko@intel.com>
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

Actual xe_sa_manager implementation uses hardcoded GFP_KERNEL flag
during creation of suballocations but in upcoming patch we want to
reuse the xe_sa_manager in places where GFP_KERNEL is not allowed.
Add another variant of the xe_sa_bo_new() function that accepts
arbitrary gfp flags.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_sa.c | 15 ++++++++++++---
 drivers/gpu/drm/xe/xe_sa.h | 10 ++++++++--
 2 files changed, 20 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sa.c b/drivers/gpu/drm/xe/xe_sa.c
index 704332ef795f..d92d9836fa91 100644
--- a/drivers/gpu/drm/xe/xe_sa.c
+++ b/drivers/gpu/drm/xe/xe_sa.c
@@ -78,8 +78,17 @@ struct xe_sa_manager *xe_sa_bo_manager_init(struct xe_tile *tile, u32 size, u32
 	return sa_manager;
 }
 
-struct drm_suballoc *xe_sa_bo_new(struct xe_sa_manager *sa_manager,
-				  unsigned int size)
+/**
+ * __xe_sa_bo_new() - Make a suballocation but use custom gfp flags.
+ * @sa_manager: the &xe_sa_manager
+ * @size: number of bytes we want to suballocate
+ * @gfp: gfp flags used for memory allocation. Typically GFP_KERNEL.
+ *
+ * Try to make a suballocation of size @size.
+ *
+ * Return: a &drm_suballoc, or an ERR_PTR.
+ */
+struct drm_suballoc *__xe_sa_bo_new(struct xe_sa_manager *sa_manager, u32 size, gfp_t gfp)
 {
 	/*
 	 * BB to large, return -ENOBUFS indicating user should split
@@ -88,7 +97,7 @@ struct drm_suballoc *xe_sa_bo_new(struct xe_sa_manager *sa_manager,
 	if (size > sa_manager->base.size)
 		return ERR_PTR(-ENOBUFS);
 
-	return drm_suballoc_new(&sa_manager->base, size, GFP_KERNEL, true, 0);
+	return drm_suballoc_new(&sa_manager->base, size, gfp, true, 0);
 }
 
 void xe_sa_bo_flush_write(struct drm_suballoc *sa_bo)
diff --git a/drivers/gpu/drm/xe/xe_sa.h b/drivers/gpu/drm/xe/xe_sa.h
index 4e96483057d7..bf55d8c3b5eb 100644
--- a/drivers/gpu/drm/xe/xe_sa.h
+++ b/drivers/gpu/drm/xe/xe_sa.h
@@ -5,6 +5,7 @@
 #ifndef _XE_SA_H_
 #define _XE_SA_H_
 
+#include <linux/types.h>
 #include "xe_sa_types.h"
 
 struct dma_fence;
@@ -13,8 +14,13 @@ struct xe_tile;
 
 struct xe_sa_manager *xe_sa_bo_manager_init(struct xe_tile *tile, u32 size, u32 align);
 
-struct drm_suballoc *xe_sa_bo_new(struct xe_sa_manager *sa_manager,
-				  u32 size);
+struct drm_suballoc *__xe_sa_bo_new(struct xe_sa_manager *sa_manager, u32 size, gfp_t gfp);
+
+static inline struct drm_suballoc *xe_sa_bo_new(struct xe_sa_manager *sa_manager, u32 size)
+{
+	return __xe_sa_bo_new(sa_manager, size, GFP_KERNEL);
+}
+
 void xe_sa_bo_flush_write(struct drm_suballoc *sa_bo);
 void xe_sa_bo_free(struct drm_suballoc *sa_bo,
 		   struct dma_fence *fence);
-- 
2.47.1

