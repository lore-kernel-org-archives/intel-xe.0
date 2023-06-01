Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AFB5C77B7E
	for <intel-xe@archiver.kernel.org>; Thu,  1 Jun 2023 19:45:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E019510E043;
	Thu,  1 Jun 2023 19:45:08 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69AF210E043
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Jun 2023 19:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685648707; x=1717184707;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZHbAjqgOhjRLw9czRhvvHsha/yDBf4wKhFkRpQWvy/w=;
 b=VL3RGrbdGJp5O3P3OgMsYLTTWBUOhqIXdJckXkvL953/1lbXzICipBuL
 ggKCQb2dz7Xi8vYxnwTtJPX8Bgzcsgm2lI/5PphK9AFx6rhkxauKKcaz/
 53uHdvatmD+0QSkZvUIvUdlDqN308e/CYWHouUdI8sVVQIKlkbgKaTlDi
 /18NcrU0IpJYlDBvG1wzf4jmN+rXMcjVUEK6Y0BEF5txbqXsbSYtxl72Q
 YVwvgq0xE+sufZLFeE/pp+tRNb9bAt5JatDnDs3Fg1WjcSouCKXWetuHF
 px9wmmZ5xwZDCr+QN/Hb6qj26g/kDC8rVcPvzzORH8ZOvGCduEwWoRd0o Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="355682929"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="355682929"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 12:45:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="737225266"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="737225266"
Received: from fabdulmu-mobl1.gar.corp.intel.com (HELO
 gjsousa-mobl2.intel.com) ([10.255.35.121])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 12:45:04 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  1 Jun 2023 16:44:19 -0300
Message-Id: <20230601194419.1179609-1-gustavo.sousa@intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2] drm/xe: Replace deprecated DRM_ERROR()
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
Cc: Jani Nikula <jani.nikula@intel.com>, Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

DRM_ERROR() has been deprecated in favor of pr_err(). However, we should
prefer to use xe_gt_err() or drm_err() whenever possible so we get gt-
or device-specific output with the error message.

v2:
  - Prefer drm_err() over pr_err(). (Matt, Jani)
v3:
  - Prefer xe_gt_err() over drm_err() when possible. (Matt)
v4:
  - Use the already available dev variable instead of xe->drm as
    parameter to drm_err(). (Matt)

Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Haridhar Kalvala <haridhar.kalvala@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_reg_sr.c | 7 +++++--
 drivers/gpu/drm/xe/xe_reg_sr.h | 3 ++-
 drivers/gpu/drm/xe/xe_rtp.c    | 2 +-
 drivers/gpu/drm/xe/xe_vm.c     | 3 ++-
 4 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
index 434133444d74..8580ff38b82c 100644
--- a/drivers/gpu/drm/xe/xe_reg_sr.c
+++ b/drivers/gpu/drm/xe/xe_reg_sr.c
@@ -19,6 +19,7 @@
 #include "xe_force_wake.h"
 #include "xe_gt.h"
 #include "xe_gt_mcr.h"
+#include "xe_gt_printk.h"
 #include "xe_macros.h"
 #include "xe_mmio.h"
 #include "xe_reg_whitelist.h"
@@ -89,7 +90,8 @@ static void reg_sr_inc_error(struct xe_reg_sr *sr)
 }
 
 int xe_reg_sr_add(struct xe_reg_sr *sr,
-		  const struct xe_reg_sr_entry *e)
+		  const struct xe_reg_sr_entry *e,
+		  struct xe_gt *gt)
 {
 	unsigned long idx = e->reg.addr;
 	struct xe_reg_sr_entry *pentry = xa_load(&sr->xa, idx);
@@ -122,7 +124,8 @@ int xe_reg_sr_add(struct xe_reg_sr *sr,
 	return 0;
 
 fail:
-	DRM_ERROR("Discarding save-restore reg %04lx (clear: %08x, set: %08x, masked: %s, mcr: %s): ret=%d\n",
+	xe_gt_err(gt,
+		  "discarding save-restore reg %04lx (clear: %08x, set: %08x, masked: %s, mcr: %s): ret=%d\n",
 		  idx, e->clr_bits, e->set_bits,
 		  str_yes_no(e->reg.masked),
 		  str_yes_no(e->reg.mcr),
diff --git a/drivers/gpu/drm/xe/xe_reg_sr.h b/drivers/gpu/drm/xe/xe_reg_sr.h
index 0bfe66ea29bf..c3001798d9e8 100644
--- a/drivers/gpu/drm/xe/xe_reg_sr.h
+++ b/drivers/gpu/drm/xe/xe_reg_sr.h
@@ -19,7 +19,8 @@ struct drm_printer;
 int xe_reg_sr_init(struct xe_reg_sr *sr, const char *name, struct xe_device *xe);
 void xe_reg_sr_dump(struct xe_reg_sr *sr, struct drm_printer *p);
 
-int xe_reg_sr_add(struct xe_reg_sr *sr, const struct xe_reg_sr_entry *e);
+int xe_reg_sr_add(struct xe_reg_sr *sr, const struct xe_reg_sr_entry *e,
+		  struct xe_gt *gt);
 void xe_reg_sr_apply_mmio(struct xe_reg_sr *sr, struct xe_gt *gt);
 void xe_reg_sr_apply_whitelist(struct xe_reg_sr *sr, u32 mmio_base,
 			       struct xe_gt *gt);
diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
index 43a86358efb6..956bd39fe1a0 100644
--- a/drivers/gpu/drm/xe/xe_rtp.c
+++ b/drivers/gpu/drm/xe/xe_rtp.c
@@ -122,7 +122,7 @@ static void rtp_add_sr_entry(const struct xe_rtp_action *action,
 	};
 
 	sr_entry.reg.addr += mmio_base;
-	xe_reg_sr_add(sr, &sr_entry);
+	xe_reg_sr_add(sr, &sr_entry, gt);
 }
 
 static bool rtp_process_one_sr(const struct xe_rtp_entry_sr *entry,
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 5aa2aeb14beb..30ffaf8b1e1a 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -7,6 +7,7 @@
 
 #include <linux/dma-fence-array.h>
 
+#include <drm/drm_print.h>
 #include <drm/ttm/ttm_execbuf_util.h>
 #include <drm/ttm/ttm_tt.h>
 #include <drm/xe_drm.h>
@@ -3056,7 +3057,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	}
 
 	if (XE_IOCTL_ERR(xe, xe_vm_is_closed(vm))) {
-		DRM_ERROR("VM closed while we began looking up?\n");
+		drm_err(dev, "VM closed while we began looking up?\n");
 		err = -ENOENT;
 		goto put_vm;
 	}
-- 
2.40.1

