Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FB4EC4829E
	for <intel-xe@archiver.kernel.org>; Thu, 15 Feb 2024 18:17:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3789C10E91A;
	Thu, 15 Feb 2024 18:17:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NkwXkn/n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5837E10E91A
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Feb 2024 18:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708021047; x=1739557047;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jJYrxWpGYcYyeo7Am9zluJuQ6XjbkeSMwTZmTPyBWFI=;
 b=NkwXkn/nSugFBKiZHBS18MnwKGqAhvMJqayeCSW0/0tvnm2bq+ICdn9O
 1h2BPYOeU/a8IvZWifukVvmpW3PJaHW8Bt3Np49AC0NdVIevOnRh9mihM
 1illghK/4vOL9h7QsBNYAvyf2fSA6WgcD/1VVh5yGKCYxXG/01ordP+mH
 Tpzn42Ki/0+EM9aPDl6OOXo1Jtf4tmQnZUvpjrKOS4GCrHPw/xi2Uom0E
 964qqi103vbJUGY7yKSufxLpMPAr1fLe1WtCaaWERkXbpp/A5ozV7kKe+
 2Y2ohrW3sF4415/S5e0RyaeIUH+qBhBjubJBHvakY2zgk38A7e0UIDvrd g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="13528587"
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; d="scan'208";a="13528587"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 10:17:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; d="scan'208";a="34408187"
Received: from mkuoppal-desk.fi.intel.com ([10.237.72.193])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 10:17:24 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: [PATCH 2/2] drm/xe: Deny unbinds if uapi ufence pending
Date: Thu, 15 Feb 2024 20:11:52 +0200
Message-Id: <20240215181152.450082-3-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240215181152.450082-1-mika.kuoppala@linux.intel.com>
References: <20240215181152.450082-1-mika.kuoppala@linux.intel.com>
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
v3: careful on clearing vma ufence (Matt)

Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1159
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c       | 37 ++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm_types.h |  7 ++++++
 2 files changed, 44 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 836a6e849cda8..f72c8bca35277 100644
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
@@ -1748,9 +1778,16 @@ static int __xe_vm_bind(struct xe_vm *vm, struct xe_vma *vma,
 {
 	struct dma_fence *fence;
 	struct xe_exec_queue *wait_exec_queue = to_wait_exec_queue(vm, q);
+	struct xe_user_fence *ufence;
 
 	xe_vm_assert_held(vm);
 
+	ufence = find_ufence_get(syncs, num_syncs);
+	if (vma->ufence && ufence)
+		xe_sync_ufence_put(vma->ufence);
+
+	vma->ufence = ufence ?: vma->ufence;
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

