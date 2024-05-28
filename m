Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EEC5C27C50
	for <intel-xe@archiver.kernel.org>; Tue, 28 May 2024 09:56:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05D9F10E7C3;
	Tue, 28 May 2024 09:56:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iQ3y/qOa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73B11112094
 for <intel-xe@lists.freedesktop.org>; Tue, 28 May 2024 09:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716890130; x=1748426130;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=V7XPQ/fHQHW9AiUsHwha/F+9HM72wUYaJm7UB+Smj6M=;
 b=iQ3y/qOaYMULxpbAnhl9uREHPgllRIAiQ3XQu4LhZmrRrbq1NmylzJzU
 uXZD9Jn1yveLu2R/nPgpjDh+N6L2hThsZXTofIw4y6vzPvaa/2uUFQkQt
 btJPdFPEQBwRpy3s4HupQ1+gyeIPAlwETEQ14h6I1M9r9YlWRm/R2Fjfo
 tqkeW5Y7c2rv+c7ICB3fi3n2sJZC8lRyQ1FCdJP+xx0W1n5iFnctSvdy0
 USbpbWS5BV9TC4Mw0EDSmoj1qsdi0jcWT2CZVmg8TnrcBDjViOnhyHDIe
 /fs4srHbHK0/FosVawEf2mDqZp5thUPFewMRCaM1NPIfEBALj2xwd4mIJ g==;
X-CSE-ConnectionGUID: E8WrbMVNSCqPFMAtq5RyIA==
X-CSE-MsgGUID: 7SWv3mJxQYemwbHB7ZaKvA==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13345556"
X-IronPort-AV: E=Sophos;i="6.08,194,1712646000"; d="scan'208";a="13345556"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 02:55:24 -0700
X-CSE-ConnectionGUID: YK81va6uQqW2Ue15HRPgwQ==
X-CSE-MsgGUID: 7UILDscCSG+yBoBBGotEfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,194,1712646000"; d="scan'208";a="34932100"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO fedora..)
 ([10.245.244.233])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 02:55:23 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI v5 13/20] drm/exec: Add a snapshot capability
Date: Tue, 28 May 2024 11:54:55 +0200
Message-ID: <20240528095503.90177-14-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240528095503.90177-1-thomas.hellstrom@linux.intel.com>
References: <20240528095503.90177-1-thomas.hellstrom@linux.intel.com>
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

When validating a buffer object for submission, we might need to lock
a number of object for eviction to make room for the validation.

This makes it pretty likely that validation will eventually succeed,
since eventually the validating process will hold most dma_resv locks
of the buffer objects residing in the memory type being validated for.

However, once validation of a single object has succeeded it might not
be beneficial to hold on to those locks anymore, and the validator
would want to drop the locks of all objects taken during validation.

Introduce a drm_exec snapshot functionality that can be used to
record the locks held at a certain time, and a restore functionality
that restores the drm_exec state to the snapshot by dropping all
locks.

Snapshots can be nested if needed.

Cc: Christian König <christian.koenig@amd.com>
Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: <dri-devel@lists.freedesktop.org>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/drm_exec.c | 55 +++++++++++++++++++++++++++++++++++++-
 include/drm/drm_exec.h     | 23 +++++++++++++++-
 2 files changed, 76 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_exec.c b/drivers/gpu/drm/drm_exec.c
index 1244aa58322b..10528e6c4046 100644
--- a/drivers/gpu/drm/drm_exec.c
+++ b/drivers/gpu/drm/drm_exec.c
@@ -56,6 +56,7 @@ static void drm_exec_unlock_all(struct drm_exec *exec)
 	struct drm_gem_object *obj;
 	unsigned long index;
 
+	WARN_ON(exec->snap);
 	drm_exec_for_each_locked_object_reverse(exec, index, obj) {
 		dma_resv_unlock(obj->resv);
 		drm_gem_object_put(obj);
@@ -89,6 +90,7 @@ void drm_exec_init(struct drm_exec *exec, u32 flags, unsigned nr)
 	exec->num_objects = 0;
 	exec->contended = DRM_EXEC_DUMMY;
 	exec->prelocked = NULL;
+	exec->snap = NULL;
 }
 EXPORT_SYMBOL(drm_exec_init);
 
