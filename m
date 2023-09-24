Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12BF6CE7A88
	for <intel-xe@archiver.kernel.org>; Sun, 24 Sep 2023 14:57:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1BA688A72;
	Sun, 24 Sep 2023 14:56:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 113E310E12C
 for <intel-xe@lists.freedesktop.org>; Sun, 24 Sep 2023 14:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695567410; x=1727103410;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OZQ8PE9M3IUrO4ipqqegvB1dJ3yps6T7v9TxI8raZic=;
 b=UGF0OekU1IJb66f1aQ+HFr/mWB1ly4d10hLAlOZ6sjg4j4ocplui/sU8
 TYIRg47AsxYCmO+1SZDgkX348Nme9u5NXRkfVxmEwHNlVgEgKVRP8P6jM
 RGf845+H80VEnf8QcD1VSMahqUyVDpqTghtxa9i2a0CpJ9a0WKPe72RvW
 D1KEFkUVmrDau9MeoLV8MTgUsjAHyGab1so3broxwV16Cz0WuEhJtKF/l
 rjhBVVhZ4bo6W6s3z/pZuXhnt8I3jYCVKF3d2LGMOM4ltQForpuocK01U
 3/86yDHZkv8Ag7Oll1B7UnTIpy6g0dJePoPjoMkaJT47d37IzzpkyBV5H A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="467383724"
X-IronPort-AV: E=Sophos;i="6.03,173,1694761200"; d="scan'208";a="467383724"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2023 07:56:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="741641668"
X-IronPort-AV: E=Sophos;i="6.03,173,1694761200"; d="scan'208";a="741641668"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by orsmga007.jf.intel.com with ESMTP; 24 Sep 2023 07:56:47 -0700
From: Arun R Murthy <arun.r.murthy@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Sun, 24 Sep 2023 20:17:50 +0530
Message-Id: <20230924144751.446446-1-arun.r.murthy@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/2] drm/xe: Add module parameter 'fastboot'
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
Cc: Arun R Murthy <arun.r.murthy@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Fastboot is by default enabled on all Display 9+ platforms.
Module param is added in xe for controlling the same.

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h | 1 +
 drivers/gpu/drm/xe/xe_display.c      | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index a82f28c6a3a0..f73c0672bd54 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -458,6 +458,7 @@ struct xe_device {
 		s32 panel_use_ssc;
 		const char *vbt_firmware;
 		u32 lvds_channel_mode;
+		int fastboot;
 	} params;
 #endif
 };
diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
index bb4938a84f47..8a80d85eb104 100644
--- a/drivers/gpu/drm/xe/xe_display.c
+++ b/drivers/gpu/drm/xe/xe_display.c
@@ -123,6 +123,7 @@ int xe_display_create(struct xe_device *xe)
 	xe->params.enable_psr2_sel_fetch = -1;
 	xe->params.enable_sagv = true;
 	xe->params.panel_use_ssc = -1;
+	xe->params.fastboot = -1;
 
 	err = drmm_add_action_or_reset(&xe->drm, display_destroy, NULL);
 	if (err)
-- 
2.25.1

