Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 454FECA0EE0
	for <intel-xe@archiver.kernel.org>; Wed, 13 Aug 2025 10:52:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BB5110E6F6;
	Wed, 13 Aug 2025 10:52:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mWqMjMWq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11EE410E6FB
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Aug 2025 10:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755082329; x=1786618329;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uZv+H6hStDZgjFcD0DRt9WETnwQKw87uYnGN4SveeZE=;
 b=mWqMjMWqz5fPBm9QvB/qMko2+6HZGA+hqZMcP9idhJBi5EM/4JE93JMv
 ynXGZbPKN26rKNm9hbLRwRq0Xph9OyCFQWaeHnhcuhqGRctPDB3rGNsRY
 2LAXgDhP29OfRrHAy2eUT4/aMHmEbB+KGsjiergjy2uBlivVb+8wAYtMc
 xR4YXzHhcdqbVZ8IidvqMC+BIEK+OYiLyJZjyUX+2JmBgUf+sdoHMSOTj
 4DyXcOo7Q1FUflj0W6CyP8eS7Rad/M/sGE1zyD2BQo9o4u/AVU07ULYSP
 cfICdP0Jj8kmaBkVbe6kc3fbcdMlruRR5jhTAmI0jbeY9tsfR2rO+8Ldy Q==;
X-CSE-ConnectionGUID: zyYbdeo6Tk2c0bzVJZgXqQ==
X-CSE-MsgGUID: RCyK/M94RcKGHwnVraNxWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="57450034"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="57450034"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 03:52:09 -0700
X-CSE-ConnectionGUID: +w5JaXcdS6GLqdrENEJikg==
X-CSE-MsgGUID: P00JYGMQTsuFobuc5Zefyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="166069065"
Received: from agladkov-desk.ger.corp.intel.com (HELO fedora)
 ([10.245.245.199])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 03:52:07 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH 09/15] drm/xe: Convert the CPU fault handler for exhaustive
 eviction
Date: Wed, 13 Aug 2025 12:51:15 +0200
Message-ID: <20250813105121.5945-10-thomas.hellstrom@linux.intel.com>
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

The CPU fault handler may populate bos and migrate, and in doing
so might interfere with other tasks validing.

Convert it for exhaustive eviction. To do this properly without
potentially introducing stalls with the mmap lock held requires
TTM work. In the meantime, let's live with those stalls that
would typically happen on memory pressure.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 5e40b6cb8d2a..dd1e0e9957e0 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1720,14 +1720,18 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
 	struct xe_device *xe = to_xe_device(ddev);
 	struct xe_bo *bo = ttm_to_xe_bo(tbo);
 	bool needs_rpm = bo->flags & XE_BO_FLAG_VRAM_MASK;
-	struct drm_exec *exec;
+	struct xe_validation_ctx ctx;
+	struct drm_exec exec;
 	vm_fault_t ret;
 	int idx;
 
 	if (needs_rpm)
 		xe_pm_runtime_get(xe);
 
-	exec = XE_VALIDATION_UNIMPLEMENTED;
+	if (xe_validation_ctx_init(&ctx, &xe->val, &exec,
+				   DRM_EXEC_INTERRUPTIBLE_WAIT, 0, false))
+		return VM_FAULT_NOPAGE;
+
 	ret = ttm_bo_vm_reserve(tbo, vmf);
 	if (ret)
 		goto out;
@@ -1735,7 +1739,7 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
 	if (drm_dev_enter(ddev, &idx)) {
 		trace_xe_bo_cpu_fault(bo);
 
-		xe_validation_assert_exec(xe, exec, &tbo->base);
+		xe_validation_assert_exec(xe, &exec, &tbo->base);
 		ret = ttm_bo_vm_fault_reserved(vmf, vmf->vma->vm_page_prot,
 					       TTM_BO_VM_NUM_PREFAULT);
 		drm_dev_exit(idx);
@@ -1761,6 +1765,7 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
 
 	dma_resv_unlock(tbo->base.resv);
 out:
+	xe_validation_ctx_fini(&ctx);
 	if (needs_rpm)
 		xe_pm_runtime_put(xe);
 
-- 
2.50.1

