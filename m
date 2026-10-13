Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C814ECA9ED0
	for <intel-xe@archiver.kernel.org>; Tue, 13 Oct 2026 02:08:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85FE010E6F3;
	Tue, 13 Oct 2026 02:08:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 281A310E6F3
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Oct 2026 02:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791857290; x=1823393290;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=P5xJvs39L6tjkTWGwZrfZaq8wx4MjZC2xdiz/EX1cQQ=;
 b=Bs3PPqGPZ3jIHi/yO1P86XStdCdSyaFCzKPep4HWHI/mouOnjtrjerXt
 +sDpiXw/Ub7yd4io20URO1QxtQ25Z5+icBYnMzDhR7XO4h80AbhbNksyn
 ZvkcKnle/e/UE8K22//9XcgGUNM9QruW9o1fr0fZRutK3IudMYb+IuP9G
 XzfGYF0dJt4nwROlB7ZFtB9EZEkWp93FKDeIOMAGVgkz78LsuL1s7y1rV
 h3G9F44Y3v1Ast/UWoeCudhv4nZun55153mRvJ0COTTzOR2KXg69jcpKq
 YiVaI83bKT676e6dj/SkhteduR9pZgrRB7U8mJ4axeO1dMYEca/we5BNn A==;
X-CSE-ConnectionGUID: J1esS8S0QmOKX8XUo3d1lw==
X-CSE-MsgGUID: /K9EmxqQQ7WekrYX/41XeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="670223"
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="670223"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 19:08:10 -0700
X-CSE-ConnectionGUID: vnq4DPC+THKVps5e6QvC4g==
X-CSE-MsgGUID: RHQ8pdpjQiSahmSdzHjVWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="1369225"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 19:08:07 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v11 15/16] drm/xe: Validate thermal sensor count before reads
Date: Tue, 13 Oct 2026 07:36:35 +0530
Message-Id: <20261013020636.447620-16-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261013020636.447620-1-karthik.poosa@intel.com>
References: <20261013020636.447620-1-karthik.poosa@intel.com>
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

Check that READ_THERMAL_CONFIG reports enough thermal entries for the
platform-specific MCTRL range and PCIe sensor index before reading
READ_THERMAL_DATA.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_hwmon.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 7311f969f574..702c739c9bf0 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -920,6 +920,13 @@ static int get_mc_temp(struct xe_hwmon *hwmon, long *val)
 		end = hwmon->temp.count - 1;
 	}
 
+	if (end <= start || end > hwmon->temp.count) {
+		drm_warn(&hwmon->xe->drm,
+			 "memory controller range [%d, %d) is invalid for temperature count %d\n",
+			 start, end, hwmon->temp.count);
+		return -ENODATA;
+	}
+
 	for (i = start / sizeof(u32); i < DIV_ROUND_UP(end, sizeof(u32)); i++) {
 		ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_THERMAL_DATA, i),
 				    &data, NULL);
@@ -964,15 +971,24 @@ static int get_pcie_temp(const struct xe_hwmon *hwmon, long *val)
 {
 	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
 	u32 data = 0;
+	int index;
 	int ret;
 
+	index = xe_hwmon_pcie_temp_index(hwmon);
+	if (hwmon->temp.count - 1 <  index) {
+		drm_warn(&hwmon->xe->drm,
+			 "PCIe temperature end index %d exceeds temperature count %d\n",
+			 index, hwmon->temp.count);
+		return -ENODATA;
+	}
+
 	ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_THERMAL_DATA,
-						  xe_hwmon_pcie_temp_index(hwmon) / sizeof(data)),
+						  index / sizeof(data)),
 						  &data, NULL);
 	if (ret)
 		return ret;
 
-	data >>= (xe_hwmon_pcie_temp_index(hwmon) % sizeof(data)) * BITS_PER_BYTE;
+	data >>= (index % sizeof(data)) * BITS_PER_BYTE;
 	data = REG_FIELD_GET(TEMP_MASK, data);
 	if (!mbx_temp_valid(hwmon, data)) {
 		drm_dbg(&hwmon->xe->drm, "PCIe temperature not available\n");
-- 
2.25.1

