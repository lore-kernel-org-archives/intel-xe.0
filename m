Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DB1FCA5FFD
	for <intel-xe@archiver.kernel.org>; Tue,  6 Oct 2026 03:36:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28C9010E2C6;
	Tue,  6 Oct 2026 03:36:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BNcjRj18";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6E6510E2C6
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Oct 2026 03:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791257803; x=1822793803;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ICpZ7Tia9d/jL+ST04MhYNioMwCVkHdqzaX/MA6NA8k=;
 b=BNcjRj18HwEied5mk19ttuAzYOj8VJr2zzpXXF/ZyGQyDCLXEX1BJhGI
 wb3WFGx47jT7w9Cuv6Rm8ou3UCJQ9+oWBKcQd9c0juSlFPNjIAGTidHaY
 gGLgIsjVd8SwqxNY+w+ietTNbpwsk5+YiGjzN7ph469jhZaXs2MjsbU1z
 ibFec+QG3F8b6daaH0Ih4GH7Vt9UDYBJOJXhpC63+iafOB9CNyWClN6BA
 FWDxHryFReprq25jSDc3bZktdLY+jajG0B7kzSKY6F+e/JW753n3dICCL
 wL5mR46oBJTXoRPRQuQjsYJvt3Z2zvv5Dr5UJRZXqH5qmOl196itMfFsW A==;
X-CSE-ConnectionGUID: AAiJH7h1TNqZLTD/AthcPA==
X-CSE-MsgGUID: BY0+p8e9SjaUHY16POl4/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="94427398"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; d="scan'208";a="94427398"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 20:36:43 -0700
X-CSE-ConnectionGUID: 4Pkn8tVAQAiG3HALhNrEEA==
X-CSE-MsgGUID: T1cyafZmSLWj/oN6mqoLVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; d="scan'208";a="273400953"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 20:36:40 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v8 05/15] drm/xe/hwmon: Handle unavailable memory controller
 sensors
Date: Tue,  6 Oct 2026 09:05:24 +0530
Message-Id: <20261006033534.3583967-6-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261006033534.3583967-1-karthik.poosa@intel.com>
References: <20261006033534.3583967-1-karthik.poosa@intel.com>
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

Skip memory controller sensors that report invalid readings when
computing the average temperature in get_mc_temp(). Return -ENXIO when
no valid sensor data is available, and allow the helper to be used as
an availability probe by making the output parameter optional.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
Fixes: 3a0cb885e111 ("drm/xe/hwmon: Expose memory controller temperature")
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_hwmon.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 5bbcb81529db..89e47d013dc6 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -855,8 +855,8 @@ static int mbx_temp_decode(u8 value)
 static int get_mc_temp(struct xe_hwmon *hwmon, long *val)
 {
 	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
+	int ret, i, count = 0;
 	s32 average = 0;
-	int ret, i;
 
 	for (i = 0; i < DIV_ROUND_UP(hwmon->temp.count, sizeof(u32)); i++) {
 		ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_THERMAL_DATA, i),
@@ -867,11 +867,23 @@ static int get_mc_temp(struct xe_hwmon *hwmon, long *val)
 			hwmon->temp.dword[i]);
 	}
 
-	for (i = TEMP_INDEX_MCTRL; i < hwmon->temp.count - 1; i++)
+	for (i = TEMP_INDEX_MCTRL; i < hwmon->temp.count - 1; i++) {
+		if (!mbx_temp_valid(hwmon, hwmon->temp.value[i]))
+			continue;
 		average += mbx_temp_decode(hwmon->temp.value[i]);
+		count++;
+	}
+
+	if (!count) {
+		drm_dbg(&hwmon->xe->drm, "Memory controller temperature unavailable!\n");
+		return -ENXIO;
+	}
+
+	average /= count;
+
+	if (val)
+		*val = average * MILLIDEGREE_PER_DEGREE;
 
-	average /= (hwmon->temp.count - TEMP_INDEX_MCTRL - 1);
-	*val = average * MILLIDEGREE_PER_DEGREE;
 	return 0;
 }
 
-- 
2.25.1

