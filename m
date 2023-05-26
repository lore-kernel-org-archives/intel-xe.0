Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCB9EC77B7E
	for <intel-xe@archiver.kernel.org>; Fri, 26 May 2023 00:43:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4BC710E00F;
	Fri, 26 May 2023 00:43:09 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9622B10E00F
 for <intel-xe@lists.freedesktop.org>; Fri, 26 May 2023 00:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685061788; x=1716597788;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=FuQ7WtvVDPaRayGkPtN21oBD3J1sDdWHBm6azxOy+PQ=;
 b=jDjiTLHMK2F+3OQq3BIO3N+ZVfd3ogoIXg7N9ROAEi1rfjwZkBTr/raW
 gCXNQrXYheudSu7wf6+G+VJfAfwc0XVv7zHQVWiNL9vP+Wc0vw3topG3c
 WkD/HvJiDByeBF4u2H3ZS2nOMEn6UDilwPgtHQ5CtCjEz60jf7YomNaWj
 B8Ya2LDZLgdphyp1JKSSrYIPJY3iKiSbgMnOmFEn2iOcew9Uloxv8jCuA
 cRapnK69AmWkjLsLWMX1cCWqGcG5Tcya8zOkmAnhj82nm03Fw8GJE2U2k
 s7ConDRBNA6eGeBbDgoB9lTg7FJKL7T4uF/A0PBwbUbeC5Pnzo8RORR+Y A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="357323125"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; d="scan'208";a="357323125"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 17:43:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="1035155121"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; d="scan'208";a="1035155121"
Received: from xiaofang-mobl2.ccr.corp.intel.com (HELO
 gjsousa-mobl2.intel.com) ([10.255.36.192])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 17:43:07 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 25 May 2023 21:42:35 -0300
Message-Id: <20230526004235.745730-3-gustavo.sousa@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230526004235.745730-1-gustavo.sousa@intel.com>
References: <20230526004235.745730-1-gustavo.sousa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/2] drm/xe: Replace DRM_ERROR() with pr_err()
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

The former has been deprecated in favor of the latter.

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_reg_sr.c | 11 ++++++-----
 drivers/gpu/drm/xe/xe_vm.c     |  3 ++-
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
index 24d9c73ef279..4266999cdeb6 100644
--- a/drivers/gpu/drm/xe/xe_reg_sr.c
+++ b/drivers/gpu/drm/xe/xe_reg_sr.c
@@ -7,6 +7,7 @@
 
 #include <kunit/visibility.h>
 #include <linux/align.h>
+#include <linux/printk.h>
 #include <linux/string_helpers.h>
 #include <linux/xarray.h>
 
@@ -123,11 +124,11 @@ int xe_reg_sr_add(struct xe_reg_sr *sr,
 	return 0;
 
 fail:
-	DRM_ERROR("Discarding save-restore reg %04lx (clear: %08x, set: %08x, masked: %s, mcr: %s): ret=%d\n",
-		  idx, e->clr_bits, e->set_bits,
-		  str_yes_no(e->reg.masked),
-		  str_yes_no(e->reg.mcr),
-		  ret);
+	pr_err("Discarding save-restore reg %04lx (clear: %08x, set: %08x, masked: %s, mcr: %s): ret=%d\n",
+	       idx, e->clr_bits, e->set_bits,
+	       str_yes_no(e->reg.masked),
+	       str_yes_no(e->reg.mcr),
+	       ret);
 	reg_sr_inc_error(sr);
 
 	return ret;
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 4d9c8de8b348..89d8240ea6aa 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -13,6 +13,7 @@
 #include <linux/delay.h>
 #include <linux/kthread.h>
 #include <linux/mm.h>
+#include <linux/printk.h>
 #include <linux/swap.h>
 
 #include "xe_bo.h"
@@ -3019,7 +3020,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	}
 
 	if (XE_IOCTL_ERR(xe, xe_vm_is_closed(vm))) {
-		DRM_ERROR("VM closed while we began looking up?\n");
+		pr_err("VM closed while we began looking up?\n");
 		err = -ENOENT;
 		goto put_vm;
 	}
-- 
2.40.1

