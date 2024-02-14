Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 995CCC48BC3
	for <intel-xe@archiver.kernel.org>; Wed, 14 Feb 2024 14:17:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4334A10E28F;
	Wed, 14 Feb 2024 14:17:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jtVrrUIk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54BBF10E28F
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Feb 2024 14:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707920275; x=1739456275;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kco9IdUK0fIaVvrKSSLGhnmaomkIrCQfao91BRcJg88=;
 b=jtVrrUIkonhNh41Ysx9mfZOXFsNk4ePetwfO0FMZ5J4B4aNpTlBcgHiy
 h/8b2jHAMxzfM9k5zP+A2mIuv9WD3nUfFjHeZ3B8bkTGjI4uuhD3m4pni
 DYCoc/W7N/5gdff+mEdjgTwHYKU1ungozpn9Vu1zq5WDrP67gijhy/MZe
 f2AI9YQJWHkCYlQVt610AvYs3qJrI5IA/9CDZvqltAhrqv3huKRilojOY
 UOKPNMlWJiquWYZBIV6jNksafOCKHMEkU9J1AegevwB4LsfaZLQn3w+Uh
 YvlHybI1h3fWp48PKRZ+mBvQC+XB6jUTowtXcSSfdqGg6CQq2w8o4JgcZ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="5783806"
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="5783806"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2024 06:17:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="3552293"
Received: from mkuoppal-desk.fi.intel.com ([10.237.72.193])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2024 06:17:52 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: [PATCH 2/2] drm/xe: RFC Deny unbinds if uapi ufence pending
Date: Wed, 14 Feb 2024 16:12:17 +0200
Message-Id: <20240214141217.361122-2-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240214141217.361122-1-mika.kuoppala@linux.intel.com>
References: <20240214141217.361122-1-mika.kuoppala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

If user fence was provided for MAP in vm_bind_ioctl
and it has still not been signalled, deny UNMAP of said
vma with EBUSY as long as unsignalled fence exists.

This guarantees that MAP vs UNMAP sequences won't
escape under the radar if we ever want to track the
client's state wrt to completed and accessible MAPs.
By means of intercepting the ufence release signalling.

Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1159
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c       | 22 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm_types.h |  7 +++++++
 2 files changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 836a6e849cda8..c26297568e697 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -897,6 +897,11 @@ static void xe_vma_destroy_late(struct xe_vma *vma)
 	struct xe_device *xe = vm->xe;
 	bool read_only = xe_vma_read_only(vma);
 
+	if (vma->ufence) {
+		xe_sync_ufence_put(vma->ufence);
+		vma->ufence = NULL;
+	}
+
 	if (xe_vma_is_userptr(vma)) {
 		struct xe_userptr *userptr = &to_userptr_vma(vma)->userptr;
 
@@ -1608,6 +1613,16 @@ xe_vm_unbind_vma(struct xe_vma *vma, struct xe_exec_queue *q,
 
 	trace_xe_vma_unbind(vma);
 
+	if (vma->ufence) {
+		struct xe_user_fence * const f = vma->ufence;
+
+		if (!xe_sync_ufence_get_status(f))
+			return ERR_PTR(-EBUSY);
+
+		vma->ufence = NULL;
+		xe_sync_ufence_put(f);
+	}
+
 	if (number_tiles > 1) {
 		fences = kmalloc_array(number_tiles, sizeof(*fences),
 				       GFP_KERNEL);
@@ -1751,6 +1766,13 @@ static int __xe_vm_bind(struct xe_vm *vm, struct xe_vma *vma,
 
 	xe_vm_assert_held(vm);
 
+	if (num_syncs == 1 && xe_sync_is_ufence(&syncs[0])) {
+		if (XE_WARN_ON(vma->ufence))
+			xe_sync_ufence_put(vma->ufence);
+
+		vma->ufence = xe_sync_ufence_get(&syncs[0]);
+	}
+
 	if (immediate) {
 		fence = xe_vm_bind_vma(vma, q, syncs, num_syncs, first_op,
 				       last_op);
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 5ac9c5bebabc3..4a06420b941ea 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -19,6 +19,7 @@
 
 struct xe_bo;
 struct xe_sync_entry;
+struct xe_user_fence;
 struct xe_vm;
 
 #define XE_VMA_READ_ONLY	DRM_GPUVA_USERBITS
@@ -102,6 +103,12 @@ struct xe_vma {
 	 * @pat_index: The pat index to use when encoding the PTEs for this vma.
 	 */
 	u16 pat_index;
+
+	/**
+	 * @ufence: The user fence that was provided with MAP.
+	 * Needs to be signalled before UNMAP can be processed.
+	 */
+	struct xe_user_fence *ufence;
 };
 
 /**
-- 
2.34.1

