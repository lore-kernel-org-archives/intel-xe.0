Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACCC6C9831D
	for <intel-xe@archiver.kernel.org>; Thu, 24 Sep 2026 11:13:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60D0610E7D2;
	Thu, 24 Sep 2026 11:13:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NZW7CBlb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2B6710E0F6
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Sep 2026 11:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790248383; x=1821784383;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mOJYchtypuAK86v9HKryUqQVHaBLeB2orUQ20mY8vbQ=;
 b=NZW7CBlbq4htmjRkvduy/3Jt/GMbxbfbTepDcBUcFyY0nPAuBnH3kQtC
 RV/Pr2PUZ+P8xSvtPk8fjpt1E+2pC754kV8z/Ltl0dl9Cb7szP4jJsM4h
 L0ut3VR0H/toqPnGNR5qBUKUZNVpPrXF8GpEf6jJ7g14Pn7i/Ii5ZSA36
 ic2o8OaXXtCeGvobNBDwJXKNrYZRk4td71qkOvMuvjyiHzgcizmXSMZii
 V59PandkkJns3GbtiiCb21svXRoGOx3FxilUQkSm3+iY/6ZKbr58LsYdC
 arPN9XMs/jGT0BBDxmIqwq/ZqYdQ6DibxOepRGiGpHcMXKkQ7QlbDxXoN Q==;
X-CSE-ConnectionGUID: AutU6VEOQSCfTDIB5zfdMg==
X-CSE-MsgGUID: q8t19PlxSFGOhhfpRx2w/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="101187718"
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; d="scan'208";a="101187718"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 04:13:03 -0700
X-CSE-ConnectionGUID: FAC+93AeQSaUq00Tf8Dd8A==
X-CSE-MsgGUID: n57SedJHQpGQ1xRwcabM+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; d="scan'208";a="277394720"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 04:13:01 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v5 05/13] drm/xe/hwmon: Handle unavailable memory controller
 sensors
Date: Thu, 24 Sep 2026 16:41:48 +0530
Message-Id: <20260924111156.2628915-6-karthik.poosa@intel.com>
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

Skip memory controller sensors that report invalid readings when
computing the average temperature in get_mc_temp(). Return -ENXIO when
no valid sensor data is available, and allow the helper to be used as
an availability probe by making the output parameter optional.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 drivers/gpu/drm/xe/xe_hwmon.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 349423bf6f5a..905c3d6b3d3f 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -849,8 +849,8 @@ static int mbx_temp_decode(u8 value)
 static int get_mc_temp(struct xe_hwmon *hwmon, long *val)
 {
 	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
+	int ret, i, count = 0;
 	s32 average = 0;
-	int ret, i;
 
 	for (i = 0; i < DIV_ROUND_UP(hwmon->temp.count, sizeof(u32)); i++) {
 		ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_THERMAL_DATA, i),
@@ -861,11 +861,23 @@ static int get_mc_temp(struct xe_hwmon *hwmon, long *val)
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

