Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19438C3DA47
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jul 2024 00:28:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8B9010E217;
	Tue,  9 Jul 2024 00:28:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BsrFh7WS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C31E10E211
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jul 2024 00:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720484920; x=1752020920;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=DCGsfqUiuyk2UmxW1l0dm2hQ3He+Zd2SWrUtNU+Rn/Y=;
 b=BsrFh7WSwRzc/z5cJGaPuDFDOsC8B2ZZcWf/FBjSBA3PUMlfiPybqh18
 iRLjlrOQodS1V/0oExZh+hLMQfR/bMw2wRNmQn7cTZD7RD65lq0oB+Y8R
 hL7lMOlFG8ptpoB9klvLHj4gf6tsMvk/3lPu52pq+ehg8p6MQrwkZLiap
 B+0CzqxX3ziHmPhU2c2L4flAJ5LQRJxHwI2Jmk7P5qxedz5nhxJPl8lrx
 bCuiE2xdNU0l6g3LEGklKiovAds0db4aAM2uSlNBeGssSvfHOudpBHXvD
 Mtk3IOuvcydMsccuNKn6ZQ2kn42oVXz4bXksYyFOlKJLTurSGUa/ksQPX g==;
X-CSE-ConnectionGUID: 9wPA7y6eTbC4/wHSFB0VTQ==
X-CSE-MsgGUID: jaIiRaLaRki01jp5rej/fA==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="29105703"
X-IronPort-AV: E=Sophos;i="6.09,193,1716274800"; d="scan'208";a="29105703"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2024 17:28:39 -0700
X-CSE-ConnectionGUID: djLfwe6PQhqM8A4ikt673w==
X-CSE-MsgGUID: L9u1Koj0Qfq7cpyzgLU9+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,193,1716274800"; d="scan'208";a="47630948"
Received: from unerlige-desk.jf.intel.com ([10.165.21.199])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2024 17:28:39 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org, matthew.brost@intel.com,
 lucas.demarchi@intel.com
Subject: [PATCH v2 2/4] drm/xe: Add ref counting for xe_file
Date: Mon,  8 Jul 2024 17:28:33 -0700
Message-Id: <20240709002835.3372618-3-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20240709002835.3372618-1-umesh.nerlige.ramappa@intel.com>
References: <20240709002835.3372618-1-umesh.nerlige.ramappa@intel.com>
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

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c       | 31 ++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_device.h       |  3 +++
 drivers/gpu/drm/xe/xe_device_types.h |  3 +++
 3 files changed, 35 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index c5464ad5d908..61dc0a37a4d0 100644
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
@@ -110,6 +113,30 @@ static void xe_file_destroy(struct xe_file *xef)
 	kfree(xef);
 }
 
+/**
+ * xe_file_get: Take a reference to the xe file object
+ * @xef: Pointer to the xe file
+ *
+ * Anyone making a copy of xef must take a reference to the xe file
+ * object using this call.
+ */
+struct xe_file *xe_file_get(struct xe_file *xef)
+{
+	kref_get(&xef->refcount);
+	return xef;
+}
+
+/**
+ * xe_file_put: Drop a reference to the xe file object
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
@@ -132,7 +159,7 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
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
index f0cf9020e463..70115fb8d806 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -578,6 +578,9 @@ struct xe_file {
 
 	/** @client: drm client */
 	struct xe_drm_client *client;
+
+	/** @refcount: ref count of this xe file */
+	struct kref refcount;
 };
 
 #endif
-- 
2.38.1

