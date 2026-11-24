Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC0C606A321
	for <intel-xe@archiver.kernel.org>; Tue, 24 Nov 2026 15:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ug9F6eIm
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A870F10F6E7;
	Tue, 24 Nov 2026 15:39:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEB8B10E89B
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Nov 2026 15:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795534792; x=1827070792;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=h5zcMysq4ljwGf+qX86DAZAKTCqQf3WL9ZUDcFnX4J4=;
 b=Ug9F6eImlB0Y+TGh/UKNHaTI2QLsJPr3sjZTAqExd6ePy2u05RJk3wKp
 w8BN5zE+LzfxzEbLYMLfWfwCWVoTTQy9Fo2Fl5o4WZQOW3iCRosUcDKQJ
 TMmH/dE0Oyabg0dIvf1rmrEW662oGnorGNrf7aaH4QeVBOFWRG6KaSPHy
 gWNjF/drzB2tcgTKFYhEcmCOuqB+hGgzt9Bro/cX99IEX3bP7cxkpiNzT
 wFcp/b/9wJntq3JVECJj50Qv52mhLqcIQl3xQ6J3UITgOnmnQcKLhDXNL
 O2w/s8b+fhoIgvBpaQSkhsHGQ8PI1vBLh2k+e9NcypPIGsLcus+fy/nRE g==;
X-CSE-ConnectionGUID: Myr8ama5TTeGIe2zW6kKpQ==
X-CSE-MsgGUID: yEnZ2lwgQRyjH5hS9QP9YQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4277179"
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="4277179"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 07:21:59 -0800
X-CSE-ConnectionGUID: YSageeiFQT2lesIF1Y14RA==
X-CSE-MsgGUID: eHrihQtMT2eNl+d8tsINdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; d="scan'208";a="13278682"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by fmviesa012.fm.intel.com with ESMTP; 24 Nov 2026 07:21:57 -0800
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v1] drm/xe: Retry when drm_gpusvm_get_pages() gives -EBUSY
Date: Tue, 24 Nov 2026 16:23:00 +0100
Message-ID: <20261124152300.2450568-1-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

drm_gpusvm_get_pages() returns -EBUSY when its HMM retry budget is
exhausted. This can happen when the range was repeatedly invalidated
or faulting was slow. This is transient, but the callers treat -EBUSY
as fatal.

The behavior causes sporadic fails after a VF post-migration recovery,
if drm_gpusvm_get_pages() run in parallel with the recovery, and the
recovery took longer than HMM_RANGE_DEFAULT_TIMEOUT (which isn't rare,
as the kernel bound to VF is running on virtual CPU).

Example signature of the issue:
  xe 0000:00:04.0: [drm] VM worker error: -16
  xe 0000:00:04.0: [drm] Trying to schedule after vm is closed or banned

Convert -EBUSY to -EAGAIN in both wrappers around drm_gpusvm_get_pages(),
through a common helper. The rebind worker, exec, the pagefault loop and
the SVM fault path already have a retry implemented on -EAGAIN.

xe_vma_userptr_pin_pages() can now return -EAGAIN instead of -EBUSY, so
update the VMA creation path in xe_vm.c, which maps this error to
-ENOMEM. Tis way the bind ioctl keeps returning the same error as before.

Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c     |  2 +-
 drivers/gpu/drm/xe/xe_userptr.c | 16 ++++++++++------
 drivers/gpu/drm/xe/xe_vm.c      |  8 ++++----
 drivers/gpu/drm/xe/xe_vm.h      | 16 ++++++++++++++++
 4 files changed, 31 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index bc6902b5bf57..ffc624171d50 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -1624,7 +1624,7 @@ int xe_svm_range_get_pages(struct xe_vm *vm, struct xe_svm_range *range,
 		drm_gpusvm_range_evict(&vm->svm.gpusvm, &range->base);
 	}
 
