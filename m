Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0888DC001B0
	for <intel-xe@archiver.kernel.org>; Mon, 17 Jul 2023 11:25:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B74C010E0EE;
	Mon, 17 Jul 2023 11:25:43 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04B8510E0EE
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Jul 2023 11:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689593141; x=1721129141;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GmZ6S3ODAUvkljLi8HcUsbk2CQhnQMvvXUb9BczAe6s=;
 b=BtdGwPHQaEwDrlCiouJARsWIy0tngEb0txWw0UOQCrhWrGBMyfXEwkX6
 MKqKsvMK7jleESgOJeqI9SIoGmDpRe+j8hUnTOW8F0xe4+LMdseuy93Hh
 fDd8UQH7+S1PHn72ZIp0GyOmcKdM5Nw8uszOmCBDGL5wtt3AlXEp4HiGT
 MPjTXSPk9O0XDmIYJDNT3an07RNLojJ0D/cG1B7sJe4UCkWLWXo6L1pGB
 Lyja+f5a1VhVx0KcxHrKyJoePA86FzOQfU5GKDc18tKifh7Q4GI1tUSyk
 OBUMWtS/UkULPFFCCaKIUv8ialkTIl54oji0lgtee3zPHKXP/YJMBc4qW w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10773"; a="365948465"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; d="scan'208";a="365948465"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2023 04:25:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10773"; a="897174833"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; d="scan'208";a="897174833"
Received: from kprutko-mobl3.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.13.224])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2023 04:25:40 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 17 Jul 2023 12:25:05 +0100
Message-ID: <20230717112502.32379-14-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230717112502.32379-12-matthew.auld@intel.com>
References: <20230717112502.32379-12-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v14 02/10] drm/xe/vm: tidy up xe_runtime_pm usage
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
index 966e05d814c0..e0d4e5df8e15 100644
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

