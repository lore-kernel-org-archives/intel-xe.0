Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 701B9C3DA4A
	for <intel-xe@archiver.kernel.org>; Mon,  5 Aug 2024 16:54:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C27F10E1E9;
	Mon,  5 Aug 2024 16:54:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SbOZwHFk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5B8510E1E9
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Aug 2024 16:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722876871; x=1754412871;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WB3xoYDjFHzdD3R+VuSGvqCiscM5Juq6PuLmZpatDI0=;
 b=SbOZwHFkqkWnTv3g+7dtmUkdTaQ9EPcITqXlU75aMvpXSo+vc6RYhblO
 DbzedW1QDe4nti/0RaKAPP7IF+RCx1ZULf55xy6Ti/wOeEB4yttNYlxA+
 plH+0MxT4lw/7qeKwFWW6kiJemPU8CVb3Ney7ap4PZwJrV7mNZ2IeriHN
 ygzF5jLMP54HAKoxXwScsCjjyvQbArxQ6KWtR/tVaEdaOFhKVkpVxgYjS
 InSTPXVQ/H9i9aNH6zRFRGDgFz6ll6/wYxzpZKFQj1eT1kQo/s0/blEM8
 cScA8476V+o+qzCtrWlahyCZ9BDXi+BIh2xeO3tBDjZvRKvg6bYrKkZcy w==;
X-CSE-ConnectionGUID: WieXCxeyREeJ5p6nqQS0Sg==
X-CSE-MsgGUID: 8yfabR7CSyKP0/BV4O8asg==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="38359920"
X-IronPort-AV: E=Sophos;i="6.09,265,1716274800"; d="scan'208";a="38359920"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2024 09:54:30 -0700
X-CSE-ConnectionGUID: 0DHBhIX0SMauJkP4pIne8g==
X-CSE-MsgGUID: rH3eXUwURFu6EYrqMJ4sxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,265,1716274800"; d="scan'208";a="56169744"
Received: from lab-ah.igk.intel.com ([10.102.138.202])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2024 09:54:29 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
To: intel-xe@lists.freedesktop.org,
	Matthew Brost <matthew.brost@intel.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>
Subject: [PATCH v2] drm/xe/eudebug: implement userptr_vma access
Date: Mon,  5 Aug 2024 18:54:21 +0200
Message-Id: <20240805165421.3033741-1-andrzej.hajda@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <Zqp5oYGygI97UglY@DUT025-TGLU>
References: <Zqp5oYGygI97UglY@DUT025-TGLU>
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

v2: kmap to kmap_local (Maciej)
v3: simplified locking, moved to xe_vm.c (Matthew)

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_eudebug.c |  2 +-
 drivers/gpu/drm/xe/xe_vm.c      | 47 +++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm.h      |  3 +++
 3 files changed, 51 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
index 62be0879e651..baed2812438a 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.c
+++ b/drivers/gpu/drm/xe/xe_eudebug.c
@@ -2905,7 +2905,7 @@ static int xe_eudebug_vma_access(struct xe_vma *vma, u64 offset,
 	if (bo)
 		return xe_eudebug_bovma_access(bo, offset, buf, bytes, write);
 
-	return -EOPNOTSUPP;
+	return xe_uvma_access(to_userptr_vma(vma), offset, buf, bytes, write);
 }
 
 static int xe_eudebug_vm_access(struct xe_vm *vm, u64 offset,
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index b117a892e386..f1aadd5068a6 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3429,3 +3429,50 @@ void xe_vm_snapshot_free(struct xe_vm_snapshot *snap)
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

