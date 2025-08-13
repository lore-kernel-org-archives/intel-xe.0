Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25092CA0EE4
	for <intel-xe@archiver.kernel.org>; Wed, 13 Aug 2025 10:51:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E26D210E6EE;
	Wed, 13 Aug 2025 10:51:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JuCokQpM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E14F010E4EC
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Aug 2025 10:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755082311; x=1786618311;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ckzqTX523sl9X7i5tbuovoXy6qXZQY5H1W+xjyxVN94=;
 b=JuCokQpM+PyIsIwSvd5Q0Qfg29q3Pm/XSVe25SYvirZrSkvU2M221A+X
 /RDVxXQ02lWqgnp+k60XtRreUurMDLrJVBs2Ho4u7CglPfOtlosLAicnD
 D7MHeWIEzbW3pEjEteFf2BVwM1LycdAXfWyf01E/GdwE0+Ux1Q78LrJoP
 oCUCpdKW56T6QI3I/3HfhZGQAF3kMxYx+KBRKvFym3cBu2pu6bX2yOBKJ
 5BpQXo+Dd702GdL7K3I2EHUUMOmRYQ0Ef/0NQmHrrDx3gGX2a0xaTEkbT
 gYdaH6GfidmUy6gGbdg991lA01Lcckmt3a1t1RTAUBJaDbSDblQUn0vKh A==;
X-CSE-ConnectionGUID: fT+vnsPrQOCoi190ad5D6g==
X-CSE-MsgGUID: m3ehW9zDR2i7rlct0ZsmhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="57449977"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="57449977"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 03:51:50 -0700
X-CSE-ConnectionGUID: nCrV4tbNSVK5s2Y2Kcg93A==
X-CSE-MsgGUID: FqZDBDMDRAaoPR6lanZjeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="166068908"
Received: from agladkov-desk.ger.corp.intel.com (HELO fedora)
 ([10.245.245.199])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 03:51:49 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH 01/15] drm/xe/vm: Don't use a pin the vm_resv during validation
Date: Wed, 13 Aug 2025 12:51:07 +0200
Message-ID: <20250813105121.5945-2-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250813105121.5945-1-thomas.hellstrom@linux.intel.com>
References: <20250813105121.5945-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

The pinning has the odd side-effect that unlocking *any* resv
during validation triggers an "unlocking pinned lock" warning.

Cc: Matthew Brost <matthew.brost@intel.com>
Fixes: 9d5558649f68 ("drm/xe: Rework eviction rejection of bound external bos")
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c |  5 ++---
 drivers/gpu/drm/xe/xe_vm.h | 15 ++-------------
 2 files changed, 4 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 6fea39842e1e..11eaf3b06766 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -2468,7 +2468,6 @@ int xe_bo_validate(struct xe_bo *bo, struct xe_vm *vm, bool allow_res_evict)
 		.no_wait_gpu = false,
 		.gfp_retry_mayfail = true,
 	};
-	struct pin_cookie cookie;
 	int ret;
 
 	if (vm) {
@@ -2479,10 +2478,10 @@ int xe_bo_validate(struct xe_bo *bo, struct xe_vm *vm, bool allow_res_evict)
 		ctx.resv = xe_vm_resv(vm);
 	}
 
-	cookie = xe_vm_set_validating(vm, allow_res_evict);
+	xe_vm_set_validating(vm, allow_res_evict);
 	trace_xe_bo_validate(bo);
 	ret = ttm_bo_validate(&bo->ttm, &bo->placement, &ctx);
-	xe_vm_clear_validating(vm, allow_res_evict, cookie);
+	xe_vm_clear_validating(vm, allow_res_evict);
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 2f213737c7e5..2ecb417c19a2 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -315,22 +315,14 @@ void xe_vm_snapshot_free(struct xe_vm_snapshot *snap);
  * Register this task as currently making bos resident for the vm. Intended
  * to avoid eviction by the same task of shared bos bound to the vm.
  * Call with the vm's resv lock held.
- *
- * Return: A pin cookie that should be used for xe_vm_clear_validating().
  */
-static inline struct pin_cookie xe_vm_set_validating(struct xe_vm *vm,
-						     bool allow_res_evict)
+static inline void xe_vm_set_validating(struct xe_vm *vm, bool allow_res_evict)
 {
-	struct pin_cookie cookie = {};
-
 	if (vm && !allow_res_evict) {
 		xe_vm_assert_held(vm);
-		cookie = lockdep_pin_lock(&xe_vm_resv(vm)->lock.base);
 		/* Pairs with READ_ONCE in xe_vm_is_validating() */
 		WRITE_ONCE(vm->validating, current);
 	}
-
-	return cookie;
 }
 
 /**
@@ -338,17 +330,14 @@ static inline struct pin_cookie xe_vm_set_validating(struct xe_vm *vm,
  * @vm: Pointer to the vm or NULL
  * @allow_res_evict: Eviction from @vm was allowed. Must be set to the same
  * value as for xe_vm_set_validation().
- * @cookie: Cookie obtained from xe_vm_set_validating().
  *
  * Register this task as currently making bos resident for the vm. Intended
  * to avoid eviction by the same task of shared bos bound to the vm.
  * Call with the vm's resv lock held.
  */
-static inline void xe_vm_clear_validating(struct xe_vm *vm, bool allow_res_evict,
-					  struct pin_cookie cookie)
+static inline void xe_vm_clear_validating(struct xe_vm *vm, bool allow_res_evict)
 {
 	if (vm && !allow_res_evict) {
-		lockdep_unpin_lock(&xe_vm_resv(vm)->lock.base, cookie);
 		/* Pairs with READ_ONCE in xe_vm_is_validating() */
 		WRITE_ONCE(vm->validating, NULL);
 	}
-- 
2.50.1

