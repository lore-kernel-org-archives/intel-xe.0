Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13F08C47DB3
	for <intel-xe@archiver.kernel.org>; Thu,  1 Feb 2024 00:48:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C078510FE05;
	Thu,  1 Feb 2024 00:48:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A1C810FE0C
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Feb 2024 00:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706748489; x=1738284489;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JXg0L84wv1VM7zu85WBM6Evh7Pr7iHGVXIqKYpUbKGQ=;
 b=DzxKwD14TMENgUD2aKCtry1lLRb50iPlBT24/DDKANe8N/eOIBfJe5U6
 OBUev8StzJsrwXXoZmyfAdD4vRxM4NfYRxuGhqBeQ1Tevrf8Ifp/Fh5+C
 EoH968wUVQaruaIC/JBWiKvNSFzeH2mJYNiNijQHLGTHQeflHwtYpZvtm
 rBFQIBt2oG8E35dcsFlO8iYpYdbosx1HcV8KkCPG6bw59KNUQoUtjVOKr
 hfqmO6JynkRGfR8XOK+VYrUWxmk2WtTvMn+PIyh3lUjUtj+628L3NXxbA
 MtpUzqpsj4J0tiPYoc2CbnqvhCMNQab0XQGbpPGXKIt5N0lBFKZ456uOu Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="10424076"
X-IronPort-AV: E=Sophos;i="6.05,233,1701158400"; d="scan'208";a="10424076"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 16:48:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="878961983"
X-IronPort-AV: E=Sophos;i="6.05,233,1701158400"; d="scan'208";a="878961983"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 16:48:08 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH 2/2] drm/xe: Pick correct userptr VMA to repin on REMAP op
 failure
Date: Wed, 31 Jan 2024 16:48:49 -0800
Message-Id: <20240201004849.2219558-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240201004849.2219558-1-matthew.brost@intel.com>
References: <20240201004849.2219558-1-matthew.brost@intel.com>
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

A REMAP op is composed of 3 VMA's - unmap, prev map, and next map. When
op_execute fails with -EAGAIN we need to update the local VMA pointer to
the current op state and then repin the VMA if it is a userptr.

Fixes a failure seen in xe_vm.munmap-style-unbind-userptr-one-partial.

Fixes: b06d47be7c83 ("drm/xe: Port Xe to GPUVA")
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index e55161136490..2ab863fe7d0a 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2506,13 +2506,25 @@ static int __xe_vma_op_execute(struct xe_vm *vm, struct xe_vma *vma,
 	}
 	drm_exec_fini(&exec);
 
-	if (err == -EAGAIN && xe_vma_is_userptr(vma)) {
+	if (err == -EAGAIN) {
 		lockdep_assert_held_write(&vm->lock);
-		err = xe_vma_userptr_pin_pages(vma);
-		if (!err)
-			goto retry_userptr;
 
-		trace_xe_vma_fail(vma);
+		if (op->base.op == DRM_GPUVA_OP_REMAP) {
+			if (!op->remap.unmap_done)
+				vma = gpuva_to_vma(op->base.remap.unmap->va);
+			else if (op->remap.prev)
+				vma = op->remap.prev;
+			else
+				vma = op->remap.next;
+		}
+
+		if (xe_vma_is_userptr(vma)) {
+			err = xe_vma_userptr_pin_pages(vma);
+			if (!err)
+				goto retry_userptr;
+
+			trace_xe_vma_fail(vma);
+		}
 	}
 
 	return err;
-- 
2.34.1

