Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68EF6C5B554
	for <intel-xe@archiver.kernel.org>; Wed, 28 May 2025 21:54:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BB7610E6DA;
	Wed, 28 May 2025 21:54:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X7mxTnf1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60C8810E0C6
 for <intel-xe@lists.freedesktop.org>; Wed, 28 May 2025 21:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748469258; x=1780005258;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dAQ7oSUB1A7ssJJVwynIkMD06A3xS1m0LSK0FE3W3zI=;
 b=X7mxTnf13xaK+OjCcEmhLsnPA3g2fnVUyJ77wNylVlOyQS8QbwZeQqcM
 1xqdzLfqETO//JLeM3eVerOxw/iYp8Kb3ciNgtU8qS4u9m6L1BJzEcZin
 oEiVpmWpLp5tEq0czVoZPy/5jhZE9xpnKN757Y+qm99p3V6IEsIFQ8xHO
 eJ76KKNM8rSxLOw5eelNZP52c4qihyohd3SEYnUvMnyGVkoE61JI9DvN2
 NsQwS69XyLkP/6DdIbIslfkX6fz8dvkT8358b91SfKLNN6UJh3cV9GQgb
 Vhk5uSSfY6jJl0vVYWkMcV+hF32Gs32RpzlgPXt9CXKFoYuvWnH4AVEC2 w==;
X-CSE-ConnectionGUID: bEqqQvOeSBSRctD59jiBbw==
X-CSE-MsgGUID: IjGwMISnROO3VzHd6q2q7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="73044761"
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; d="scan'208";a="73044761"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 14:54:18 -0700
X-CSE-ConnectionGUID: RfmTm3hOSXS0+EG6reW3Bw==
X-CSE-MsgGUID: 4uSUgr3TT+C28zwRUMuhiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; d="scan'208";a="143201081"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 14:54:18 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Riana Tauro <riana.tauro@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Stuart Summers <stuart.summers@intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH v4 4/5] drm/xe/configfs: Add attribute to disable engines
Date: Wed, 28 May 2025 14:54:07 -0700
Message-ID: <20250528-engine-mask-v4-4-f4636d2a890a@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250528-engine-mask-v4-0-f4636d2a890a@intel.com>
References: <20250528-engine-mask-v4-0-f4636d2a890a@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-d9694
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
 drivers/gpu/drm/xe/xe_configfs.c | 149 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 147 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index 8320d57ef5a80..8ec1ff1e4e808 100644
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
@@ -48,6 +53,30 @@
  *	# echo 1 > /sys/kernel/config/xe/0000:03:00.0/survivability_mode
  *	# echo 0000:03:00.0 > /sys/bus/pci/drivers/xe/bind  (Enters survivability mode if supported)
  *
+ * Allowed engines:
+ * ----------------
+ *
+ * Allow only a set of engine(s) to be available, disabling the other engines
+ * even if they are available in hardware. This is applied after HW fuses are
+ * considered on each tile. Examples:
+ *
+ * Allow only one render and one copy engines, nothing else::
+ *
+ *	# echo 'rcs0,bcs0' > /sys/kernel/config/xe/0000:03:00.0/engines_allowed
+ *
+ * Allow only compute engines and first copy engine::
+ *
+ *	# echo 'ccs*,bcs0' > /sys/kernel/config/xe/0000:03:00.0/engines_allowed
+ *
+ * Note that the engine names are the per-GT hardware names. On multi-tile
+ * platforms, writing ``rcs0,bcs0`` to this file would allow the first render
+ * and copy engines on each tile.
+ *
+ * The requested configuration may not be supported by the platform and driver
+ * may fail to probe. For example: if at least one copy engine is expected to be
+ * available for migrations, but it's disabled. This is intended for debugging
+ * purposes only.
+ *
  * Remove devices
  * ==============
  *
@@ -60,11 +89,30 @@ struct xe_config_device {
 	struct config_group group;
 
 	bool survivability_mode;
+	u64 engines_allowed;
 
 	/* protects attributes */
 	struct mutex lock;
 };
 
