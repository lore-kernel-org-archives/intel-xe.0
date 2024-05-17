Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0213C04FFE
	for <intel-xe@archiver.kernel.org>; Fri, 17 May 2024 07:41:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 764AC10EE22;
	Fri, 17 May 2024 07:41:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AiftzR5B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B49010EE1F
 for <intel-xe@lists.freedesktop.org>; Fri, 17 May 2024 07:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715931713; x=1747467713;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=cUpxL9iw5g/b6dUMzymCZFiGQV7I/O/UC+taIuQwQdc=;
 b=AiftzR5B6Z5/F1V2z38mQjEdJeyZlESaDaoo6Pch+jqi9TmBlxhoD9y+
 Ywo/n0hGET4Et9EsYxXASSwobPOkL8ZOsPitesoYyFVsVpI+LkTgpQRiv
 kZHuaEoEWXu6laL4Cmc8vqDXNE1F+xy6kDVUN+DbUCgUjlf3+p2O4uRFl
 BTqN4WSuaAzhoyaNpGFLtidWBAO5qi4FQjqzGfWCYqI6hprWxqRwsg8aW
 ORDeelY1g+celhHA6q0ZmBauV2z0VBravqu9+c8eaJT4MgdXHDeVEDGhs
 XgG7Wy0+9g90g0+EfB/F29t2YfS3H32N+ydoPiGPBIMn9uVEGTgXv+WOW g==;
X-CSE-ConnectionGUID: fqz57DIcQW63quunuj3Nlg==
X-CSE-MsgGUID: IOnDilDOSOmlvqMuxODnrg==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="11897599"
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; d="scan'208";a="11897599"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 00:41:53 -0700
X-CSE-ConnectionGUID: 3wgA3+nvRoWDyOeKp/Byvg==
X-CSE-MsgGUID: 2NovQcdcQP6vL97rbqGQtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; d="scan'208";a="36213124"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO fedora..)
 ([10.245.246.17])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 00:41:53 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI v4 15/21] drm/exec: Add a snapshot capability.
Date: Fri, 17 May 2024 09:41:24 +0200
Message-ID: <20240517074130.2908-16-thomas.hellstrom@linux.intel.com>
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
 drivers/gpu/drm/drm_exec.c | 39 +++++++++++++++++++++++++++++++++++++-
 include/drm/drm_exec.h     | 11 ++++++++++-
 2 files changed, 48 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_exec.c b/drivers/gpu/drm/drm_exec.c
index 1a62ee24c1b8..334d2f9109a6 100644
--- a/drivers/gpu/drm/drm_exec.c
+++ b/drivers/gpu/drm/drm_exec.c
@@ -57,6 +57,7 @@ static void drm_exec_unlock_all(struct drm_exec *exec)
 	struct drm_gem_object *obj;
 	unsigned long index;
 
+	WARN_ON(exec->snap);
 	drm_exec_for_each_locked_object_reverse(exec, index, obj) {
 		dma_resv_unlock(obj->resv);
 		drm_gem_object_put(obj);
@@ -90,6 +91,7 @@ void drm_exec_init(struct drm_exec *exec, u32 flags, unsigned nr)
 	exec->num_objects = 0;
 	exec->contended = DRM_EXEC_DUMMY;
 	exec->prelocked = NULL;
+	exec->snap = NULL;
 }
 EXPORT_SYMBOL(drm_exec_init);
 
@@ -289,7 +291,6 @@ int drm_exec_lock_obj(struct drm_exec *exec, struct drm_gem_object *obj)
 		goto error_unlock;
 
 	return 0;
-
 error_unlock:
 	dma_resv_unlock(obj->resv);
 	return ret;
@@ -383,5 +384,41 @@ int drm_exec_prepare_array(struct drm_exec *exec,
 }
 EXPORT_SYMBOL(drm_exec_prepare_array);
 
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
index a37c851a178b..0ef326f2f5f0 100644
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
@@ -49,6 +48,13 @@ struct drm_exec {
 	 * @prelocked: already locked GEM object due to contention
 	 */
 	struct drm_gem_object *prelocked;
+	struct drm_exec_snapshot *snap;
+};
+
+struct drm_exec_snapshot {
+	struct drm_exec_snapshot *saved_snap;
+	struct drm_gem_object *prelocked;
+	unsigned long num_locked;
 };
 
 int drm_exec_handle_contended(struct drm_exec *exec);
@@ -156,5 +162,8 @@ int drm_exec_prepare_array(struct drm_exec *exec,
 			   struct drm_gem_object **objects,
 			   unsigned int num_objects,
 			   unsigned int num_fences);
+void drm_exec_snapshot(struct drm_exec *exec, struct drm_exec_snapshot *snap);
+void drm_exec_restore(struct drm_exec *exec, struct drm_exec_snapshot *snap);
+
 
 #endif
-- 
2.44.0

