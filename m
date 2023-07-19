Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 833F5C001B0
	for <intel-xe@archiver.kernel.org>; Wed, 19 Jul 2023 08:38:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C1AB10E42E;
	Wed, 19 Jul 2023 08:38:58 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4F8610E42D
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Jul 2023 08:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689755936; x=1721291936;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ltFrUhEfH6Lps+c4Zw4tP01mg8HrqSFbK3KZxBn8uVk=;
 b=NDYW243nDWGaSWiTsMTcTyCmYhTSP6ISblP4hOEo9JAON3ai6uT7J+pB
 B7TeYs3XGhC8y8wFrbHGNSjaP6P2hG8DgSLbWaX+kaUcBurc5H2V6Qhh5
 EW1lB8w749ST1f9bYzh/pbxyR8tLHDJXAY6Bk84Zhpf9NOpQZgpZpdead
 8IWlGFloBIn0KZvJLA1S/ON3m+NJ1YJHUSoiyFrG4tpHE/Nw2vx7OWgfF
 FR5v2MLFazp0Mc0cNIbzyzru/Jt8VjKSdftHKHBD0Ky4PWt5E7IFgaI3o
 62DyYxNGAa4eXZwiIkP+lmgHOgDyWRnYBh3cqeg+6J4iuObNySOAVM52v g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="345999014"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; d="scan'208";a="345999014"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2023 01:38:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="837603325"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; d="scan'208";a="837603325"
Received: from gtroy-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.29.95])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2023 01:38:55 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 19 Jul 2023 09:38:04 +0100
Message-ID: <20230719083801.182123-14-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230719083801.182123-12-matthew.auld@intel.com>
References: <20230719083801.182123-12-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v15 02/10] drm/xe/vm: tidy up xe_runtime_pm usage
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
index 91f11dfe9460..3941ceb64594 100644
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

