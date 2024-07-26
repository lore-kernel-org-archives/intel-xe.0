Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E28C7C3DA4A
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jul 2024 14:17:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6DF010E9B0;
	Fri, 26 Jul 2024 14:17:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IxGMe2+L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5592E10E9A8
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jul 2024 14:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722003458; x=1753539458;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7D8w6YGimfTA7MBCOYv0ds+b6DOtMduiQJ7NR0H1XJo=;
 b=IxGMe2+LKnWZEUHjxlU13OJjcuOcALK4yaiQIULSSqszdTNUqzNHBNjQ
 celH7k6G/r7h4JKYR7lMuOvyHPVXJ7f50jAqKQkNg8+4U7vhUL+yrU72c
 mHO0+tkYhazxR2PTDPqK9MTzflSjRcoosMNBqrPutFTgNHoO/1vOs22yD
 hr0+l1DWEzaSgpQ4aDLbf/OFzbWBbI27l7k1eTbLnlysTg9FpFmDHvkNM
 ps99ZHfY3C6gYIPmxIr6bznn8SoA782qVc0ggnfSigxsxUPiQrHLKSked
 GhryJDWp/rpPMj69zweH80q9qAyK1NcIVIW/L04O4L5+4bIC/10WPamF5 A==;
X-CSE-ConnectionGUID: 0FHgKQ5gSgOzq1X+qX4mSg==
X-CSE-MsgGUID: HY1L9KgWQWaPv8PJCLhF0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11145"; a="23598774"
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; d="scan'208";a="23598774"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 07:17:38 -0700
X-CSE-ConnectionGUID: Bm1MT9bqQ1KU6dL87VV+Qg==
X-CSE-MsgGUID: FBV8yAbiRjeturOA8a5hNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; d="scan'208";a="57861441"
Received: from mkuoppal-desk.fi.intel.com ([10.237.72.193])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 07:17:36 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH 15/21] drm/xe/eudebug: implement userptr_vma access
Date: Fri, 26 Jul 2024 17:08:12 +0300
Message-Id: <20240726140818.54304-16-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240726140818.54304-1-mika.kuoppala@linux.intel.com>
References: <20240726140818.54304-1-mika.kuoppala@linux.intel.com>
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

v2: kmap to kmap_local (Maciej)

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_eudebug.c | 56 ++++++++++++++++++++++++++++++++-
 1 file changed, 55 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
index aa383accc468..947331c19f43 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.c
+++ b/drivers/gpu/drm/xe/xe_eudebug.c
@@ -33,6 +33,7 @@
 #include "xe_mmio.h"
 #include "xe_module.h"
 #include "xe_pm.h"
+#include "xe_res_cursor.h"
 #include "xe_rtp.h"
 #include "xe_sched_job.h"
 #include "xe_vm.h"
@@ -2852,6 +2853,58 @@ static void discovery_work_fn(struct work_struct *work)
 	xe_eudebug_put(d);
 }
 
+static int xe_eudebug_uvma_access(struct xe_userptr_vma *uvma, u64 offset,
+				  void *buf, u64 len, bool write)
+{
+	struct xe_vm *vm = xe_vma_vm(&uvma->vma);
+	struct xe_userptr *up = &uvma->userptr;
+	struct xe_res_cursor cur = {};
+	int cur_len, ret = 0;
+
+	/* lock notifier in non-invalidation state */
+	for (unsigned long nseq = uvma->userptr.notifier_seq; true;
+	     nseq = mmu_interval_read_begin(&uvma->userptr.notifier)) {
+		down_read(&vm->userptr.notifier_lock);
+		if (!mmu_interval_read_retry(&uvma->userptr.notifier, nseq))
+			break;
+		up_read(&vm->userptr.notifier_lock);
+	}
+
+	/* re-pin if necessary */
+	if (xe_vma_userptr_check_repin(uvma)) {
+		spin_lock(&vm->userptr.invalidated_lock);
+		list_del_init(&uvma->userptr.invalidate_link);
+		spin_unlock(&vm->userptr.invalidated_lock);
+
+		ret = xe_vma_userptr_pin_pages(uvma);
+		if (ret)
+			goto out_unlock_notifier;
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
+
 static int xe_eudebug_bovma_access(struct xe_bo *bo, u64 offset,
 				   void *buf, u64 len, bool write)
 {
@@ -2895,7 +2948,8 @@ static int xe_eudebug_vma_access(struct xe_vma *vma, u64 offset,
 	if (bo)
 		return xe_eudebug_bovma_access(bo, offset, buf, bytes, write);
 
-	return -EOPNOTSUPP;
+	return xe_eudebug_uvma_access(to_userptr_vma(vma), offset,
+				      buf, bytes, write);
 }
 
 static int xe_eudebug_vm_access(struct xe_vm *vm, u64 offset,
-- 
2.34.1

