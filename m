Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09D49EB28E2
	for <intel-xe@archiver.kernel.org>; Fri,  6 Feb 2026 08:10:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFEAF10E55F;
	Fri,  6 Feb 2026 08:10:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QMysffnU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D71C310E55F
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Feb 2026 08:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770365448; x=1801901448;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IusNTGI+ZoZfLge+VAa49ratC9E11YiNL9c8TPpXjGU=;
 b=QMysffnUx8Fbq5ZN0oPaSPGjnhM8ig6fRMrmapGAyrWblXrp8/SEiYCE
 C7pPahjWblWkYNe/vs1dmB81NxIJ9Aty93d0Tl2HUWgU+6vPPW/CCZTO3
 hYHFFRxQZK41UdS92wnoEXzb4/5SxxRBuTD6j0GcFpa+RNB7Xcv/B22Ae
 UHRSGMRnFj0ecGhHHbmZW404DX2510Hol+jZj7LWuDhQQLaulkytllltf
 WrMT/zgl4GN7cGArVUpQA2UsdtOUd6LwDfFtvJFodmG8BFjJ4LrOT5eur
 lqLk/nyyi6orYRD6mAsp+CcbUaRjgHhJLaCCzEKjsTYcZssIJaz+Offtg A==;
X-CSE-ConnectionGUID: b2GrV4kgRAOp5+arSDMGmw==
X-CSE-MsgGUID: FiaD+evsSNiU74T2qdYzoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="71471103"
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; d="scan'208";a="71471103"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2026 00:10:48 -0800
X-CSE-ConnectionGUID: ZQccQr2XSfOZZqhNYnnMxQ==
X-CSE-MsgGUID: rX3b9D1KQE+ujbzdg3R42A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; d="scan'208";a="241477348"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2026 00:10:46 -0800
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, rodrigo.vivi@intel.com,
 raag.jadav@intel.com, Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH] drm/xe/hwmon: Prevent unintended VRAM channel creation
Date: Fri,  6 Feb 2026 13:46:55 +0530
Message-Id: <20260206081655.2115439-1-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
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

Remove the unnecessary VRAM channel entry introduced in xe_hwmon_channel.
Without this, adding any new hwmon channel causes extra VRAM channel
to appear. This remained unnoticed earlier because VRAM was the
final xe hwmon channel.

v2: Use MAX_VRAM_CHANNELS with in_range() instead of
    CHANNEL_VRAM_N_MAX. (Raag)

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
Fixes: 49a498338417 ("drm/xe/hwmon: Expose individual VRAM channel temperature")
---
 drivers/gpu/drm/xe/xe_hwmon.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index baf277955b33..0fd4d4f1014a 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -48,7 +48,7 @@ enum xe_hwmon_channel {
 	CHANNEL_MCTRL,
 	CHANNEL_PCIE,
 	CHANNEL_VRAM_N,
-	CHANNEL_VRAM_N_MAX = CHANNEL_VRAM_N + MAX_VRAM_CHANNELS,
+	CHANNEL_VRAM_N_MAX = CHANNEL_VRAM_N + MAX_VRAM_CHANNELS - 1,
 	CHANNEL_MAX,
 };
 
@@ -264,7 +264,7 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg
 				return BMG_PACKAGE_TEMPERATURE;
 			else if (channel == CHANNEL_VRAM)
 				return BMG_VRAM_TEMPERATURE;
-			else if (in_range(channel, CHANNEL_VRAM_N, CHANNEL_VRAM_N_MAX))
+			else if (in_range(channel, CHANNEL_VRAM_N, MAX_VRAM_CHANNELS))
 				return BMG_VRAM_TEMPERATURE_N(channel - CHANNEL_VRAM_N);
 		} else if (xe->info.platform == XE_DG2) {
 			if (channel == CHANNEL_PKG)
@@ -1427,7 +1427,7 @@ static int xe_hwmon_read_label(struct device *dev,
 			*str = "mctrl";
 		else if (channel == CHANNEL_PCIE)
 			*str = "pcie";
-		else if (in_range(channel, CHANNEL_VRAM_N, CHANNEL_VRAM_N_MAX))
+		else if (in_range(channel, CHANNEL_VRAM_N, MAX_VRAM_CHANNELS))
 			*str = hwmon->temp.vram_label[channel - CHANNEL_VRAM_N];
 		return 0;
 	case hwmon_power:
-- 
2.25.1

