Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F08D8606A755
	for <intel-xe@archiver.kernel.org>; Wed, 18 Nov 2026 17:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=f0L1dTlp
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B703310FEBA;
	Wed, 18 Nov 2026 17:28:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5917E10FEBA
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Nov 2026 17:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795022902; x=1826558902;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=opOorEf2HmDteHc16uoqeJ/yJ0JXhFmjmvbOtSWbqAc=;
 b=f0L1dTlpCk5riFsHbLGEZekoIpdV74Qyr801witSHZdQuZWp6cjZ2DKQ
 HVabWhfPouf5W50Qwo0jOfysYRUcO56cYWlkzwZf4H8uYQOFTiqcMailW
 W+ROUuVxQgQSXo0SO9UfQOP5dzRJ+hMFqiKVg+gB7LDOJOuItDSUCeJxE
 Fa9BeK4yWkBMK6S+dZy0acnTKYGtPKCCpW3TcGYDS94YPKnCXTZKfta+X
 O9hMHz6oXwZtN0nRfKrsYcpked6mZCVoXKN37Wyu0q9hEqLJxXN/OK5/U
 UZS46KfRVcRCR9UovnK5ei96jiiK4cjF5xfn3rEvhWIpzGgwqqEJaub5G Q==;
X-CSE-ConnectionGUID: HWU4lhvfT1ODFo2sUQAJHw==
X-CSE-MsgGUID: yBZbu3/aTAm1DqPjlF8V3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3730766"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3730766"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 09:28:21 -0800
X-CSE-ConnectionGUID: aENagtOZQlOS7RHVPJg/zg==
X-CSE-MsgGUID: GaKoF7KrSnO+GuCELDhK4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; d="scan'208";a="10203793"
Received: from gfx-coremm-kmd15.iind.intel.com ([10.223.55.8])
 by orviesa006.jf.intel.com with ESMTP; 18 Nov 2026 09:28:20 -0800
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: badal.nilawar@intel.com, sk.anirban@intel.com,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
Subject: [PATCH v3 3/3] drm/xe: Expose CRI maximum memory frequency and
 bandwidth in sysfs
Date: Wed, 18 Nov 2026 22:54:54 +0530
Message-ID: <20261118172458.316603-4-naresh.kumar.g@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261118172458.316603-1-naresh.kumar.g@intel.com>
References: <20261118172458.316603-1-naresh.kumar.g@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

Expose the maximum achievable memory frequency and bandwidth reported
by PCODE MEMORY_CONFIG as read-only tile#/memory/max_freq (MHz) and
tile#/memory/max_bw on Crescent Island.

These are capability limits, not the current memory frequency or
bandwidth usage. The existing PVC memory/freq0 entries are unchanged.

Document both attributes in the Xe sysfs ABI.

v2:(Sashiko)
1. Fixed CFI violation by updating attribute types and callback signatures
2. Added a check for xe->info.skip_pcode in memory_groups() to prevent
   exposing these attributes on Virtual Functions,
   where PCODE access is disabled.
3. Changed kernel version in documentation from 7.4 to 7.5(Badal)

v3:
1. The device_uid version was reverted to the previous value

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
---
 .../ABI/testing/sysfs-driver-intel-xe-gpu     |  24 ++++
 drivers/gpu/drm/xe/xe_vram_config.c           | 122 ++++++++++++++++--
 2 files changed, 132 insertions(+), 14 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-gpu b/Documentation/ABI/testing/sysfs-driver-intel-xe-gpu
index 4dc4afc3961d9..b563b7e8a9d9c 100644
--- a/Documentation/ABI/testing/sysfs-driver-intel-xe-gpu
+++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-gpu
@@ -8,3 +8,27 @@ Description:
 
 		This sysfs file is present only on supported Intel Xe platforms.
 		Accessible only to users with administrative privileges.
