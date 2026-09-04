Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A15A6C79F89
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 21:16:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A00510FB63;
	Fri,  4 Sep 2026 21:16:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U+/oWGKI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91F9910FB48
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 21:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788556582; x=1820092582;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=Qw1VpCqW432ZqyqVAVjCeX+7BBk3LBIeKtmhrVTgUvk=;
 b=U+/oWGKIImAQLoggWUVniLFmorbJKHoKSVtuLh35j/l+e9BqNMwxDBbx
 iKzWt36uYekC1Jb7AuOi+V+b0drHYJComxxUyM7cSx4ZIxhsoPA8/vjPo
 5s3/0YLlrr4+G5qONL1dH/wnTIl38qN2hGL2bd3KWsZ4C1FiF/ecMKGyh
 PLQM/jemJlvk9/eA4vp/2j7u65DmGm6oLp4erFir0yk2fbxQ6ug15cKOt
 GgbO3bY2jG5Z4JMyjMTAMTTxG2ST+jGJZ4Em3w9XqOZPS79MXMRh4kmXb
 R7h+WOIBlVKwa5HyPMt2dveG3xdRnS7L8nswzUA4RHNy1+sntywYzjyl6 Q==;
X-CSE-ConnectionGUID: UJxvOdUwSpq0kVENNP3bfg==
X-CSE-MsgGUID: hYWQVwOHT1CPqcsWJAP9kg==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="89096819"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="89096819"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 14:16:22 -0700
X-CSE-ConnectionGUID: wRXEf2bNSkiva+yYhyT/rA==
X-CSE-MsgGUID: 2KLJAKMiRdmFUDs2io/fyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="267563442"
Received: from gsse-cloud1.jf.intel.com ([10.54.39.91])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 14:16:22 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v6 22/24] drm/xe: Enter ULLS for migration jobs upon page
 fault or SVM prefetch
Date: Fri,  4 Sep 2026 14:16:11 -0700
Message-Id: <20260904211613.3934307-23-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260904211613.3934307-1-matthew.brost@intel.com>
References: <20260904211613.3934307-1-matthew.brost@intel.com>
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

Call xe_migration_ulls_enter upon page fault or SVM prefetch in an
effort speed up these critical paths.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Link: https://patch.msgid.link/20260228013501.106680-25-matthew.brost@intel.com
Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_pagefault.c | 3 +++
 drivers/gpu/drm/xe/xe_vm.c        | 4 +++-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
index e81ca24df37f..ecf2530f0284 100644
--- a/drivers/gpu/drm/xe/xe_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_pagefault.c
@@ -15,6 +15,7 @@
 #include "xe_gt_stats.h"
 #include "xe_hw_engine.h"
 #include "xe_log.h"
+#include "xe_migrate.h"
 #include "xe_pagefault.h"
 #include "xe_pagefault_types.h"
 #include "xe_svm.h"
@@ -262,6 +263,8 @@ static int xe_pagefault_service(struct xe_pagefault *pf)
 	if (IS_ERR(vm))
 		return PTR_ERR(vm);
 
+	xe_migrate_ulls_enter(gt_to_tile(gt)->migrate);
+
 	down_read(&vm->lock);
 
 	if (xe_vm_is_closed(vm)) {
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index ee4d149b7453..c68d3baf1988 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2526,8 +2526,10 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
 			ctx.devmem_possible = IS_DGFX(vm->xe) &&
 					      IS_ENABLED(CONFIG_DRM_XE_PAGEMAP);
 
-			for_each_tile(tile, vm->xe, id)
+			for_each_tile(tile, vm->xe, id) {
+				xe_migrate_ulls_enter(tile->migrate);
 				tile_mask |= 0x1 << id;
+			}
 
 			if (prefetch_region == DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC) {
 				dpagemap = xe_vma_resolve_pagemap(vma,
-- 
2.34.1

