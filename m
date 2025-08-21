Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18D0FCA0EF8
	for <intel-xe@archiver.kernel.org>; Thu, 21 Aug 2025 14:31:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD96810E9B0;
	Thu, 21 Aug 2025 14:31:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ue6ti0DJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDA2910E9AF
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Aug 2025 14:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755786666; x=1787322666;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=GACC5J7R3TslP6tP/THBi5kzzjBlD1g6i7tV5fYPNkg=;
 b=Ue6ti0DJL+jZphqEj1DgUEu/f3XG0J571/S59O/Op0rmzKjmROiXd6oc
 zN08jFrqZYGo8BwBVARknnUxbiRC/kcw40iu8KLpsP0QBEPyDpBCBNVYP
 DLdk7XaYrSfMJuaEhbnwieFhzHkwRFTfYNf7QBAbdV5b5R5V9n7WODAhB
 RkRuh7Z4wbpOFO2Vxyg0aeZK6n0dyi3Ibwlfe7Uqo4Qxa9Ovles8IkrjJ
 ycFvKpk7tHwrARf+H8FHBhW1yab3N/pXxESR/lG8SnBSbRAGvDL8llJ4x
 Z0n+ru78ZnwDgAA8F37XVOYc2Wwu7n35PQtgMCnQZe1AXa6TLvvKLhPvx A==;
X-CSE-ConnectionGUID: Kk/QJVTCQwGpXMx31n8BpQ==
X-CSE-MsgGUID: xtwmBgxsS6q4IoNMEjQOCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="58175757"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; d="scan'208";a="58175757"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 07:31:05 -0700
X-CSE-ConnectionGUID: SUKG+jMLTwezhEc4vVaUvg==
X-CSE-MsgGUID: 6sWk2FFlQom4QFvjD45QnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; d="scan'208";a="172840846"
Received: from johunt-mobl9.ger.corp.intel.com (HELO fedora) ([10.245.245.201])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 07:31:05 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 1/3] drm/xe/vm: Don't pin the vm_resv during validation
Date: Thu, 21 Aug 2025 16:30:43 +0200
Message-ID: <20250821143045.106005-2-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821143045.106005-1-thomas.hellstrom@linux.intel.com>
References: <20250821143045.106005-1-thomas.hellstrom@linux.intel.com>
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