@@ -287,7 +289,6 @@ int drm_exec_lock_obj(struct drm_exec *exec, struct drm_gem_object *obj)
 		goto error_unlock;
 
 	return 0;
-
 error_unlock:
 	dma_resv_unlock(obj->resv);
 	return ret;
@@ -381,5 +382,57 @@ int drm_exec_prepare_array(struct drm_exec *exec,
 }
 EXPORT_SYMBOL(drm_exec_prepare_array);
 
+/**
+ * drm_exec_restore() - Restore the drm_exec state to the point of a snapshot.
+ * @exec: The drm_exec object with the state.
+ * @snap: The snapshot state.
+ *
+ * Restores the drm_exec object by means of unlocking and dropping references
+ * to objects locked after the snapshot.
+ */
+void drm_exec_restore(struct drm_exec *exec, struct drm_exec_snapshot *snap)
+{
+	struct drm_gem_object *obj;
+	unsigned int index;
+
+	exec->snap = snap->saved_snap;
+
+	drm_exec_for_each_locked_object_reverse(exec, index, obj) {
+		if (index + 1 == snap->num_locked)
+			break;
+
+		dma_resv_unlock(obj->resv);
+		drm_gem_object_put(obj);
+		exec->objects[index] = NULL;
+	}
+
+	exec->num_objects = snap->num_locked;
+
+	if (!exec->prelocked)
+		exec->prelocked = snap->prelocked;
+	else
+		drm_gem_object_put(snap->prelocked);
+}
+EXPORT_SYMBOL(drm_exec_restore);
+
+/**
+ * drm_exec_snapshot() - Take a snapshot of the drm_exec state
+ * @exec: The drm_exec object with the state.
+ * @snap: The snapshot state.
+ *
+ * Records the @exec state in @snap. The @snap object is typically allocated
+ * in the stack of the caller.
+ */
+void drm_exec_snapshot(struct drm_exec *exec, struct drm_exec_snapshot *snap)
+{
+	snap->num_locked = exec->num_objects;
+	snap->prelocked = exec->prelocked;
+	if (snap->prelocked)
+		drm_gem_object_get(snap->prelocked);
+	snap->saved_snap = exec->snap;
+	exec->snap = snap;
+}
+EXPORT_SYMBOL(drm_exec_snapshot);
+
 MODULE_DESCRIPTION("DRM execution context");
 MODULE_LICENSE("Dual MIT/GPL");
diff --git a/include/drm/drm_exec.h b/include/drm/drm_exec.h
index 0dd36fb53145..af5f3ffc7174 100644
--- a/include/drm/drm_exec.h
+++ b/include/drm/drm_exec.h
@@ -19,7 +19,6 @@ struct drm_exec {
 	 * @flags: Flags to control locking behavior
 	 */
 	u32                     flags;
-
 	/**
 	 * @ticket: WW ticket used for acquiring locks
 	 */
@@ -49,6 +48,25 @@ struct drm_exec {
 	 * @prelocked: already locked GEM object due to contention
 	 */
 	struct drm_gem_object *prelocked;
+
+	/**
+	 * @snap: Pointer to the last snapshot taken or NULL if none.
+	 */
+	struct drm_exec_snapshot *snap;
+};
+
+/**
+ * struct drm_exec_snapshot - drm_exec snapshot information
+ */
+struct drm_exec_snapshot {
+	/** @saved_snap: Pointer to the previous snapshot or NULL. */
+	struct drm_exec_snapshot *saved_snap;
+
+	/** @prelocked: Refcounted pointer to the prelocked object at snapshot time. */
+	struct drm_gem_object *prelocked;
+
+	/** @num_locked: Number of locked objects at snapshot time. */
+	unsigned long num_locked;
 };
 
 /**
@@ -147,5 +165,8 @@ int drm_exec_prepare_array(struct drm_exec *exec,
 			   struct drm_gem_object **objects,
 			   unsigned int num_objects,
 			   unsigned int num_fences);
+void drm_exec_snapshot(struct drm_exec *exec, struct drm_exec_snapshot *snap);
+void drm_exec_restore(struct drm_exec *exec, struct drm_exec_snapshot *snap);
+
 
 #endif
-- 
2.44.0

