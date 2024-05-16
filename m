Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56959C41513
	for <intel-xe@archiver.kernel.org>; Thu, 16 May 2024 18:24:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAFBB10E514;
	Thu, 16 May 2024 18:24:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N48zek3O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BCEA10E4E0
 for <intel-xe@lists.freedesktop.org>; Thu, 16 May 2024 18:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715883846; x=1747419846;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=OKnmgXLgzCiApCYwet0nx4S0a5i4QBFuPARCG/kzFBU=;
 b=N48zek3OqT+dgBju7lqL42UkaJU/OXerJF9ZFbjqD343RQVWaSV0zRBW
 AI/43BdG9ALD/zV8euiuH8cOCale0XzOHguCtzCYUx/wIp1RHUwNBJETa
 TX3Mg9hj3e4UmhjIEVWfBMppsLiPJvqq4pJNbKH/YiwBbq9Q8nsNy9jH+
 NhKUGPF4is77K7bTMkxG1UpEItzlgnCoU17L3Uy5ldHO77zAEHMq0VxZe
 r6eTT3mk8rn1pWacDB9g6ZScnTLNyPyttoJJ/dzjROfvfjqgYjXEe8641
 VmUdpyoeyIYbvfshZKOvIxkpZpQo19WzBqWofZd/ekFaVH9chk3kRmHmU A==;
X-CSE-ConnectionGUID: wPyKDOkiQO+oXPwkhrn/vQ==
X-CSE-MsgGUID: XIu6VQbFS+6AnOlP2SazyA==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="23159953"
X-IronPort-AV: E=Sophos;i="6.08,165,1712646000"; d="scan'208";a="23159953"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2024 11:24:06 -0700
X-CSE-ConnectionGUID: IqvN+hbPTKKr266vKD8ISQ==
X-CSE-MsgGUID: 7oH7Cl/2QX+y6Q+71o+lQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,165,1712646000"; d="scan'208";a="32065469"
Received: from unknown (HELO fedora..) ([10.245.246.241])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2024 11:24:05 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI v3 16/21] drm/exec: Introduce an evict mode
Date: Thu, 16 May 2024 20:23:34 +0200
Message-ID: <20240516182339.3482-17-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240516182339.3482-1-thomas.hellstrom@linux.intel.com>
References: <20240516182339.3482-1-thomas.hellstrom@linux.intel.com>
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

Locking for eviction is in some way different from locking for
submission:

1) We can't lock objects that are already locked for submission,
hence DRM_EXEC_IGNORE_DUPLICATES must be unset.
2) We must be able to re-lock objects locked for eviction,
either for submission or for yet another eviction, in
particular objects sharing a single resv must be considered.
3) There is no point to keep a contending object after the
transaction restart. We don't know whether we actuall want to use
it again.

So introduce a drm_exec evict mode, and for now instead of
explicitly setting it using a function call or implement separate
locking functions that use evict mode, assume evict mode if
there is a snapshot registered. This can easily be changed later.

To keep track of resvs locked for eviction, use a pointer set
implemented by an xarray. This is probably not the most efficient
data structure but used as an easy-to-implement first approach.
If the set is empty (evict mode never used), the performance-
and memory usage impact will be very small.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/drm_exec.c | 78 ++++++++++++++++++++++++++++++++++----
 include/drm/drm_exec.h     |  4 ++
 2 files changed, 75 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_exec.c b/drivers/gpu/drm/drm_exec.c
index dec5300ef3a5..13391d100e5e 100644
--- a/drivers/gpu/drm/drm_exec.c
+++ b/drivers/gpu/drm/drm_exec.c
@@ -65,6 +65,10 @@ static void drm_exec_unlock_all(struct drm_exec *exec)
 
 	drm_gem_object_put(exec->prelocked);
 	exec->prelocked = NULL;
