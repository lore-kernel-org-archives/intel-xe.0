Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27ADBCEACDC
	for <intel-xe@archiver.kernel.org>; Tue,  1 Oct 2024 14:53:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2CA910E644;
	Tue,  1 Oct 2024 14:53:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WnBi0BZC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6A9C10E644
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Oct 2024 14:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727794430; x=1759330430;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GWHlnIgj+vGsN9kmFVSM647H50tFuhV4/7uWRcu5ICc=;
 b=WnBi0BZCJmVgdP6HiNGL4ge8xazX1U1ZjT21UttlsZKWaAzN/ZEogGll
 crNbCF6ULnIsN5gT1U9TuGAbXDdxa4XawcZ+hz/P3s5pfY9GQCVM5WMx7
 TbwF9MuPO8mhTMAd+Iy4PY0elqBd537VD69kI+Qh/9MwY7GFWaSaFH1td
 w56+7MYMgnQRjCtSEbR496zebPRWuck21JGTkKP+X1cdUgwEZkEBpvoiY
 d1pC66ban+GFGYZqzLHHw4XRhBnGEOVZIVzo5fxSMcRxJvF/v/osA0F0e
 uKU/fuTCRiyWD5eZ9XaxAWtMTpsrTC36zrtO9qpoY16tCYhnnWbB+ez8y g==;
X-CSE-ConnectionGUID: pIh8ZT8/TJqZqtqdmse+cQ==
X-CSE-MsgGUID: nBqmPeRrTTGBBnUk4K8A+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="27091413"
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; d="scan'208";a="27091413"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2024 07:53:50 -0700
X-CSE-ConnectionGUID: JgqeDm5+QnusYn6NNVzcXQ==
X-CSE-MsgGUID: dMvoiM3dS/ms2Z50IgX1LA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; d="scan'208";a="97048726"
Received: from mkuoppal-desk.fi.intel.com ([10.237.72.193])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2024 07:53:48 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: [PATCH 12/18] drm/xe/eudebug: implement userptr_vma access
Date: Tue,  1 Oct 2024 17:43:00 +0300
Message-Id: <20241001144306.1991001-13-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241001144306.1991001-1-mika.kuoppala@linux.intel.com>
References: <20241001144306.1991001-1-mika.kuoppala@linux.intel.com>
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

From: Andrzej Hajda <andrzej.hajda@intel.com>

Debugger needs to read/write program's vmas including userptr_vma.
Since hmm_range_fault is used to pin userptr vmas, it is possible
to map those vmas from debugger context.

v2: pin pages vs notifier, move to vm.c (Matthew)

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/xe/xe_eudebug.c |  2 +-
 drivers/gpu/drm/xe/xe_vm.c      | 47 +++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm.h      |  3 +++
 3 files changed, 51 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
index edad6d533d0b..b09d7414cfe3 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.c
+++ b/drivers/gpu/drm/xe/xe_eudebug.c
@@ -3023,7 +3023,7 @@ static int xe_eudebug_vma_access(struct xe_vma *vma, u64 offset,
 		return ret;
 	}
 
-	return -EINVAL;
+	return xe_uvma_access(to_userptr_vma(vma), offset, buf, bytes, write);
 }
 
 static int xe_eudebug_vm_access(struct xe_vm *vm, u64 offset,
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index a836dfc5a86f..5f891e76993b 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3421,3 +3421,50 @@ void xe_vm_snapshot_free(struct xe_vm_snapshot *snap)
 	}
 	kvfree(snap);
 }
+
+int xe_uvma_access(struct xe_userptr_vma *uvma, u64 offset,
+		   void *buf, u64 len, bool write)
+{
+	struct xe_vm *vm = xe_vma_vm(&uvma->vma);
+	struct xe_userptr *up = &uvma->userptr;
+	struct xe_res_cursor cur = {};
+	int cur_len, ret = 0;
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
+	for (xe_res_first_sg(up->sg, offset, len, &cur); cur.remaining;
+	     xe_res_next(&cur, cur_len)) {
+		void *ptr = kmap_local_page(sg_page(cur.sgl)) + cur.start;
+
+		cur_len = min(cur.size, cur.remaining);
+		if (write)
+			memcpy(ptr, buf, cur_len);
+		else
+			memcpy(buf, ptr, cur_len);
+		kunmap_local(ptr);
+		buf += cur_len;
+	}
+	ret = len;
+
+out_unlock_notifier:
+	up_read(&vm->userptr.notifier_lock);
+	return ret;
+}
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index c864dba35e1d..99b9a9b011de 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -281,3 +281,6 @@ struct xe_vm_snapshot *xe_vm_snapshot_capture(struct xe_vm *vm);
 void xe_vm_snapshot_capture_delayed(struct xe_vm_snapshot *snap);
 void xe_vm_snapshot_print(struct xe_vm_snapshot *snap, struct drm_printer *p);
 void xe_vm_snapshot_free(struct xe_vm_snapshot *snap);
+
+int xe_uvma_access(struct xe_userptr_vma *uvma, u64 offset,
+		   void *buf, u64 len, bool write);
-- 
2.34.1

