Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8361606A320
	for <intel-xe@archiver.kernel.org>; Thu, 19 Nov 2026 11:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AtuOK5/M
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 892EE1122B8;
	Thu, 19 Nov 2026 11:19:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FAE61122C6
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Nov 2026 11:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795087171; x=1826623171;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=Pj+Z51+dH+44Un9A5Ao0+wiDp3yilfaEKlKgUw2hGlM=;
 b=AtuOK5/MzbADOrKYFub7yR/9T7SCwCWt+TWqepHmZJHrhGorVmsB2GpV
 pEn+d+GpVWWZFo1Fs1MoFLgdhvzhkH7Sw1d8GV+lO2LROKD+Nj8Wdv1te
 lL0/LWSZTAnf/FU7RRd7MI8za7b89XLqCpHnhihk0EAWuy7c8GrbTlJxd
 mQYh1jic4eJepv6jlAu7SuaYvuYg14HbgpwVLz6G3QDHRzggRA4uyDM+4
 urOFKcF5/9DtEdKKWgGuhKCUQVuLoB6lolekEI4p3ZJyhSuDQlid6MZzu
 vJVy7iHwUPNC4sJZoR36nBHPEA1yrNx7faQnXq6H7Tl9EVHJYov10RpYJ w==;
X-CSE-ConnectionGUID: Zx8t5ZbjTTerASdc4i7pPw==
X-CSE-MsgGUID: xRhPyJeNQqCMyP6XjbLNOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3828778"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3828778"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 03:19:30 -0800
X-CSE-ConnectionGUID: gEAkQE9SSWC3BO6wirO/hg==
X-CSE-MsgGUID: pNc/1UIvS0OPlz6Uf4+FtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; d="scan'208";a="10402280"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO [192.168.0.182])
 ([10.245.245.108])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 03:19:28 -0800
From: Matthew Auld <matthew.auld@intel.com>
Date: Thu, 19 Nov 2026 11:14:34 +0000
Subject: [PATCH 3/5] drm/xe: Add a userptr repin timeout sysfs attribute
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261119-userptr-repin-v1-3-af2e327833a9@intel.com>
References: <20261119-userptr-repin-v1-0-af2e327833a9@intel.com>
In-Reply-To: <20261119-userptr-repin-v1-0-af2e327833a9@intel.com>
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
mappings keep changing during the repin. The default is 100000 ms and
zero means retry indefinitely. The value can be changed at any time and
is read each time the timeout is checked.

v2 (Matt):
- Reject values above INT_MAX (or reaching MAX_JIFFY_OFFSET) with
  -EINVAL in userptr_repin_timeout_ms_store() so msecs_to_jiffies() does
  not treat them as an infinite timeout.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c       |  2 ++
 drivers/gpu/drm/xe/xe_device.h       |  2 ++
 drivers/gpu/drm/xe/xe_device_sysfs.c | 56 ++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_device_types.h |  8 ++++++
 4 files changed, 68 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 616e02066ae6..4e54a1b7fc51 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -437,6 +437,8 @@ struct xe_device *xe_device_create(struct pci_dev *pdev)
 	if (err)
 		return ERR_PTR(err);
 
+	xe->userptr_repin_timeout_ms = XE_USERPTR_REPIN_TIMEOUT_MS_DEFAULT;
+
 	return xe;
 }
 ALLOW_ERROR_INJECTION(xe_device_create, ERRNO); /* See xe_pci_probe() */
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 7a7632e2d56b..128fe51bede7 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -43,6 +43,8 @@ static inline struct xe_device *ttm_to_xe_device(struct ttm_device *ttm)
 	return container_of(ttm, struct xe_device, ttm);
 }
 
+#define XE_USERPTR_REPIN_TIMEOUT_MS_DEFAULT	100000
+
 struct xe_device *xe_device_create(struct pci_dev *pdev);
 int xe_device_init_early(struct xe_device *xe);
 int xe_device_probe_early(struct xe_device *xe);
diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
index ff5d25dd867c..52111b4458f4 100644
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
 
@@ -38,6 +40,15 @@
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
+ * immediately. Defaults to 100000.
  */
 
 static ssize_t
@@ -340,6 +351,47 @@ static const struct attribute_group shrinker_attr_group = {
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
@@ -349,6 +401,10 @@ int xe_device_sysfs_init(struct xe_device *xe)
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