+
+	/* garbage collect */
+	xa_destroy(&exec->resv_set);
+	xa_init(&exec->resv_set);
 }
 
 /**
@@ -91,6 +95,8 @@ void drm_exec_init(struct drm_exec *exec, u32 flags, unsigned nr)
 	exec->num_objects = 0;
 	exec->contended = DRM_EXEC_DUMMY;
 	exec->prelocked = NULL;
+	exec->drop_contended = false;
+	xa_init(&exec->resv_set);
 }
 EXPORT_SYMBOL(drm_exec_init);
 
@@ -109,6 +115,7 @@ void drm_exec_fini(struct drm_exec *exec)
 		drm_gem_object_put(exec->contended);
 		ww_acquire_fini(&exec->ticket);
 	}
+	xa_destroy(&exec->resv_set);
 }
 EXPORT_SYMBOL(drm_exec_fini);
 
@@ -138,6 +145,30 @@ bool drm_exec_cleanup(struct drm_exec *exec)
 }
 EXPORT_SYMBOL(drm_exec_cleanup);
 
+static unsigned long drm_exec_resv_to_key(const struct dma_resv *resv)
+{
+	return (unsigned long)resv / __alignof__(typeof(*resv));
+}
+
+static void
+drm_exec_resv_set_erase(struct drm_exec *exec, unsigned long key)
+{
+	if (xa_load(&exec->resv_set, key))
+		xa_erase(&exec->resv_set, key);
+}
+
+static bool drm_exec_in_evict_mode(struct drm_exec *exec)
+{
+	return !!exec->snap;
+}
+
+static void drm_exec_set_evict_mode(struct drm_exec *exec,
+				    struct drm_exec_snapshot *snap)
+{
+	exec->snap = snap;
+	exec->flags &= ~DRM_EXEC_IGNORE_DUPLICATES;
+}
+
 /* Track the locked object in the array */
 static int drm_exec_obj_locked(struct drm_exec *exec,
 			       struct drm_gem_object *obj)
@@ -157,6 +188,15 @@ static int drm_exec_obj_locked(struct drm_exec *exec,
 	drm_gem_object_get(obj);
 	exec->objects[exec->num_objects++] = obj;
 
+	/*
+	 * Errors here are not fatal, It means the object we locked
+	 * for eviction can't be locked again. If that is problematic
+	 * we may need to reconsider this.
+	 */
+	if (drm_exec_in_evict_mode(exec))
+		(void)xa_store(&exec->resv_set, drm_exec_resv_to_key(obj->resv),
+			       obj->resv, GFP_KERNEL | __GFP_RETRY_MAYFAIL |
+			       __GFP_NOWARN);
 	return 0;
 }
 
@@ -180,6 +220,9 @@ static int drm_exec_lock_contended(struct drm_exec *exec)
 		dma_resv_lock_slow(obj->resv, &exec->ticket);
 	}
 
+	if (exec->drop_contended)
+		goto error_unlock;
+
 	ret = drm_exec_obj_locked(exec, obj);
 	if (unlikely(ret))
 		goto error_unlock;
@@ -232,10 +275,19 @@ int drm_exec_trylock_obj(struct drm_exec *exec, struct drm_gem_object *obj)
 	}
 
 	if (!dma_resv_trylock_ctx(obj->resv, &exec->ticket)) {
-		if (dma_resv_locking_ctx(obj->resv) == &exec->ticket)
-			return (exec->flags & DRM_EXEC_IGNORE_DUPLICATES) ? 0 : -EALREADY;
-		else
+		if (dma_resv_locking_ctx(obj->resv) == &exec->ticket) {
+			unsigned long key = drm_exec_resv_to_key(obj->resv);
+
+			if (exec->flags & DRM_EXEC_IGNORE_DUPLICATES ||
+			    xa_load(&exec->resv_set, key)) {
+				if (!drm_exec_in_evict_mode(exec))
+					drm_exec_resv_set_erase(exec, key);
+				return 0;
+			}
+			return -EALREADY;
+		} else {
 			return -EBUSY;
+		}
 	}
 
 	ret = drm_exec_obj_locked(exec, obj);
