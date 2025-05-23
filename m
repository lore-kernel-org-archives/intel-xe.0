Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31460C54ED1
	for <intel-xe@archiver.kernel.org>; Fri, 23 May 2025 17:42:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C206A10E0BD;
	Fri, 23 May 2025 17:42:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FebUMrOt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A98110E098
 for <intel-xe@lists.freedesktop.org>; Fri, 23 May 2025 17:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748022171; x=1779558171;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZKSapsB1S1tAFf1XDO/i+m+PC/bAcDXAaFndqO2u7Bw=;
 b=FebUMrOtjDhqT14ilPecaKfjNLof1YQG3q04ZrdBAZ+29Alhjlj5Ey8w
 S1ifVNcIOsCAOV6TVi+VJ2H1j0utJ7g0jcoSEFkvGpPXYB/S9+LP6yjnb
 50ndFTfhHBiBXwmgLI03lwSlE8lTEpP/8CKOAzh1chM2yfz6yZG7S7671
 uMp4qDsbpzvb9xm5xXCMzgb8x/ob+Wty4JQdOWRiSW6Dt7iGGrMyvhQB9
 0bZDdolySpoVyzzUUzYAEgpF3JUUjndvkkmGLsU//sRsq/Wbj5A+ctTVB
 38rbvxMzTMazJPYMf5TkJo9Lm27yMb+Kjm4qs00ruUF4QTL6F6DP2WhuR Q==;
X-CSE-ConnectionGUID: UQwCCJ50So+b2hWazXQxmQ==
X-CSE-MsgGUID: nqz/HosgRJ28RLJYXlWLXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="53881259"
X-IronPort-AV: E=Sophos;i="6.15,309,1739865600"; d="scan'208";a="53881259"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2025 10:42:51 -0700
X-CSE-ConnectionGUID: GWCskYn7SlGSY5cThSx1UA==
X-CSE-MsgGUID: rlVjqhGGQYegVUlvqo7AMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,309,1739865600"; d="scan'208";a="141098144"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2025 10:42:51 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Riana Tauro <riana.tauro@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH v3 3/3] drm/xe/configfs: Add attribute to disable engines
Date: Fri, 23 May 2025 10:42:33 -0700
Message-ID: <20250523-engine-mask-v3-3-11817dc6eb63@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250523-engine-mask-v3-0-11817dc6eb63@intel.com>
References: <20250523-engine-mask-v3-0-11817dc6eb63@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-f7671
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

Add the userspace interface to load the driver with fewer engines.
The syntax is to just echo the engine names to a file in configfs, like
below:

	echo 'rcs0,bcs0' > /sys/kernel/config/xe/<bdf>/engine_allowed

With that engines other than rcs0 and bcs0 will not be enabled. To
enable all instances from a class, a '*' can be used.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_configfs.c | 137 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 135 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index 11ca36f194bfc..b27bbe203eb46 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -3,14 +3,19 @@
  * Copyright © 2025 Intel Corporation
  */
 
+#include <linux/bitops.h>
 #include <linux/configfs.h>
+#include <linux/find.h>
 #include <linux/init.h>
 #include <linux/module.h>
 #include <linux/pci.h>
+#include <linux/string.h>
 
 #include "xe_configfs.h"
 #include "xe_module.h"
 
+#include "xe_hw_engine_types.h"
+
 /**
  * DOC: Xe Configfs
  *
@@ -48,6 +53,23 @@
  *	# echo 1 > /sys/kernel/config/xe/0000:03:00.0/survivability_mode
  *	# echo 0000:03:00.0 > /sys/bus/pci/drivers/xe/bind  (Enters survivability mode if supported)
  *
+ * Allowed engine:
+ * ---------------
+ *
+ * Allow only a set of engine(s) to be available - this is the equivalent of
+ * fusing engines off in software. Examples:
+ *
+ * Allow only one render and one copy engines, nothing else::
+ *
+ *	# echo 'rcs0,bcs0' > /sys/kernel/config/xe/0000:03:00.0/engine_allowed
+ *
+ * Allow only compute engines and first copy engine::
+ *
+ *	# echo 'ccs*,bcs0' > /sys/kernel/config/xe/0000:03:00.0/engine_allowed
+ *
+ * The requested configuration may not be supported by the platform and driver
+ * may fail to probe - intended for debugging purposes.
+ *
  * Remove devices
  * ==============
  *
@@ -60,11 +82,26 @@ struct xe_config_device {
 	struct config_group group;
 
 	bool survivability_mode;
+	u64 engine_allowed;
 
 	/* protects attributes */
 	struct mutex lock;
 };
 
