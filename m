Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FC3BC83F17
	for <intel-xe@archiver.kernel.org>; Thu, 31 Aug 2023 08:58:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E125A10E1AC;
	Thu, 31 Aug 2023 08:58:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4CD910E1AC
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Aug 2023 08:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693472292; x=1725008292;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Cmjf9CrsKoagyU+hI74YoEZ8W266RuUT5BHGqvV7bF4=;
 b=JYR3IPzZl5oeCN5I4fi53BW/PN8aHIVnpIlBdsddBRfqchimpXN/oHed
 UQZ50vrgE5qcY/6tGzaovAuiM90k+Jth8HcZ/9s/p89uS2oVPIuufv8Og
 4KCUHVU2csoJstAqSt6tSvKLRI1S3CQB8IjKFHh1r2fe1FyI0uZFq0mZN
 anxBqz748fZNkAFXQnxlT7hxVyuo4nxR6zAJ/n2rN++W1kvURaO38XMS1
 jXnjU9+BEUOji1sOX+ghuxKFRw5rQ3XjaQ+QEe5KN52KvtV5i05lbm77g
 0I6G2PRJwLFd/V7Sw4nHSRZmH5rQ98F9SyzjBZ/bRc7UtmZcXiF6GdP4E w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="375814157"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; d="scan'208";a="375814157"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2023 01:58:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="716257357"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; d="scan'208";a="716257357"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orsmga006.jf.intel.com with ESMTP; 31 Aug 2023 01:58:10 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 31 Aug 2023 14:35:31 +0530
Message-Id: <20230831090536.2949934-3-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230831090536.2949934-1-tejas.upadhyay@intel.com>
References: <20230831090536.2949934-1-tejas.upadhyay@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/7] drm/xe: Interface xe drm client with fdinfo
 interface
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

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c     |  4 ++++
 drivers/gpu/drm/xe/xe_drm_client.c | 17 +++++++++++++++++
 drivers/gpu/drm/xe/xe_drm_client.h |  4 +++-
 3 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index cf59c7b74eaf..1aae352a982c 100644
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
@@ -162,6 +165,7 @@ static struct drm_driver driver = {
 
 	.dumb_create = xe_bo_dumb_create,
 	.dumb_map_offset = drm_gem_ttm_dumb_map_offset,
+	.show_fdinfo = PTR_IF(IS_ENABLED(CONFIG_PROC_FS), xe_drm_client_fdinfo),
 	.release = &xe_driver_release,
 
 	.ioctls = xe_ioctls,
diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
index ea7993338076..b5dc024b5dd0 100644
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

