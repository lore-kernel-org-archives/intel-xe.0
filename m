Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A945C98317
	for <intel-xe@archiver.kernel.org>; Thu, 24 Sep 2026 11:13:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A23310F476;
	Thu, 24 Sep 2026 11:13:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cBR4awCu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90B7810E7D2
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Sep 2026 11:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790248404; x=1821784404;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9Bt+JprMjqQhC72n/ra6PS18wtPrxhLfRtcXZdA7XZ4=;
 b=cBR4awCu/5BNUmRk4klyM071Vt3ZT1MUfmXgW2Byu4JEMv9D4IlNGLiP
 sdmhyG5ge4/4epWjXSTGCz9g5dt7duPLgXvIemEtOx4Fkk8OCQwPIC+CI
 Fs8vCdSmPG6xJZXVrIV6aIrNpG/8w2NpIt9BHj7Yjd1VTNlHTDo2smq48
 htc4muag1Ramx1Zj/LqriD+eUEiho9ZhZhZccNrwRH5RYNJDy5inxsB3X
 jSKczuRICM2PovXaEZFYSZ5VdD7syY0EAlebO6IT8N0cvIvA9Efxhqalh
 4YldvKq5ISAybd7uCcDBqUxWK1reT5YokwL9twrwh72bK3ObBVhhT/azw A==;
X-CSE-ConnectionGUID: UCdAGGhQS0el0IvpK+sqEg==
X-CSE-MsgGUID: /Xq8W3k9T7qkGiNlw5qTkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="101187745"
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; d="scan'208";a="101187745"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 04:13:24 -0700
X-CSE-ConnectionGUID: wYeOb/HxSO+qPQpUVtYiLA==
X-CSE-MsgGUID: Ka6EtXa0TRO+eJEpNQq7TQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; d="scan'208";a="277394839"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 04:13:21 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v5 12/13] drm/xe/hwmon: Update memory controller temperature
 offset for CRI
Date: Thu, 24 Sep 2026 16:41:55 +0530
Message-Id: <20260924111156.2628915-13-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260924111156.2628915-1-karthik.poosa@intel.com>
References: <20260924111156.2628915-1-karthik.poosa@intel.com>
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
---
 drivers/gpu/drm/xe/xe_hwmon.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index c411cd375aa1..fef2166989ba 100644
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
 
@@ -964,10 +968,19 @@ static int mbx_temp_decode(u8 value)
 static int get_mc_temp(struct xe_hwmon *hwmon, long *val)
 {
 	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
-	int ret, i, count = 0;
+	int ret, i, start, end, count = 0;
 	s32 average = 0;
 
-	for (i = 0; i < DIV_ROUND_UP(hwmon->temp.count, sizeof(u32)); i++) {
+	/* CRI relocated the memory controller temperatures to READ_THERMAL_DATA bytes 16..19. */
+	if (hwmon->xe->info.platform >= XE_CRESCENTISLAND) {
+		start = CRI_TEMP_INDEX_MCTRL;
+		end = CRI_TEMP_INDEX_MCTRL + CRI_TEMP_MCTRL_COUNT;
+	} else {
+		start = TEMP_INDEX_MCTRL;
+		end = hwmon->temp.count - 1;
+	}
+
+	for (i = start / sizeof(u32); i < DIV_ROUND_UP(end, sizeof(u32)); i++) {
 		ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_THERMAL_DATA, i),
 				    &hwmon->temp.dword[i], NULL);
 		if (ret)
@@ -976,7 +989,7 @@ static int get_mc_temp(struct xe_hwmon *hwmon, long *val)
 			hwmon->temp.dword[i]);
 	}
 
-	for (i = TEMP_INDEX_MCTRL; i < hwmon->temp.count - 1; i++) {
+	for (i = start; i < end; i++) {
 		if (!mbx_temp_valid(hwmon, hwmon->temp.value[i]))
 			continue;
 		average += mbx_temp_decode(hwmon->temp.value[i]);
-- 
2.25.1

