Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C46AC4829E
	for <intel-xe@archiver.kernel.org>; Thu, 15 Feb 2024 16:45:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E21AF10E9E5;
	Thu, 15 Feb 2024 16:45:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QKdaPn1v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1793610E9E5
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Feb 2024 16:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708015557; x=1739551557;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NUv9TiRsPmWityANYn3hi4rUdOeN8o6bFSejpKcCFQA=;
 b=QKdaPn1vDbm+yQt61dX901wL8rszTjVsc6Tb6j09n0gjSdhS9S2zrMMJ
 3lmyuqVAp4gI8xb3JONaiLlpjJPwEtYKQFpAI3uKuMUGJlv23eiP0dzM/
 5rGhBGhsVc1HMLcB1T2DID2xaLj/84sH3ip0z2sbcOkRJJ8yTSk+v2a12
 Ix+fpMiTaaT5ckApB5hPXH7bvgg6I2L/g0TZWxZ6fN/qTZhYVigyP9HUB
 SHENshLmUCVHOvSu6PGknHQDurFLVvHTOAjBR1tjSkejRj+mv9+rCTEOE
 d6mV+CQo0Ea4FSwdk0DXizWvneDGRDGelA0LWp5xU0re9L51aOTOSYB6a A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="12742424"
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; d="scan'208";a="12742424"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 08:45:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; 
   d="scan'208";a="3508354"
Received: from mkuoppal-desk.fi.intel.com ([10.237.72.193])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 08:45:55 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: [PATCH 2/2] drm/xe: Deny unbinds if uapi ufence pending
Date: Thu, 15 Feb 2024 18:40:21 +0200
Message-Id: <20240215164021.438913-3-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240215164021.438913-1-mika.kuoppala@linux.intel.com>
References: <20240215164021.438913-1-mika.kuoppala@linux.intel.com>
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

v2: find ufence with num_fences > 1 (Matt)

Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1159
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c       | 35 ++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm_types.h |  7 +++++++
 2 files changed, 42 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 836a6e849cda8..e9559aa80dc8b 100644
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
@@ -1741,6 +1756,21 @@ xe_vm_bind_vma(struct xe_vma *vma, struct xe_exec_queue *q,
 	return ERR_PTR(err);
 }
 
+static struct xe_user_fence *
+find_ufence_get(struct xe_sync_entry *syncs, u32 num_syncs)
+{
+	unsigned int i;
+
+	for (i = 0; i < num_syncs; i++) {
+		struct xe_sync_entry *e = &syncs[i];
+
+		if (xe_sync_is_ufence(e))
+			return xe_sync_ufence_get(e);
+	}
+
+	return NULL;
+}
+
 static int __xe_vm_bind(struct xe_vm *vm, struct xe_vma *vma,
 			struct xe_exec_queue *q, struct xe_sync_entry *syncs,
 			u32 num_syncs, bool immediate, bool first_op,
@@ -1751,6 +1781,11 @@ static int __xe_vm_bind(struct xe_vm *vm, struct xe_vma *vma,
 
 	xe_vm_assert_held(vm);
 
+	if (vma->ufence)
+		xe_sync_ufence_put(vma->ufence);
+
+	vma->ufence = find_ufence_get(syncs, num_syncs);
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

