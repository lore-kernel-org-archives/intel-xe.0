Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 564CFCFD2F6
	for <intel-xe@archiver.kernel.org>; Tue,  2 Dec 2025 13:53:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E45B10E651;
	Tue,  2 Dec 2025 13:53:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bgO1zeeE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8174D10E651
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Dec 2025 13:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764683615; x=1796219615;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Rn1/zsJwFaewCg7XyXmzZruAWDdWzvOR1IEaR5DE+vw=;
 b=bgO1zeeEAhHhAHcCGlfImy0DanAzMb2Mxmv7stFzbrkJNeqRM+Ni4ZIk
 +VUmrq9iqFR+e1klBUzo/z6ls0BC/QS2NofdRSiPVUIZyF74jy7NE6mce
 xerkshqk+FacVnYcJKGlxMljftUR7ihnMjoOdouJqKhYerlTnFHgWyFo+
 J9+jP4cuyaKWGfBYjkHYvI77q+3gL/3sZTvqb8yZUDhFtBOOlJu7WPcV3
 NSeLaqfw07bY+YuuDlgb8Ce4EGqDBZmhxEEYGzo5wystRua273zAPmKlk
 mdt2TFU1fkOZriuOrsSch27nfq/l8vV4ir/Bz2TByIHF8H7VDk3McfG2a w==;
X-CSE-ConnectionGUID: M+5L4l69SJSu7rzU47g7og==
X-CSE-MsgGUID: 9zn9ieTVQhOHd+TNhIuafQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66537086"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="66537086"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 05:53:35 -0800
X-CSE-ConnectionGUID: LMPP4M3iRiadFc7M19iRWg==
X-CSE-MsgGUID: cUtH596aThmUfC9FkqK8BQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="199505690"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO mkuoppal-desk.lan)
 ([10.245.246.189])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 05:53:31 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: simona.vetter@ffwll.ch, matthew.brost@intel.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, joonas.lahtinen@linux.intel.com,
 christoph.manszewski@intel.com, rodrigo.vivi@intel.com,
 andrzej.hajda@intel.com, matthew.auld@intel.com,
 maciej.patelczyk@intel.com, gwan-gyeong.mun@intel.com,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Simona Vetter <simona@ffwll.ch>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Subject: [PATCH 10/20] drm/xe/eudebug: userptr vm pread/pwrite
Date: Tue,  2 Dec 2025 15:52:29 +0200
Message-ID: <20251202135241.880267-11-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251202135241.880267-1-mika.kuoppala@linux.intel.com>
References: <20251202135241.880267-1-mika.kuoppala@linux.intel.com>
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
index 4dd747680a9c..6d341bae4ffc 100644
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
index 0d9130b1958a..96f8ae352c18 100644
--- a/drivers/gpu/drm/xe/xe_userptr.c
+++ b/drivers/gpu/drm/xe/xe_userptr.c
@@ -292,6 +292,8 @@ int xe_userptr_setup(struct xe_userptr_vma *uvma, unsigned long start,
 
 	userptr->pages.notifier_seq = LONG_MAX;
 
+	xe_eudebug_track_userptr_task(userptr);
+
 	return 0;
 }
 
@@ -300,6 +302,8 @@ void xe_userptr_remove(struct xe_userptr_vma *uvma)
 	struct xe_vm *vm = xe_vma_vm(&uvma->vma);
 	struct xe_userptr *userptr = &uvma->userptr;
 
+	xe_eudebug_untrack_userptr_task(userptr);
+
 	drm_gpusvm_free_pages(&vm->svm.gpusvm, &uvma->userptr.pages,
 			      xe_vma_size(&uvma->vma) >> PAGE_SHIFT);
 
diff --git a/drivers/gpu/drm/xe/xe_userptr.h b/drivers/gpu/drm/xe/xe_userptr.h
index ef801234991e..4af2569f1fa1 100644
--- a/drivers/gpu/drm/xe/xe_userptr.h
+++ b/drivers/gpu/drm/xe/xe_userptr.h
@@ -66,6 +66,12 @@ struct xe_userptr {
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
@@ -104,4 +110,30 @@ static inline void xe_vma_userptr_force_invalidate(struct xe_userptr_vma *uvma)
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

