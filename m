Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0CA2C79FBF
	for <intel-xe@archiver.kernel.org>; Thu, 10 Sep 2026 18:28:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DEC210E69C;
	Thu, 10 Sep 2026 18:28:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QWBZjfIu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0057B10E652
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Sep 2026 18:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789064935; x=1820600935;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=O5Uw8a1hTGnpqpNWTzaqM2Oh3NCfyLuVcITR51byVRI=;
 b=QWBZjfIuzl86jVBMUzFxJjrMJs/sfMc0WjIC+QTcJu8ZRtO+JxrWacxd
 z55wGViIY+2m5B05SdqjgdiYa3E3VxzH6MEvFYBxS1hceKI/pQlxFkaaB
 wIA+dQyETfgNtnxNHhjzU1YnCXNMh1A7VTPuIoB7IkDgjnTiIRjomNNgb
 6XhTu5PjvKRWqxc9dp4zggXzrve20U3T6vhZYTM68YQA8vizJD7TRBJwF
 ZDX5VcSYCOR5ts93o8E4y5fmnrB4/SI5S36R9LCCb2Tm6ZWsPG495I6IX
 nrXa8m6yf/et2oOv++4n6RUQ29AwJrjwa0dG7vBzR8wvL36RNaygyBGis w==;
X-CSE-ConnectionGUID: D3yMz5GEQouO/a8p/8ygHA==
X-CSE-MsgGUID: rCsYb8v4QJewQ4jGqOk/yQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="89397580"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="89397580"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 11:28:55 -0700
X-CSE-ConnectionGUID: wTRlzBDSQeKnczTDISjRRA==
X-CSE-MsgGUID: nMNEtuzFSUuvMlAIRLrRZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; d="scan'208";a="296701061"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 11:28:52 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v3 3/5] drm/xe/hwmon: Fix memory controller thermal data
 handling
Date: Thu, 10 Sep 2026 23:57:54 +0530
Message-Id: <20260910182756.638830-4-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260910182756.638830-1-karthik.poosa@intel.com>
References: <20260910182756.638830-1-karthik.poosa@intel.com>
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
---
 drivers/gpu/drm/xe/xe_hwmon.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index a60a6a731d88..c682c5a33650 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -148,8 +148,12 @@ struct xe_hwmon_thermal_info {
 	u8 count;
 	/** @vram_count: number of VRAM temperature sensors available for the platform */
 	u8 vram_count;
-	/** @value: signed value from each sensor */
-	s8 value[U8_MAX];
+	union {
+		/** @value: signed value from each sensor */
+		s8 value[U8_MAX + 1];
+		/** @dword: sensor values as dwords, u32-aligned for pcode reads */
+		u32 dword[DIV_ROUND_UP(U8_MAX + 1, sizeof(u32))];
+	};
 	/** @vram_label: vram label names, dynamically allocated based on vram_count */
 	char (*vram_label)[MAX_LABEL_SIZE];
 };
@@ -910,16 +914,16 @@ static inline bool is_temp_valid(const struct xe_hwmon *hwmon, u32 value, bool i
 static int get_mc_temp(struct xe_hwmon *hwmon, long *val)
 {
 	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
-	u32 *dword = (u32 *)hwmon->temp.value;
 	int ret, i, count = 0;
 	s32 average = 0;
 
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
 
 	for (i = TEMP_INDEX_MCTRL; i < hwmon->temp.count - 1; i++) {
-- 
2.25.1