+struct engine_info {
+	const char *cls;
+	u64 mask;
+};
+
+static const struct engine_info engine_info[] = {
+	{ .cls = "rcs", .mask = XE_HW_ENGINE_RCS_MASK },
+	{ .cls = "bcs", .mask = XE_HW_ENGINE_BCS_MASK },
+	{ .cls = "vcs", .mask = XE_HW_ENGINE_VCS_MASK },
+	{ .cls = "vecs", .mask = XE_HW_ENGINE_VECS_MASK },
+	{ .cls = "ccs", .mask = XE_HW_ENGINE_CCS_MASK },
+	{ .cls = "gsccs", .mask = XE_HW_ENGINE_GSCCS_MASK },
+};
+
 static struct xe_config_device *to_xe_config_device(struct config_item *item)
 {
 	return container_of(to_config_group(item), struct xe_config_device, group);
@@ -94,10 +131,95 @@ static ssize_t survivability_mode_store(struct config_item *item, const char *pa
 	return len;
 }
 
+static ssize_t engine_allowed_show(struct config_item *item, char *page)
+{
+	struct xe_config_device *dev = to_xe_config_device(item);
+	char *p = page;
+
+	for (size_t i = 0; i < ARRAY_SIZE(engine_info); i++) {
+		u64 mask = engine_info[i].mask;
+
+		if ((dev->engine_allowed & mask) == mask) {
+			p += sprintf(p, "%s*\n", engine_info[i].cls);
+		} else if (mask & dev->engine_allowed) {
+			u16 bit0 = __ffs64(mask), bit;
+
+			mask &= dev->engine_allowed;
+
+			for_each_set_bit(bit, (const unsigned long *)&mask, 64)
+				p += sprintf(p, "%s%u\n", engine_info[i].cls,
+					     bit - bit0);
+		}
+	}
+
+	return p - page;
+}
+
+static bool lookup_engine_mask(const char *name, size_t namelen, u64 *mask)
+{
+	for (size_t i = 0; i < ARRAY_SIZE(engine_info); i++) {
+		size_t clslen = strlen(engine_info[i].cls);
+		size_t numlen = namelen - clslen;
+		char instancestr[4];
+		u8 instance;
+		u16 bit;
+
+		if (namelen <= clslen || strncmp(name, engine_info[i].cls, clslen))
+			continue;
+
+		if (name[clslen] == '*' && numlen == 1) {
+			*mask = engine_info[i].mask;
+			return true;
+		}
+
+		if (numlen > sizeof(instancestr) - 1)
+			return false;
+
+		memcpy(instancestr, name + clslen, numlen);
+		instancestr[numlen] = '\0';
+
+		if (kstrtou8(instancestr, 10, &instance))
+			return false;
+
+		bit = __ffs64(engine_info[i].mask) + instance;
+		if (bit > fls64(engine_info[i].mask))
+			return false;
+
+		*mask = BIT_ULL(bit);
+		return true;
+	}
+
+	return false;
+}
+
+static ssize_t engine_allowed_store(struct config_item *item, const char *page,
+				    size_t len)
+{
+	struct xe_config_device *dev = to_xe_config_device(item);
+	size_t namelen, p;
+	u64 mask, val = 0;
+
+	for (p = 0; p < len; p += namelen + 1) {
+		namelen = strcspn(page + p, ",\n");
+		if (!lookup_engine_mask(page + p, namelen, &mask))
+			return -EINVAL;
+
+		val |= mask;
+	}
+
+	mutex_lock(&dev->lock);
+	dev->engine_allowed = val;
+	mutex_unlock(&dev->lock);
+
+	return len;
+}
+
 CONFIGFS_ATTR(, survivability_mode);
+CONFIGFS_ATTR(, engine_allowed);
 
 static struct configfs_attribute *xe_config_device_attrs[] = {
 	&attr_survivability_mode,
+	&attr_engine_allowed,
 	NULL,
 };
 
@@ -139,6 +261,9 @@ static struct config_group *xe_config_make_device_group(struct config_group *gro
 	if (!dev)
 		return ERR_PTR(-ENOMEM);
 
+	/* Default values */
+	dev->engine_allowed = U64_MAX;
+
 	config_group_init_type_name(&dev->group, name, &xe_config_device_type);
 
 	mutex_init(&dev->lock);
@@ -237,8 +362,16 @@ void xe_configfs_clear_survivability_mode(struct pci_dev *pdev)
  */
 u64 xe_configfs_get_engine_allowed(struct pci_dev *pdev)
 {
-	/* dummy implementation */
-	return U64_MAX;
+	struct xe_config_device *dev = configfs_find_group(pdev);
+	u64 engine_allowed;
+
+	if (!dev)
+		return U64_MAX;
+
+	engine_allowed = dev->engine_allowed;
+	config_item_put(&dev->group.cg_item);
+
+	return engine_allowed;
 }
 
 int __init xe_configfs_init(void)

-- 
2.49.0

