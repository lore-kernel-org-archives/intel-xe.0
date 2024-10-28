Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B1D2D33998
	for <intel-xe@archiver.kernel.org>; Mon, 28 Oct 2024 16:20:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E40D10E0E1;
	Mon, 28 Oct 2024 16:20:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kYZV5FAJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B08710E4FF
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Oct 2024 16:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730132389; x=1761668389;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Xv+qMys0sSkTVueXGT31UKTSphumaoeOg9qoadqpHO0=;
 b=kYZV5FAJ+hY9bjCITjrx0xtB2FTqBQ/cG4UqbtRiRkvz0dkSPSe+CKkn
 l7/g/t/WgmZj3UnOYBpe0nNwuALUqYrCeA1D7dxOtM92W4FJMjUGtQ1n2
 7gXsv2yFNFg2wjDPkjaBR23jBsjSK4pChZTYpD2tqDXRK0v8iWgB93Z0m
 saWUmi7cfqkkkoMiGA/OtkFoRVh7ammWRa2iwjd4DEAscd2fJAt+Y9AkF
 wZmm8swXK2B5Tam7zskyg1SYNYJ8WvbL5oKYFICvX8VX2O9TJNP44l99f
 uHPgrbSVPgS5JC6d1vrsfaac8dOsNVMRmv8yRN/2XNxfPKomr9dFf2Yuf Q==;
X-CSE-ConnectionGUID: Yah8G6hbSQ6A5ndru3//rQ==
X-CSE-MsgGUID: Vhqh2l3RRmqRnymY+jlZ6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29699296"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="29699296"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2024 09:19:49 -0700
X-CSE-ConnectionGUID: PzN8EhmPQmWWvPJIcNuufQ==
X-CSE-MsgGUID: VY79FDJvSeWmOyJpKa2w0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,239,1725346800"; d="scan'208";a="104983934"
Received: from lab-ah.igk.intel.com ([10.102.138.202])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2024 09:19:46 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, intel-xe@lists.freedesktop.org,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: [PATCH 2/2] drm/xe/eudebug: implement userptr_vma access
Date: Mon, 28 Oct 2024 17:19:27 +0100
Message-Id: <20241028161927.1157426-2-andrzej.hajda@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <ZxviLOv75ISykjK8@DUT025-TGLU.fm.intel.com>
References: <ZxviLOv75ISykjK8@DUT025-TGLU.fm.intel.com>
MIME-Version: 1.0
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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

Debugger needs to read/write program's vmas including userptr_vma.
Since hmm_range_fault is used to pin userptr vmas, it is possible
to map those vmas from debugger context.

v2: pin pages vs notifier, move to vm.c (Matthew)
v3: - iterate over system pages instead of DMA, fixes work with iommu enabled
    - s/xe_uvma_access/xe_vm_uvma_access/ (Matt)
v4: use xe_userptr->pages, instead of sg to access pages (Matt)

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 drivers/gpu/drm/xe/xe_eudebug.c |  2 +-
 drivers/gpu/drm/xe/xe_vm.c      | 52 +++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm.h      |  3 ++
 3 files changed, 56 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
index 1bff0a2cfaa1..569c8d0b2ef8 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.c
+++ b/drivers/gpu/drm/xe/xe_eudebug.c
@@ -3049,7 +3049,7 @@ static int xe_eudebug_vma_access(struct xe_vma *vma, u64 offset,
 		return ret;
 	}
 
-	return -EINVAL;
+	return xe_vm_userptr_access(to_userptr_vma(vma), offset, buf, bytes, write);
 }
 
 static int xe_eudebug_vm_access(struct xe_vm *vm, u64 offset,
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index e76a6df1eba1..8fd9eed41fe1 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3412,3 +3412,55 @@ void xe_vm_snapshot_free(struct xe_vm_snapshot *snap)
 	}
 	kvfree(snap);
 }
+
+int xe_vm_userptr_access(struct xe_userptr_vma *uvma, u64 offset,
+			 void *buf, u64 len, bool write)
+{
+	struct xe_vm *vm = xe_vma_vm(&uvma->vma);
+	struct xe_userptr *up = &uvma->userptr;
+	struct page **page;
+	u64 left = len;
+	int ret = 0;
+
+	while (true) {
+		down_read(&vm->userptr.notifier_lock);
+		if (!xe_vma_userptr_check_repin(uvma))
+			break;
+
+		spin_lock(&vm->userptr.invalidated_lock);
+		list_del_init(&uvma->userptr.invalidate_link);
+		spin_unlock(&vm->userptr.invalidated_lock);
+
+		up_read(&vm->userptr.notifier_lock);
+		ret = xe_vma_userptr_pin_pages(uvma);
+		if (ret)
+			return ret;
+	}
+
+	if (!up->sg) {
+		ret = -EINVAL;
+		goto out_unlock_notifier;
+	}
+
+	page = &up->pages[offset >> PAGE_SHIFT];
+	offset &= ~PAGE_MASK;
+	for (;left > 0; ++page) {
+		u64 cur_len = min(PAGE_SIZE - offset, left);
+		void *ptr = kmap_local_page(page[0]);
+
+		if (write)
+			memcpy(ptr + offset, buf, cur_len);
+		else
+			memcpy(buf, ptr + offset, cur_len);
+		kunmap_local(ptr);
+		buf += cur_len;
+		left -= cur_len;
+		offset = 0;
+	}
+
+	ret = len;
+
+out_unlock_notifier:
+	up_read(&vm->userptr.notifier_lock);
+	return ret;
+}
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index c864dba35e1d..165eab494d59 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -281,3 +281,6 @@ struct xe_vm_snapshot *xe_vm_snapshot_capture(struct xe_vm *vm);
 void xe_vm_snapshot_capture_delayed(struct xe_vm_snapshot *snap);
 void xe_vm_snapshot_print(struct xe_vm_snapshot *snap, struct drm_printer *p);
 void xe_vm_snapshot_free(struct xe_vm_snapshot *snap);
+
+int xe_vm_userptr_access(struct xe_userptr_vma *uvma, u64 offset,
+			 void *buf, u64 len, bool write);
-- 
2.34.1

