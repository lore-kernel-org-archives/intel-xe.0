Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DB5FC27C4F
	for <intel-xe@archiver.kernel.org>; Tue, 28 May 2024 12:34:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5B4B112251;
	Tue, 28 May 2024 12:34:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g3S8BBfa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F046210F199
 for <intel-xe@lists.freedesktop.org>; Tue, 28 May 2024 12:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716899647; x=1748435647;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=liol1cKeUAFcUrXHMGR17vksSxntNZz5PmA4A5lcxtw=;
 b=g3S8BBfa55K3aYVovxeH5KbkJoHX6X35ukvXEqgzm2a79d5dl0XJhTfE
 c0kg+J/OIpV3CxmwpfPNf73TwFCeOjLBpgTbfjphkikMke08d9ZeOWXTF
 ER66ab3mvsACuwSbFKYZ7SGmpMDzX2fePmZVrViczRrCxOEu+nlVOP9/S
 qLU4GzkMSSNVQ3/qwcm4+cUlkmzAWFFNCrzokHYmQG3JqIVQll6tih6lt
 6xdNuAQzufZqnPlJ/O2XEAKffzKEmeYWJs+x3U1DWODEcMyQLNpCMKrvC
 dmhrLBNv7sJbRa13jN7GfHNQcWpThh71T2cJ+zzarhy7+2P7vtidK1OS2 w==;
X-CSE-ConnectionGUID: Fee8zBF+RwS1lFfbZOcIIg==
X-CSE-MsgGUID: z2a8lvW5T96lSQS2uIua2g==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13065033"
X-IronPort-AV: E=Sophos;i="6.08,195,1712646000"; d="scan'208";a="13065033"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 05:34:06 -0700
X-CSE-ConnectionGUID: N3PfObZcRHmjapmY3Yqgrw==
X-CSE-MsgGUID: SzJzAOXVTQepoiteOg6VdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,195,1712646000"; d="scan'208";a="39880434"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO fedora..)
 ([10.245.244.233])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 05:34:07 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI v5 12/22] dma-buf/dma-resv: Introduce dma_resv_trylock_ctx()
Date: Tue, 28 May 2024 14:33:33 +0200
Message-ID: <20240528123343.169970-13-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240528123343.169970-1-thomas.hellstrom@linux.intel.com>
References: <20240528123343.169970-1-thomas.hellstrom@linux.intel.com>
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

For the drm_exec_trylock() functionality, there is a need to be able
to trylock a dma-resv object as part of a drm_exec transaction.
Therefore expose a variant of dma_resv_trylock that also takes
a struct ww_acquire_ctx parameter.

Cc: Christian König <christian.koenig@amd.com>
Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: <dri-devel@lists.freedesktop.org>
Cc: <linaro-mm-sig@lists.linaro.org>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/drm_exec.c | 53 +++++++++++++++++++++++++++++++++++---
 include/drm/drm_exec.h     |  1 +
 include/linux/dma-resv.h   | 23 ++++++++++++++++-
 3 files changed, 72 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_exec.c b/drivers/gpu/drm/drm_exec.c
index 2da094bdf8a4..1244aa58322b 100644
--- a/drivers/gpu/drm/drm_exec.c
+++ b/drivers/gpu/drm/drm_exec.c
@@ -139,14 +139,17 @@ EXPORT_SYMBOL(drm_exec_cleanup);
 
 /* Track the locked object in the array */
 static int drm_exec_obj_locked(struct drm_exec *exec,
-			       struct drm_gem_object *obj)
+			       struct drm_gem_object *obj,
+			       gfp_t gfp)
 {
+	might_alloc(gfp);
+
 	if (unlikely(exec->num_objects == exec->max_objects)) {
 		size_t size = exec->max_objects * sizeof(void *);
 		void *tmp;
 
 		tmp = kvrealloc(exec->objects, size, size + PAGE_SIZE,
-				GFP_KERNEL);
+				gfp);
 		if (!tmp)
 			return -ENOMEM;
 
@@ -179,7 +182,7 @@ static int drm_exec_lock_contended(struct drm_exec *exec)
 		dma_resv_lock_slow(obj->resv, &exec->ticket);
 	}
 
-	ret = drm_exec_obj_locked(exec, obj);
+	ret = drm_exec_obj_locked(exec, obj, GFP_KERNEL);
 	if (unlikely(ret))
 		goto error_unlock;
 
@@ -194,6 +197,48 @@ static int drm_exec_lock_contended(struct drm_exec *exec)
 	return ret;
 }
 
