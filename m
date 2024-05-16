Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 399F6C3DA40
	for <intel-xe@archiver.kernel.org>; Thu, 16 May 2024 18:24:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFBEC10EDA1;
	Thu, 16 May 2024 18:24:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GAeVtxvq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2010210ECC4
 for <intel-xe@lists.freedesktop.org>; Thu, 16 May 2024 18:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715883844; x=1747419844;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=jEPJEKosN1yjd5TQOHa0fgfJPL/JOAPmiIyC606lXbY=;
 b=GAeVtxvqTBf8xXNUA30Y/NUtrP5uE63E94Ccas9B+8HJD3Dzvkkedohn
 hdGWdCS2hFd6eha+2vKVr5sog5GrkehjrSB21ZPPch4KRSR9GVDEG/CNj
 Nmpv/jdKh3CnoDAaeEIR4pGez63frUjWQ1u7/qBTigKl6XzafKD6muths
 2+DOmJcRx/54HJkAgzjpSI5LMpIWvKYuDJXjF0lktlenFW8YnNPUE6zpb
 tQGNLBfh7MpOCOYI39VIfOh6gVYC7FlmSxAMValCG6jVitVpjRzQGSLki
 Yw/c2ZxMPVQUlHyxcv19KojfmjmDRzDxS6UP0C+ynJKW7JG0pymgUdtUT Q==;
X-CSE-ConnectionGUID: FMITsKqmSFKBJL0RaWBY2g==
X-CSE-MsgGUID: BgaGwtXmQDSa1FIR3kej4Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="23159941"
X-IronPort-AV: E=Sophos;i="6.08,165,1712646000"; d="scan'208";a="23159941"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2024 11:24:04 -0700
X-CSE-ConnectionGUID: 7WGbqBXMTom3RyyKEm7hXA==
X-CSE-MsgGUID: s9u/0i0uRnCKGGpCR4t3kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,165,1712646000"; d="scan'208";a="32065443"
Received: from unknown (HELO fedora..) ([10.245.246.241])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2024 11:24:03 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI v3 14/21] drm/exec: drm_exec_trylock()
Date: Thu, 16 May 2024 20:23:32 +0200
Message-ID: <20240516182339.3482-15-thomas.hellstrom@linux.intel.com>
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