+struct engine_info {
+	const char *cls;
+	u64 mask;
+};
+
+/* Some helpful macros to aid on the sizing of buffer allocation when parsing */
+#define MAX_ENGINE_CLASS_CHARS 5
+#define MAX_ENGINE_INSTANCE_CHARS 2
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
@@ -94,10 +142,96 @@ static ssize_t survivability_mode_store(struct config_item *item, const char *pa
 	return len;
 }
 
+static ssize_t engines_allowed_show(struct config_item *item, char *page)
+{
+	struct xe_config_device *dev = to_xe_config_device(item);
+	char *p = page;
+
+	for (size_t i = 0; i < ARRAY_SIZE(engine_info); i++) {
+		u64 mask = engine_info[i].mask;
+
+		if ((dev->engines_allowed & mask) == mask) {
+			p += sprintf(p, "%s*\n", engine_info[i].cls);
+		} else if (mask & dev->engines_allowed) {
+			u16 bit0 = __ffs64(mask), bit;
+
+			mask &= dev->engines_allowed;
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
+static bool lookup_engine_mask(const char *pattern, u64 *mask)
+{
+	for (size_t i = 0; i < ARRAY_SIZE(engine_info); i++) {
+		u8 instance;
+		u16 bit;
+
+		if (!str_has_prefix(pattern, engine_info[i].cls))
+			continue;
+
+		pattern += strlen(engine_info[i].cls);
+
+		if (!strcmp(pattern, "*")) {
+			*mask = engine_info[i].mask;
+			return true;
+		}
+
+		if (kstrtou8(pattern, 10, &instance))
+			return false;
+
+		bit = __ffs64(engine_info[i].mask) + instance;
+		if (bit >= fls64(engine_info[i].mask))
+			return false;
+
+		*mask = BIT_ULL(bit);
+		return true;
+	}
+
+	return false;
+}
+
+static ssize_t engines_allowed_store(struct config_item *item, const char *page,
+				     size_t len)
+{
+	struct xe_config_device *dev = to_xe_config_device(item);
+	size_t patternlen, p;
+	u64 mask, val = 0;
+
+	for (p = 0; p < len; p += patternlen + 1) {
+		char buf[MAX_ENGINE_CLASS_CHARS + MAX_ENGINE_INSTANCE_CHARS + 1];
+
+		patternlen = strcspn(page + p, ",\n");
+		if (patternlen >= sizeof(buf))
+			return -EINVAL;
+
+		memcpy(buf, page + p, patternlen);
+		buf[patternlen] = '\0';
+
+		if (!lookup_engine_mask(buf, &mask))
+			return -EINVAL;
+
+		val |= mask;
+	}
+
+	mutex_lock(&dev->lock);
+	dev->engines_allowed = val;
+	mutex_unlock(&dev->lock);
+
+	return len;
+}
+
 CONFIGFS_ATTR(, survivability_mode);
+CONFIGFS_ATTR(, engines_allowed);
 
 static struct configfs_attribute *xe_config_device_attrs[] = {
 	&attr_survivability_mode,
+	&attr_engines_allowed,
 	NULL,
 };
 
@@ -139,6 +273,9 @@ static struct config_group *xe_config_make_device_group(struct config_group *gro
 	if (!dev)
 		return ERR_PTR(-ENOMEM);
 
+	/* Default values */
+	dev->engines_allowed = U64_MAX;
+
 	config_group_init_type_name(&dev->group, name, &xe_config_device_type);
 
 	mutex_init(&dev->lock);
@@ -237,8 +374,16 @@ void xe_configfs_clear_survivability_mode(struct pci_dev *pdev)
  */
 u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev)
 {
-	/* dummy implementation */
-	return U64_MAX;
+	struct xe_config_device *dev = configfs_find_group(pdev);
+	u64 engines_allowed;
+
+	if (!dev)
+		return U64_MAX;
+
+	engines_allowed = dev->engines_allowed;
+	config_item_put(&dev->group.cg_item);
+
+	return engines_allowed;
 }
 
 int __init xe_configfs_init(void)

-- 
2.49.0

