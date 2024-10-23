Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5BB4D2E023
	for <intel-xe@archiver.kernel.org>; Wed, 23 Oct 2024 07:53:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3A5E10E778;
	Wed, 23 Oct 2024 07:53:06 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC77A10E778
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Oct 2024 07:53:04 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-xe@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Tejun Heo <tj@kernel.org>,
 Zefan Li <lizefan.x@bytedance.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Friedrich Vock <friedrich.vock@gmx.de>, cgroups@vger.kernel.org,
 linux-mm@kvack.org, Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH 2/7] drm/drv: Add drmm cgroup registration for dev cgroups.
Date: Wed, 23 Oct 2024 09:52:55 +0200
Message-ID: <20241023075302.27194-3-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241023075302.27194-1-maarten.lankhorst@linux.intel.com>
References: <20241023075302.27194-1-maarten.lankhorst@linux.intel.com>
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

From: Maxime Ripard <mripard@kernel.org>

Drivers will need to register a cgroup device at probe time, so let's
give them a drm-managed helper.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/drm_drv.c | 21 +++++++++++++++++++++
 include/drm/drm_drv.h     |  4 ++++
 2 files changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index c2c172eb25df7..251d1d69b09c5 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -26,6 +26,7 @@
  * DEALINGS IN THE SOFTWARE.
  */
 
+#include <linux/cgroup_dev.h>
 #include <linux/debugfs.h>
 #include <linux/fs.h>
 #include <linux/module.h>
@@ -820,6 +821,26 @@ void drm_dev_put(struct drm_device *dev)
 }
 EXPORT_SYMBOL(drm_dev_put);
 
+static inline void drmm_cg_unregister_device(struct drm_device *dev, void *arg)
+{
+	dev_cgroup_unregister_device(arg);
+}
+
+int drmm_cgroup_register_device(struct drm_device *dev,
+				struct dev_cgroup_device *cgdev)
+{
+	int ret;
+	char dev_name[32];
+
+	snprintf(dev_name, sizeof(dev_name), "drm/%s", dev->unique);
+	ret = dev_cgroup_register_device(cgdev, dev_name);
+	if (ret)
+		return ret;
+
+	return drmm_add_action_or_reset(dev, drmm_cg_unregister_device, cgdev);
+}
+EXPORT_SYMBOL_GPL(drmm_cgroup_register_device);
+
 static int create_compat_control_link(struct drm_device *dev)
 {
 	struct drm_minor *minor;
diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
index 1bbbcb8e2d231..3e83c7ce7f2d0 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -34,6 +34,7 @@
 
 #include <drm/drm_device.h>
 
+struct dev_cgroup_device;
 struct drm_fb_helper;
 struct drm_fb_helper_surface_size;
 struct drm_file;
@@ -438,6 +439,9 @@ void *__devm_drm_dev_alloc(struct device *parent,
 			   const struct drm_driver *driver,
 			   size_t size, size_t offset);
 
+int drmm_cgroup_register_device(struct drm_device *dev,
+				struct dev_cgroup_device *cgdev);
+
 /**
  * devm_drm_dev_alloc - Resource managed allocation of a &drm_device instance
  * @parent: Parent device object
-- 
2.45.2

