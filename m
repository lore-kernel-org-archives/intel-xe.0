Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 470A3C25B74
	for <intel-xe@archiver.kernel.org>; Thu, 16 May 2024 06:44:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DD0910E37F;
	Thu, 16 May 2024 06:44:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MdvEcvQ/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAAF010E638
 for <intel-xe@lists.freedesktop.org>; Thu, 16 May 2024 06:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715841874; x=1747377874;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=v5+2V64r4Nu6cx4P05ec58QsmjwEGKXOBGTKABrnFAE=;
 b=MdvEcvQ/7uAjItx+tPsNnr+awmzdYCHZaiMyT5jUqnyswaYua5V103fp
 azG588iaG+JOHE9+v/bMtZ9tHYhEp1qy42hp37Sh3GwcLK1Diy2q6owTT
 wL/vQCMhgu5btleR07tGBy6QYbXS70lGNr26CwTvt6NAHuOY8ixJSSkvQ
 5n8M2cFAu5sEW+8/31IawuLf+xS9eqZTnS/Q9mn+MEghxGvyHsZ/FJeGv
 FzkzZDzmD1xmVEH9DTIwPHfXauvtPrDIOEVx/S7zE/UQtOZG4K8oOqVbt
 uU+WRw4axKCEcnqktzraWTCMB8Uhnb5yk61Iijrsw6Gy2HvnJQOLZFXSM g==;
X-CSE-ConnectionGUID: LGbCPD61RV+S3BmsQlolGQ==
X-CSE-MsgGUID: Y9b3lIxJSUqnhwxUPZhFuQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="11878107"
X-IronPort-AV: E=Sophos;i="6.08,163,1712646000"; d="scan'208";a="11878107"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 23:44:33 -0700
X-CSE-ConnectionGUID: 0xmEKruxSYK1aGrCC7Tm2w==
X-CSE-MsgGUID: YQwbSDmPQpaM25nCfuYcnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,163,1712646000"; d="scan'208";a="35880829"
Received: from mklonows-mobl1.ger.corp.intel.com (HELO fedora..)
 ([10.245.246.188])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 23:44:33 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI v2 15/21] drm/exec: Add a snapshot capability.
Date: Thu, 16 May 2024 08:44:03 +0200
Message-ID: <20240516064410.22151-16-thomas.hellstrom@linux.intel.com>
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
 drivers/gpu/drm/drm_exec.c | 38 +++++++++++++++++++++++++++++++++++++-
 include/drm/drm_exec.h     | 11 ++++++++++-
 2 files changed, 47 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_exec.c b/drivers/gpu/drm/drm_exec.c
index 1a62ee24c1b8..dec5300ef3a5 100644
--- a/drivers/gpu/drm/drm_exec.c
+++ b/drivers/gpu/drm/drm_exec.c
@@ -57,6 +57,7 @@ static void drm_exec_unlock_all(struct drm_exec *exec)
 	struct drm_gem_object *obj;
 	unsigned long index;
 
+	WARN_ON(exec->snap);
 	drm_exec_for_each_locked_object_reverse(exec, index, obj) {
 		dma_resv_unlock(obj->resv);
 		drm_gem_object_put(obj);
@@ -289,7 +290,6 @@ int drm_exec_lock_obj(struct drm_exec *exec, struct drm_gem_object *obj)
 		goto error_unlock;
 
 	return 0;
-
 error_unlock:
 	dma_resv_unlock(obj->resv);
 	return ret;
@@ -383,5 +383,41 @@ int drm_exec_prepare_array(struct drm_exec *exec,
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

