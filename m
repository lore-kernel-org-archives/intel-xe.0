Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 728DEE77180
	for <intel-xe@archiver.kernel.org>; Thu, 12 Dec 2024 19:00:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40B1B10E66C;
	Thu, 12 Dec 2024 19:00:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q8YOvfzP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9584610E66C
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Dec 2024 19:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734030051; x=1765566051;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ylqEWZDQYVOQXYy+NoheSq+UwRxNm7I+y0bjYQkzGxc=;
 b=Q8YOvfzP9Z93rKnNHYwYRpnx0QomNW8u/eQDVq/xPJruLXEwY6gHmdCv
 9VSoqkQ7AtjyYR4aphRiq2T9Y0PsjJZW6mgh9A6Ibxu4yuVxASHIzgHeC
 KaAk67QcFvuqi3IpKhCt5OZ9+maKokoenv+9EhhhaxLSM22x+nTZkoH1k
 ddy6K9/57ZagTZvqgcsZLBzrcJZm9HUHVQ8SiqbhXAkfsFiqK3Hx+EpmC
 8Nk1ThUiuz4RAW5a7Vp1vnATWMLofM7xmZnOMHUQ6zvuYpjUWAJNNbTP9
 K1H8J6yYIoNvx4ZoELGiQif7VjsjVVZxr7Z1aRxx4+zWDFqX++sBgTQqG w==;
X-CSE-ConnectionGUID: MpTTqzZOTW6GpV+6GFIsjg==
X-CSE-MsgGUID: CwOY+fYpScSlpYchUG8DhA==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="34611844"
X-IronPort-AV: E=Sophos;i="6.12,229,1728975600"; d="scan'208";a="34611844"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 11:00:50 -0800
X-CSE-ConnectionGUID: 8Ae4N3mIRGK8TaazmUH93Q==
X-CSE-MsgGUID: ExLWYy7jQ+STl9cYb+hESA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,229,1728975600"; d="scan'208";a="96198897"
Received: from jesusnar-desk.jf.intel.com ([10.165.21.207])
 by fmviesa007.fm.intel.com with ESMTP; 12 Dec 2024 11:00:49 -0800
From: Jesus Narvaez <jesus.narvaez@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Jesus Narvaez <jesus.narvaez@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH] drm/xe/guc: Adding steering info support for GuC register
 lists
Date: Thu, 12 Dec 2024 11:01:00 -0800
Message-Id: <20241212190100.3768068-1-jesus.narvaez@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
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

The guc_mmio_reg interface supports steering, but it is currently not
implemented. This will allow the GuC to control steering of MMIO
registers after save-restore and avoid reading from fused off MCR
register instances.

Fixes: 9c57bc08652a ("drm/xe/lnl: Drop force_probe requirement")
Signed-off-by: Jesus Narvaez <jesus.narvaez@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_mcr.c  |  6 +++---
 drivers/gpu/drm/xe/xe_gt_mcr.h  |  4 ++++
 drivers/gpu/drm/xe/xe_guc_ads.c | 15 +++++++++++++++
 3 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
index 5013d674e17d..d929a78c26a9 100644
--- a/drivers/gpu/drm/xe/xe_gt_mcr.c
+++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
@@ -550,9 +550,9 @@ void xe_gt_mcr_set_implicit_defaults(struct xe_gt *gt)
  * Returns true if the caller should steer to the @group/@instance values
  * returned.  Returns false if the caller need not perform any steering
  */
-static bool xe_gt_mcr_get_nonterminated_steering(struct xe_gt *gt,
-						 struct xe_reg_mcr reg_mcr,
-						 u8 *group, u8 *instance)
+bool xe_gt_mcr_get_nonterminated_steering(struct xe_gt *gt,
+					  struct xe_reg_mcr reg_mcr,
+					  u8 *group, u8 *instance)
 {
 	const struct xe_reg reg = to_xe_reg(reg_mcr);
 	const struct xe_mmio_range *implicit_ranges;
diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.h b/drivers/gpu/drm/xe/xe_gt_mcr.h
index c0cd36021c24..bc06520befab 100644
--- a/drivers/gpu/drm/xe/xe_gt_mcr.h
+++ b/drivers/gpu/drm/xe/xe_gt_mcr.h
@@ -26,6 +26,10 @@ void xe_gt_mcr_unicast_write(struct xe_gt *gt, struct xe_reg_mcr mcr_reg,
 void xe_gt_mcr_multicast_write(struct xe_gt *gt, struct xe_reg_mcr mcr_reg,
 			       u32 value);
 
+bool xe_gt_mcr_get_nonterminated_steering(struct xe_gt *gt,
+					  struct xe_reg_mcr reg_mcr,
+					  u8 *group, u8 *instance);
+
 void xe_gt_mcr_steering_dump(struct xe_gt *gt, struct drm_printer *p);
 void xe_gt_mcr_get_dss_steering(struct xe_gt *gt, unsigned int dss, u16 *group, u16 *instance);
 u32 xe_gt_mcr_steering_info_to_dss_id(struct xe_gt *gt, u16 group, u16 instance);
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index 943146e5b460..fab259adc380 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -29,6 +29,7 @@
 #include "xe_platform_types.h"
 #include "xe_uc_fw.h"
 #include "xe_wa.h"
+#include "xe_gt_mcr.h"
 
 /* Slack of a few additional entries per engine */
 #define ADS_REGSET_EXTRA_MAX	8
@@ -696,6 +697,20 @@ static void guc_mmio_regset_write_one(struct xe_guc_ads *ads,
 		.flags = reg.masked ? GUC_REGSET_MASKED : 0,
 	};
 
+	if (reg.mcr) {
+		struct xe_reg_mcr mcr_reg = XE_REG_MCR(reg.addr);
+		u8 group, instance;
+
+		bool steer = xe_gt_mcr_get_nonterminated_steering(ads_to_gt(ads), mcr_reg,
+								  &group, &instance);
+
+		if (steer) {
+			entry.flags |= FIELD_PREP(GUC_REGSET_STEERING_GROUP, group);
+			entry.flags |= FIELD_PREP(GUC_REGSET_STEERING_INSTANCE, instance);
+			entry.flags |= GUC_REGSET_STEERING_NEEDED;
+		}
+	}
+
 	xe_map_memcpy_to(ads_to_xe(ads), regset_map, n_entry * sizeof(entry),
 			 &entry, sizeof(entry));
 }
-- 
2.34.1

