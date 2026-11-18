Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8423B606A31C
	for <intel-xe@archiver.kernel.org>; Wed, 18 Nov 2026 07:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cnrNMn2f
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A1F210E6AE;
	Wed, 18 Nov 2026 07:28:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5F6010E6AE
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Nov 2026 07:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794986918; x=1826522918;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0YaE+EFJc0XZlI8xvSddYNX1trD7+bFsfDwQS1jFWlE=;
 b=cnrNMn2fTReucfI6D7fPLbrJeaHuXlzF/xixlYADxnukJ9rwIvbPwos9
 dvrCoFRomP9/Za6or2zUy4sEMpC+NBGYuLR3ileHmbo0DE5RVZFhWl2Qy
 crpWGFFre2GDIZrTiMsYAu9+2VYQezn3iQFnPQVY9gLHiYmO5+ZS8f47x
 //37BtmwIQbqIMexkKo1Ku+rnX/7KVrh8aft1QR387H4WjXEJDNijft/U
 XxYh+3hrMRphGxMIChcn/Lz2GvKyT5eADS5LtyX2Rc9vbHf2QJlyrkk/o
 InN6OWBJTXSzgI5q4oiJk2GXhWbU9dVLK1FvpW8VKsV68GG48hHS3wLjF w==;
X-CSE-ConnectionGUID: 5Hhss+RvSM2g6hkL4pKxKQ==
X-CSE-MsgGUID: 6WkNnxHGQfi/EaUW+dwSGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3676869"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3676869"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2026 23:28:38 -0800
X-CSE-ConnectionGUID: yKyN+qPTRSSe898Cj1HVYg==
X-CSE-MsgGUID: McITMsr4SquEsZYSmuZ9eQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="9957075"
Received: from gfx-coremm-kmd15.iind.intel.com ([10.223.55.8])
 by orviesa003.jf.intel.com with ESMTP; 17 Nov 2026 23:28:36 -0800
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: badal.nilawar@intel.com, sk.anirban@intel.com,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
Subject: [PATCH 3/3] drm/xe: Expose CRI maximum memory frequency and bandwidth
 in sysfs
Date: Wed, 18 Nov 2026 12:55:05 +0530
Message-ID: <20261118072506.4159301-4-naresh.kumar.g@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261118072506.4159301-1-naresh.kumar.g@intel.com>
References: <20261118072506.4159301-1-naresh.kumar.g@intel.com>
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
tile#/memory/max_bw_Mbps (Mbps) on Crescent Island.

These are capability limits, not the current memory frequency or
bandwidth usage. The existing PVC memory/freq0 entries are unchanged.

Document both attributes in the Xe sysfs ABI.

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
---
 .../ABI/testing/sysfs-driver-intel-xe-gpu     | 24 ++++++
 drivers/gpu/drm/xe/xe_vram_config.c           | 85 ++++++++++++++++++-
 2 files changed, 105 insertions(+), 4 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-gpu b/Documentation/ABI/testing/sysfs-driver-intel-xe-gpu
index 4dc4afc3961d9..45a140af965e0 100644
--- a/Documentation/ABI/testing/sysfs-driver-intel-xe-gpu
+++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-gpu
@@ -8,3 +8,27 @@ Description:
 
 		This sysfs file is present only on supported Intel Xe platforms.
 		Accessible only to users with administrative privileges.
+
+What:		/sys/bus/pci/drivers/xe/.../tile<N>/memory/max_bw
+Date:		October 2026
+KernelVersion:	7.4
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
+KernelVersion:	7.4
+Contact:	intel-xe@lists.freedesktop.org
+Description:
+		RO. Maximum achievable memory frequency reported by firmware,
+		in MHz, as a decimal integer.
+		This is not the current memory frequency.
+
+		This sysfs file is present only on Crescent Island devices.
+		It is readable by all users.
diff --git a/drivers/gpu/drm/xe/xe_vram_config.c b/drivers/gpu/drm/xe/xe_vram_config.c
index 31a3405c39abd..4b8661b8597ac 100644
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
@@ -22,6 +23,11 @@
  * device/tile#/memory/freq0/min_freq - This is minimum frequency. This value is read-only as it
  *					is the fixed fuse point PN. It is not the system
  *					configuration.
+ *
+ * On Crescent Island, the following entries are provided instead:
+ *
+ * device/tile#/memory/max_freq - Maximum achievable memory frequency in MHz. Read-only.
+ * device/tile#/memory/max_bw - Maximum achievable memory bandwidth in Mbps. Read-only.
  */
 
 static struct xe_tile *dev_to_tile(struct device *dev)
@@ -84,11 +90,81 @@ static const struct attribute_group freq_group_attrs = {
 	.attrs = freq_attrs,
 };
 
+static const struct attribute_group *pvc_memory_groups[] = {
+	&freq_group_attrs,
+	NULL
+};
+
+static int memory_config_read(struct device *dev, u32 subcmd, u32 *val)
+{
+	struct xe_tile *tile = dev_to_tile(dev);
+
+	guard(xe_pm_runtime)(tile_to_xe(tile));
+
+	return xe_pcode_read(tile, PCODE_MBOX(PCODE_MEMORY_CONFIG, subcmd, 0),
+			     val, NULL);
+}
+
+static ssize_t cri_max_freq_show(struct device *dev, struct device_attribute *attr,
+				 char *buf)
+{
+	u32 val = 0;
+	int err;
+
+	err = memory_config_read(dev, MEMORY_CONFIG_SUBCOMMAND_READ_MAX_FREQUENCY, &val);
+	if (err)
+		return err;
+
+	return sysfs_emit(buf, "%u\n", val);
+}
+
+static struct device_attribute dev_attr_cri_max_freq =
+	__ATTR(max_freq, 0444, cri_max_freq_show, NULL);
+
+static ssize_t max_bw_show(struct device *dev, struct device_attribute *attr,
+			   char *buf)
+{
+	u32 val = 0;
+	int err;
+
+	err = memory_config_read(dev, MEMORY_CONFIG_SUBCOMMAND_READ_MAX_BANDWIDTH, &val);
+	if (err)
+		return err;
+
+	return sysfs_emit(buf, "%u\n", val);
+}
+static DEVICE_ATTR_RO(max_bw);
+
+static struct attribute *cri_memory_attrs[] = {
+	&dev_attr_cri_max_freq.attr,
+	&dev_attr_max_bw.attr,
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
 
@@ -103,17 +179,18 @@ static void vram_freq_sysfs_fini(void *arg)
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

