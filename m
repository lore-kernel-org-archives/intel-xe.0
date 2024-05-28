Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BBE7C25B78
	for <intel-xe@archiver.kernel.org>; Tue, 28 May 2024 09:55:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B52DB10E829;
	Tue, 28 May 2024 09:55:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RJLhQDc6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C399112095
 for <intel-xe@lists.freedesktop.org>; Tue, 28 May 2024 09:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716890131; x=1748426131;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=9fTaxeuFq+AzUMVyJ5BRpPJ8qLUYV9hdeCe+HSLTqe8=;
 b=RJLhQDc6T0ImDvaV/O3JpLn9jg6DY7AuWHvqR0b1BGbY0yVnZsq2uUBg
 1bwbUjoXrcaYUNqv892+vCLOI/4D8qMGfKFOID30+XysEjAcjOkNvItJz
 P3oMifvMdQOl42atplXetAAizUDun3mfYMxEg+zOw2WS+iovWmm3cahkf
 xqyv4ZqoRLwqqTgugn4paZ/LXdVdz6SOoFIUQdJ6ruVgtS1zI6+6jkFNn
 nDkN3+e7CNQqtmPnhya9lrVmfOsPuKh8RoX6DvYji4ZzcfJ47TFAg6EOv
 fGlJmlSxIbt93uXZHU/eguOJPe+p1SpJSlqhnHzy/iZoZ0GZIllpInWCJ A==;
X-CSE-ConnectionGUID: Bl3bmIKTQu+h0wy6zsdE6A==
X-CSE-MsgGUID: jZ+ghKRiQPeFOhSVQACnzA==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13345571"
X-IronPort-AV: E=Sophos;i="6.08,194,1712646000"; d="scan'208";a="13345571"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 02:55:28 -0700
X-CSE-ConnectionGUID: 7gDjocIVRIi0GwSICchk3g==
X-CSE-MsgGUID: nhVyPtTaRu6dSfSAp9Ky8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,194,1712646000"; d="scan'208";a="34932109"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO fedora..)
 ([10.245.244.233])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 02:55:27 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI v5 18/20] drm/exec: Introduce drm_exec_sanitize_for_trylock
Date: Tue, 28 May 2024 11:55:00 +0200
Message-ID: <20240528095503.90177-19-thomas.hellstrom@linux.intel.com>
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

In some situations, we don't want to allow memory allocation or locking
of a contended lock to cause a drm_exec_trylock_obj() to fail.

Introduce a function to move the point-of-failure if desired.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/drm_exec.c | 33 +++++++++++++++++++++++++++++++++
 include/drm/drm_exec.h     |  2 +-
 2 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_exec.c b/drivers/gpu/drm/drm_exec.c
index c70d8b01effb..98c49d864984 100644
--- a/drivers/gpu/drm/drm_exec.c
+++ b/drivers/gpu/drm/drm_exec.c
@@ -189,6 +189,10 @@ static int drm_exec_obj_locked(struct drm_exec *exec,
 		exec->objects = tmp;
 		exec->max_objects += PAGE_SIZE / sizeof(void *);
 	}
+
+	if (!obj)
+		return 0;
+
 	drm_gem_object_get(obj);
 	exec->objects[exec->num_objects++] = obj;
 
@@ -241,6 +245,35 @@ static int drm_exec_lock_contended(struct drm_exec *exec)
 	return ret;
 }
 
+/**
+ * drm_exec_sanitize_for_trylock() - Sanitize the drm_exec state for a
+ * traditional trylock.
+ * @exec: The drm_exec object.
+ *
+ * drm_exec_trylock_obj() might fail because there is a contended lock
+ * in the transaction, or because of memory allocation failure.
+ * Calling this function before a drm_exec_trylock_obj() and with no
+ * drm_exec interactions inbetween the calls, will ensure that does not
+ * happen. Any failures will be reported by this function.
+ *
+ * Return: -EINTR if a wait for contended lock was interrupted by a signal,
+ * -ENOMEM on memory allocation failure.
+ */
+int drm_exec_sanitize_for_trylock(struct drm_exec *exec)
+{
+	int ret;
+
+	might_sleep();
+	might_alloc(GFP_KERNEL);
+
+	ret = drm_exec_lock_contended(exec);
+	if (ret)
+		return ret;
+
+	return drm_exec_obj_locked(exec, NULL, GFP_KERNEL);
+}
+EXPORT_SYMBOL(drm_exec_sanitize_for_trylock);
+
 /**
  * drm_exec_trylock_obj - trylock a GEM object for use
  * @exec: the drm_exec object with the state.
diff --git a/include/drm/drm_exec.h b/include/drm/drm_exec.h
index cafeec5dddfe..a236d2bf91a8 100644
--- a/include/drm/drm_exec.h
+++ b/include/drm/drm_exec.h
@@ -182,6 +182,6 @@ int drm_exec_prepare_array(struct drm_exec *exec,
 			   unsigned int num_fences);
 void drm_exec_snapshot(struct drm_exec *exec, struct drm_exec_snapshot *snap);
 void drm_exec_restore(struct drm_exec *exec, struct drm_exec_snapshot *snap);
-
+int drm_exec_sanitize_for_trylock(struct drm_exec *exec);
 
 #endif
-- 
2.44.0

