Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 866E4C25B7D
	for <intel-xe@archiver.kernel.org>; Fri, 17 May 2024 07:42:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 220DB10EE20;
	Fri, 17 May 2024 07:42:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZybIqW0f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A964A10EE1F
 for <intel-xe@lists.freedesktop.org>; Fri, 17 May 2024 07:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715931713; x=1747467713;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=jEPJEKosN1yjd5TQOHa0fgfJPL/JOAPmiIyC606lXbY=;
 b=ZybIqW0fuaynlVobxM5WIwIXIrYwMVM9e4WqSVvOLRU4dS/AKFtZtHPj
 RRvA3RrEIGU1MV5XwIU6F99zu1Zu459hoEf4MqdOo17GJQCbxJkPxCkHC
 7i7kMnvXvz3gcEL6C6fHLbAEYx1X8wGwuDwoFJVYK7Z9rqK70vo6/JJ6k
 jobBsn14QG1H+KXsoTaRTwaKP7V5PlOQueivHIVomP47SH0aqzbLzWzz5
 bRG6XPeO2RecmfDsYMdgX0d6qyh9qKumVlV5i7XWl7ZxUu78J9CVlT10c
 PIfhL7YJXSedK7IIjS0V4XlPKWRrQIhoi1gkgvB7kGZEgMaQ+IYTUFyMO w==;
X-CSE-ConnectionGUID: TK6F0XMeSuykUWG5cJib8Q==
X-CSE-MsgGUID: vGXQML9hRW2nbcDhW4P/hg==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="11897598"
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; d="scan'208";a="11897598"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 00:41:53 -0700
X-CSE-ConnectionGUID: 6cywB6+XT0WxuXQEmMzDOA==
X-CSE-MsgGUID: dRBcTTRTScC788o3y0p/Vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; d="scan'208";a="36213123"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO fedora..)
 ([10.245.246.17])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 00:41:52 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI v4 14/21] drm/exec: drm_exec_trylock()
Date: Fri, 17 May 2024 09:41:23 +0200
Message-ID: <20240517074130.2908-15-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240517074130.2908-1-thomas.hellstrom@linux.intel.com>
References: <20240517074130.2908-1-thomas.hellstrom@linux.intel.com>
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

