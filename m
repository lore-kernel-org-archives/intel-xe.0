Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41011606A325
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 13:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JwUQxLDS
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C3AD112A17;
	Fri, 20 Nov 2026 13:03:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 410C1112A3F
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Nov 2026 13:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795179806; x=1826715806;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=aHXLzlCrEPPKNqZcsCLp61SKZ+EFdNnIfTiEtUQIlcc=;
 b=JwUQxLDSz9AMvZh2jaynC07NT3xZwpjylHotNkv+4uLQjAmckyV9TJqc
 GXKGl+SeiGyo01Ra6XsE7olHkK4H6N44IUBSMNDlNMZS4WeETzBpLWxjM
 u2pJrul5Jx6VI7QijUSj950VYIw27wo6GM/7YRrHd3RCaVEvxv2Xdh2D0
 1BLf2mH4kSt51/XIu1rbOJSSoWr3N68rTiv0Vi54Pxk1Q0vEh6M7DXUH+
 sn2Eq59LbaZbPXK9scmBp6qRoszRcRESCHRIwDgwWcu1i53k87IvRQOOk
 uuqUQ44cKU7E+sj/Fc1p3tBv1Ycy7nrROAouseIazkYcc4lWynrRnPUTk w==;
X-CSE-ConnectionGUID: hCUW3fHhRwGF80w+B1t7ZQ==
X-CSE-MsgGUID: Llngcm/CRiqKEu+NqJSL4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="4072686"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="4072686"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 05:03:26 -0800
X-CSE-ConnectionGUID: On2yWgXkQjGcPI7fzm92sQ==
X-CSE-MsgGUID: q9ThwEMdQGO4wYy63lMMJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; d="scan'208";a="10639259"
Received: from slindbla-desk.ger.corp.intel.com (HELO [192.168.0.182])
 ([10.245.244.23])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 05:03:25 -0800
From: Matthew Auld <matthew.auld@intel.com>
Date: Fri, 20 Nov 2026 13:02:19 +0000
Subject: [PATCH v2 4/6] drm/xe: Add a userptr repin timeout sysfs attribute
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261120-userptr-repin-v2-4-65e1f6e582ef@intel.com>
References: <20261120-userptr-repin-v2-0-65e1f6e582ef@intel.com>
In-Reply-To: <20261120-userptr-repin-v2-0-65e1f6e582ef@intel.com>
To: Matthew Brost <matthew.brost@intel.com>, 
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>, 
 Stuart Summers <stuart.summers@intel.com>
Cc: intel-xe@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>
X-Mailer: b4 0.14.3
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Add a per-device sysfs attribute, userptr_repin_timeout_ms, to be used
to bound the overall time a userptr repin is retried when the CPU
mappings keep changing during the repin. The default is 10000 ms on
single-node systems and 30000 ms on multi-node NUMA systems, and zero
means retry indefinitely. The value can be changed at any time and is
read each time the timeout is checked.

v2 (Matt):
- Reject values above INT_MAX (or reaching MAX_JIFFY_OFFSET) with
  -EINVAL in userptr_repin_timeout_ms_store() so msecs_to_jiffies() does
  not treat them as an infinite timeout.
- Lower the default from 100000 ms to 10000 ms on single-node systems
  and 30000 ms on multi-node NUMA systems (Himal).

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Co-developed-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c       |  5 ++++
 drivers/gpu/drm/xe/xe_device.h       |  3 ++
 drivers/gpu/drm/xe/xe_device_sysfs.c | 57 ++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_device_types.h |  8 +++++
 4 files changed, 73 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index f5a581d39c96..f0c88d3297f9 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -8,6 +8,7 @@
 #include <linux/aperture.h>
 #include <linux/delay.h>
 #include <linux/error-injection.h>
+#include <linux/nodemask.h>
 #include <linux/units.h>
 
 #include <drm/drm_client.h>
@@ -439,6 +440,10 @@ struct xe_device *xe_device_create(struct pci_dev *pdev)
 	if (err)
 		return ERR_PTR(err);
 
+	xe->userptr_repin_timeout_ms = num_online_nodes() > 1 ?
+		XE_USERPTR_REPIN_TIMEOUT_MS_NUMA_DEFAULT :
+		XE_USERPTR_REPIN_TIMEOUT_MS_DEFAULT;
+
 	return xe;
 }
 ALLOW_ERROR_INJECTION(xe_device_create, ERRNO); /* See xe_pci_probe() */
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 7a7632e2d56b..6b1e48369bdd 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -43,6 +43,9 @@ static inline struct xe_device *ttm_to_xe_device(struct ttm_device *ttm)
 	return container_of(ttm, struct xe_device, ttm);
 }
 
