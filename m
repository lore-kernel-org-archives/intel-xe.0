Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02195FA3757
	for <intel-xe@archiver.kernel.org>; Fri, 13 Sep 2024 14:33:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2A0810E263;
	Fri, 13 Sep 2024 14:33:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jdXGrUxR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5016310E263
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Sep 2024 14:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726237996; x=1757773996;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=C9ZoGk3BH5ACn5halCwcKkuGVwbmp/75VEvrKhvYDsk=;
 b=jdXGrUxRS4XXWCMhsU8KA0W4V2ZSqhZrzpgv1NPhSwI3L2eTurAIQ1E+
 mVsgLSgng3A8R0PKm1fWG0B0EFWIrgWsbnCwUHE+taFDS405IgC8oBu7x
 k+e+2kJ49OGcU2qfcpx4z/NNkQGJhbPWF5ztTCZhm0M0vAxstc/Tyy8qA
 rIGPA6f+Gax3DUDC0h4glUyEmUZvBEVCPLl6bzB1UdrekQft1MxzC92nK
 TrLgAiXVuaCMhQwOrYXjA95Re41G8H4j8rz5quf67Lm0I7dw6hA8RsOa6
 xt9eD00bkbWsv+Sw2Gh2TCvlkequPoh2JMopK6IlKU2DM+MY5C1d6g0qL A==;
X-CSE-ConnectionGUID: yFqT8YprQJScGqoP+022qw==
X-CSE-MsgGUID: 4F9lWp6hQG+G/1IoMo9Uvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="25264704"
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; d="scan'208";a="25264704"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2024 07:33:16 -0700
X-CSE-ConnectionGUID: 6Quw1Ax8TA6CVhHe9A51gg==
X-CSE-MsgGUID: 7ssQ4Y/0TqaS+1Hbp+Q8Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; d="scan'208";a="105532028"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.99])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2024 07:33:14 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [RFC v1] drm/xe: Use fault injection infrastructure to find issues at
 probe time
Date: Fri, 13 Sep 2024 16:33:05 +0200
Message-ID: <20240913143305.2262927-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

This RFC is a rework of https://patchwork.freedesktop.org/series/137314/
but instead of importing custom macros from i915, it makes use of the
standard kernel fault injection infrastructure, see fault-injection.rst.

In particular, it leverages error injectable functions with the macro
ALLOW_ERROR_INJECTION(). This macro requires minimal code changes to the
faulting function, if it meets the injectable functions requirements:
fault-injection.html#requirements-for-the-error-injectable-functions

Unfortunately this is not the case in most of the injection points of the
original series, so a wrapper is added if needed. Only a few examples are
shown in this RFC to discuss the proper pattern to apply.

The return code of the functions using ALLOW_ERROR_INJECTION() can be
conditionnally modified at runtime by tuning some debugfs entries. This
requires CONFIG_FUNCTION_ERROR_INJECTION (among others).

One way to use fault injection at probe time by making each of those
functions fail one at a time is:

    FAILTYPE=fail_function
    DEVICE="0000:00:08.0" # depends on the system
    ERRNO=-12 # -ENOMEM, other value might be needed depending on error handling

    echo N > /sys/kernel/debug/$FAILTYPE/task-filter
    echo 100 > /sys/kernel/debug/$FAILTYPE/probability
    echo 0 > /sys/kernel/debug/$FAILTYPE/interval
    echo -1 > /sys/kernel/debug/$FAILTYPE/times
    echo 0 > /sys/kernel/debug/$FAILTYPE/space
    echo 1 > /sys/kernel/debug/$FAILTYPE/verbose

    modprobe xe
    echo $DEVICE > /sys/bus/pci/drivers/xe/unbind

    grep -oP "^.* \[xe\]" /sys/kernel/debug/$FAILTYPE/injectable | cut -d ' ' -f 1 | while read -r FUNCTION ; do
        echo "Injecting fault in $FUNCTION"
        echo "" > /sys/kernel/debug/$FAILTYPE/inject
        echo $FUNCTION > /sys/kernel/debug/$FAILTYPE/inject
        printf %#x $ERRNO > /sys/kernel/debug/$FAILTYPE/$FUNCTION/retval
        echo $DEVICE > /sys/bus/pci/drivers/xe/bind
    done

    rmmod xe

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 37 +++++++++++++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_tile.c   | 18 +++++++++++++++++
 drivers/gpu/drm/xe/xe_wopcm.c  |  3 +++
 3 files changed, 55 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 4d3c794f134c..2db62aa45b39 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -6,6 +6,7 @@
 #include "xe_device.h"
 
 #include <linux/delay.h>
+#include <linux/fault-inject.h>
 #include <linux/units.h>
 
 #include <drm/drm_aperture.h>
