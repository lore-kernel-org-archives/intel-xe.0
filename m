Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2029FEA7942
	for <intel-xe@archiver.kernel.org>; Wed,  4 Feb 2026 19:06:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5F3010E749;
	Wed,  4 Feb 2026 19:06:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nUowGmDG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C440D10E749
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Feb 2026 19:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770232004; x=1801768004;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9b8IJPf9CKd+zD8+oOtghPP5dMohxUE0l5sGqcQBax4=;
 b=nUowGmDGXFNRekupj5S3JeO1f7U6o1XEpHnOJb4PPj5HRv1Es3imDlND
 4mizvKwTNJ5eJnvS/n/Ax8xk8YEUEpv2coUMKfxc7KQOWxTZ/u9RiKBAD
 PWmZpIh69ihhSTuYGtlAKeWCEfpVNyS3/EyDpKw9ljwlvYlx+5B0VfNEQ
 r3jIXChpOS6HmI/YhqlX7OHbz+/69ICca6YHR0oImqNA8GWnYDDmwrnkb
 DV6ceDtvqz/CEzOQtmMcBiHeeamHUXcPh6Mk0kRXE5Y3tzjHDz1ash/B5
 OZpF5nVtkv4gv+gdj2bxmmv9o2SmGxZZA0FOOm60UXqUCGgjnk8XfRNSR w==;
X-CSE-ConnectionGUID: gFUHMpZGQROXv/y5QyFsag==
X-CSE-MsgGUID: 2yxYwGoBQ0aI2XfHbh4QPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71322182"
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; d="scan'208";a="71322182"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 11:06:44 -0800
X-CSE-ConnectionGUID: aOH+riw0TMm+hYMp4XORDA==
X-CSE-MsgGUID: EuhZV+wfRAy8vQiyNwYrWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; d="scan'208";a="210249958"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.23])
 by fmviesa010.fm.intel.com with ESMTP; 04 Feb 2026 11:06:43 -0800
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>
Subject: [PATCH v2 1/2] drm/xe: Add GSC to powergate_info
Date: Wed,  4 Feb 2026 11:03:13 -0800
Message-Id: <20260204190314.2904009-2-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20260204190314.2904009-1-vinay.belgaumkar@intel.com>
References: <20260204190314.2904009-1-vinay.belgaumkar@intel.com>
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

Add GSC powergate status to the existing debugfs.

Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 1 +
 drivers/gpu/drm/xe/xe_gt_idle.c      | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 24fc64fc832e..7d3ec1fe4f7f 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -367,6 +367,7 @@
 #define FORCEWAKE_RENDER			XE_REG(0xa278)
 
 #define POWERGATE_DOMAIN_STATUS			XE_REG(0xa2a0)
+#define   GSC_AWAKE_STATUS			REG_BIT(8)
 #define   MEDIA_SLICE3_AWAKE_STATUS		REG_BIT(4)
 #define   MEDIA_SLICE2_AWAKE_STATUS		REG_BIT(3)
 #define   MEDIA_SLICE1_AWAKE_STATUS		REG_BIT(2)
diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
index 7a569e1730a4..94d3403ec11e 100644
--- a/drivers/gpu/drm/xe/xe_gt_idle.c
+++ b/drivers/gpu/drm/xe/xe_gt_idle.c
@@ -254,6 +254,11 @@ int xe_gt_idle_pg_print(struct xe_gt *gt, struct drm_printer *p)
 		drm_printf(p, "Media Samplers Power Gating Enabled: %s\n",
 			   str_yes_no(pg_enabled & MEDIA_SAMPLERS_POWERGATE_ENABLE));
 
+	if (gt->info.engine_mask & BIT(XE_HW_ENGINE_GSCCS0)) {
+		drm_printf(p, "GSC Power Gate Status: %s\n",
+			   str_up_down(pg_status & GSC_AWAKE_STATUS));
+	}
+
 	return 0;
 }
 
-- 
2.38.1

