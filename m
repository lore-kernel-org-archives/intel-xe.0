Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BACEC87FD3
	for <intel-xe@archiver.kernel.org>; Fri,  8 Aug 2025 10:44:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64BA010E4EF;
	Fri,  8 Aug 2025 10:44:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Onb3v+cX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E23E910E4EF
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Aug 2025 10:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754649889; x=1786185889;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VBviL6zJbks81lKBodv//I1Y4e2hPpCORQz6O8o0qsM=;
 b=Onb3v+cX/PYYfASudk2htwX+5qgxSaW0tGqCshelybqIZJN9fhTtDbW/
 T6jLFwxZrRRxYqh3ZJM+ARzy2T4UwZTw39wZmal5GthCp2v0vVi2qozUw
 CwnrW1RqidaQ807RfzPdzuQRbi4/7kSwTJ4sbJBdvOhr6Pe0Rapih3HJq
 p4Ea7+BmA4l9yBWenWEXBd0P89idOToIYE5Q3KSrSseIQhrutMA0ZRxqQ
 yk6tHBrODOEjIBFYmPmVM+XUPfwEPDruRTzAV4EJ/aIh84o6Y3qWtrTht
 RY6VNCb2Bgzk2r2g/ebxKqMZQFNw/1q9Mi5bDXaupOIMasEvksQ5DO4cm g==;
X-CSE-ConnectionGUID: T3AvfjL0Rhu4ZhIX/ao5bA==
X-CSE-MsgGUID: tdM40YkyTxCGKef2tTqXhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="67265686"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="67265686"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 03:44:49 -0700
X-CSE-ConnectionGUID: d90fF8DSRc6IWThd+otS9w==
X-CSE-MsgGUID: W0aTvQ74S9qc6qgSyHMjvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="164519011"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO mkuoppal-desk.lan)
 ([10.245.245.185])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 03:44:45 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: simona.vetter@ffwll.ch, matthew.brost@intel.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, joonas.lahtinen@linux.intel.com,
 christoph.manszewski@intel.com, rodrigo.vivi@intel.com,
 lucas.demarchi@intel.com, andrzej.hajda@intel.com, matthew.auld@intel.com,
 maciej.patelczyk@intel.com, gwan-gyeong.mun@intel.com,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Simona Vetter <simona@ffwll.ch>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Subject: [PATCH 09/15] drm/xe/eudebug: userptr vm pread/pwrite
Date: Fri,  8 Aug 2025 13:43:44 +0300
Message-ID: <20250808104356.3294210-11-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250808104356.3294210-1-mika.kuoppala@linux.intel.com>
References: <20250808104356.3294210-1-mika.kuoppala@linux.intel.com>
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

Cc: Simona Vetter <simona@ffwll.ch>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_eudebug_vm.c | 16 ++++++++++++++++
 drivers/gpu/drm/xe/xe_vm.c         |  4 ++++
 drivers/gpu/drm/xe/xe_vm.h         | 26 ++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm_types.h   |  6 ++++++
 4 files changed, 52 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_eudebug_vm.c b/drivers/gpu/drm/xe/xe_eudebug_vm.c
index 6392482683f9..6799dbfe71f1 100644
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
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 7787c442892a..ce854ebc0aee 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1264,6 +1264,8 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 			}
 
 			userptr->notifier_seq = LONG_MAX;
+
+			xe_eudebug_track_userptr_task(userptr);
 		}
 
 		xe_vm_get(vm);
@@ -1288,6 +1290,8 @@ static void xe_vma_destroy_late(struct xe_vma *vma)
 		if (userptr->sg)
 			xe_hmm_userptr_free_sg(uvma);
 
+		xe_eudebug_untrack_userptr_task(userptr);
+
 		/*
 		 * Since userptr pages are not pinned, we can't remove
 		 * the notifier until we're sure the GPU is not accessing
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 3475a118f666..8c28ba095397 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -401,4 +401,30 @@ static inline void xe_vma_userptr_force_invalidate(struct xe_userptr_vma *uvma)
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
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index e20f8341d5e9..cbf8d4f95afc 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -76,6 +76,12 @@ struct xe_userptr {
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
 
 struct xe_vma {
-- 
2.43.0

