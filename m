Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27BD2CD13D2
	for <intel-xe@archiver.kernel.org>; Thu, 30 Apr 2026 10:52:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE21A10F2E3;
	Thu, 30 Apr 2026 10:52:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XCyFS+fT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 601C310F2E3
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Apr 2026 10:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777546379; x=1809082379;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WdT1psVbIkhR/KNpPftsbAwlbKsM/q6qFs+i2DhMZfE=;
 b=XCyFS+fTuQtkcLxwzhBjAFogmisAyA1DBQ0me+/ZHkFN6sQksPLkPeN6
 NHW82VmwJq2ZEISKA3I6B/1ktFdG8xGbFZUB7ggUJy9legr+gZsXlsOBo
 EDXizQLs0kA4qfRA54OOO0zPSRsk65YZ0yMBdWcw3dWEF4ZO+PN/LW5f1
 F6xrq1NYwY1129BQ0GL3cJ1ggjGCOkErIcVNIvxYrqEgM2Sx0gFz8Qr/c
 v62Cm3kFrcO5lYVLo/FCVHHsE4ItM8EOJlGwU+4m6v1uB6c37GtcMr665
 8cuNSmD53vHcqzcf46zeN8M9+l2LELG7/LNZCRopHB+XbPKVNj4axYJY6 Q==;
X-CSE-ConnectionGUID: jyf+rIknSxu+zR2EC4hsLQ==
X-CSE-MsgGUID: wQA0Te0XRhKeezWM6bBXYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="89585972"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; d="scan'208";a="89585972"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 03:52:58 -0700
X-CSE-ConnectionGUID: ey112MeNSJmzIb8rldXwJA==
X-CSE-MsgGUID: nJpwJ8FATcaxVkVPhaJgRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; d="scan'208";a="233518777"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO
 mkuoppal-desk.home.arpa) ([10.245.250.15])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 03:52:53 -0700
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
Subject: [PATCH 12/24] drm/xe/eudebug: userptr vm pread/pwrite
Date: Thu, 30 Apr 2026 13:51:08 +0300
Message-ID: <20260430105121.712843-13-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260430105121.712843-1-mika.kuoppala@linux.intel.com>
References: <20260430105121.712843-1-mika.kuoppala@linux.intel.com>
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

When bind is done, take ref to current task so that
we know from which vm the address was bound. Then during
debugger pread/pwrite we use this target task as
parameter to access the debuggee vm with access_process_vm().

This is based on suggestions from Simona, Thomas and Joonas.

v2: need to add offset into vma (Dominik)
v3: move code into xe_userptr.c (Mika)

Cc: Simona Vetter <simona@ffwll.ch>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_eudebug_vm.c | 16 +++++++++++++++
 drivers/gpu/drm/xe/xe_userptr.c    |  4 ++++
 drivers/gpu/drm/xe/xe_userptr.h    | 32 ++++++++++++++++++++++++++++++
 3 files changed, 52 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_eudebug_vm.c b/drivers/gpu/drm/xe/xe_eudebug_vm.c
index dd75227555ee..8485397cf9c6 100644
--- a/drivers/gpu/drm/xe/xe_eudebug_vm.c
+++ b/drivers/gpu/drm/xe/xe_eudebug_vm.c
@@ -51,6 +51,22 @@ static int xe_eudebug_vma_access(struct xe_vma *vma,
 		xe_bo_put(bo);
 
 		return ret;
+	} else if (xe_vma_is_userptr(vma)) {
+		struct xe_userptr *userptr = &to_userptr_vma(vma)->userptr;
+
+		if (XE_WARN_ON(!userptr->eudebug.task))
+			return -EINVAL;
+
+		/*
+		 * access_remote_vm() would fit as userptr notifier has
+		 * mm ref so we would not need to carry task ref at all.
+		 * But access_remote_vm is not exported. access_process_vm()
+		 * is exported so use it instead.
+		 */
+		return access_process_vm(userptr->eudebug.task,
+					 xe_vma_userptr(vma) + offset_in_vma,
+					 buf, bytes,
+					 write ? FOLL_WRITE : 0);
 	}
 
 	return -EINVAL;
diff --git a/drivers/gpu/drm/xe/xe_userptr.c b/drivers/gpu/drm/xe/xe_userptr.c
index 6761005c0b90..ce7f30d2ccee 100644
--- a/drivers/gpu/drm/xe/xe_userptr.c
+++ b/drivers/gpu/drm/xe/xe_userptr.c
@@ -403,6 +403,8 @@ int xe_userptr_setup(struct xe_userptr_vma *uvma, unsigned long start,
 
 	userptr->pages.notifier_seq = LONG_MAX;
 
+	xe_eudebug_track_userptr_task(userptr);
+
 	return 0;
 }
 
@@ -411,6 +413,8 @@ void xe_userptr_remove(struct xe_userptr_vma *uvma)
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
2.43.0