@@ -300,6 +301,37 @@ static void xe_device_destroy(struct drm_device *dev, void *dummy)
 	ttm_device_fini(&xe->ttm);
 }
 
+/* Wrapper for fault injection */
+static noinline int device_create_ttm_device_init(struct xe_device *xe)
+{
+	/*
+	 * In case of error injection, the flow is modified because ttm_device_init()
+	 * executes (likely without error) but the return code is overridden in any
+	 * case to indicate an error in ttm_device_init(), which likely did not
+	 * occur.
+	 */
+	return ttm_device_init(&xe->ttm, &xe_ttm_funcs, xe->drm.dev,
+			       xe->drm.anon_inode->i_mapping,
+			       xe->drm.vma_offset_manager, false, false);
+
+	/*
+	 * The alternative below would also change the flow because in case of error
+	 * injection, ttm_device_init() would not be executed at all.
+	 *
+	 * int err = device_create_ttm_device_init_inject_fault();
+	 * if (err)
+	 *	return err;
+	 * return ttm_device_init(&xe->ttm, &xe_ttm_funcs, xe->drm.dev,
+	 *		       xe->drm.anon_inode->i_mapping,
+	 *		       xe->drm.vma_offset_manager, false, false);
+	 *
+	 * ...
+	 * static noinline int device_create_ttm_device_init_inject_fault() { return 0; }
+	 * ALLOW_ERROR_INJECTION(device_create_ttm_device_init_inject_fault, ERRNO);
+	 */
+}
+ALLOW_ERROR_INJECTION(device_create_ttm_device_init, ERRNO);
+
 struct xe_device *xe_device_create(struct pci_dev *pdev,
 				   const struct pci_device_id *ent)
 {
@@ -316,9 +348,7 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 	if (IS_ERR(xe))
 		return xe;
 
-	err = ttm_device_init(&xe->ttm, &xe_ttm_funcs, xe->drm.dev,
-			      xe->drm.anon_inode->i_mapping,
-			      xe->drm.vma_offset_manager, false, false);
+	err = device_create_ttm_device_init(xe);
 	if (WARN_ON(err))
 		goto err;
 
@@ -550,6 +580,7 @@ static int wait_for_lmem_ready(struct xe_device *xe)
 
 	return 0;
 }
+ALLOW_ERROR_INJECTION(wait_for_lmem_ready, ERRNO);
 
 static void update_device_info(struct xe_device *xe)
 {
diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
index dda5268507d8..22c0a42af9c2 100644
--- a/drivers/gpu/drm/xe/xe_tile.c
+++ b/drivers/gpu/drm/xe/xe_tile.c
@@ -3,6 +3,8 @@
  * Copyright © 2023 Intel Corporation
  */
 
+#include <linux/fault-inject.h>
+
 #include <drm/drm_managed.h>
 
 #include "xe_device.h"
@@ -99,6 +101,12 @@ static int xe_tile_alloc(struct xe_tile *tile)
 	return 0;
 }
 
+static noinline int tile_init_early_inject_fault(void)
+{
+	return 0;
+}
+ALLOW_ERROR_INJECTION(tile_init_early_inject_fault, ERRNO);
+
 /**
  * xe_tile_init_early - Initialize the tile and primary GT
  * @tile: Tile to initialize
@@ -117,6 +125,16 @@ int xe_tile_init_early(struct xe_tile *tile, struct xe_device *xe, u8 id)
 	tile->xe = xe;
 	tile->id = id;
 
+	/*
+	 * The flow is modified because xe_tile_init_early() fails before the
+	 * first possible error, from xe_tile_alloc(). It is does not match the
+	 * 2nd requirement of
+	 * fault-injection.html#requirements-for-the-error-injectable-functions
+	 */
+	err = tile_init_early_inject_fault();
+	if (err)
+		return err;
+
 	err = xe_tile_alloc(tile);
 	if (err)
 		return err;
diff --git a/drivers/gpu/drm/xe/xe_wopcm.c b/drivers/gpu/drm/xe/xe_wopcm.c
index 93c82825d896..88a201122a22 100644
--- a/drivers/gpu/drm/xe/xe_wopcm.c
+++ b/drivers/gpu/drm/xe/xe_wopcm.c
@@ -5,6 +5,8 @@
 
 #include "xe_wopcm.h"
 
+#include <linux/fault-inject.h>
+
 #include "regs/xe_guc_regs.h"
 #include "xe_device.h"
 #include "xe_force_wake.h"
@@ -268,3 +270,4 @@ int xe_wopcm_init(struct xe_wopcm *wopcm)
 
 	return ret;
 }
+ALLOW_ERROR_INJECTION(xe_wopcm_init, ERRNO);
-- 
2.43.0

