Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F862CA0ECA
	for <intel-xe@archiver.kernel.org>; Tue, 12 Sep 2023 11:45:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D00A210E409;
	Tue, 12 Sep 2023 11:45:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D7E310E406
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Sep 2023 11:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694519100; x=1726055100;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7HOqmlfDgAbcMrmmh4jvef151gSfWuHZAMT0ylkgor8=;
 b=ZT+8/vC+xs8rVao314ohfFVasAq968RhVuViUF+Vha8J5dAbLTgNJiJ9
 IqOR7r1/kKvYdRZjko6japvsqmkC8EGHCDrIw8N/gKr97VliLFHiB5Bpa
 xlhFrmVoLC4URN3wSVaRrZzc7scpY9k3Xv6VptFeACa7Kjo2hqW7JcWSa
 ZDn48nLfqFSW54YfEL9JJMpio2fgKstnNDeFQrmur9SrKn+1bdLggeQ72
 3vwGBOz0+Tbt7vzjLKw/FcVHK8xJKYoikdfA93i5Pa9IXfij7UvkS/t9z
 vLZ1RXTSxwRU03xEjDLMXY/rfnf+AoPoKM9bvjQudqX/GNfbtGV4/E/1A Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="381050187"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="381050187"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 04:45:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="743700038"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="743700038"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orsmga002.jf.intel.com with ESMTP; 12 Sep 2023 04:44:58 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 12 Sep 2023 17:22:34 +0530
Message-Id: <20230912115239.3554341-3-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230912115239.3554341-1-tejas.upadhyay@intel.com>
References: <20230912115239.3554341-1-tejas.upadhyay@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH V2 2/7] drm/xe: Interface xe drm client with
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

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
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

