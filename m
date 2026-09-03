Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41C6EC61DD3
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 15:01:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBD0A10F682;
	Thu,  3 Sep 2026 15:01:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kouyCla9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AD6C10E2B5
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 15:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788447667; x=1819983667;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ARfJJNv/yrNTUO/km6lC72kMQTlTqk3ytMYDYGddA0Q=;
 b=kouyCla9wjWpuTfqge7kTVcrthAeM1bHT+n8Nwo+fqh0D3TtUWymF0AW
 oWD8fwXY9HR8YYHRXXmRHdw5+tCgvPUxbZj45HhO4odSHk53dg7kyZ6fH
 lCBWT3WfV3SodU+yTP7iVV420g1pOHI3F3k1BvLDtBOfAcpL2jnIYG4X8
 4JjDX0Bk4YmGLuTw7PjFs3yciUI/+dfZP7DG7y3LA9Tc44mFke+AK/JSZ
 blSCJVXkLBCvPGqkksIQZTjuZBeJ2RRmpmCOEhrdTBXjNiTXxw6O1Az0K
 asIQQIP6UMMPmPJ7FySFEGFeQqIEDStXZAtotfFbaTYP+5hzFYuhaRKUp A==;
X-CSE-ConnectionGUID: 2/MZLvghTp2tr9N32MLEeQ==
X-CSE-MsgGUID: aKW0Rft4TzWOPiA6WomY8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="76486757"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="76486757"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 08:01:06 -0700
X-CSE-ConnectionGUID: CycGopegTES8d58se7arpQ==
X-CSE-MsgGUID: butMTfE2ShSf3LfwoQhAPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="268440951"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO
 mkuoppal-desk.intel.com) ([10.245.246.233])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 08:01:01 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: simona.vetter@ffwll.ch, matthew.brost@intel.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, joonas.lahtinen@linux.intel.com,
 gustavo.sousa@intel.com, jan.maslak@intel.com,
 dominik.karol.piatkowski@intel.com, rodrigo.vivi@intel.com,
 andrzej.hajda@intel.com, matthew.auld@intel.com,
 maciej.patelczyk@intel.com, gwan-gyeong.mun@intel.com,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Simona Vetter <simona@ffwll.ch>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Subject: [PATCH v10 13/27] drm/xe/eudebug: Add userptr vm pread/pwrite
Date: Thu,  3 Sep 2026 17:59:37 +0300
Message-ID: <20260903145952.848051-14-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260903145952.848051-1-mika.kuoppala@linux.intel.com>
References: <20260903145952.848051-1-mika.kuoppala@linux.intel.com>
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

Implement debugger vm access for userptrs.

When bind is done, take a ref to the current task so that
we know from which vm the address was bound. Then during
debugger pread/pwrite we use this target task as
parameter to access the debuggee vm with access_process_vm().

This is based on suggestions from Simona, Thomas and Joonas.

v2: need to add offset into vma (Dominik)
v3: move code into xe_userptr.c (Mika)
v4: check that task mm has not changed (Claude)

Assisted-by: Claude:claude-opus-4-8
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_eudebug_vm.c | 45 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_userptr.c    |  4 +++
 drivers/gpu/drm/xe/xe_userptr.h    | 32 +++++++++++++++++++++
 3 files changed, 81 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_eudebug_vm.c b/drivers/gpu/drm/xe/xe_eudebug_vm.c
index 316fe29586b0..42e24c1bc09c 100644
--- a/drivers/gpu/drm/xe/xe_eudebug_vm.c
+++ b/drivers/gpu/drm/xe/xe_eudebug_vm.c
@@ -7,6 +7,7 @@
 
 #include <linux/anon_inodes.h>
 #include <linux/fs.h>
+#include <linux/sched/mm.h>
 #include <linux/vmalloc.h>
 
 #include <drm/drm_drv.h>
