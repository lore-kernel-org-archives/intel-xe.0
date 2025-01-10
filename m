Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFF09E77188
	for <intel-xe@archiver.kernel.org>; Fri, 10 Jan 2025 20:46:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3CBA10E532;
	Fri, 10 Jan 2025 20:46:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lfebVfGr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A323810E532
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Jan 2025 20:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736542017; x=1768078017;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UY/lWRIQxCJOeXU1ATCDr+hYvbbn7j9eBlTnW3j5HM0=;
 b=lfebVfGr+7CnlKWvqEAhR49oRrhDKHt2TxUY5pjL8lw4RCfe5+rI3Ut9
 IXcqQOToCiPmaOe/wpFB+jDqztA+8yXvTu1PZWoP1gHqNs87oYjN7JrsU
 FuY6zkR9RJ7j9vEc15mvR1b/gyE62uBRyU+d3Qa6XFj4q3nRzDVa+t+ut
 AF/sqwR0NrK/EVGDZKOcQm26QKUTpSmE1w1tPYJ1OxhsqqhLzyAdLzkvl
 J3+UWWH1N6c/e2LmIfWdv98FtyubKerPkyWkA9gbJVmkT8c4XJVeupwsl
 kBaDYcWdiX5u6AME0WsKyjzMoCwQ1ACigXqxyywCfYwm7kEO8/ZKa2UJq w==;
X-CSE-ConnectionGUID: zO2vt8HGSd65Aft5Xl5eaQ==
X-CSE-MsgGUID: 9hnm7CxfSBKwkPxpTxa82g==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="40530762"
X-IronPort-AV: E=Sophos;i="6.12,305,1728975600"; d="scan'208";a="40530762"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2025 12:46:56 -0800
X-CSE-ConnectionGUID: zptWjpjdTYWm6Y0xmvLSqw==
X-CSE-MsgGUID: T0fcoRGbQOO/tZ3LWW/wdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="127119216"
Received: from szeng-desk.jf.intel.com ([10.165.21.160])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2025 12:46:56 -0800
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Thomas.Hellstrom@linux.intel.com
Subject: [PATCH] drm/xe: Reject BO eviction if BO is bound to current VM
Date: Fri, 10 Jan 2025 16:01:37 -0500
Message-Id: <20250110210137.3181576-1-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
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

This is a follow up fix for
https://patchwork.freedesktop.org/patch/msgid/20241203021929.1919730-1-oak.zeng@intel.com
The overall goal is to fail vm_bind when there is memory pressure. See more
details in the commit message of above patch. Abbove patch fixes the issue
when user pass in a vm_id parameter during gem_create. If user doesn't pass
in a vm_id during gem_create, above patch doesn't help.

This patch further reject BO eviction (which could be triggered by bo validation)
if BO is bound to the current VM. vm_bind could fail due to the eviction failure.
The BO to VM reverse mapping structure is used to determine whether BO is bound
to VM.

v2:
Move vm_bo definition from function scope to if(evict) clause (Thomas)
Further constraint the condition by adding ctx->resv (Thomas)
Add a short comment describe the change.

Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Oak Zeng <oak.zeng@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 4a623a98d9f1f..b024c63d8d296 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -713,6 +713,21 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 		goto out;
 	}
 
+	/* Reject BO eviction if BO is bound to current VM. */
+	if (evict && ctx->resv) {
+		struct drm_gpuvm_bo *vm_bo;
+
+		drm_gem_for_each_gpuvm_bo(vm_bo, &bo->ttm.base) {
+			struct xe_vm *vm = gpuvm_to_vm(vm_bo->vm);
+
+			if (xe_vm_resv(vm) == ctx->resv &&
+			    xe_vm_in_preempt_fence_mode(vm)) {
+				ret = -EBUSY;
+				goto out;
+			}
+		}
+	}
+
 	/*
 	 * Failed multi-hop where the old_mem is still marked as
 	 * TTM_PL_FLAG_TEMPORARY, should just be a dummy move.
-- 
2.26.3

