Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9156FC3DA63
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jul 2024 21:05:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3212D10EB1F;
	Thu, 18 Jul 2024 21:05:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gz1ia92N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 846C310EB1D
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Jul 2024 21:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721336752; x=1752872752;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=q83O15ozsgZ7FuXoI1pR8wlMXuWHxaEiS9yky3JgzRk=;
 b=Gz1ia92NA/LXwYEVdwb1e1YslMH2zG0pL+uZDAhfMhJfMQlbDAHfJbWH
 Czzbn00xGwI3v6llPey6Jqn5yTi92dXcqIxr+cS1fOjEkRPnR4T5/Lzh3
 OSFhBT2ImKt4OqbPkYDUN2lYIbbGlccw7o/qoXYC5Czrha1ary/KMxx3Q
 6BL4JaCde2k0reKGMNv1x7oIbvczCEIoMnv2sRACWu9M4xXeDARdmEIub
 6y/EHW353wG155KQ08fPt9c/PoB4mnHltONEFdovFIDr7AHx/YmWLd+x4
 v6KEWqOBbP15oRLx9WGIPJX+DniiEd2gu9LARvBpzFnaoq73LqWIywa6m w==;
X-CSE-ConnectionGUID: FGbPEhdJQlyNhaFE26gWrA==
X-CSE-MsgGUID: syjRfPftTkyVnJaiqeIAdw==
X-IronPort-AV: E=McAfee;i="6700,10204,11137"; a="30349947"
X-IronPort-AV: E=Sophos;i="6.09,218,1716274800"; d="scan'208";a="30349947"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2024 14:05:52 -0700
X-CSE-ConnectionGUID: +IUoMbjnTfSykiP3QonsWQ==
X-CSE-MsgGUID: Da7FMGJrTGCdMrPN1VSezw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,218,1716274800"; d="scan'208";a="88385252"
Received: from unerlige-desk.jf.intel.com ([10.165.21.199])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2024 14:05:52 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v4 2/4] drm/xe: Add ref counting for xe_file
Date: Thu, 18 Jul 2024 14:05:46 -0700
Message-Id: <20240718210548.3580382-3-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20240718210548.3580382-1-umesh.nerlige.ramappa@intel.com>
References: <20240718210548.3580382-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
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

Add ref counting for xe_file.

v2:
- Add kernel doc for exported functions (Matt)
- Instead of xe_file_destroy, export the get/put helpers (Lucas)

v3: Fixup the kernel-doc format and description (Matt, Lucas)

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c       | 33 ++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_device.h       |  3 +++
 drivers/gpu/drm/xe/xe_device_types.h |  3 +++
 3 files changed, 37 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 0a7478d1ee63..50c302cf3249 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -90,11 +90,14 @@ static int xe_file_open(struct drm_device *dev, struct drm_file *file)
 	spin_unlock(&xe->clients.lock);
 
 	file->driver_priv = xef;
+	kref_init(&xef->refcount);
+
 	return 0;
 }
 
-static void xe_file_destroy(struct xe_file *xef)
+static void xe_file_destroy(struct kref *ref)
 {
+	struct xe_file *xef = container_of(ref, struct xe_file, refcount);
 	struct xe_device *xe = xef->xe;
 
 	xa_destroy(&xef->exec_queue.xa);
@@ -110,6 +113,32 @@ static void xe_file_destroy(struct xe_file *xef)
 	kfree(xef);
 }
 
+/**
+ * xe_file_get() - Take a reference to the xe file object
+ * @xef: Pointer to the xe file
+ *
+ * Anyone with a pointer to xef must take a reference to the xe file
+ * object using this call.
+ *
+ * Return: xe file pointer
+ */
+struct xe_file *xe_file_get(struct xe_file *xef)
+{
+	kref_get(&xef->refcount);
+	return xef;
+}
+
+/**
+ * xe_file_put() - Drop a reference to the xe file object
+ * @xef: Pointer to the xe file
+ *
+ * Used to drop reference to the xef object
+ */
+void xe_file_put(struct xe_file *xef)
+{
+	kref_put(&xef->refcount, xe_file_destroy);
+}
+
 static void xe_file_close(struct drm_device *dev, struct drm_file *file)
 {
 	struct xe_file *xef = file->driver_priv;
@@ -132,7 +161,7 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
 		xe_vm_close_and_put(vm);
 	mutex_unlock(&xef->vm.lock);
 
-	xe_file_destroy(xef);
+	xe_file_put(xef);
 }
 
 static const struct drm_ioctl_desc xe_ioctls[] = {
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 0a2a3e7fd402..533ccfb2567a 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -171,4 +171,7 @@ static inline bool xe_device_wedged(struct xe_device *xe)
 
 void xe_device_declare_wedged(struct xe_device *xe);
 
+struct xe_file *xe_file_get(struct xe_file *xef);
+void xe_file_put(struct xe_file *xef);
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 8e81ade7279b..36252d5b1663 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -581,6 +581,9 @@ struct xe_file {
 
 	/** @client: drm client */
 	struct xe_drm_client *client;
+
+	/** @refcount: ref count of this xe file */
+	struct kref refcount;
 };
 
 #endif
-- 
2.38.1

