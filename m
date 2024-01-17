Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB296C47DA2
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jan 2024 12:20:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C58B10E650;
	Wed, 17 Jan 2024 12:20:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 857F610E650
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jan 2024 12:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705494053; x=1737030053;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dHuuyBdfUyiWgdnOkDJLb1Dees5ZePsmssfH/Vu4Er8=;
 b=UEtZW3rpRPgrqA+V/uXLIk77vY8KMQURUZLt40Uzm4wzXuZszoUaEkaH
 lhh1PwQJ5WdV2rF6sWsWZXtgelAeQ02lSLhLoB3XgIfu+TKQhmtWsdEqc
 QXyPlGA5KJKdyudhJ7mvBvZSGF9+1VsWyEX6h3/dN4tbuoj6+7k+BfZX2
 xTmrZlJM/fDGbYyLe99GYOL90JuyfOABIiH5mFYeEvMS2M6Ma/Uj98OTt
 pBRjQYPGrVAUl4jBCY1M/GWAkwehiLLKW0fIyvyHw3GxOvvCefdh7pPne
 OZl6VcPo+bM3wb9jqBoRPJhm8ia2qzHxVyj9F1+D+mn9VG1wtcrOE5255 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="7542757"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; 
   d="scan'208";a="7542757"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2024 04:20:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; 
   d="scan'208";a="29564"
Received: from msznigir-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.38.230])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2024 04:20:52 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 1/5] drm/xe: make xe_ttm_funcs const
Date: Wed, 17 Jan 2024 14:20:40 +0200
Message-Id: <20240117122044.1544174-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: jani.nikula@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Place the function pointers in rodata. Also drop the extra declaration
while at it.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 2 +-
 drivers/gpu/drm/xe/xe_bo.h | 2 +-
 drivers/gpu/drm/xe/xe_vm.h | 2 --
 3 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 26fe73f58d72..686d716c5581 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1041,7 +1041,7 @@ static void xe_ttm_bo_delete_mem_notify(struct ttm_buffer_object *ttm_bo)
 	}
 }
 
-struct ttm_device_funcs xe_ttm_funcs = {
+const struct ttm_device_funcs xe_ttm_funcs = {
 	.ttm_tt_create = xe_ttm_tt_create,
 	.ttm_tt_populate = xe_ttm_tt_populate,
 	.ttm_tt_unpopulate = xe_ttm_tt_unpopulate,
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 350cc73cadf8..db4b2db6b073 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -243,7 +243,7 @@ int xe_bo_evict(struct xe_bo *bo, bool force_alloc);
 int xe_bo_evict_pinned(struct xe_bo *bo);
 int xe_bo_restore_pinned(struct xe_bo *bo);
 
-extern struct ttm_device_funcs xe_ttm_funcs;
+extern const struct ttm_device_funcs xe_ttm_funcs;
 
 int xe_gem_create_ioctl(struct drm_device *dev, void *data,
 			struct drm_file *file);
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index cf2f96e8c1ab..e9c907cbcd89 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -199,8 +199,6 @@ struct dma_fence *xe_vm_rebind(struct xe_vm *vm, bool rebind_worker);
 
 int xe_vm_invalidate_vma(struct xe_vma *vma);
 
-extern struct ttm_device_funcs xe_ttm_funcs;
-
 static inline void xe_vm_queue_rebind_worker(struct xe_vm *vm)
 {
 	xe_assert(vm->xe, xe_vm_in_preempt_fence_mode(vm));
-- 
2.39.2

