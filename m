Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65573CA9ED0
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 13:05:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FEA810E564;
	Mon, 12 Oct 2026 13:05:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B324C10E577
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Oct 2026 13:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791810325; x=1823346325;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+eoqdgwEdwTOk+4eQeZgxrN49qn1yEA9js+RJFPIxow=;
 b=GGhgY25Xs+Des1+jAGZVJ8uSGG8DAinyQvsvUypIcBqHpSQhOefIEqXC
 vm4jHosZf9L3d7BvmtNYPCyUMGoY0/TDsWRc+BuI4BqN90mEZKPs5Xhdd
 BePzWvbAVRQnufz1XFiHWDBqT5gyp6n66bheVvzDnpBUBS1Huq0Dsi2ra
 HHKMWhdzcxII5VkKe/wMGuS/MHZ2bsG2cjzBZk0tIt1zJUG7myP5woyex
 9Ijiuxlr9eY6rxSEVkgNk/QKq99I6bPzQntjV0Rs2v2wYJ29EhNMwwUXM
 hZqPcmT+lmP/CUPhe2C7B0cbIt98qjtT88jjqoqquDMk50vKLysaChnMS Q==;
X-CSE-ConnectionGUID: v37AWb4/S/aQEmMxPFpx2w==
X-CSE-MsgGUID: Khy/QHTTSIevNodhKsegog==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="527301"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="527301"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 06:05:25 -0700
X-CSE-ConnectionGUID: G2ou7ZAGRx6hQBz39/1WYA==
X-CSE-MsgGUID: JfR6qoPlSfe3jy48R63ytA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="2682020"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 06:05:21 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v10 12/16] drm/xe/hwmon: Update memory controller temperature
 offset for CRI
Date: Mon, 12 Oct 2026 18:33:58 +0530
Message-Id: <20261012130401.443473-13-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261012130401.443473-1-karthik.poosa@intel.com>
References: <20261012130401.443473-1-karthik.poosa@intel.com>
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

On CRI the memory controller temperatures moved in the READ_THERMAL_DATA
output: they now occupy bytes 16..19 instead of starting at byte 2.

Read and average the CRI memory controller sensors from bytes 16..19,
keeping the existing byte 2..count-1 range for earlier platforms. Only
the group(s) covering the used bytes are fetched.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_hwmon.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 46df380c101c..d66ae0b88126 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -109,6 +109,10 @@ enum sensor_attr_power {
 /* Index of memory controller in READ_THERMAL_DATA output */
 #define TEMP_INDEX_MCTRL	2
 
+/* On CRI the memory controller temperatures are READ_THERMAL_DATA bytes 16..19. */
+#define CRI_TEMP_INDEX_MCTRL	16
+#define CRI_TEMP_MCTRL_COUNT	4
+
 /* Mailbox sentinel reported for an unavailable temperature sensor */
 #define TEMP_MBX_INVALID	0xFF
 
@@ -970,12 +974,20 @@ static int mbx_temp_decode(u8 value)
 static int get_mc_temp(struct xe_hwmon *hwmon, long *val)
 {
 	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
-	int ret, i, count = 0;
+	int ret, i, start, end, count = 0;
 	s32 average = 0;
+	u32 data = 0;
 
-	for (i = 0; i < DIV_ROUND_UP(hwmon->temp.count, sizeof(u32)); i++) {
-		u32 data = 0;
+	/* CRI relocated the memory controller temperatures to READ_THERMAL_DATA bytes 16..19. */
+	if (hwmon->xe->info.platform >= XE_CRESCENTISLAND) {
+		start = CRI_TEMP_INDEX_MCTRL;
+		end = CRI_TEMP_INDEX_MCTRL + CRI_TEMP_MCTRL_COUNT;
+	} else {
+		start = TEMP_INDEX_MCTRL;
+		end = hwmon->temp.count - 1;
+	}
 
+	for (i = start / sizeof(u32); i < DIV_ROUND_UP(end, sizeof(u32)); i++) {
 		ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_THERMAL_DATA, i),
 				    &data, NULL);
 		if (ret)
@@ -984,7 +996,7 @@ static int get_mc_temp(struct xe_hwmon *hwmon, long *val)
 		hwmon->temp.dword[i] = cpu_to_le32(data);
 	}
 
-	for (i = TEMP_INDEX_MCTRL; i < hwmon->temp.count - 1; i++) {
+	for (i = start; i < end; i++) {
 		if (!mbx_temp_valid(hwmon, hwmon->temp.value[i]))
 			continue;
 		average += mbx_temp_decode(hwmon->temp.value[i]);
-- 
2.25.1