-	return err;
+	return xe_gpusvm_get_pages_err(err);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_userptr.c b/drivers/gpu/drm/xe/xe_userptr.c
index 9c1dac0fce6f..423c190ac68d 100644
--- a/drivers/gpu/drm/xe/xe_userptr.c
+++ b/drivers/gpu/drm/xe/xe_userptr.c
@@ -10,6 +10,7 @@
 
 #include "xe_tlb_inval.h"
 #include "xe_trace_bo.h"
+#include "xe_vm.h"
 
 static void xe_userptr_assert_in_notifier(struct xe_vm *vm)
 {
@@ -84,6 +85,7 @@ int xe_vma_userptr_pin_pages(struct xe_userptr_vma *uvma)
 		.device_private_page_owner = xe_svm_private_page_owner(vm, false),
 		.allow_mixed = true,
 	};
+	int err;
 
 	xe_vma_userptr_lockdep(uvma);
 	xe_assert(xe, xe_vma_is_userptr(vma));
@@ -91,12 +93,14 @@ int xe_vma_userptr_pin_pages(struct xe_userptr_vma *uvma)
 	if (vma->gpuva.flags & XE_VMA_DESTROYED)
 		return 0;
 
-	return drm_gpusvm_get_pages(&vm->svm.gpusvm, &uvma->userptr.pages, 1,
-				    uvma->userptr.notifier.mm,
-				    &uvma->userptr.notifier,
-				    xe_vma_userptr(vma),
-				    xe_vma_userptr(vma) + xe_vma_size(vma),
-				    &ctx);
+	err = drm_gpusvm_get_pages(&vm->svm.gpusvm, &uvma->userptr.pages, 1,
+				   uvma->userptr.notifier.mm,
+				   &uvma->userptr.notifier,
+				   xe_vma_userptr(vma),
+				   xe_vma_userptr(vma) + xe_vma_size(vma),
+				   &ctx);
+
+	return xe_gpusvm_get_pages_err(err);
 }
 
 static struct mmu_interval_notifier_finish *
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index dd855876f571..6e6937870ac6 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2746,11 +2746,11 @@ static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
 			err = xe_vma_userptr_pin_pages(to_userptr_vma(vma));
 			/*
 			 * -EBUSY has dedicated meaning that a user fence
-			 * attached to the VMA is busy, in practice
-			 * xe_vma_userptr_pin_pages can only fail with -EBUSY if
-			 * we are low on memory so convert this to -ENOMEM.
+			 * attached to the VMA is busy. xe_vma_userptr_pin_pages
+			 * reports exhausted HMM retries as -EAGAIN, which makes
+			 * no sense for the bind ioctl, so convert it to -ENOMEM.
 			 */
-			if (err == -EBUSY)
+			if (err == -EAGAIN)
 				err = -ENOMEM;
 		}
 	}
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index b1c5f940bcc5..ba24f2e6022e 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -38,6 +38,22 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags, struct xe_file *xef)
 struct xe_vm *xe_vm_lookup(struct xe_file *xef, u32 id);
 int xe_vma_cmp_vma_cb(const void *key, const struct rb_node *node);
 
+/**
+ * xe_gpusvm_get_pages_err() - Translate an error from drm_gpusvm_get_pages()
+ * @err: error code returned by drm_gpusvm_get_pages()
+ *
+ * drm_gpusvm_get_pages() returns -EBUSY when its HMM retry budget ran out,
+ * because the range was repeatedly invalidated or faulting was slow. That is
+ * transient, so report -EAGAIN to let the callers retry. -EBUSY would be
+ * treated as fatal, and has other meanings in the VM code.
+ *
+ * Return: @err, with -EBUSY replaced by -EAGAIN
+ */
+static inline int xe_gpusvm_get_pages_err(int err)
+{
+	return err == -EBUSY ? -EAGAIN : err;
+}
+
 static inline struct xe_vm *xe_vm_get(struct xe_vm *vm)
 {
 	drm_gpuvm_get(&vm->gpuvm);
-- 
2.43.0

