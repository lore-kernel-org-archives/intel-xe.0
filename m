Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D171C25B7C
	for <intel-xe@archiver.kernel.org>; Thu, 16 May 2024 06:44:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA92510E638;
	Thu, 16 May 2024 06:44:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T1HGFn59";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0812210E638
 for <intel-xe@lists.freedesktop.org>; Thu, 16 May 2024 06:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715841873; x=1747377873;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=jEPJEKosN1yjd5TQOHa0fgfJPL/JOAPmiIyC606lXbY=;
 b=T1HGFn59MAi5/eCX9qC2XNE8vYmhJznPaf/JCvNJAEyzsEimzsJ2ARTL
 yq53PCw6tWr/CnNW6wV5q38K2bRNxci+RlHWeZaX4z345W+oO15FdVEQ8
 0idP+gUcJRDU1ZGO3y8l12/gYEOl1ybAlqKY5LZ/xdSWO+EXbOAa6KhQ/
 uoWWnd43Q7v/QZAtH0002KzjU7w8OfDBY4JM3TRJu1d6qLS8ex3q2KAud
 yi8s/hqn3Lmqmn1/CXUgBIJ+/MIU+K2bah8pfy3vZech9jjUo42jQpjZX
 3QwU6PGGT0P70OsnheARo6W/DuCneGVZK8LiVCbwGsfd2GM4AvQgLD87r w==;
X-CSE-ConnectionGUID: eDHIgZkQTim+J4ncnIRCiw==
X-CSE-MsgGUID: 3wm1Mkh9Sou0ysOC86IoMA==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="11878106"
X-IronPort-AV: E=Sophos;i="6.08,163,1712646000"; d="scan'208";a="11878106"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 23:44:33 -0700
X-CSE-ConnectionGUID: bxa6XTFcQh2iwOH9rUIqgw==
X-CSE-MsgGUID: RcY9Dv86R7e0L7uRLHCBZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,163,1712646000"; d="scan'208";a="35880825"
Received: from mklonows-mobl1.ger.corp.intel.com (HELO fedora..)
 ([10.245.246.188])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 23:44:32 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI v2 14/21] drm/exec: drm_exec_trylock()
Date: Thu, 16 May 2024 08:44:02 +0200
Message-ID: <20240516064410.22151-15-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240516064410.22151-1-thomas.hellstrom@linux.intel.com>
References: <20240516064410.22151-1-thomas.hellstrom@linux.intel.com>
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

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/drm_exec.c | 38 ++++++++++++++++++++++++++++++++++++++
 include/drm/drm_exec.h     |  1 +
 2 files changed, 39 insertions(+)

diff --git a/drivers/gpu/drm/drm_exec.c b/drivers/gpu/drm/drm_exec.c
index 2a28cbccaec7..1a62ee24c1b8 100644
--- a/drivers/gpu/drm/drm_exec.c
+++ b/drivers/gpu/drm/drm_exec.c
@@ -207,6 +207,44 @@ int drm_exec_handle_contended(struct drm_exec *exec)
 }
 EXPORT_SYMBOL(drm_exec_handle_contended);
 
+/**
+ * drm_exec_trylock_obj - trylock a GEM object for use
+ * @exec: the drm_exec object with the state
+ * @obj: the GEM object to lock
+ *
+ * Lock a GEM object for use and grab a reference to it.
+ *
+ * Returns: -EALREADY when object is already locked (can be suppressed by
+ * setting the DRM_EXEC_IGNORE_DUPLICATES flag), -ENOMEM when memory
+ * allocation failed and zero for success.
+ */
+int drm_exec_trylock_obj(struct drm_exec *exec, struct drm_gem_object *obj)
+{
+	int ret;
+
+	might_alloc(GFP_KERNEL);
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
+	ret = drm_exec_obj_locked(exec, obj);
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
diff --git a/include/drm/drm_exec.h b/include/drm/drm_exec.h
index a3490794ef35..a37c851a178b 100644
--- a/include/drm/drm_exec.h
+++ b/include/drm/drm_exec.h
@@ -148,6 +148,7 @@ void drm_exec_init(struct drm_exec *exec, u32 flags, unsigned nr);
 void drm_exec_fini(struct drm_exec *exec);
 bool drm_exec_cleanup(struct drm_exec *exec);
 int drm_exec_lock_obj(struct drm_exec *exec, struct drm_gem_object *obj);
+int drm_exec_trylock_obj(struct drm_exec *exec, struct drm_gem_object *obj);
 void drm_exec_unlock_obj(struct drm_exec *exec, struct drm_gem_object *obj);
 int drm_exec_prepare_obj(struct drm_exec *exec, struct drm_gem_object *obj,
 			 unsigned int num_fences);
-- 
2.44.0

