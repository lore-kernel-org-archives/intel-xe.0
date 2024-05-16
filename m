Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82014C25B7F
	for <intel-xe@archiver.kernel.org>; Thu, 16 May 2024 18:24:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC79810ED93;
	Thu, 16 May 2024 18:24:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="baGywbWz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D4CD10E4E0
 for <intel-xe@lists.freedesktop.org>; Thu, 16 May 2024 18:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715883845; x=1747419845;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=v5+2V64r4Nu6cx4P05ec58QsmjwEGKXOBGTKABrnFAE=;
 b=baGywbWzdKNjmvKG2HQP6gyBrChAxWVQyPWQTbll+fmJ0KGqzSbCxNpE
 pQV7kHAAGIpgiAezGeMM6k317UemDyz7brqO8V73g33ZsvpobHQYFy73p
 X/UPvsPje2dmA37ZxSvbLEVMEnL2hbtUwW2DzhEvQMTd+6AWFRp7eluo8
 pJ9RInEbPYLt4jUDwJcHEajjW/gZ6wxYEcWDfgN1p4CET2mLUipgV3/dr
 pgKi4iFdng8SnOnkYE4OqWWtUCy679f672oyQ5PhyL8DetaztchEq/en/
 YfwvyNyD/rSISNkug9lX65FJL1gbLdITwSWediXBBdMenGwzla0QUL6IL Q==;
X-CSE-ConnectionGUID: UNAg4t1CRx++5iu3QaH7+g==
X-CSE-MsgGUID: E1b4fO1tRZCP8OZwHIxSxQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="23159946"
X-IronPort-AV: E=Sophos;i="6.08,165,1712646000"; d="scan'208";a="23159946"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2024 11:24:05 -0700
X-CSE-ConnectionGUID: ZmK1BpRnTiyowjDY/0/JoA==
X-CSE-MsgGUID: tyoMADMbRcKwc00w5/CCRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,165,1712646000"; d="scan'208";a="32065458"
Received: from unknown (HELO fedora..) ([10.245.246.241])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2024 11:24:04 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI v3 15/21] drm/exec: Add a snapshot capability.
Date: Thu, 16 May 2024 20:23:33 +0200
Message-ID: <20240516182339.3482-16-thomas.hellstrom@linux.intel.com>
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

