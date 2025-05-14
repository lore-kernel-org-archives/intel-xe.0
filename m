Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62CF0C3ABCC
	for <intel-xe@archiver.kernel.org>; Wed, 14 May 2025 15:24:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0721E10E669;
	Wed, 14 May 2025 15:24:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wusn1WAa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C06510E670
 for <intel-xe@lists.freedesktop.org>; Wed, 14 May 2025 15:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747236288; x=1778772288;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sAVwxiUHyCySCQN0fWXiDUop9GOm/rUWMpBSoMI8+zQ=;
 b=Wusn1WAa4lljuNFBAt7d02j+FuHwXlYUSw5rxpgGoRdjYcpew0RAkHC+
 0g/UuqpMt6/m7NXMg23M5VEF3wyaeza6iMFyM7QffMTwKUzRP77aLdv3N
 1ETPEqAbkk/+PIqb+ujyV9KNQG7E90a4p3UY1lT426LLt5c6Z9AIVqCfK
 SBzx8PjIJB4MJ32dawwnLf6XRuEvnj64I1IQvQ2HfldEJYzgcelvJLjxE
 2WVrs+zXKzWApdryhpJOb3IHIeY860INvwx9nku67XdNpBzSnZNyk30v7
 57Mj4ZM4pO890YiDiENWlEALJSGvyoQtVlirBS506OMBIIJnF1nSt86mt A==;
X-CSE-ConnectionGUID: EOPq9N1pQe2r9rOq4cKBIg==
X-CSE-MsgGUID: 6nF+fm5LTbqAcPOYhEb9Nw==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="60149643"
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; d="scan'208";a="60149643"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 08:24:48 -0700
X-CSE-ConnectionGUID: 1qjkFXIyTSOLBPdPv2OxZw==
X-CSE-MsgGUID: Zu94Yn8CTUy00v9Ich4EbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; d="scan'208";a="137949208"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.203])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 08:24:47 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
	stable@vger.kernel.org
Subject: [PATCH 1/2] drm/xe/vm: move rebind_work init earlier
Date: Wed, 14 May 2025 16:24:25 +0100
Message-ID: <20250514152424.149591-3-matthew.auld@intel.com>
X-Mailer: git-send-email 2.49.0
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

In xe_vm_close_and_put() we need to be able to call
flush_work(rebind_work), however during vm creation we can call this on
the error path, before having actually set up the worker, leading to a
splat from flush_work().

It looks like we can simply move the worker init step earlier to fix
this.

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: <stable@vger.kernel.org> # v6.8+
---
 drivers/gpu/drm/xe/xe_vm.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 5a978da411b0..168756fb140b 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1704,8 +1704,10 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 	 * scheduler drops all the references of it, hence protecting the VM
 	 * for this case is necessary.
 	 */
-	if (flags & XE_VM_FLAG_LR_MODE)
+	if (flags & XE_VM_FLAG_LR_MODE) {
+		INIT_WORK(&vm->preempt.rebind_work, preempt_rebind_work_func);
 		xe_pm_runtime_get_noresume(xe);
+	}
 
 	vm_resv_obj = drm_gpuvm_resv_object_alloc(&xe->drm);
 	if (!vm_resv_obj) {
@@ -1750,10 +1752,8 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 		vm->batch_invalidate_tlb = true;
 	}
 
-	if (vm->flags & XE_VM_FLAG_LR_MODE) {
-		INIT_WORK(&vm->preempt.rebind_work, preempt_rebind_work_func);
+	if (vm->flags & XE_VM_FLAG_LR_MODE)
 		vm->batch_invalidate_tlb = false;
-	}
 
 	/* Fill pt_root after allocating scratch tables */
 	for_each_tile(tile, xe, id) {
-- 
2.49.0

