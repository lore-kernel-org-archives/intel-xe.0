Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19CEFEB64DC
	for <intel-xe@archiver.kernel.org>; Mon, 10 Jul 2023 14:43:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC4B310E132;
	Mon, 10 Jul 2023 14:43:56 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9E5210E132
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Jul 2023 14:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689000236; x=1720536236;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uRQLYQ7GzdAIYgXV4XLQ/+alwAkZZuDWRnqjytuqgXw=;
 b=Eyx+dJNbUe523rRpKgJ5I+1BnYAAX92+0kDSgTvCJQLEsW+r6d8lyFbO
 ElqL+xF8Ixff8EeVrHmNjIA8wtRE6dR94q2YVtiGhKo2w0e5CAlvkvbcY
 GCtsMXIOGpvpXroJXYtGpdop3XqBxOICAXfasPIYtMiUe+c7V9L3FSNL5
 E2H2+aZZGv0NiqmNuaxG/PjGIAbCjLEb4XUN1eWveAs2nc3jtYML4gmNP
 k47E80vqy7k2rP7pYD5IXwsc3NmbYNudRFtGK+nwG5PbLyTbkq2XsulXL
 tWSXd5BEko7q3WaX2nF/4ycIkOBsarRZTt2nEM9Tf0XV0EqkOS/Wg4Wi2 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="428054252"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; d="scan'208";a="428054252"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2023 07:43:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="1051372863"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; d="scan'208";a="1051372863"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2023 07:43:51 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Mon, 10 Jul 2023 07:44:05 -0700
Message-Id: <20230710144405.1863923-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Use internal VM flags in xe_vm_create
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

xe_vm_create used the IOCTL create flags in a few places rather than the
internal VM flags and this just happened to work as these values
matched. This is risky (and incorrect) as the internal flag values are
free to change. Fix this and use the internal VM flag values.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 57326cc23c0a..26d39de777aa 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1274,13 +1274,13 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 		vm->batch_invalidate_tlb = true;
 	}
 
-	if (flags & DRM_XE_VM_CREATE_COMPUTE_MODE) {
+	if (flags & XE_VM_FLAG_COMPUTE_MODE) {
 		INIT_WORK(&vm->preempt.rebind_work, preempt_rebind_work_func);
 		vm->flags |= XE_VM_FLAG_COMPUTE_MODE;
 		vm->batch_invalidate_tlb = false;
 	}
 
-	if (flags & DRM_XE_VM_CREATE_ASYNC_BIND_OPS) {
+	if (flags & XE_VM_FLAG_ASYNC_BIND_OPS) {
 		vm->async_ops.fence.context = dma_fence_context_alloc(1);
 		vm->flags |= XE_VM_FLAG_ASYNC_BIND_OPS;
 	}
-- 
2.34.1

