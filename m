Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B96A9E67815
	for <intel-xe@archiver.kernel.org>; Mon, 22 Dec 2025 19:01:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7345510E321;
	Mon, 22 Dec 2025 19:01:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MZq6Ufqx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B8EC10E321
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Dec 2025 19:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766430109; x=1797966109;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2zM0w7bjWIrX2mG3Wa7gYr5Zg0qZwm9xsErKYhIn43M=;
 b=MZq6UfqxXMFJILk8Cy7jdpZZ+h5Dy3MDBj4tPsdOHGpmh1RLxHP8tBzq
 lmEb4rZ09goIo5iitfp3pAQPOQ16pBC5a+8/djSQtka5E3eN/UPoSxg9w
 EEwj202rJy8Ov0aIOXusXnxih8ALgQkvE5GrEwZ2V9ntfJvtByYJLt95P
 focpXjNvhzlO3/CWvNrcU0mMMXbW6CSieM8Zjmv0P+QIHk70Lrj0zULEC
 i+p4SfbVI4x+YPEkiN39mrr725lgdpqu+7uRtX1ofgV538s5OQvXq/qr7
 EBQOa774yCRcdTsRnxO5XGW6mi1jI3KqlgWT73bnsLP15WjMXwoMP4QZ9 g==;
X-CSE-ConnectionGUID: hShH3xXHSGS3XOp7I2rVPQ==
X-CSE-MsgGUID: wqc3s+hpSwmro0GBTK5CBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="67481475"
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; d="scan'208";a="67481475"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2025 11:01:49 -0800
X-CSE-ConnectionGUID: o1yqLckoQna6I8DnPkYbvw==
X-CSE-MsgGUID: MOlQA3/MSRya+7unETOUbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; d="scan'208";a="204077022"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.23])
 by fmviesa005.fm.intel.com with ESMTP; 22 Dec 2025 11:01:49 -0800
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: [PATCH] drm/xe: Add GSC to powergate_info
Date: Mon, 22 Dec 2025 10:58:59 -0800
Message-Id: <20251222185859.46866-1-vinay.belgaumkar@intel.com>
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add GSC powergate status to the existing debugfs.

Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 1 +
 drivers/gpu/drm/xe/xe_gt_idle.c      | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 917a088c28f2..96e1f50e5e9f 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -358,6 +358,7 @@
 #define FORCEWAKE_RENDER			XE_REG(0xa278)
 
 #define POWERGATE_DOMAIN_STATUS			XE_REG(0xa2a0)
+#define   GSC_AWAKE_STATUS			REG_BIT(8)
 #define   MEDIA_SLICE3_AWAKE_STATUS		REG_BIT(4)
 #define   MEDIA_SLICE2_AWAKE_STATUS		REG_BIT(3)
 #define   MEDIA_SLICE1_AWAKE_STATUS		REG_BIT(2)
diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
index c1c9bec3c487..52436dcb6381 100644
--- a/drivers/gpu/drm/xe/xe_gt_idle.c
+++ b/drivers/gpu/drm/xe/xe_gt_idle.c
@@ -255,6 +255,11 @@ int xe_gt_idle_pg_print(struct xe_gt *gt, struct drm_printer *p)
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

