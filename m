Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A5B3C4829D
	for <intel-xe@archiver.kernel.org>; Tue,  6 Feb 2024 14:18:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 668E5112C3C;
	Tue,  6 Feb 2024 14:18:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="LOR3/npB";
	dkim-atps=neutral
Received: from mail02.habana.ai (unknown [62.90.112.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E77710EDF9
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Feb 2024 14:18:42 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1707229107; bh=QMokfSQj2KgB83vKhP/Z2G/nesnz/aunpfTNXQJ/pM8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LOR3/npBmfMjdKpxPHjNM8FJPtP1c2q+qscnruRqSOQSfe3VoBbkM7d7+Z6Y3r6E4
 OQyCF/Ounuuf7UlcyvV4YfMEfD6sWIJhvNOFNhbCzjyoWBSMaI1SjXQmjBYFaFcy01
 VWPoPYnxysJi6FlbgYrbyut/c9aL6kadx2EuBWlUje+mm1CIrGf+okscYziu8/mFpv
 2lx2clO4zYBsMZvR+XQU+6EH5iAFaQJItq83TGG8EdLqNADsqFhIQ2SPNJui5Acypf
 9MLZ1vuvvJm5AqS/IVcnvAWQHgzL1Ue8kU+wd/HkWXc1nkXe1ZETS+eNRDWjyyLk21
 3d6i6k3H5cHOQ==
Received: from mhaimovski-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by mhaimovski-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with
 ESMTPS id 416EIMjS265007
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 6 Feb 2024 16:18:22 +0200
Received: (from mhaimovski@localhost)
 by mhaimovski-vm-u22.habana-labs.com (8.15.2/8.15.2/Submit) id 416EIM1K265006; 
 Tue, 6 Feb 2024 16:18:22 +0200
From: Moti Haimovski <mhaimovski@habana.ai>
To: intel-xe@lists.freedesktop.org
Cc: mhaimovski@habana.ai, lucas.demarchi@intel.com, matthew.brost@intel.com
Subject: [PATCH 1/2] drm/xe: add ref count to xe_file
Date: Tue,  6 Feb 2024 16:18:19 +0200
Message-Id: <20240206141820.264977-2-mhaimovski@habana.ai>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240206141820.264977-1-mhaimovski@habana.ai>
References: <20240206141820.264977-1-mhaimovski@habana.ai>
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

Added reference counters (kref) to for managing the xe_file and
exported xe_file open and close routines.

Xe-file is a structure which is a part of the context created when
a user opens the device.
The xef serves as a "database" for all the resources the user allocates
and uses (directly and indirectly). Since this is a per-user resource
then the initial design was for a single user controlling it.
Latest modifications to the driver broke the above the assumption
since user context may now be accessed also by the driver. This lead
to races and subsequent crashes when a user context was closed while
still in use by the driver.
The use of kref added by this commit solves this issue.
i
Exporting the xe_file open and close routines is done for supporting
the creation of internal contexts implemented in another commit.

Signed-off-by: Moti Haimovski <mhaimovski@habana.ai>
---
 drivers/gpu/drm/xe/xe_device.c       | 51 ++++++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_device.h       |  6 ++++
 drivers/gpu/drm/xe/xe_device_types.h |  3 ++
 3 files changed, 53 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 5b84d73055202..e75bca060f473 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -51,9 +51,8 @@ struct lockdep_map xe_device_mem_access_lockdep_map = {
 };
 #endif
 
-static int xe_file_open(struct drm_device *dev, struct drm_file *file)
+int xe_file_open(struct xe_device *xe, struct drm_file *file)
 {
-	struct xe_device *xe = to_xe_device(dev);
 	struct xe_drm_client *client;
 	struct xe_file *xef;
 	int ret = -ENOMEM;
@@ -82,17 +81,27 @@ static int xe_file_open(struct drm_device *dev, struct drm_file *file)
 	xe->clients.count++;
 	spin_unlock(&xe->clients.lock);
 
+	kref_init(&xef->refcount);
+
 	file->driver_priv = xef;
 	return 0;
 }
 
+
+static int __xe_file_open(struct drm_device *dev, struct drm_file *file)
+{
+	struct xe_device *xe = to_xe_device(dev);
+
+	return xe_file_open(xe, file);
+}
+
 static void device_kill_persistent_exec_queues(struct xe_device *xe,
 					       struct xe_file *xef);
 
-static void xe_file_close(struct drm_device *dev, struct drm_file *file)
+static void xe_file_terminate(struct kref *ref)
 {
-	struct xe_device *xe = to_xe_device(dev);
-	struct xe_file *xef = file->driver_priv;
+	struct xe_file *xef = container_of(ref, struct xe_file, refcount);
+	struct xe_device *xe = xef->xe;
 	struct xe_vm *vm;
 	struct xe_exec_queue *q;
 	unsigned long idx;
@@ -122,6 +131,33 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
 	kfree(xef);
 }
 
+struct xe_file *xe_file_get(struct xe_file *xef)
+{
+	if (likely(xef && kref_get_unless_zero(&xef->refcount)))
+		return xef;
+
+	return NULL;
+}
+
+void xe_file_put(struct xe_file *xef)
+{
+	kref_put(&xef->refcount, xe_file_terminate);
+}
+
+void xe_file_close(struct xe_device *xe, struct drm_file *file)
+{
+	struct xe_file *xef = file->driver_priv;
+
+	xe_file_put(xef);
+}
+
+static void __xe_file_close(struct drm_device *dev, struct drm_file *file)
+{
+	struct xe_device *xe = to_xe_device(dev);
+
+	xe_file_close(xe, file);
+}
+
 static const struct drm_ioctl_desc xe_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(XE_DEVICE_QUERY, xe_query_ioctl, DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(XE_GEM_CREATE, xe_gem_create_ioctl, DRM_RENDER_ALLOW),
@@ -171,8 +207,9 @@ static struct drm_driver driver = {
 	    DRIVER_GEM |
 	    DRIVER_RENDER | DRIVER_SYNCOBJ |
 	    DRIVER_SYNCOBJ_TIMELINE | DRIVER_GEM_GPUVA,
-	.open = xe_file_open,
-	.postclose = xe_file_close,
+
+	.open = __xe_file_open,
+	.postclose = __xe_file_close,
 
 	.gem_prime_import = xe_gem_prime_import,
 
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 462f59e902b12..fb89b83c3d850 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -48,6 +48,12 @@ void xe_device_remove_persistent_exec_queues(struct xe_device *xe,
 
 void xe_device_wmb(struct xe_device *xe);
 
+int xe_file_open(struct xe_device *xe, struct drm_file *file);
+void xe_file_close(struct xe_device *xe, struct drm_file *file);
+
+struct xe_file *xe_file_get(struct xe_file *xef);
+void xe_file_put(struct xe_file *xef);
+
 static inline struct xe_file *to_xe_file(const struct drm_file *file)
 {
 	return file->driver_priv;
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index eb2b806a1d233..72e6958f15ac2 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -550,6 +550,9 @@ struct xe_file {
 	/** @drm: base DRM file */
 	struct drm_file *drm;
 
+	/** @refcount: xef usage count  */
+	struct kref refcount;
+
 	/** @vm: VM state for file */
 	struct {
 		/** @vm.xe: xarray to store VMs */
-- 
2.34.1

