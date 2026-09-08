Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32AD8C79F99
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 13:50:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E216710EBFF;
	Tue,  8 Sep 2026 13:50:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k2aZb+GR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90A7F10EBF9
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Sep 2026 13:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788875449; x=1820411449;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JbOBMaxTAGHqy13TrMlewOAlcBMo+8i51BEV4MGDev8=;
 b=k2aZb+GRcQjkvkNDREPfXt41I9jo6Yin87GP7mtqD14ecdafg5I0Ajoz
 QxPOQlqfL7VtWELfJgWeHDBstosgGLpAWoNjdl/scvNrqudicfp6dBErC
 CwKJBzkogAF2f0U1wsUepnQ6MDn5pY6T9fFWR23k6PqYoRSeMbS/ort06
 3creDJWIVgxabzr2DrCB2LTL5HgTz32tngtyf4J6MZiGByUFvywVnn8ia
 BvGQ+URZGEH+D9eAieiF/9r6zvGepR/CYFQrPhtuhqX78IxM/PXUlPnAj
 QTgWVOSgzfGBfND1QN9/ufakpI+yfz4tgPs4mtmm/rzG4BOMHVasUopy9 w==;
X-CSE-ConnectionGUID: O3/vtA4GRKejUluKzlIADQ==
X-CSE-MsgGUID: zpcJR6z7Q4aTebNwBvZm8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="106793375"
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; d="scan'208";a="106793375"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 06:50:49 -0700
X-CSE-ConnectionGUID: 2OrkCw0zSw6AMTcXRJGM8g==
X-CSE-MsgGUID: XMUw5GS1QCSz6+CG6yGYmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; d="scan'208";a="270519671"
Received: from rvuia-mobl.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.158])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 06:50:48 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Ilia Levi <ilia.levi@intel.com>
Subject: [PATCH v4 1/8] drm/xe/mmio_gem: forbid VMA split
Date: Tue,  8 Sep 2026 14:49:57 +0100
Message-ID: <20260908134955.1344429-11-matthew.auld@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260908134955.1344429-10-matthew.auld@intel.com>
References: <20260908134955.1344429-10-matthew.auld@intel.com>
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

From: Ilia Levi <ilia.levi@intel.com>

The fault handler assumes it always operates on a VMA spanning the entire
GEM object. This does not hold when the VMA has been split, e.g. by a
partial munmap or mprotect. In that case the handler may map wrong
physical pages or cause SIGBUS.

Handle this by forbidding VMA split, as partial unmaps are not deemed
useful for MMIO GEMs.

Suggested-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Ilia Levi <ilia.levi@intel.com>
Fixes: 1ffcf8b8ae8a ("drm/xe: Support for mmap-ing mmio regions")
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio_gem.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_mmio_gem.c b/drivers/gpu/drm/xe/xe_mmio_gem.c
index 3741ae60f532..d54477b93b6e 100644
--- a/drivers/gpu/drm/xe/xe_mmio_gem.c
+++ b/drivers/gpu/drm/xe/xe_mmio_gem.c
@@ -39,10 +39,20 @@ struct xe_mmio_gem {
 	phys_addr_t phys_addr;
 };
 
+static int xe_mmio_gem_vm_may_split(struct vm_area_struct *area, unsigned long addr)
+{
+	/*
+	 * Forbid splitting. Together with VM_DONTEXPAND, this keeps the VMA
+	 * matching the GEM object exactly.
+	 */
+	return -EINVAL;
+}
+
 static const struct vm_operations_struct vm_ops = {
 	.open = drm_gem_vm_open,
 	.close = drm_gem_vm_close,
 	.fault = xe_mmio_gem_vm_fault,
+	.may_split = xe_mmio_gem_vm_may_split,
 };
 
 static const struct drm_gem_object_funcs xe_mmio_gem_funcs = {
-- 
2.55.0

