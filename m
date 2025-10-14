Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D6B6CCD190
	for <intel-xe@archiver.kernel.org>; Tue, 14 Oct 2025 03:25:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B46810E533;
	Tue, 14 Oct 2025 03:25:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GLY9JB5U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 309D110E1A5
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Oct 2025 03:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760412330; x=1791948330;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oFFLcJP8CuECAjV2WAd+5XTUuB3l/fVnDWclsTTOKwQ=;
 b=GLY9JB5Ukti/cQNC5D8ZgoID8vaYZM1NI3kknl4ujss6U+twc+YC8IQs
 Il0diNQakQBLYYiCnWe+pL3kN+AauEL8lIYoOf9V0YL87luwxE+Vv7ja/
 zOcgnCFr2Qw6qFVI+r1n49GRPXA1c1Leim4ZY0stqnElcfBWKcl826Iv1
 AnysmkrD0jTgXRVI3DY84fZVE2HXfwMPp4xmTXM74oar8+3sKextHP/L/
 n86JqslZAu6jTnqUrZOPdQA6OoYndngAx/g1KULqRyECjMGw+4154ZB/J
 Ct/3kJ0sscpQxWcu7/B35rNTpAtrWKUqGIwq1fzACc8/nOvAFxb5zcLPT A==;
X-CSE-ConnectionGUID: Rh21DCUHQj+H1/eSuX1Dug==
X-CSE-MsgGUID: FfhibqMpQXC2s4wbsvKHBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="66414875"
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="66414875"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 20:25:29 -0700
X-CSE-ConnectionGUID: Uc5n8A5vRFKx91QprlUdzA==
X-CSE-MsgGUID: FqzXx/LySWabCs4hZatepw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="181567302"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 20:25:29 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Shekhar Chauhan <shekhar.chauhan@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH 12/23] drm/xe/xe3p: Flush userptr/shrinker bo cachelines
 manually
Date: Mon, 13 Oct 2025 20:24:44 -0700
Message-ID: <20251013-xe3p-v1-12-bfb74f038215@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251013-xe3p-v1-0-bfb74f038215@intel.com>
References: <20251013-xe3p-v1-0-bfb74f038215@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-bd47d
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

From: Tejas Upadhyay <tejas.upadhyay@intel.com>

Starting with Xe3p, HW will flush cachelines marked with XA only when
media is off. We have few cases where kernel will have non-XA cachelines
which needs manual flush as we postpone the invalidation.

Flush asap from correctness POV to ensure non accelerated CPU copy to
swap/shmem file will see coherent view of memory, but also from security
POV where later flush can't corrupt the next user of those pages.

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
[ TODO: xe_device_needs_cache_flush() seems a bad name that doesn't
  really review the context - it may need to be renamed/localized ]
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c      |  3 ++-
 drivers/gpu/drm/xe/xe_device.c  | 20 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_device.h  |  1 +
 drivers/gpu/drm/xe/xe_userptr.c |  3 ++-
 4 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 7b65020818738..05bc61d9e37cf 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -673,7 +673,8 @@ static int xe_bo_trigger_rebind(struct xe_device *xe, struct xe_bo *bo,
 
 		if (!xe_vm_in_fault_mode(vm)) {
 			drm_gpuvm_bo_evict(vm_bo, true);
-			continue;
+			if (!xe_device_needs_cache_flush(xe))
+				continue;
 		}
 
 		if (!idle) {
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 7efa8da9e1069..168a45fe36838 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1081,6 +1081,26 @@ void xe_device_l2_flush(struct xe_device *xe)
 	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 }
 
+/**
+ * xe_device_needs_cache_flush - Whether the cache needs to be flushed
+ * @xe: The device to check.
+ *
+ * Return: true if the device needs cache flush, false otherwise.
+ */
+bool xe_device_needs_cache_flush(struct xe_device *xe)
+{
+	/*
+	 * Xe3p will flush cachelines marked with XA only when media is off. We
+	 * have few cases where kernel will have non-XA cachelines which needs
+	 * manual flush and this is one of them as we postpone the
+	 * invalidation. Flush asap from correctness POV to ensure non
+	 * accelerated CPU copy to swap/shmem file will see coherent view of
+	 * memory, but also from security POV where later flush can't corrupt
+	 * the next user of those pages.
+	 */
+	return GRAPHICS_VER(xe) >= 35 && !IS_DGFX(xe);
+}
+
 /**
  * xe_device_td_flush() - Flush transient L3 cache entries
  * @xe: The device
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 32cc6323b7f64..15e67db44b56c 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -179,6 +179,7 @@ void xe_device_snapshot_print(struct xe_device *xe, struct drm_printer *p);
 u64 xe_device_canonicalize_addr(struct xe_device *xe, u64 address);
 u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address);
 
+bool xe_device_needs_cache_flush(struct xe_device *xe);
 void xe_device_td_flush(struct xe_device *xe);
 void xe_device_l2_flush(struct xe_device *xe);
 
diff --git a/drivers/gpu/drm/xe/xe_userptr.c b/drivers/gpu/drm/xe/xe_userptr.c
index f16e92cd80904..86ce1c3ef41aa 100644
--- a/drivers/gpu/drm/xe/xe_userptr.c
+++ b/drivers/gpu/drm/xe/xe_userptr.c
@@ -112,7 +112,8 @@ static void __vma_userptr_invalidate(struct xe_vm *vm, struct xe_userptr_vma *uv
 				    false, MAX_SCHEDULE_TIMEOUT);
 	XE_WARN_ON(err <= 0);
 
-	if (xe_vm_in_fault_mode(vm) && userptr->initial_bind) {
+	if ((xe_vm_in_fault_mode(vm) || xe_device_needs_cache_flush(vm->xe)) &&
+	    userptr->initial_bind) {
 		err = xe_vm_invalidate_vma(vma);
 		XE_WARN_ON(err);
 	}

-- 
2.51.0

