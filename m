Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58F5FC47074
	for <intel-xe@archiver.kernel.org>; Fri,  5 Jan 2024 00:34:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA68C10E010;
	Fri,  5 Jan 2024 00:34:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDEBA10E010
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Jan 2024 00:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704414861; x=1735950861;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Z5Y0RA8MXejjxmVvn1rDOVfzSFwkTagc3CzlcQA9FsY=;
 b=QgbSiMypk/NNwiDXaXArdXg+6t7d/xoO92GQagpq49Lj7ZcJ+Y2vxHp6
 kZZEY9HB/xMyyMMyke707lAQMU8Bpz8b8yYis3FrPBq5hvMbD0AO99aQe
 I3mD4Fv7HHI+aGbmn74Y7+ArxfYF9QgxH6Rbx7hK0T2oZHWe6mkbeZ3Gv
 5XSte36IATcocSnt+VV45EZLI6QEm3YVtjsqBgk4u3PASwT56VKUfXnqd
 e0BSLmQm9nBKL0XvFXe4S7mKwr1WJD+qFdcBoFoJMDcqfUc79kaU2vGXH
 Lns2IJLvwcF3upZctKBSzars2ZOcZKxpiXQxzZeldN9bael8pGmH7/v0W g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="397121754"
X-IronPort-AV: E=Sophos;i="6.04,332,1695711600"; d="scan'208";a="397121754"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2024 16:34:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="809401221"
X-IronPort-AV: E=Sophos;i="6.04,332,1695711600"; d="scan'208";a="809401221"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.27.27])
 by orsmga008.jf.intel.com with ESMTP; 04 Jan 2024 16:34:20 -0800
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2] drm/xe: Check skip_guc_pc before setting SLPC flag
Date: Thu,  4 Jan 2024 16:33:41 -0800
Message-Id: <20240105003341.124422-1-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Don't set SLPC GuC feature ctl flag if skip_guc_pc is true.

v2: Skip the freq related sysfs creation as well (Badal)

Fixes: 975e4a3795d4 ("drm/xe: Manually setup C6 when skip_guc_pc is set")
Fixes: bef52b5c7a19 ("drm/xe: Create a xe_gt_freq component for raw management and sysfs")
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_freq.c | 3 +++
 drivers/gpu/drm/xe/xe_guc.c     | 7 ++++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_freq.c b/drivers/gpu/drm/xe/xe_gt_freq.c
index 3adfa6686e7c..e5b0f4ecdbe8 100644
--- a/drivers/gpu/drm/xe/xe_gt_freq.c
+++ b/drivers/gpu/drm/xe/xe_gt_freq.c
@@ -196,6 +196,9 @@ void xe_gt_freq_init(struct xe_gt *gt)
 	struct xe_device *xe = gt_to_xe(gt);
 	int err;
 
+	if (xe->info.skip_guc_pc)
+		return;
+
 	gt->freq = kobject_create_and_add("freq0", gt->sysfs);
 	if (!gt->freq) {
 		drm_warn(&xe->drm, "failed to add freq0 directory to %s\n",
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 811e8b201270..0e112b144ec8 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -62,7 +62,12 @@ static u32 guc_ctl_debug_flags(struct xe_guc *guc)
 
 static u32 guc_ctl_feature_flags(struct xe_guc *guc)
 {
-	return GUC_CTL_ENABLE_SLPC;
+	u32 flags = 0;
+
+	if (!(guc_to_xe(guc))->info.skip_guc_pc)
+		flags |= GUC_CTL_ENABLE_SLPC;
+
+	return flags;
 }
 
 static u32 guc_ctl_log_params_flags(struct xe_guc *guc)
-- 
2.38.1

