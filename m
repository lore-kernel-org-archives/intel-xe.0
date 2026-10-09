Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 571E8CA6019
	for <intel-xe@archiver.kernel.org>; Fri,  9 Oct 2026 12:04:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14E7010E5BF;
	Fri,  9 Oct 2026 12:04:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G4bKSkMP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14D4110E5BF
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Oct 2026 12:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791547495; x=1823083495;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+E/jbbjAuvL5kax3I0fJBvFpQL8GLYofmfRNW/e5mE4=;
 b=G4bKSkMP5kU0uj5A9XoUdmeMqxwjIT5mH+KeJTqaO2SYZK+5OlsxoT2x
 8aulpDbS7QOOElm2LW6zpzf8asmfnN/7XUesb3CU+u612Swnzw0ENIoSz
 G2k7m+pGUhJBVIJgtL4JRTXKPLo4xYXo1AMqPVodSQVBEjwsx7lg/7HAf
 0WTahofFau8ofoCWQKYqs36MVKCvKblptyQREqjsC+BZBCpUG3pqI8a/h
 oHWrfFBSjaqro4YSEWdbHIC11srXbqxfeSphuAMjyvfk5aK3EQzk8BkDX
 tCD1O0/0mLX2g82CDAb2irMZ1r6AE9SCSm9Gfam7s8eZ3LQ3HzP1enLls A==;
X-CSE-ConnectionGUID: d33aW5ZFSJ++e8O581m9VQ==
X-CSE-MsgGUID: lbqFKfCsQ5OFXvtQxsp76g==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="372053"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="372053"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2026 05:04:55 -0700
X-CSE-ConnectionGUID: xtkES9fvSLa9ecbe0Q2Y5w==
X-CSE-MsgGUID: cEnWBU9tQH2hZq49iRYrLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="311941"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2026 05:04:52 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v9 12/14] drm/xe/hwmon: Update memory controller temperature
 offset for CRI
Date: Fri,  9 Oct 2026 17:33:33 +0530
Message-Id: <20261009120335.52973-13-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261009120335.52973-1-karthik.poosa@intel.com>
References: <20261009120335.52973-1-karthik.poosa@intel.com>
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
 drivers/gpu/drm/xe/xe_hwmon.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 8617b5e84b50..7fe3ba422cc8 100644
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
 
@@ -969,10 +973,19 @@ static int mbx_temp_decode(u8 value)
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
@@ -981,7 +994,7 @@ static int get_mc_temp(struct xe_hwmon *hwmon, long *val)
 			hwmon->temp.dword[i]);
 	}
 
-	for (i = TEMP_INDEX_MCTRL; i < hwmon->temp.count - 1; i++) {
+	for (i = start; i < end; i++) {
 		if (!mbx_temp_valid(hwmon, hwmon->temp.value[i]))
 			continue;
 		average += mbx_temp_decode(hwmon->temp.value[i]);
-- 
2.25.1

