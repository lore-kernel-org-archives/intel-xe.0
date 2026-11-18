Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31346606A74B
	for <intel-xe@archiver.kernel.org>; Wed, 18 Nov 2026 17:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VLuwKfcL
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB21610FE12;
	Wed, 18 Nov 2026 17:28:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A1F410FE12
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Nov 2026 17:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795022900; x=1826558900;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2r1+0T+YoynkTuf+nOHmUJtwtm4HM3tMz33/adqNG6M=;
 b=VLuwKfcL1FO3oll4RJ0f7QLJMZhn/Fl4iOvrbPaQ/EWvIKAQ/NTKf4XI
 nxP+O+8iJxNrY8KBzhV/xGDkLqcluM4J7f52AXkMEXAFs+L8fkk8qdNVk
 +bd2FKQWvP6m+koZbbfCK7zrxljoI5NEEhlniwFxLIn38XTDAS627wpdX
 MYsJYHrKEliN63pclW6lk5TEBMJqVf4K1WkEdTg5Dg8gWNOtoT98Zf9W8
 pfanEaaCJ/1Gh7jeJDFgSY2ZzjeW+NaKxmvWlLBH9WOMABCE44Ft5aLuH
 iFYJNdtkWCT3KW99vwLc/8yKPMwNBWw1KEJ9FpfrtGkeXIbFwgcgFTkWb Q==;
X-CSE-ConnectionGUID: DaI28lFLTx+k7I1NNOz5Ig==
X-CSE-MsgGUID: HW6LegEBThide9d8hmg+VQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3730763"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3730763"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 09:28:19 -0800
X-CSE-ConnectionGUID: whXI0eIjT6CrOb5op725EQ==
X-CSE-MsgGUID: 6V7C16veS0uwrcJyEVu2lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; d="scan'208";a="10203788"
Received: from gfx-coremm-kmd15.iind.intel.com ([10.223.55.8])
 by orviesa006.jf.intel.com with ESMTP; 18 Nov 2026 09:28:18 -0800
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: badal.nilawar@intel.com, sk.anirban@intel.com,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
Subject: [PATCH v3 2/3] drm/xe: Rename xe_vram_freq to xe_vram_config
Date: Wed, 18 Nov 2026 22:54:53 +0530
Message-ID: <20261118172458.316603-3-naresh.kumar.g@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261118172458.316603-1-naresh.kumar.g@intel.com>
References: <20261118172458.316603-1-naresh.kumar.g@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

The tile memory sysfs component is about to expose memory configuration
beyond frequency, such as maximum bandwidth. Rename xe_vram_freq.c
and xe_vram_freq.h to xe_vram_config.c xe_vram_config.h.
xe_vram_freq_sysfs_init() to xe_vram_config_sysfs_init() to reflect that.

No functional change.

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/Makefile                         |  2 +-
 drivers/gpu/drm/xe/xe_tile_sysfs.c                  |  4 ++--
 .../gpu/drm/xe/{xe_vram_freq.c => xe_vram_config.c} |  8 ++++----
 drivers/gpu/drm/xe/xe_vram_config.h                 | 13 +++++++++++++
 drivers/gpu/drm/xe/xe_vram_freq.h                   | 13 -------------
 5 files changed, 20 insertions(+), 20 deletions(-)
 rename drivers/gpu/drm/xe/{xe_vram_freq.c => xe_vram_config.c} (94%)
 create mode 100644 drivers/gpu/drm/xe/xe_vram_config.h
 delete mode 100644 drivers/gpu/drm/xe/xe_vram_freq.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 4377f60f5dabe..b0ce47fbac9d5 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -150,7 +150,7 @@ xe-y += xe_bb.o \
 	xe_vm.o \
 	xe_vm_madvise.o \
 	xe_vram.o \
-	xe_vram_freq.o \
+	xe_vram_config.o \
 	xe_vsec.o \
 	xe_wa.o \
 	xe_wait_user_fence.o \
diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.c b/drivers/gpu/drm/xe/xe_tile_sysfs.c
index 510aa0ac44287..c944579a17c85 100644
--- a/drivers/gpu/drm/xe/xe_tile_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
@@ -10,7 +10,7 @@
 #include "xe_device_types.h"
 #include "xe_pm.h"
 #include "xe_tile_sysfs.h"
-#include "xe_vram_freq.h"
+#include "xe_vram_config.h"
 
 static void xe_tile_sysfs_kobj_release(struct kobject *kobj)
 {
@@ -49,7 +49,7 @@ int xe_tile_sysfs_init(struct xe_tile *tile)
 
 	tile->sysfs = &kt->base;
 
-	err = xe_vram_freq_sysfs_init(tile);
+	err = xe_vram_config_sysfs_init(tile);
 	if (err)
 		goto err_object;
 
diff --git a/drivers/gpu/drm/xe/xe_vram_freq.c b/drivers/gpu/drm/xe/xe_vram_config.c
similarity index 94%
rename from drivers/gpu/drm/xe/xe_vram_freq.c
rename to drivers/gpu/drm/xe/xe_vram_config.c
index 8717367ccd4c7..31a3405c39abd 100644
--- a/drivers/gpu/drm/xe/xe_vram_freq.c
+++ b/drivers/gpu/drm/xe/xe_vram_config.c
@@ -9,10 +9,10 @@
 #include "xe_pcode.h"
 #include "xe_pcode_api.h"
 #include "xe_tile_sysfs.h"
-#include "xe_vram_freq.h"
+#include "xe_vram_config.h"
 
 /**
- * DOC: Xe VRAM freq
+ * DOC: Xe VRAM config
  *
  * Provides sysfs entries for vram frequency in tile
  *
@@ -93,14 +93,14 @@ static void vram_freq_sysfs_fini(void *arg)
 }
 
 /**
- * xe_vram_freq_sysfs_init - Initialize vram frequency sysfs component
+ * xe_vram_config_sysfs_init - Initialize vram configuration sysfs component
  * @tile: Xe Tile object
  *
  * It needs to be initialized after the main tile component is ready
  *
  * Returns: 0 on success, negative error code on error.
  */
-int xe_vram_freq_sysfs_init(struct xe_tile *tile)
+int xe_vram_config_sysfs_init(struct xe_tile *tile)
 {
 	struct xe_device *xe = tile_to_xe(tile);
 	struct kobject *kobj;
diff --git a/drivers/gpu/drm/xe/xe_vram_config.h b/drivers/gpu/drm/xe/xe_vram_config.h
new file mode 100644
index 0000000000000..98903911f6583
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_vram_config.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _XE_VRAM_CONFIG_H_
+#define _XE_VRAM_CONFIG_H_
+
+struct xe_tile;
+
+int xe_vram_config_sysfs_init(struct xe_tile *tile);
+
+#endif /* _XE_VRAM_CONFIG_H_ */
diff --git a/drivers/gpu/drm/xe/xe_vram_freq.h b/drivers/gpu/drm/xe/xe_vram_freq.h
deleted file mode 100644
index bf726bc5881f2..0000000000000
--- a/drivers/gpu/drm/xe/xe_vram_freq.h
+++ /dev/null
@@ -1,13 +0,0 @@
-/* SPDX-License-Identifier: MIT */
-/*
- * Copyright © 2023 Intel Corporation
- */
-
-#ifndef _XE_VRAM_FREQ_H_
-#define _XE_VRAM_FREQ_H_
-
-struct xe_tile;
-
-int xe_vram_freq_sysfs_init(struct xe_tile *tile);
-
-#endif /* _XE_VRAM_FREQ_H_ */
-- 
2.43.0