+/**
+ * drm_exec_trylock_obj - trylock a GEM object for use
+ * @exec: the drm_exec object with the state.
+ * @obj: the GEM object to lock.
+ *
+ * Trylock a GEM object for use and grab a reference to it.
+ *
+ * Returns: -EALREADY when object is already locked (can be suppressed by
+ * setting the DRM_EXEC_IGNORE_DUPLICATES flag), -ENOMEM when memory
+ * allocation failed, and zero for success. If the object was already
+ * locked, or if there was a contended lock, -EBUSY will be returned.
+ */
+int drm_exec_trylock_obj(struct drm_exec *exec, struct drm_gem_object *obj)
+{
+	int ret;
+
+	might_alloc(GFP_ATOMIC);
+
+	if (drm_exec_is_contended(exec))
+		return -EBUSY;
+
+	if (exec->prelocked == obj) {
+		drm_gem_object_put(exec->prelocked);
+		exec->prelocked = NULL;
+		return 0;
+	}
+
+	if (!dma_resv_trylock_ctx(obj->resv, &exec->ticket)) {
+		if (dma_resv_locking_ctx(obj->resv) == &exec->ticket)
+			return (exec->flags & DRM_EXEC_IGNORE_DUPLICATES) ? 0 : -EALREADY;
+		else
+			return -EBUSY;
+	}
+
+	ret = drm_exec_obj_locked(exec, obj, GFP_ATOMIC | __GFP_NOWARN);
+	if (ret)
+		dma_resv_unlock(obj->resv);
+
+	return ret;
+}
+EXPORT_SYMBOL(drm_exec_trylock_obj);
+
 /**
  * drm_exec_lock_obj - lock a GEM object for use
  * @exec: the drm_exec object with the state
@@ -237,7 +282,7 @@ int drm_exec_lock_obj(struct drm_exec *exec, struct drm_gem_object *obj)
 	if (unlikely(ret))
 		return ret;
 
-	ret = drm_exec_obj_locked(exec, obj);
+	ret = drm_exec_obj_locked(exec, obj, GFP_KERNEL);
 	if (ret)
 		goto error_unlock;
 
diff --git a/include/drm/drm_exec.h b/include/drm/drm_exec.h
index aa786b828a0a..0dd36fb53145 100644
--- a/include/drm/drm_exec.h
+++ b/include/drm/drm_exec.h
@@ -139,6 +139,7 @@ void drm_exec_init(struct drm_exec *exec, u32 flags, unsigned nr);
 void drm_exec_fini(struct drm_exec *exec);
 bool drm_exec_cleanup(struct drm_exec *exec);
 int drm_exec_lock_obj(struct drm_exec *exec, struct drm_gem_object *obj);
+int drm_exec_trylock_obj(struct drm_exec *exec, struct drm_gem_object *obj);
 void drm_exec_unlock_obj(struct drm_exec *exec, struct drm_gem_object *obj);
 int drm_exec_prepare_obj(struct drm_exec *exec, struct drm_gem_object *obj,
 			 unsigned int num_fences);
diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
index 8d0e34dad446..68dae8f2a22c 100644
--- a/include/linux/dma-resv.h
+++ b/include/linux/dma-resv.h
@@ -405,6 +405,27 @@ static inline int dma_resv_lock_slow_interruptible(struct dma_resv *obj,
 	return ww_mutex_lock_slow_interruptible(&obj->lock, ctx);
 }
 
+/**
+ * dma_resv_trylock_ctx - trylock the reservation object
+ * @obj: the reservation object
+ * @ctx: The ww acquire context or NULL.
+ *
+ * Tries to lock the reservation object for exclusive access and modification.
+ * Note, that the lock is only against other writers, readers will run
+ * concurrently with a writer under RCU. The seqlock is used to notify readers
+ * if they overlap with a writer. The context parameter ensures that other
+ * ww transactions can perform deadlock backoff if necessary, and that
+ * subsequent attempts to dma_resv_lock() @obj for @ctx will return
+ * -EALREADY.
+ *
+ * Return: true if the lock was acquired, false otherwise.
+ */
+static inline bool __must_check
+dma_resv_trylock_ctx(struct dma_resv *obj, struct ww_acquire_ctx *ctx)
+{
+	return ww_mutex_trylock(&obj->lock, ctx);
+}
+
 /**
  * dma_resv_trylock - trylock the reservation object
  * @obj: the reservation object
@@ -421,7 +442,7 @@ static inline int dma_resv_lock_slow_interruptible(struct dma_resv *obj,
  */
 static inline bool __must_check dma_resv_trylock(struct dma_resv *obj)
 {
-	return ww_mutex_trylock(&obj->lock, NULL);
+	return dma_resv_trylock_ctx(obj, NULL);
 }
 
 /**
-- 
2.44.0

