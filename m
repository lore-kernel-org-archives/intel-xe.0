Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81770C04AAC
	for <intel-xe@archiver.kernel.org>; Thu, 21 Sep 2023 11:42:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3944910E5D2;
	Thu, 21 Sep 2023 11:42:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A67E110E5D2
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Sep 2023 11:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695296530; x=1726832530;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yrIFZjxSN5zx4XGqzGmdKgkPAH8P2SQpVhx36Na7I7c=;
 b=Rlx7ARu9BOW2mL01TG/a1GhufzbBFXN7X7iEfqpStAlBOcFKvtIQqWuo
 b3h9GsOYxK61Xuvt4LRqmLFpOLrMsD24FdMVF7p9vSoewH0syw3WibIMK
 nkiBsnXzVdpbfpslDUA63Fx/ypZ+Dfn3xJMOso536G2LyIdfX3qqdMpeP
 OD95eNz///480i1raixAP21eJQfOP1n946GryphFT2Q2SUHkghXGNIKS1
 4ndnT3yyaXLettSnvaGwJqJ95yT7BHNI78JkAPlOAvFKbCNMUuZQ2W1kj
 Xmm8pxzS73eiq0Jn2kFqqSmejlfvhDXvyfBoV6Mhw6y/yZpnvx9sobpX+ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="370812819"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; d="scan'208";a="370812819"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2023 04:42:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="696697327"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; d="scan'208";a="696697327"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orsmga003.jf.intel.com with ESMTP; 21 Sep 2023 04:42:09 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 21 Sep 2023 17:19:57 +0530
Message-Id: <20230921115002.22884-3-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230921115002.22884-1-tejas.upadhyay@intel.com>
References: <20230921115002.22884-1-tejas.upadhyay@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH V5 2/7] drm/xe: Interface xe drm client with
 fdinfo interface
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

DRM core driver has introduced recently fdinfo interface to
show memory stats of individual drm client. Lets interface
xe drm client to fdinfo interface.

V2:
  - cover call to xe_drm_client_fdinfo under PROC_FS

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c     |  6 ++++++
 drivers/gpu/drm/xe/xe_drm_client.c | 17 +++++++++++++++++
 drivers/gpu/drm/xe/xe_drm_client.h |  4 +++-
 3 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 60509fe9a1c6..687dc3d79a66 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -138,6 +138,9 @@ static const struct file_operations xe_driver_fops = {
 	.read = drm_read,
 	.compat_ioctl = drm_compat_ioctl,
 	.llseek = noop_llseek,
+#ifdef CONFIG_PROC_FS
+	.show_fdinfo = drm_show_fdinfo,
+#endif
 };
 
 static void xe_driver_release(struct drm_device *dev)
@@ -162,6 +165,9 @@ static struct drm_driver driver = {
 
 	.dumb_create = xe_bo_dumb_create,
 	.dumb_map_offset = drm_gem_ttm_dumb_map_offset,
+#ifdef CONFIG_PROC_FS
+	.show_fdinfo = xe_drm_client_fdinfo,
+#endif
 	.release = &xe_driver_release,
 
 	.ioctls = xe_ioctls,
diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
index 1558ca4e0eb7..98c8a0cf2f56 100644
--- a/drivers/gpu/drm/xe/xe_drm_client.c
+++ b/drivers/gpu/drm/xe/xe_drm_client.c
@@ -50,3 +50,20 @@ void __xe_drm_client_free(struct kref *kref)
 
 	kfree(client);
 }
+
+#ifdef CONFIG_PROC_FS
+/**
+ * xe_drm_client_fdinfo() - Callback for fdinfo interface
+ * @p: The drm_printer ptr
+ * @file: The drm_file ptr
+ *
+ * This is callabck for drm fdinfo interface. Register this callback
+ * in drm driver ops for show_fdinfo.
+ *
+ * Return: void
+ */
+void xe_drm_client_fdinfo(struct drm_printer *p, struct drm_file *file)
+{
+	/* show_meminfo() will be developed here */
+}
+#endif
diff --git a/drivers/gpu/drm/xe/xe_drm_client.h b/drivers/gpu/drm/xe/xe_drm_client.h
index be097cdf5d12..dbe3a083c9df 100644
--- a/drivers/gpu/drm/xe/xe_drm_client.h
+++ b/drivers/gpu/drm/xe/xe_drm_client.h
@@ -39,5 +39,7 @@ struct xe_drm_client *xe_drm_client_alloc(void);
 static inline struct xe_drm_client *
 xe_drm_client_get(struct xe_drm_client *client);
 static inline void xe_drm_client_put(struct xe_drm_client *client);
-
+#ifdef CONFIG_PROC_FS
+void xe_drm_client_fdinfo(struct drm_printer *p, struct drm_file *file);
+#endif
 #endif
-- 
2.25.1

