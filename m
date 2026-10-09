Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA17FCA601E
	for <intel-xe@archiver.kernel.org>; Fri,  9 Oct 2026 12:04:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A2781120A8;
	Fri,  9 Oct 2026 12:04:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eejsCIq4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4854D10F24D
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Oct 2026 12:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791547470; x=1823083470;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iYTUi7QJx09qTyltHPiDxslP4igJbzp6VYb180z6CeQ=;
 b=eejsCIq4Po9O0ZX3WMcPJu564WZSLdiFhUs1MAoidc9E083H0h+PMo5H
 u8umiqTOF43MC0mNZEbRJRnGKq0a5PdCU9Z7r7O6BbC/4Dex56hUR2qYr
 IJmk1b7JMHlqxkSMp/lCingYBdoAcakH3Hd3ONEo5QEiYO2ki1awI/X2n
 gEkSI/hddvrEzLjTJ517Cm2QopksrWHyGZlh/RzFnxtKuix/TWowvbFB+
 kpAwOznZUOQ+yCFAH40Mls9Vu7t2stibXkneYKp8HsvvCOY9rpncnFdo5
 8bDqwP3CKaYgaW+yS31tUJWqQhESbvJmc1UZLJmIpFocghi/3Qaf7yt49 g==;
X-CSE-ConnectionGUID: VWVvkjyFTRCxtDBGfd0CYw==
X-CSE-MsgGUID: uFR5zyd/RYCc6Knbym3mGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="372028"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="372028"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2026 05:04:30 -0700
X-CSE-ConnectionGUID: 9vWXuGlzSDeHsjbeAZcohg==
X-CSE-MsgGUID: ZX6wLnZgQna7KGby3op4pA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="311871"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2026 05:04:28 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v9 03/14] drm/xe/hwmon: Fix memory controller thermal data
 handling
Date: Fri,  9 Oct 2026 17:33:24 +0530
Message-Id: <20261009120335.52973-4-karthik.poosa@intel.com>
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

Read all required thermal groups in get_mc_temp() and use an aligned
u32 buffer for PCODE accesses to avoid unaligned memory accesses and
ensure correct MC temperature reporting.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
Fixes: 3a0cb885e111 ("drm/xe/hwmon: Expose memory controller temperature")
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_hwmon.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index c63aa708ab6f..33d0ca7d86e4 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -143,8 +143,12 @@ struct xe_hwmon_thermal_info {
 	};
 	/** @count: no of temperature sensors available for the platform */
 	u8 count;
-	/** @value: per-sensor raw mailbox temperature; bit7=sign, bits6:0=magnitude */
-	u8 value[U8_MAX];
+	union {
+		/** @value: per-sensor raw mailbox temperature; bit7=sign, bits6:0=magnitude */
+		u8 value[U8_MAX + 1];
+		/** @dword: sensor values as dwords, u32-aligned for pcode reads */
+		u32 dword[DIV_ROUND_UP(U8_MAX + 1, sizeof(u32))];
+	};
 	/** @vram_label: vram label names */
 	char vram_label[MAX_VRAM_CHANNELS][MAX_LABEL_SIZE];
 };
@@ -831,16 +835,16 @@ static int mbx_temp_decode(u8 value)
 static int get_mc_temp(struct xe_hwmon *hwmon, long *val)
 {
 	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
-	u32 *dword = (u32 *)hwmon->temp.value;
 	s32 average = 0;
 	int ret, i;
 
-	for (i = 0; i < DIV_ROUND_UP(TEMP_LIMIT_MAX, sizeof(u32)); i++) {
+	for (i = 0; i < DIV_ROUND_UP(hwmon->temp.count, sizeof(u32)); i++) {
 		ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_THERMAL_DATA, i),
-				    (dword + i), NULL);
+				    &hwmon->temp.dword[i], NULL);
 		if (ret)
 			return ret;
-		drm_dbg(&hwmon->xe->drm, "thermal data for group %d val 0x%x\n", i, dword[i]);
+		drm_dbg(&hwmon->xe->drm, "thermal data for group %d val 0x%x\n", i,
+			hwmon->temp.dword[i]);
 	}
 
 	for (i = TEMP_INDEX_MCTRL; i < hwmon->temp.count - 1; i++)
-- 
2.25.1