@@ -52,6 +53,50 @@ static int xe_eudebug_vma_access(struct xe_vma *vma,
 		xe_bo_put(bo);
 
 		return ret;
+	} else if (xe_vma_is_userptr(vma)) {
+		struct xe_userptr *userptr = &to_userptr_vma(vma)->userptr;
+		struct mm_struct *mm;
+		int ret;
+
+		if (XE_WARN_ON(!userptr->eudebug.task))
+			return -EINVAL;
+
+		/*
+		 * XXX FIXME: access_remote_vm() is the preferred
+		 *
+		 * access_remote_vm() would fit as userptr notifier has
+		 * mm ref so we would not need to carry task ref at all.
+		 * But access_remote_vm is not exported. access_process_vm()
+		 * is exported so use it instead.
+		 *
+		 * Going through the task means the address space is resolved
+		 * from it on every access, and the task outlives its mm: after
+		 * an execve the same task carries a different address space,
+		 * and after the thread exits it carries none at all even
+		 * though the process and this mapping are still alive.
+		 *
+		 * Confirm the mm the userptr was bound against is still the
+		 * one the task holds, so that a replaced address space is
+		 * refused instead of handing the debugger bytes from an
+		 * unrelated program. access_process_vm() resolves the mm
+		 * again on its own, so this narrows that window rather than
+		 * closing it. Keying the access on the mm instead, with
+		 * get_user_pages_remote() on userptr->notifier.mm, would
+		 * remove the task from the picture entirely.
+		 */
+		mm = get_task_mm(userptr->eudebug.task);
+		if (!mm)
+			return -ESRCH;
+
+		ret = mm == userptr->notifier.mm ? 0 : -ESRCH;
+		mmput(mm);
+		if (ret)
+			return ret;
+
+		return access_process_vm(userptr->eudebug.task,
+					 xe_vma_userptr(vma) + offset_in_vma,
+					 buf, bytes,
+					 write ? FOLL_WRITE : 0);
 	}
 
 	return -EINVAL;
diff --git a/drivers/gpu/drm/xe/xe_userptr.c b/drivers/gpu/drm/xe/xe_userptr.c
index 90ac141fc12d..4ef078d4f4c3 100644
--- a/drivers/gpu/drm/xe/xe_userptr.c
+++ b/drivers/gpu/drm/xe/xe_userptr.c
@@ -421,6 +421,8 @@ int xe_userptr_setup(struct xe_userptr_vma *uvma, unsigned long start,
 	if (err)
 		return err;
 
+	xe_eudebug_track_userptr_task(userptr);
+
 	return 0;
 }
 
@@ -429,6 +431,8 @@ void xe_userptr_remove(struct xe_userptr_vma *uvma)
 	struct xe_vm *vm = xe_vma_vm(&uvma->vma);
 	struct xe_userptr *userptr = &uvma->userptr;
 
+	xe_eudebug_untrack_userptr_task(userptr);
+
 	drm_gpusvm_free_pages(&vm->svm.gpusvm, &uvma->userptr.pages,
 			      xe_vma_size(&uvma->vma) >> PAGE_SHIFT);
 
diff --git a/drivers/gpu/drm/xe/xe_userptr.h b/drivers/gpu/drm/xe/xe_userptr.h
index 2a3cd1b5efbb..b0781618b3f4 100644
--- a/drivers/gpu/drm/xe/xe_userptr.h
+++ b/drivers/gpu/drm/xe/xe_userptr.h
@@ -95,6 +95,12 @@ struct xe_userptr {
 #if IS_ENABLED(CONFIG_DRM_XE_USERPTR_INVAL_INJECT)
 	u32 divisor;
 #endif
+
+#if IS_ENABLED(CONFIG_DRM_XE_EUDEBUG)
+	struct {
+		struct task_struct *task;
+	} eudebug;
+#endif
 };
 
 #if IS_ENABLED(CONFIG_DRM_GPUSVM)
@@ -133,4 +139,30 @@ static inline void xe_vma_userptr_force_invalidate(struct xe_userptr_vma *uvma)
 {
 }
 #endif
+
+#if IS_ENABLED(CONFIG_DRM_XE_EUDEBUG)
+static inline void xe_eudebug_track_userptr_task(struct xe_userptr *userptr)
+{
+	/*
+	 * We could use the mm which is on notifier. But
+	 * the access_remote_vm() is not exported. Thus
+	 * we get reference to task for access_process_vm()
+	 */
+	userptr->eudebug.task = get_task_struct(current);
+}
+
+static inline void xe_eudebug_untrack_userptr_task(struct xe_userptr *userptr)
+{
+	put_task_struct(userptr->eudebug.task);
+}
+#else
+static inline void xe_eudebug_track_userptr_task(struct xe_userptr *userptr)
+{
+}
+
+static inline void xe_eudebug_untrack_userptr_task(struct xe_userptr *userptr)
+{
+}
+#endif /* CONFIG_DRM_XE_EUDEBUG */
+
 #endif
-- 
2.53.0

