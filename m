Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC89CCA0EEB
	for <intel-xe@archiver.kernel.org>; Fri, 22 Aug 2025 09:40:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63BB010EAAD;
	Fri, 22 Aug 2025 09:40:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DW9d+nwk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BBA010EAAD
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Aug 2025 09:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755855654; x=1787391654;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GACC5J7R3TslP6tP/THBi5kzzjBlD1g6i7tV5fYPNkg=;
 b=DW9d+nwkyrRR8rjfIjtJjcQ9KG7pSoHAIlW5VW/qW5vdKv68vF/0spUa
 M3PQDm5AgatoBdFqqhD67XxkreZMxLBpHisKJX/JM1SKN2a1YcutTahja
 mJ4oH7ZkhO2pwtlaiTpTwlWsxfP6hFqT9pEepBgfwkDs89cKRcu1KU5Do
 xmavLJP/Gelaa+hm76zYAyVOgIV3dQYGgvL1Bskxj0G8Z8oYUVGA53RhH
 8Wm9rKjvLk347moQm8L+wZNOEmyzGqGW8gwl/ptTF7KZJYgO4f7bTQsZo
 avokQ4/nvS9t4KtxWRajLhEAkhPI9oqzHJkXviw2xVvNuo5VrskTYHKOp w==;
X-CSE-ConnectionGUID: pvXSiCZbQ9yLUJZVVGCHUA==
X-CSE-MsgGUID: 9kL7RjooQKmuA2EP68GjCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="80760596"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="80760596"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 02:40:54 -0700
X-CSE-ConnectionGUID: SGjUN8aLQ8OJluR0zupb1w==
X-CSE-MsgGUID: Y0OPPLLlTJW3MfjFSsZKgQ==
X-ExtLoop1: 1
Received: from ncintean-mobl1.ger.corp.intel.com (HELO fedora)
 ([10.245.244.108])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 02:40:52 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v2 01/16] drm/xe/vm: Don't pin the vm_resv during validation
Date: Fri, 22 Aug 2025 11:40:15 +0200
Message-ID: <20250822094030.3499-2-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250822094030.3499-1-thomas.hellstrom@linux.intel.com>
References: <20250822094030.3499-1-thomas.hellstrom@linux.intel.com>
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
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
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

