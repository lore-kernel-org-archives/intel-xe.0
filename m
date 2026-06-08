Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8D3CCD8C9D
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jun 2026 16:18:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6964710F6BD;
	Mon,  8 Jun 2026 16:18:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hd3OODqv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4178110F6BD
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jun 2026 16:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780935486; x=1812471486;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dshU9SjQ1l7pKRY+EBro4UZ0pg57iNRFdUGHAjYuu1g=;
 b=hd3OODqvJvUcdxTNM/gOJzYkr8YL3ghqHcCr4pzdaMOFvSilZ16kTa6t
 fPP9Y1Vf/b+0eJcC5yLntNKNrfvL3GNk1P3WTlTscV+mzs4qgTxx9mh55
 zYT4Z2Lo2hUPlKEl4ilexH+uvIbnHFKAuZHkgvSCwGXd8qriBlMyFhjHm
 5uOEYIFpkW3evl1hP0MqFMhK9liq/WnbzKuluUfW1+ixrBMGAPTP7e4Yy
 ylwtO0hOUSL3L5qbhoZn/RTr9odd11oRfl/Dhx02+9qn0WZT5v5vGs5Y5
 4eaXBqWqAKbgNDB6fbkdCVSq+Q5T816ZJ6G/l36966iwf2DodLIU1W8Wu A==;
X-CSE-ConnectionGUID: YaxrQDHHRW6ISrSOKSC++w==
X-CSE-MsgGUID: q4+wFbU9RUiGKxXIkw4l8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="85531959"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="85531959"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 09:18:06 -0700
X-CSE-ConnectionGUID: 2fqUsfYORsyJerpo5isWlQ==
X-CSE-MsgGUID: 5ELcBy/nQpK4KkyPaFqAsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="247458513"
Received: from ikozitz-mobl3.ger.corp.intel.com (HELO mkuoppal-desk.intel.com)
 ([10.245.251.97])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 09:18:00 -0700
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
Subject: [PATCH 12/18] drm/xe/eudebug: userptr vm pread/pwrite
Date: Mon,  8 Jun 2026 19:16:30 +0300
Message-ID: <20260608161639.1652127-13-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260608161639.1652127-1-mika.kuoppala@linux.intel.com>
References: <20260608161639.1652127-1-mika.kuoppala@linux.intel.com>
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
index b886db98667f..15edbe7a9d00 100644
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