@@ -275,12 +327,20 @@ int drm_exec_lock_obj(struct drm_exec *exec, struct drm_gem_object *obj)
 	if (unlikely(ret == -EDEADLK)) {
 		drm_gem_object_get(obj);
 		exec->contended = obj;
+		exec->drop_contended = drm_exec_in_evict_mode(exec);
 		return -EDEADLK;
 	}
 
-	if (unlikely(ret == -EALREADY) &&
-	    exec->flags & DRM_EXEC_IGNORE_DUPLICATES)
-		return 0;
+	if (unlikely(ret == -EALREADY)) {
+		unsigned long key = drm_exec_resv_to_key(obj->resv);
+
+		if (exec->flags & DRM_EXEC_IGNORE_DUPLICATES ||
+		    xa_load(&exec->resv_set, key)) {
+			if (!drm_exec_in_evict_mode(exec))
+				drm_exec_resv_set_erase(exec, key);
+			return 0;
+		}
+	}
 
 	if (unlikely(ret))
 		return ret;
@@ -311,6 +371,7 @@ void drm_exec_unlock_obj(struct drm_exec *exec, struct drm_gem_object *obj)
 
 	for (i = exec->num_objects; i--;) {
 		if (exec->objects[i] == obj) {
+			drm_exec_resv_set_erase(exec, drm_exec_resv_to_key(obj->resv));
 			dma_resv_unlock(obj->resv);
 			for (++i; i < exec->num_objects; ++i)
 				exec->objects[i - 1] = exec->objects[i];
@@ -394,12 +455,14 @@ void drm_exec_restore(struct drm_exec *exec, struct drm_exec_snapshot *snap)
 		if (index + 1 == snap->num_locked)
 			break;
 
+		xa_erase(&exec->resv_set, drm_exec_resv_to_key(obj->resv));
 		dma_resv_unlock(obj->resv);
 		drm_gem_object_put(obj);
 		exec->objects[index] = NULL;
 	}
 
 	exec->num_objects = snap->num_locked;
+	exec->flags = snap->flags;
 
 	if (!exec->prelocked)
 		exec->prelocked = snap->prelocked;
@@ -414,8 +477,9 @@ void drm_exec_snapshot(struct drm_exec *exec, struct drm_exec_snapshot *snap)
 	snap->prelocked = exec->prelocked;
 	if (snap->prelocked)
 		drm_gem_object_get(snap->prelocked);
+	snap->flags = exec->flags;
 	snap->saved_snap = exec->snap;
-	exec->snap = snap;
+	drm_exec_set_evict_mode(exec, snap);
 }
 EXPORT_SYMBOL(drm_exec_snapshot);
 
diff --git a/include/drm/drm_exec.h b/include/drm/drm_exec.h
index 0ef326f2f5f0..b9bdf2031dfe 100644
--- a/include/drm/drm_exec.h
+++ b/include/drm/drm_exec.h
@@ -5,6 +5,7 @@
 
 #include <linux/compiler.h>
 #include <linux/ww_mutex.h>
+#include <linux/xarray.h>
 
 #define DRM_EXEC_INTERRUPTIBLE_WAIT	BIT(0)
 #define DRM_EXEC_IGNORE_DUPLICATES	BIT(1)
@@ -49,12 +50,15 @@ struct drm_exec {
 	 */
 	struct drm_gem_object *prelocked;
 	struct drm_exec_snapshot *snap;
+	struct xarray resv_set;
+	bool drop_contended;
 };
 
 struct drm_exec_snapshot {
 	struct drm_exec_snapshot *saved_snap;
 	struct drm_gem_object *prelocked;
 	unsigned long num_locked;
+	u32 flags;
 };
 
 int drm_exec_handle_contended(struct drm_exec *exec);
-- 
2.44.0

