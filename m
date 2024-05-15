Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 758ECC25B7B
	for <intel-xe@archiver.kernel.org>; Wed, 15 May 2024 08:15:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E748710E5A5;
	Wed, 15 May 2024 08:15:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BQuHySeI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2923E10E5A5
 for <intel-xe@lists.freedesktop.org>; Wed, 15 May 2024 08:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715760914; x=1747296914;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=qS2XkqAi/A8pGepyiBhgEV0gSg7WHK+11/dqUMfYmhU=;
 b=BQuHySeIujPUqcdb6xXA/+c3yrJXDtv4A0mCu0/J7eGRsjUWWlrI9hkW
 xRlbFp7xXZtu6YN7307kBYIXnVL5rv79VHh/+/cKPcg8yIiCLbHGo39gD
 OArwFy1QQ4+Cf+kGE3Av7G3Xm7VXXWQoMGhDZgztR1o3jrmgtCLYHKJwu
 dI9xEcscm1lazjLk1FDMlF8DNCwJUrcH9H7uZPZcxJKpXjkwH1b4AWqqn
 Pd/WYjmRz2Zgz9AMmNDNnQhdgouD8zaKveffmNma5lgflc28PkVQXydhC
 IiT9M6JFcUWnlcQ56KI52fhGeHYU8aeP16N4wiyHhYal412D8B3z+r2TM Q==;
X-CSE-ConnectionGUID: XyeAVhubRFOaLwRAdoCSWA==
X-CSE-MsgGUID: KIJiVbLHStOo6MvRx33c6w==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="23193320"
X-IronPort-AV: E=Sophos;i="6.08,161,1712646000"; d="scan'208";a="23193320"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 01:15:14 -0700
X-CSE-ConnectionGUID: 1z3S4rg3Sc2ezy6uNIT8OQ==
X-CSE-MsgGUID: FyaUu71aTHKQvN+gQbSt3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,161,1712646000"; d="scan'208";a="30977479"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO fedora..)
 ([10.245.246.147])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 01:15:13 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 16/21] drm/exec: Introduce an evict mode
Date: Wed, 15 May 2024 10:14:44 +0200
Message-ID: <20240515081449.46646-17-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240515081449.46646-1-thomas.hellstrom@linux.intel.com>
References: <20240515081449.46646-1-thomas.hellstrom@linux.intel.com>
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
index 934f60e75744..ceab7c810eda 100644
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
+	return (unsigned long) resv / __alignof__(typeof(*resv));
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
+		(void) xa_store(&exec->resv_set, drm_exec_resv_to_key(obj->resv),
+				obj->resv, GFP_KERNEL | __GFP_RETRY_MAYFAIL |
+				__GFP_NOWARN);
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
index b82e4c8ead11..d615ce6b9f6d 100644
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

