Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB515D0E6DA
	for <intel-xe@archiver.kernel.org>; Mon, 21 Oct 2024 09:59:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F01610E47A;
	Mon, 21 Oct 2024 09:59:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wkt/eqM1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D080F10E47A
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Oct 2024 09:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729504790; x=1761040790;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=P+ArS7ppnKeB8rZFJ5dvDLtdhlqkFxj20FifDbmusV4=;
 b=Wkt/eqM1jRTtmRXnpWWSSpI5fH8wkfmOeCQ7AEtKWhPe7flOgi1mcYgx
 Bh31w53QmPhapDVkyrYgEt1ql+ypfGdt1IPPAsZcKJkotxqWz+TMqYBfZ
 xyiIuYA0xGX/5Me/so05CycaIIK8jtRvLdLwNtIkq3M/w/dPXU1orJxxo
 X44GZO/ee+csmYPYNe9brV08Bv30LD2DQQLVSi+NztdMMCsdo7lneI7s/
 /J6NL2oTkvbo/w1tfcGWNNwDgU3dKGcqSUwr8fZB60fQpW0W+SPyTtgde
 dNaf6ebQ7nHv1Hk1SdU/PmvkMW7OI+efcQz6pDw6IWTKxUzAl1I6V0a9w w==;
X-CSE-ConnectionGUID: n4vl+Y1AR2CdqnXFalqD0Q==
X-CSE-MsgGUID: yEcephD8QNeKd7EjTnpspw==
X-IronPort-AV: E=McAfee;i="6700,10204,11231"; a="40350827"
X-IronPort-AV: E=Sophos;i="6.11,220,1725346800"; d="scan'208";a="40350827"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 02:59:50 -0700
X-CSE-ConnectionGUID: l2vsGnylRJ+C35Rvk/1iNw==
X-CSE-MsgGUID: g5uyY0EYSdyVqq/xbOI5Kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,220,1725346800"; d="scan'208";a="84546151"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO rapter.intel.com)
 ([10.245.246.221])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 02:59:46 -0700
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: nirmoy.das@intel.com, matthew.brost@intel.com, stuart.summers@intel.com,
 christoph.manszewski@intel.com, mika.kuoppala@linux.intel.com,
 dominik.grzegorzek@intel.com, andrzej.hajda@intel.com,
 maciej.patelczyk@intel.com
Subject: [RFC 12/19] drm/xe/eudebug: implement userptr_vma access
Date: Mon, 21 Oct 2024 12:58:51 +0300
Message-ID: <20241021095904.439555-13-gwan-gyeong.mun@intel.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241021095904.439555-1-gwan-gyeong.mun@intel.com>
References: <20241021095904.439555-1-gwan-gyeong.mun@intel.com>
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
Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
---
 drivers/gpu/drm/xe/xe_eudebug.c |  2 +-
 drivers/gpu/drm/xe/xe_vm.c      | 47 +++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm.h      |  3 +++
 3 files changed, 51 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
index 309358b575d6..9802347258d0 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.c
+++ b/drivers/gpu/drm/xe/xe_eudebug.c
@@ -3024,7 +3024,7 @@ static int xe_eudebug_vma_access(struct xe_vma *vma, u64 offset,
 		return ret;
 	}
 
-	return -EINVAL;
+	return xe_uvma_access(to_userptr_vma(vma), offset, buf, bytes, write);
 }
 
 static int xe_eudebug_vm_access(struct xe_vm *vm, u64 offset,
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index dad407840379..69fe582d6517 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3417,3 +3417,50 @@ void xe_vm_snapshot_free(struct xe_vm_snapshot *snap)
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
2.46.1

