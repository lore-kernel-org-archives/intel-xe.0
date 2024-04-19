Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 101D9C4345F
	for <intel-xe@archiver.kernel.org>; Fri, 19 Apr 2024 12:49:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C766710F436;
	Fri, 19 Apr 2024 12:49:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SmZzefTv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D76410F436
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Apr 2024 12:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713530940; x=1745066940;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=svbquhe+YXEY5KywP5GwGhTV/bLvL6P5A5FvVFL2PAQ=;
 b=SmZzefTv7mFUDTpdB/yyXHhBJTXYrOY4mzBKHot1wwn3sZROJUZpgG1k
 Ly84E/eLp5ibpMBY84PStoZeJ7X8MB3OI8FL9mOaHlOYtfJrYJ0xko/rp
 ohXtKdmWoPrh1fTAxKtDB2etEbFj3JHVt3FYLInaBZfgE7GtH4JR4HRf1
 oA7qffN5z/c+4RvYvvh8qzLyOmsZeG6dAdhlGZLpyolBoRUpvc4TA+suT
 0aUtNqaULrP/2tBEgzRUUyAtigqEMd/EnpsV/QDKvN92kt/cjokdA11ye
 MLEOeZFeg7iM1Yx9wi+/IYerzIYdkuSe0b4jEf7T2lrbqtML62RuR3LLH Q==;
X-CSE-ConnectionGUID: 3FOJ/1mOQvCo7FUxtj+5+w==
X-CSE-MsgGUID: WaUT02aETbaiyU7lE1Sdug==
X-IronPort-AV: E=McAfee;i="6600,9927,11049"; a="31610849"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="31610849"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 05:49:00 -0700
X-CSE-ConnectionGUID: diqhgAU8T6Sy2yQt4p44JQ==
X-CSE-MsgGUID: aKZwp3SgQIq3zoVE2ijRwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="23351277"
Received: from sinjan-super-server.iind.intel.com ([10.145.169.153])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 05:48:57 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, rodrigo.vivi@intel.com,
 lucas.demarchi@intel.com, Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH] drm/xe/hwmon: Remove unwanted write permission for currN_label
Date: Fri, 19 Apr 2024 18:29:45 +0530
Message-Id: <20240419125945.4085629-1-karthik.poosa@intel.com>
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

Change umode of currN_label from 0644 to 0444 as write permission
not needed for label.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 drivers/gpu/drm/xe/xe_hwmon.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 453e601ddd5e..dca275117232 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -550,12 +550,17 @@ xe_hwmon_curr_is_visible(const struct xe_hwmon *hwmon, u32 attr, int channel)
 {
 	u32 uval;
 
+	/* hwmon sysfs attribute of current available only for package */
+	if (channel != CHANNEL_PKG)
+		return 0;
+
 	switch (attr) {
 	case hwmon_curr_crit:
-	case hwmon_curr_label:
-		if (channel == CHANNEL_PKG)
 			return (xe_hwmon_pcode_read_i1(hwmon->gt, &uval) ||
 				(uval & POWER_SETUP_I1_WATTS)) ? 0 : 0644;
+	case hwmon_curr_label:
+			return (xe_hwmon_pcode_read_i1(hwmon->gt, &uval) ||
+				(uval & POWER_SETUP_I1_WATTS)) ? 0 : 0444;
 		break;
 	default:
 		return 0;
-- 
2.25.1

