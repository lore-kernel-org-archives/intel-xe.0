Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5C06C27C41
	for <intel-xe@archiver.kernel.org>; Wed, 15 May 2024 08:15:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7589910E5EE;
	Wed, 15 May 2024 08:15:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H0Pnw79y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35D2E10E5A5
 for <intel-xe@lists.freedesktop.org>; Wed, 15 May 2024 08:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715760913; x=1747296913;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=Fa91qtW9nYhrS8XiPfFFTU9fiVrCnIVKyRJ/tb4vWak=;
 b=H0Pnw79yy05Rnpks3afI5B6tIoM1GS6E1jSV3Ta8OWWn32GyXUAu1Cya
 rsyhQZT2ylCAMe3cB4ZHbmkczmRCap4CpQbaZyxXdZ4LFbRe5nKhQ/5yK
 GMs0OhA5LtXbpRx7yAWEB+euHpK0ybAeMgHMa2NSrChGFdo6XAlFwbkkA
 Gfy3kIDWL7gdyuZNCDwWVVV21Qj1Cb30e1OD7gz69O+Abw9twAoJrGO/6
 42yoqjnbnGnJzzij6ZYGaYnccGnI8RhHwAujS0mfh1JAAKnqNZE6IGqy3
 GOiq8Nlj+Ezyytyo/skU0mRe4AwAyY2S7kJxp/J7nduB3niUeFbTfrGVx g==;
X-CSE-ConnectionGUID: swdEEMKhRB6Oidapqavk0A==
X-CSE-MsgGUID: 61oTrZZRT6y65XuDnCAOuA==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="23193318"
X-IronPort-AV: E=Sophos;i="6.08,161,1712646000"; d="scan'208";a="23193318"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 01:15:13 -0700
X-CSE-ConnectionGUID: h8qiS0eKSdGtesRW74V5ng==
X-CSE-MsgGUID: jwfFAm/XSCqGoZIWzdLMvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,161,1712646000"; d="scan'208";a="30977478"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO fedora..)
 ([10.245.246.147])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 01:15:12 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 15/21] drm/exec: Add a snapshot capability.
Date: Wed, 15 May 2024 10:14:43 +0200
Message-ID: <20240515081449.46646-16-thomas.hellstrom@linux.intel.com>
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

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/drm_exec.c | 38 +++++++++++++++++++++++++++++++++++++-
 include/drm/drm_exec.h     | 13 ++++++++++++-
 2 files changed, 49 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_exec.c b/drivers/gpu/drm/drm_exec.c
index ec8c245e33d1..934f60e75744 100644
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
index a37c851a178b..b82e4c8ead11 100644
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
@@ -144,6 +150,8 @@ static inline bool drm_exec_is_contended(struct drm_exec *exec)
 	return !!exec->contended;
 }
 
+
+
 void drm_exec_init(struct drm_exec *exec, u32 flags, unsigned nr);
 void drm_exec_fini(struct drm_exec *exec);
 bool drm_exec_cleanup(struct drm_exec *exec);
@@ -156,5 +164,8 @@ int drm_exec_prepare_array(struct drm_exec *exec,
 			   struct drm_gem_object **objects,
 			   unsigned int num_objects,
 			   unsigned int num_fences);
+void drm_exec_snapshot(struct drm_exec *exec, struct drm_exec_snapshot *snap);
+void drm_exec_restore(struct drm_exec *exec, struct drm_exec_snapshot *snap);
+
 
 #endif
-- 
2.44.0

