Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D5A3C77B7E
	for <intel-xe@archiver.kernel.org>; Mon, 29 May 2023 15:08:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1096710E104;
	Mon, 29 May 2023 15:08:49 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44E6F10E104
 for <intel-xe@lists.freedesktop.org>; Mon, 29 May 2023 15:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685372926; x=1716908926;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=T/VlDDHinTdYNdAzLdJ6UoeaWSjZBfI9s8Tgy3SrGCA=;
 b=GIw/KvtNq4HJerR8pxAplA2oBk+bZQcE1ZO4ED2cyK/XtrjyfdHJcJem
 VeFTZpw/h0ngUY5Vw1+AZFqbZGAs1v/D/UUtPjATMbXGelJuJ5VAlp6Fh
 bw5vcfVRtH/sdju2aoY4K0SVOA/N652yvwgU8GyWkY1FKiZCIOUXmDpSL
 LK06gECUKMzFank1U+KgTCbO3GD8Lpg3M7TyG60yiU3nxQuqJATYM5xIs
 X0kLvqbVJwY7KhHtVlwinjyLvz6BvkewX/rjYZlUPGi3JTk4nztusn13e
 LNy+nKxqkcc5q+Rr2rqDZeTdmOdtD7/4LOZ2+dr/aoS7nUiy57jF/NWO1 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="441082988"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; d="scan'208";a="441082988"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2023 08:08:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="709322414"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; d="scan'208";a="709322414"
Received: from chavesbe-mobl2.amr.corp.intel.com (HELO
 gjsousa-mobl2.intel.com) ([10.255.39.86])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2023 08:08:43 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 29 May 2023 12:08:31 -0300
Message-Id: <20230529150831.259733-1-gustavo.sousa@intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Replace DRM_ERROR() with drm_err()
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
Cc: Jani Nikula <jani.nikula@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

DRM_ERROR() has been deprecated in favor of pr_err(). However, we should
prefer to use drm_err() whenever possible so we get device-specific
output with the error message.

Adding an "xe" member to struct xe_reg_sr does not seem very
justifiable, since the only as of now is to register a clean up function
and, with this change, print error messages. So let's just add a
parameter to xe_reg_sr_add().

v2:
  - Prefer drm_err() over pr_err(). (Matt, Jani)

Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Haridhar Kalvala <haridhar.kalvala@intel.com>
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_reg_sr.c | 14 ++++++++------
 drivers/gpu/drm/xe/xe_reg_sr.h |  3 ++-
 drivers/gpu/drm/xe/xe_rtp.c    |  2 +-
 drivers/gpu/drm/xe/xe_vm.c     |  3 ++-
 4 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
index 24d9c73ef279..02ba95223d7b 100644
--- a/drivers/gpu/drm/xe/xe_reg_sr.c
+++ b/drivers/gpu/drm/xe/xe_reg_sr.c
@@ -90,7 +90,8 @@ static void reg_sr_inc_error(struct xe_reg_sr *sr)
 }
 
 int xe_reg_sr_add(struct xe_reg_sr *sr,
-		  const struct xe_reg_sr_entry *e)
+		  const struct xe_reg_sr_entry *e,
+		  struct xe_device *xe)
 {
 	unsigned long idx = e->reg.addr;
 	struct xe_reg_sr_entry *pentry = xa_load(&sr->xa, idx);
@@ -123,11 +124,12 @@ int xe_reg_sr_add(struct xe_reg_sr *sr,
 	return 0;
 
 fail:
-	DRM_ERROR("Discarding save-restore reg %04lx (clear: %08x, set: %08x, masked: %s, mcr: %s): ret=%d\n",
-		  idx, e->clr_bits, e->set_bits,
-		  str_yes_no(e->reg.masked),
-		  str_yes_no(e->reg.mcr),
-		  ret);
+	drm_err(&xe->drm,
+		"Discarding save-restore reg %04lx (clear: %08x, set: %08x, masked: %s, mcr: %s): ret=%d\n",
+		idx, e->clr_bits, e->set_bits,
+		str_yes_no(e->reg.masked),
+		str_yes_no(e->reg.mcr),
+		ret);
 	reg_sr_inc_error(sr);
 
 	return ret;
diff --git a/drivers/gpu/drm/xe/xe_reg_sr.h b/drivers/gpu/drm/xe/xe_reg_sr.h
index 0bfe66ea29bf..3e337f174ae3 100644
--- a/drivers/gpu/drm/xe/xe_reg_sr.h
+++ b/drivers/gpu/drm/xe/xe_reg_sr.h
@@ -19,7 +19,8 @@ struct drm_printer;
 int xe_reg_sr_init(struct xe_reg_sr *sr, const char *name, struct xe_device *xe);
 void xe_reg_sr_dump(struct xe_reg_sr *sr, struct drm_printer *p);
 
-int xe_reg_sr_add(struct xe_reg_sr *sr, const struct xe_reg_sr_entry *e);
+int xe_reg_sr_add(struct xe_reg_sr *sr, const struct xe_reg_sr_entry *e,
+		  struct xe_device *xe);
 void xe_reg_sr_apply_mmio(struct xe_reg_sr *sr, struct xe_gt *gt);
 void xe_reg_sr_apply_whitelist(struct xe_reg_sr *sr, u32 mmio_base,
 			       struct xe_gt *gt);
diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
index 43a86358efb6..93067f4fd480 100644
--- a/drivers/gpu/drm/xe/xe_rtp.c
+++ b/drivers/gpu/drm/xe/xe_rtp.c
@@ -122,7 +122,7 @@ static void rtp_add_sr_entry(const struct xe_rtp_action *action,
 	};
 
 	sr_entry.reg.addr += mmio_base;
-	xe_reg_sr_add(sr, &sr_entry);
+	xe_reg_sr_add(sr, &sr_entry, gt_to_xe(gt));
 }
 
 static bool rtp_process_one_sr(const struct xe_rtp_entry_sr *entry,
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index f73e08b60670..bf4a2732447b 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -7,6 +7,7 @@
 
 #include <linux/dma-fence-array.h>
 
+#include <drm/drm_print.h>
 #include <drm/ttm/ttm_execbuf_util.h>
 #include <drm/ttm/ttm_tt.h>
 #include <drm/xe_drm.h>
@@ -3035,7 +3036,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	}
 
 	if (XE_IOCTL_ERR(xe, xe_vm_is_closed(vm))) {
-		DRM_ERROR("VM closed while we began looking up?\n");
+		drm_err(&xe->drm, "VM closed while we began looking up?\n");
 		err = -ENOENT;
 		goto put_vm;
 	}
-- 
2.40.1

