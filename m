Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3151C44508
	for <intel-xe@archiver.kernel.org>; Wed, 15 Jul 2026 14:01:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5450D10F0CE;
	Wed, 15 Jul 2026 14:01:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zh00gD2r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0843310F0CE
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Jul 2026 14:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784124101; x=1815660101;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=aCDR8Zh4TbMEKZeq9myuxkMTjkw14RxDIZN0LbTH+sw=;
 b=Zh00gD2rETwR/I2LHCmsWmP21fL7dSqJSo3XOuLOGtxh/E39AvniMM2h
 YCvwoP34DbhQIYjKNav+TQq6kZ75+L2djf/MXz+tKDGaHeQ0skXW6F+vK
 Yg58+GCd2PtxvRe0hTq1CEtdikOvXTWakCIStjkU0InJSEEzOoO8jIvO7
 P1PKIvmdMA17XRaW+XBNbFWrIbaEbz8YexT/I4wryerTy0g8sv8mvNvTX
 QfRnPn2kWlYBQy7wFGy9KFYZvc6f22BWVnK3DjokJWbgpPFFPA5KktjLf
 J9FG7vL0sM/lWsTRNTEbTZLecEgI0M/UK78PcbxStGwRZ/atzFT7q8GXz w==;
X-CSE-ConnectionGUID: 4XN+GM1fQtOFAeI6Mbg7Xg==
X-CSE-MsgGUID: uCJoMBBhR6GxRZffF5GzrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="88588461"
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="88588461"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 07:01:35 -0700
X-CSE-ConnectionGUID: nW+notboQ/WZX9/LiOkOew==
X-CSE-MsgGUID: lv5AZinUSr+mqnZA3wMIYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="294398291"
Received: from dbhadane-mobl1.iind.intel.com ([10.190.239.58])
 by orviesa001.jf.intel.com with ESMTP; 15 Jul 2026 07:01:35 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [PATCH] xe/userptr: TLB invalidation new pm_runtime ref before submit
Date: Wed, 15 Jul 2026 19:31:33 +0530
Message-ID: <20260715140133.1811959-1-dnyaneshwar.bhadane@intel.com>
X-Mailer: git-send-email 2.54.0
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

Take a proper runtime PM reference before TLB invalidation.
The MMU notifier path has no outer xe_pm_runtime_get()
protection, but xe_tlb_inval_fence_init() called from
xe_vm_invalidate_vma_submit() uses xe_pm_runtime_get_noresume()
which requires an existing reference. The fence itself will
hold its own noresume ref until it signals.

Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
---
 drivers/gpu/drm/xe/xe_userptr.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_userptr.c b/drivers/gpu/drm/xe/xe_userptr.c
index 1d2ab678faf5..fc7e4b00fe17 100644
--- a/drivers/gpu/drm/xe/xe_userptr.c
+++ b/drivers/gpu/drm/xe/xe_userptr.c
@@ -8,6 +8,7 @@
 
 #include <linux/mm.h>
 
+#include "xe_pm.h"
 #include "xe_tlb_inval.h"
 #include "xe_trace_bo.h"
 
@@ -103,6 +104,7 @@ xe_vma_userptr_do_inval(struct xe_vm *vm, struct xe_userptr_vma *uvma, bool is_d
 	XE_WARN_ON(err <= 0);
 
 	if (xe_vm_in_fault_mode(vm) && userptr->initial_bind) {
+		guard(xe_pm_runtime)(vm->xe);
 		if (!userptr->finish_inuse) {
 			/*
 			 * Defer the TLB wait to an extra pass so the caller
-- 
2.54.0