+#define XE_USERPTR_REPIN_TIMEOUT_MS_DEFAULT		10000
+#define XE_USERPTR_REPIN_TIMEOUT_MS_NUMA_DEFAULT	30000
+
 struct xe_device *xe_device_create(struct pci_dev *pdev);
 int xe_device_init_early(struct xe_device *xe);
 int xe_device_probe_early(struct xe_device *xe);
diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
index ff5d25dd867c..f6275e74eb31 100644
--- a/drivers/gpu/drm/xe/xe_device_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
@@ -4,7 +4,9 @@
  */
 
 #include <linux/device.h>
+#include <linux/jiffies.h>
 #include <linux/kobject.h>
+#include <linux/limits.h>
 #include <linux/pci.h>
 #include <linux/sysfs.h>
 
@@ -38,6 +40,16 @@
  * reclaimed by the shrinker. Higher values reduce reclaim pressure on
  * non-purgeable buffer objects. Valid values are 1 to 64. Defaults to
  * CONFIG_DRM_XE_SHRINKER_NON_PURGEABLE_SEEKS.
+ *
+ * userptr_repin_timeout_ms - Report/change the overall time, in
+ * milliseconds, a userptr repin is retried, with all locks dropped between
+ * the attempts, when the CPU mappings keep changing during the repin. The
+ * time is measured from the first repin attempt after an invalidation. When
+ * it expires the repin fails with -EBUSY. Zero means retry indefinitely.
+ * Valid values are 0 to INT_MAX (capped by MAX_JIFFY_OFFSET). The value is
+ * read each time the timeout is checked, so a change takes effect
+ * immediately. Defaults to 10000 on single-node systems and 30000 on
+ * multi-node NUMA systems.
  */
 
 static ssize_t
@@ -340,6 +352,47 @@ static const struct attribute_group shrinker_attr_group = {
 	.attrs = shrinker_attrs,
 };
 
+static ssize_t
+userptr_repin_timeout_ms_show(struct device *dev,
+			      struct device_attribute *attr, char *buf)
+{
+	struct xe_device *xe = pdev_to_xe_device(to_pci_dev(dev));
+
+	return sysfs_emit(buf, "%u\n", READ_ONCE(xe->userptr_repin_timeout_ms));
+}
+
+static ssize_t
+userptr_repin_timeout_ms_store(struct device *dev,
+			       struct device_attribute *attr,
+			       const char *buf, size_t count)
+{
+	struct xe_device *xe = pdev_to_xe_device(to_pci_dev(dev));
+	u32 val;
+	int ret;
+
+	ret = kstrtou32(buf, 0, &val);
+	if (ret)
+		return ret;
+
+	if (val > INT_MAX || msecs_to_jiffies(val) >= MAX_JIFFY_OFFSET)
+		return -EINVAL;
+
+	WRITE_ONCE(xe->userptr_repin_timeout_ms, val);
+
+	return count;
+}
+
+static DEVICE_ATTR_RW(userptr_repin_timeout_ms);
+
+static struct attribute *userptr_attrs[] = {
+	&dev_attr_userptr_repin_timeout_ms.attr,
+	NULL
+};
+
+static const struct attribute_group userptr_attr_group = {
+	.attrs = userptr_attrs,
+};
+
 int xe_device_sysfs_init(struct xe_device *xe)
 {
 	struct device *dev = xe->drm.dev;
@@ -349,6 +402,10 @@ int xe_device_sysfs_init(struct xe_device *xe)
 	if (ret)
 		return ret;
 
+	ret = devm_device_add_group(dev, &userptr_attr_group);
+	if (ret)
+		return ret;
+
 	if (xe->d3cold.capable) {
 		ret = devm_device_add_group(dev, &vram_attr_group);
 		if (ret)
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 8f2a31949073..fc80cd2c766e 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -437,6 +437,14 @@ struct xe_device {
 		u16 idx[__XE_CACHE_LEVEL_COUNT];
 	} pat;
 
+	/**
+	 * @userptr_repin_timeout_ms: Overall time in milliseconds a userptr
+	 * repin is retried before failing with -EBUSY. Zero means retry
+	 * indefinitely. Accessed with READ_ONCE() / WRITE_ONCE() and tunable
+	 * through sysfs.
+	 */
+	u32 userptr_repin_timeout_ms;
+
 	/** @d3cold: Encapsulate d3cold related stuff */
 	struct {
 		/** @d3cold.capable: Indicates if root port is d3cold capable */

-- 
2.56.1

