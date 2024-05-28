Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09E04C27C51
	for <intel-xe@archiver.kernel.org>; Tue, 28 May 2024 09:55:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BE99112051;
	Tue, 28 May 2024 09:55:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g7OS3JD4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B7A910E58D
 for <intel-xe@lists.freedesktop.org>; Tue, 28 May 2024 09:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716890130; x=1748426130;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=JbpGHkp4ged+AgCHVyxdHqtlQoEZRRD2pBcHnf/8hVk=;
 b=g7OS3JD45gV0tPRoD6Jdtz8J6G5blQiTmYaZGPYZJToCisZXZGgRdSM8
 S7Z/Xpt8MgaPvp9sAihfBla28isIusxmNf8TJo5sWtnXcLz1qkYVoK9cE
 FhoRe1fOT9Rdcp/AT15dPg5IWEeSs1auOzgXeylsT04FOvAZLqj8hdaL3
 IECIr6+j5Lq4ZSbubXHrfr97lHdDH6fZHMQ138ynSNJyoBmm3kO9Ju/Bn
 HrSw4UaScH5G2xsA15C5ajdpG0N1wMeLeeuwxxr8GEiQk1zX43/D8Mnke
 0qSpuQ9Y4Kjz7C9hi3mXQPWM/rVHAMkOaKZj6UVj/TZUeP5iTQ31c/7Vr Q==;
X-CSE-ConnectionGUID: w7usoEvwSSSRwzuNn5rj3g==
X-CSE-MsgGUID: oGCGt2AzTm2VzaG+ErPokA==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13345557"
X-IronPort-AV: E=Sophos;i="6.08,194,1712646000"; d="scan'208";a="13345557"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 02:55:25 -0700
X-CSE-ConnectionGUID: vWUl9ZWaS5qXlVj+9LNwow==
X-CSE-MsgGUID: wJhRpHLOTTmMRLg69d0T3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,194,1712646000"; d="scan'208";a="34932101"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO fedora..)
 ([10.245.244.233])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 02:55:24 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI v5 14/20] drm/exec: Introduce an evict mode
Date: Tue, 28 May 2024 11:54:56 +0200
Message-ID: <20240528095503.90177-15-thomas.hellstrom@linux.intel.com>
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

Locking for eviction is in some way different from locking for
submission:

1) We can't lock objects that are already locked for submission,
hence DRM_EXEC_IGNORE_DUPLICATES must be unset.
2) We must be able to re-lock objects locked for eviction,
either for submission or for yet another eviction, in
particular objects sharing a single resv must be considered.
3) There is no point to keep a contending object after the
transaction restart. We don't know whether we actually want to use
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

TODO: Probably want to implement the set using an open addressing
hash table.

Cc: Christian König <christian.koenig@amd.com>
Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: <dri-devel@lists.freedesktop.org>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/drm_exec.c | 77 ++++++++++++++++++++++++++++++++++----
 include/drm/drm_exec.h     | 15 ++++++++
 2 files changed, 85 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_exec.c b/drivers/gpu/drm/drm_exec.c
index 10528e6c4046..c70d8b01effb 100644
--- a/drivers/gpu/drm/drm_exec.c
+++ b/drivers/gpu/drm/drm_exec.c
@@ -64,6 +64,10 @@ static void drm_exec_unlock_all(struct drm_exec *exec)
 
 	drm_gem_object_put(exec->prelocked);
 	exec->prelocked = NULL;
+
+	/* garbage collect */
+	xa_destroy(&exec->resv_set);
+	xa_init(&exec->resv_set);
 }
 
 /**
@@ -91,6 +95,8 @@ void drm_exec_init(struct drm_exec *exec, u32 flags, unsigned nr)
 	exec->contended = DRM_EXEC_DUMMY;
 	exec->prelocked = NULL;
 	exec->snap = NULL;
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
 
@@ -139,6 +146,30 @@ bool drm_exec_cleanup(struct drm_exec *exec)
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
 			       struct drm_gem_object *obj,
@@ -161,6 +192,14 @@ static int drm_exec_obj_locked(struct drm_exec *exec,
 	drm_gem_object_get(obj);
 	exec->objects[exec->num_objects++] = obj;
 
+	/*
+	 * Errors here are not fatal, It means the object we locked
+	 * for eviction can't be locked again. If that is problematic
+	 * we may need to reconsider this.
+	 */
+	if (drm_exec_in_evict_mode(exec))
+		(void)xa_store(&exec->resv_set, drm_exec_resv_to_key(obj->resv),
+			       obj->resv, gfp | __GFP_NOWARN);
 	return 0;
 }
 
@@ -184,6 +223,9 @@ static int drm_exec_lock_contended(struct drm_exec *exec)
 		dma_resv_lock_slow(obj->resv, &exec->ticket);
 	}
 
+	if (exec->drop_contended)
+		goto error_unlock;
+
 	ret = drm_exec_obj_locked(exec, obj, GFP_KERNEL);
 	if (unlikely(ret))
 		goto error_unlock;
@@ -227,10 +269,19 @@ int drm_exec_trylock_obj(struct drm_exec *exec, struct drm_gem_object *obj)
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
 
 	ret = drm_exec_obj_locked(exec, obj, GFP_ATOMIC | __GFP_NOWARN);
@@ -274,12 +325,20 @@ int drm_exec_lock_obj(struct drm_exec *exec, struct drm_gem_object *obj)
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
@@ -310,6 +369,7 @@ void drm_exec_unlock_obj(struct drm_exec *exec, struct drm_gem_object *obj)
 
 	for (i = exec->num_objects; i--;) {
 		if (exec->objects[i] == obj) {
+			drm_exec_resv_set_erase(exec, drm_exec_resv_to_key(obj->resv));
 			dma_resv_unlock(obj->resv);
 			for (++i; i < exec->num_objects; ++i)
 				exec->objects[i - 1] = exec->objects[i];
@@ -401,12 +461,14 @@ void drm_exec_restore(struct drm_exec *exec, struct drm_exec_snapshot *snap)
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
@@ -429,8 +491,9 @@ void drm_exec_snapshot(struct drm_exec *exec, struct drm_exec_snapshot *snap)
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
index af5f3ffc7174..cafeec5dddfe 100644
--- a/include/drm/drm_exec.h
+++ b/include/drm/drm_exec.h
@@ -5,6 +5,7 @@
 
 #include <linux/compiler.h>
 #include <linux/ww_mutex.h>
+#include <linux/xarray.h>
 
 #define DRM_EXEC_INTERRUPTIBLE_WAIT	BIT(0)
 #define DRM_EXEC_IGNORE_DUPLICATES	BIT(1)
@@ -53,6 +54,17 @@ struct drm_exec {
 	 * @snap: Pointer to the last snapshot taken or NULL if none.
 	 */
 	struct drm_exec_snapshot *snap;
+
+	/**
+	 * @resv_set: Set of pointers to locked objects in evict mode.
+	 */
+	struct xarray resv_set;
+
+	/**
+	 * @drop_contended: Drop the contended object after WW transaction
+	 * relaxation.
+	 */
+	bool drop_contended;
 };
 
 /**
@@ -67,6 +79,9 @@ struct drm_exec_snapshot {
 
 	/** @num_locked: Number of locked objects at snapshot time. */
 	unsigned long num_locked;
+
+	/** @flags: The drm_exec flags at snapshot time. */
+	u32 flags;
 };
 
 /**
-- 
2.44.0

