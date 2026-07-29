Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42BB0C53219
	for <intel-xe@archiver.kernel.org>; Wed, 29 Jul 2026 17:07:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D444A10ED07;
	Wed, 29 Jul 2026 17:07:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NScXMv50";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24EC410ED07
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Jul 2026 17:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785344827; x=1816880827;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Mk9yffVjGfmzNd+iBk0vSsCXm6dqoiTxuH3OVRkh8so=;
 b=NScXMv50qHNYoMjlw1MATf8XNih5RY7tBW9k47nNsXQO7FwRII7VcZiX
 VWzfIvQtGiNfKB2cViIptoFjwe16YaM1MD6vTct++jiqwYN+lfmfOT1yG
 Y+5RWDIB1sJNrpaWXhkJu7T7qiIdhn1e9C6ndf5J/NJOgokwjnSQBaV+A
 Mhr9kBsJHGruEM5tvLJhLQXVNq1CvcSq4vEvmnnphCl/46CD6NrANCyxE
 djJeztKMXI9X8QeF3yt0iicR8dQlIEdPlSyJIQqGVrOMSdPj1sm4/caWl
 D3NsjpJmud7o0VPy12xaMgQ1sXEujDUa/XefuruDEJKW2XX7JV8RYE0rf g==;
X-CSE-ConnectionGUID: EuiJtTSqRxa6rsPQsgy6kw==
X-CSE-MsgGUID: OChlB1ijRterVbrbZ5FR/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="73494453"
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="73494453"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 10:07:07 -0700
X-CSE-ConnectionGUID: PjnT4jfLTVulsrY6UYFe+A==
X-CSE-MsgGUID: y0oEI8IETduAJwWNG5IB5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="298284843"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 10:07:04 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH 2/2] drm/xe/hwmon: Increase timeout for mailbox power limits
Date: Wed, 29 Jul 2026 22:45:46 +0530
Message-Id: <20260729171546.3368457-3-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260729171546.3368457-1-karthik.poosa@intel.com>
References: <20260729171546.3368457-1-karthik.poosa@intel.com>
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

Mailbox power limit operations can occasionally take longer than the
current 1 ms timeout, causing sporadic failures.
Increase the timeout to 10 ms and rename PL_WRITE_MBX_TIMEOUT_MS to
PL_MBX_TIMEOUT_MS to better reflect its usage.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 drivers/gpu/drm/xe/xe_hwmon.c | 28 +++++++++++++++-------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index de3f2aeffc3f..459ad953dfc8 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -102,9 +102,9 @@ enum sensor_attr_power {
 #define PWR_ATTR_TO_STR(attr)	(((attr) == hwmon_power_max) ? "PL1" : "PL2")
 
 /*
- * Timeout for power limit write mailbox command.
+ * Timeout for power limit mailbox commands.
  */
-#define PL_WRITE_MBX_TIMEOUT_MS	(1)
+#define PL_MBX_TIMEOUT_MS	(10)
 
 /* Index of memory controller in READ_THERMAL_DATA output */
 #define TEMP_INDEX_MCTRL	2
@@ -199,11 +199,12 @@ static int xe_hwmon_pcode_read_power_limit(const struct xe_hwmon *hwmon, u32 att
 	u32 val0 = 0, val1 = 0;
 	int ret = 0;
 
-	ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_POWER_SETUP,
-						  (channel == CHANNEL_CARD) ?
-						  READ_PSYSGPU_POWER_LIMIT :
-						  READ_PACKAGE_POWER_LIMIT,
-						  prepare_power_limit_param2(hwmon)), &val0, &val1);
+	ret = xe_pcode_read_timeout(root_tile, PCODE_MBOX(PCODE_POWER_SETUP,
+							  (channel == CHANNEL_CARD) ?
+							  READ_PSYSGPU_POWER_LIMIT :
+							  READ_PACKAGE_POWER_LIMIT,
+							  prepare_power_limit_param2(hwmon)),
+							  &val0, &val1, PL_MBX_TIMEOUT_MS);
 
 	if (ret) {
 		drm_dbg(&hwmon->xe->drm, "read failed ch %d val0 0x%08x, val1 0x%08x, ret %d\n",
@@ -232,11 +233,12 @@ static int xe_hwmon_pcode_rmw_power_limit(const struct xe_hwmon *hwmon, u32 attr
 	u32 val0 = 0, val1 = 0;
 	int ret = 0;
 
-	ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_POWER_SETUP,
-						  (channel == CHANNEL_CARD) ?
-						  READ_PSYSGPU_POWER_LIMIT :
-						  READ_PACKAGE_POWER_LIMIT,
-						  prepare_power_limit_param2(hwmon)), &val0, &val1);
+	ret = xe_pcode_read_timeout(root_tile, PCODE_MBOX(PCODE_POWER_SETUP,
+							  (channel == CHANNEL_CARD) ?
+							  READ_PSYSGPU_POWER_LIMIT :
+							  READ_PACKAGE_POWER_LIMIT,
+							  prepare_power_limit_param2(hwmon)),
+							  &val0, &val1, PL_MBX_TIMEOUT_MS);
 	if (ret)
 		drm_dbg(&hwmon->xe->drm, "read failed ch %d val0 0x%08x, val1 0x%08x, ret %d\n",
 			channel, val0, val1, ret);
@@ -252,7 +254,7 @@ static int xe_hwmon_pcode_rmw_power_limit(const struct xe_hwmon *hwmon, u32 attr
 							     (channel == CHANNEL_CARD) ?
 							     WRITE_PSYSGPU_POWER_LIMIT :
 							     WRITE_PACKAGE_POWER_LIMIT, 0),
-							     val0, val1, PL_WRITE_MBX_TIMEOUT_MS);
+							     val0, val1, PL_MBX_TIMEOUT_MS);
 	if (ret)
 		drm_dbg(&hwmon->xe->drm, "write failed ch %d val0 0x%08x, val1 0x%08x, ret %d\n",
 			channel, val0, val1, ret);
-- 
2.25.1

