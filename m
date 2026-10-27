Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1F8606A31A
	for <intel-xe@archiver.kernel.org>; Tue, 27 Oct 2026 18:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=oBaY2/hw
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFE3610F7A6;
	Tue, 27 Oct 2026 18:36:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2874F10F798
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Oct 2026 18:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793126209; x=1824662209;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CCJmGH5N1slFmgm/zdiAUbsua+XMNnoifzxzqm8Gxnk=;
 b=oBaY2/hwKSqykXT1891cKadA48cvAw8Jgbm+q8bhka8m00OEV0dnQz3c
 WYpVx8OyqmzEiAtDHJ0eSbJ8hmo/7d7f2VSzt34ZO8ZqxcQHikqJ8j1PE
 zeEA9N4PkZjJg6e5E12PPlwgWAKD+h2UxhGb0sL6zuu0JJozj0AjkYLIu
 nnkGHKO2o6I/2nUCvthjwWsyRUdFPagBmHZQJ41Rae/LtCPxTutwaF/2a
 VoKh3CwmNKCb7aUkRlmV8JHp2FMOIOwx187GEAWN0FmyUdroK0l7V+cma
 Sezz2mv2ZGaRpCgeJmOaPvSvNmg5njgUpzBqex7WKaodPNaomry6NByok g==;
X-CSE-ConnectionGUID: Boaz82C8T/mYhlJeF27bwA==
X-CSE-MsgGUID: Y5SHMKOoSQ24S/Cbo3avsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1725993"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1725993"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 11:36:43 -0700
X-CSE-ConnectionGUID: MWvuIkqGT9y0diKJl1KWpA==
X-CSE-MsgGUID: SJglZvDZQ2Cr++rkFIwXgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="4579012"
Received: from gsse-cloud1.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 11:36:43 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Copilot <223556219+Copilot@users.noreply.github.com>
Subject: [PATCH v4 1/5] drm/xe: Bump the LRU of every BO an exec touches
Date: Tue, 27 Oct 2026 11:36:34 -0700
Message-Id: <20261027183638.1031299-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261027183638.1031299-1-matthew.brost@intel.com>
References: <20261027183638.1031299-1-matthew.brost@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

xe_vm_bump_lru() bumps the VM's bulk move and then, individually, every
locked object drm_gpuvm_is_extobj() reports. That misses BOs which are
neither: a VM in fault mode is created with a NULL bulk move, so its
private BOs ride along with nothing and are never bumped at all. They
just sit wherever they first landed on the LRU, however hot they are,
and are the first thing eviction and the shrinker pick.

Bump everything locked by the exec that the bulk move doesn't already
cover instead. The VM's dummy resv object is skipped explicitly since
it isn't a BO; it was previously filtered out by the extobj test.

Fixes: 7ba4c5f02763 ("drm/xe: VM LRU bulk move")
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Co-authored-by: Copilot <223556219+Copilot@users.noreply.github.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 86c3b4fd232f..25d5e164d260 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -453,10 +453,8 @@ int xe_vm_validate_rebind(struct xe_vm *vm, struct drm_exec *exec,
  * @vm: The vm for which we are bumping LRUs.
  * @exec: The struct drm_exec with the locked GEM objects.
  *
- * Move the VM's private BOs, and all external objects locked by @exec,
- * to the LRU tail. Private BOs are moved in bulk using @vm's
- * &xe_vm.lru_bulk_move. External objects, which may be shared with other
- * VMs, are not part of that bulk move and are bumped individually.
+ * Move all BOs locked by @exec to the LRU tail. Those covered by @vm's
+ * &xe_vm.lru_bulk_move are moved in bulk, the rest individually.
  */
 void xe_vm_bump_lru(struct xe_vm *vm, struct drm_exec *exec)
 {
@@ -466,10 +464,17 @@ void xe_vm_bump_lru(struct xe_vm *vm, struct drm_exec *exec)
 	spin_lock(lru_lock);
 	ttm_lru_bulk_move_tail(&vm->lru_bulk_move);
 	drm_exec_for_each_locked_object(exec, obj) {
-		if (!drm_gpuvm_is_extobj(&vm->gpuvm, obj))
+		struct xe_bo *bo;
+
+		/* The VM's dummy resv object, not a BO. */
+		if (obj == xe_vm_obj(vm))
+			continue;
+
+		bo = gem_to_xe_bo(obj);
+		if (bo->ttm.bulk_move == &vm->lru_bulk_move)
 			continue;
 
-		ttm_bo_move_to_lru_tail(&gem_to_xe_bo(obj)->ttm);
+		ttm_bo_move_to_lru_tail(&bo->ttm);
 		cond_resched_lock(lru_lock);
 	}
 	spin_unlock(lru_lock);
-- 
2.34.1

