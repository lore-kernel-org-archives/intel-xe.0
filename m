Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6C16C71136
	for <intel-xe@archiver.kernel.org>; Fri, 13 Jun 2025 12:30:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B057010E20F;
	Fri, 13 Jun 2025 12:30:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pvcr9JmG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ABF210E986
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Jun 2025 12:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749817816; x=1781353816;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qY+dd3V37MSBa036DSJ6rr4GwY8E0TvV9JuFF+XmHiU=;
 b=Pvcr9JmGo59RiC52VGsCa+/3CYjnXN7HBJEZBDgQvxhF+uwWgIh7f6V1
 f0f8jlkdu92nx/pkWI94IK1/u9/jIwr7L9+KLGDEFW7Y/mYHtuOqkHYOL
 mK+UYi7aScVzNkHzOtLG/wmO/kB2S/UQJXmw7yrgE78/KKvPL7Gldhqcw
 VwyKMoeOXy6cZLb24nLyG66VCl2SdzXhafW3dck7R7YOabG27U842BJtW
 R5CNBTAa6TJnYzWo87hpIXL1Um1c/ffZpvYidi7jv6RkV8y9dTne1S/OG
 eCr/P3x/pP9ctygLtM3qNyZLa+o3oZ8IcucxY45yZGckcWPJYQeHb9MHN Q==;
X-CSE-ConnectionGUID: tr30NXmrTnWLbmocs3V6tQ==
X-CSE-MsgGUID: h/WFHgR2Q/SGokSeXkt0lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="69610169"
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; d="scan'208";a="69610169"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 05:30:16 -0700
X-CSE-ConnectionGUID: JjxtppEPQ2CdzFJt/QOKyg==
X-CSE-MsgGUID: TyBZJqMeRDCBhr2yPc9fTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; d="scan'208";a="148290332"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by fmviesa010.fm.intel.com with ESMTP; 13 Jun 2025 05:30:15 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v4 10/20] drm/xe/vm: Add an identifier for madvise in
 xe_vma_ops
Date: Fri, 13 Jun 2025 18:25:48 +0530
Message-Id: <20250613125558.2607665-11-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250613125558.2607665-1-himal.prasad.ghimiray@intel.com>
References: <20250613125558.2607665-1-himal.prasad.ghimiray@intel.com>
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

The flag XE_VMA_OPS_FLAG_MADVISE is introduced to  determine whether
xe_vma_ops is initialized by madvise operation on not.

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c       | 1 +
 drivers/gpu/drm/xe/xe_vm_types.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index f5f8de113eae..e059d9810d26 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -4237,6 +4237,7 @@ int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t start, uint64_t range)
 	}
 
 	xe_vma_ops_init(&vops, vm, NULL, NULL, 0);
+	vops.flags |= XE_VMA_OPS_FLAG_MADVISE;
 	err = vm_bind_ioctl_ops_parse(vm, ops, &vops);
 	if (err)
 		goto unwind_ops;
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index cde2583da303..c7156f8e2ed2 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -489,6 +489,7 @@ struct xe_vma_ops {
 	struct xe_vm_pgtable_update_ops pt_update_ops[XE_MAX_TILES_PER_DEVICE];
 	/** @flag: signify the properties within xe_vma_ops*/
 #define XE_VMA_OPS_FLAG_HAS_SVM_PREFETCH BIT(0)
+#define XE_VMA_OPS_FLAG_MADVISE          BIT(1)
 	u32 flags;
 #ifdef TEST_VM_OPS_ERROR
 	/** @inject_error: inject error to test error handling */
-- 
2.34.1

