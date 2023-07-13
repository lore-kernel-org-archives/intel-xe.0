Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40555C0015E
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jul 2023 13:23:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E178110E6DB;
	Thu, 13 Jul 2023 13:23:16 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A44AB10E6D9
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Jul 2023 13:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689254595; x=1720790595;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yVaDBJPaj9L5ZwjaM+RKxQ8GfnUTqywvFbga3rrPBOM=;
 b=Rrnn5COuqSptqEsPoQ/5ZnJE9W2kWAOaFRVs4o0grkosyMIMiDcrKbCg
 yjGXLwbLXI1oTn6q1t7dY6dtQPssXb0eueyKJc16iJc9wovzEVwHwLQrW
 SJTX+2teqQAQXVcSPv3+ns/xoHy7pWauUDG2HG6QZw3aZmmgYYWYZp6TL
 0c42kqBVsf833NbirOTA6uHj/uifDnvjSmN2PjKuOAaFSXl5DgVLZGleP
 pCBaBn4geqkZIW4bVyONOIBk/rDMwjpzsDOl+0C/wf8szdBlAl+arA4YR
 4EPc6DhRQN0xbeokTtGkXl6HLpBfEU9zQF9nRO0nwN5fF9/PxXnpcLwTL A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="345497912"
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="345497912"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2023 06:23:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="787455298"
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="787455298"
Received: from rossdevx-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.28.133])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2023 06:23:12 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 13 Jul 2023 14:22:47 +0100
Message-ID: <20230713132244.459605-14-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230713132244.459605-12-matthew.auld@intel.com>
References: <20230713132244.459605-12-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v13 02/10] drm/xe/vm: tidy up xe_runtime_pm usage
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The xe_device_mem_access_get() should be all that's needed here and
should now work as expected, without any strange races. In theory should
be no functional changes here.

Reported-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 6c216350084b..97ecd7f7d593 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1231,11 +1231,8 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 
 	INIT_LIST_HEAD(&vm->extobj.list);
 
-	if (!(flags & XE_VM_FLAG_MIGRATION)) {
-		/* We need to immeditatelly exit from any D3 state */
-		xe_pm_runtime_get(xe);
+	if (!(flags & XE_VM_FLAG_MIGRATION))
 		xe_device_mem_access_get(xe);
-	}
 
 	err = dma_resv_lock_interruptible(&vm->resv, NULL);
 	if (err)
@@ -1352,10 +1349,8 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 err_put:
 	dma_resv_fini(&vm->resv);
 	kfree(vm);
-	if (!(flags & XE_VM_FLAG_MIGRATION)) {
+	if (!(flags & XE_VM_FLAG_MIGRATION))
 		xe_device_mem_access_put(xe);
-		xe_pm_runtime_put(xe);
-	}
 	return ERR_PTR(err);
 }
 
@@ -1513,7 +1508,6 @@ static void vm_destroy_work_func(struct work_struct *w)
 
 	if (!(vm->flags & XE_VM_FLAG_MIGRATION)) {
 		xe_device_mem_access_put(xe);
-		xe_pm_runtime_put(xe);
 
 		if (xe->info.has_asid) {
 			mutex_lock(&xe->usm.lock);
-- 
2.41.0