+
+What:		/sys/bus/pci/drivers/xe/.../tile<N>/memory/max_bw
+Date:		October 2026
+KernelVersion:	7.5
+Contact:	intel-xe@lists.freedesktop.org
+Description:
+		RO. Maximum achievable memory bandwidth reported by firmware, in
+		megabits per second (Mbps), as a decimal integer.
+		This is not a measurement of current memory bandwidth usage.
+
+		This sysfs file is present only on Crescent Island devices.
+		It is readable by all users.
+
+What:		/sys/bus/pci/drivers/xe/.../tile<N>/memory/max_freq
+Date:		October 2026
+KernelVersion:	7.5
+Contact:	intel-xe@lists.freedesktop.org
+Description:
+		RO. Maximum achievable memory frequency reported by firmware,
+		in MHz, as a decimal integer.
+		This is not the current memory frequency.
+
+		This sysfs file is present only on Crescent Island devices.
+		It is readable by all users.
diff --git a/drivers/gpu/drm/xe/xe_vram_config.c b/drivers/gpu/drm/xe/xe_vram_config.c
index 31a3405c39abd..130a8f76e6663 100644
--- a/drivers/gpu/drm/xe/xe_vram_config.c
+++ b/drivers/gpu/drm/xe/xe_vram_config.c
@@ -8,13 +8,14 @@
 #include "xe_device_types.h"
 #include "xe_pcode.h"
 #include "xe_pcode_api.h"
+#include "xe_pm.h"
 #include "xe_tile_sysfs.h"
 #include "xe_vram_config.h"
 
 /**
  * DOC: Xe VRAM config
  *
- * Provides sysfs entries for vram frequency in tile
+ * Provides sysfs entries for vram frequency and bandwidth in tile
  *
  * device/tile#/memory/freq0/max_freq - This is maximum frequency. This value is read-only as it
  *					is the fixed fuse point P0. It is not the system
@@ -22,17 +23,22 @@
  * device/tile#/memory/freq0/min_freq - This is minimum frequency. This value is read-only as it
  *					is the fixed fuse point PN. It is not the system
  *					configuration.
+ *
+ * On Crescent Island, the following entries are provided instead:
+ *
+ * device/tile#/memory/max_freq - Maximum achievable memory frequency in MHz. Read-only.
+ * device/tile#/memory/max_bw - Maximum achievable memory bandwidth in Mbps. Read-only.
  */
 
-static struct xe_tile *dev_to_tile(struct device *dev)
+static struct xe_tile *kobj_to_tile_parent(struct kobject *kobj)
 {
-	return kobj_to_tile(dev->kobj.parent);
+	return kobj_to_tile(kobj->parent);
 }
 
-static ssize_t max_freq_show(struct device *dev, struct device_attribute *attr,
+static ssize_t max_freq_show(struct kobject *kobj, struct kobj_attribute *attr,
 			     char *buf)
 {
-	struct xe_tile *tile = dev_to_tile(dev);
+	struct xe_tile *tile = kobj_to_tile_parent(kobj);
 	u32 val = 0, mbox;
 	int err;
 
@@ -49,12 +55,16 @@ static ssize_t max_freq_show(struct device *dev, struct device_attribute *attr,
 
 	return sysfs_emit(buf, "%u\n", val);
 }
-static DEVICE_ATTR_RO(max_freq);
 
-static ssize_t min_freq_show(struct device *dev, struct device_attribute *attr,
+static struct kobj_attribute kobj_attr_max_freq = {
+	.attr = { .name = "max_freq", .mode = 0444 },
+	.show = max_freq_show,
+};
+
+static ssize_t min_freq_show(struct kobject *kobj, struct kobj_attribute *attr,
 			     char *buf)
 {
-	struct xe_tile *tile = dev_to_tile(dev);
+	struct xe_tile *tile = kobj_to_tile_parent(kobj);
 	u32 val = 0, mbox;
 	int err;
 
@@ -71,11 +81,15 @@ static ssize_t min_freq_show(struct device *dev, struct device_attribute *attr,
 
 	return sysfs_emit(buf, "%u\n", val);
 }
-static DEVICE_ATTR_RO(min_freq);
+
+static struct kobj_attribute kobj_attr_min_freq = {
+	.attr = { .name = "min_freq", .mode = 0444 },
+	.show = min_freq_show,
+};
 
 static struct attribute *freq_attrs[] = {
-	&dev_attr_max_freq.attr,
-	&dev_attr_min_freq.attr,
+	&kobj_attr_max_freq.attr,
+	&kobj_attr_min_freq.attr,
 	NULL
 };
 
@@ -84,11 +98,90 @@ static const struct attribute_group freq_group_attrs = {
 	.attrs = freq_attrs,
 };
 
+static const struct attribute_group *pvc_memory_groups[] = {
+	&freq_group_attrs,
+	NULL
+};
+
+static int memory_config_read(struct kobject *kobj, u32 subcmd, u32 *val)
+{
+	struct xe_tile *tile = kobj_to_tile_parent(kobj);
+
+	guard(xe_pm_runtime)(tile_to_xe(tile));
+
+	return xe_pcode_read(tile, PCODE_MBOX(PCODE_MEMORY_CONFIG, subcmd, 0),
+			     val, NULL);
+}
+
+static ssize_t cri_max_freq_show(struct kobject *kobj, struct kobj_attribute *attr,
+				 char *buf)
+{
+	u32 val = 0;
+	int err;
+
+	err = memory_config_read(kobj, MEMORY_CONFIG_SUBCOMMAND_READ_MAX_FREQUENCY, &val);
+	if (err)
+		return err;
+
+	return sysfs_emit(buf, "%u\n", val);
+}
+
+static struct kobj_attribute kobj_attr_cri_max_freq = {
+	.attr = { .name = "max_freq", .mode = 0444 },
+	.show = cri_max_freq_show,
+};
+
+static ssize_t max_bw_show(struct kobject *kobj, struct kobj_attribute *attr,
+			   char *buf)
+{
+	u32 val = 0;
+	int err;
+
+	err = memory_config_read(kobj, MEMORY_CONFIG_SUBCOMMAND_READ_MAX_BANDWIDTH, &val);
+	if (err)
+		return err;
+
+	return sysfs_emit(buf, "%u\n", val);
+}
+
+static struct kobj_attribute kobj_attr_max_bw = {
+	.attr = { .name = "max_bw", .mode = 0444 },
+	.show = max_bw_show,
+};
+
+static struct attribute *cri_memory_attrs[] = {
+	&kobj_attr_cri_max_freq.attr,
+	&kobj_attr_max_bw.attr,
+	NULL
+};
+
+static const struct attribute_group cri_memory_group_attrs = {
+	.attrs = cri_memory_attrs,
+};
+
+static const struct attribute_group *cri_memory_groups[] = {
+	&cri_memory_group_attrs,
+	NULL
+};
+
+static const struct attribute_group **memory_groups(struct xe_device *xe)
+{
+	if (xe->info.skip_pcode)
+		return NULL;
+
+	if (xe->info.platform == XE_PVC)
+		return pvc_memory_groups;
+	if (xe->info.platform == XE_CRESCENTISLAND)
+		return cri_memory_groups;
+	return NULL;
+}
+
 static void vram_freq_sysfs_fini(void *arg)
 {
 	struct kobject *kobj = arg;
+	struct xe_tile *tile = kobj_to_tile(kobj->parent);
 
-	sysfs_remove_group(kobj, &freq_group_attrs);
+	sysfs_remove_groups(kobj, memory_groups(tile_to_xe(tile)));
 	kobject_put(kobj);
 }
 
@@ -103,17 +196,18 @@ static void vram_freq_sysfs_fini(void *arg)
 int xe_vram_config_sysfs_init(struct xe_tile *tile)
 {
 	struct xe_device *xe = tile_to_xe(tile);
+	const struct attribute_group **groups = memory_groups(xe);
 	struct kobject *kobj;
 	int err;
 
-	if (xe->info.platform != XE_PVC)
+	if (!groups)
 		return 0;
 
 	kobj = kobject_create_and_add("memory", tile->sysfs);
 	if (!kobj)
 		return -ENOMEM;
 
-	err = sysfs_create_group(kobj, &freq_group_attrs);
+	err = sysfs_create_groups(kobj, groups);
 	if (err) {
 		kobject_put(kobj);
 		return err;
-- 
2.43.0

