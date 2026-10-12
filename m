Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2067CCA9ED0
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 13:05:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5E2510E5B5;
	Mon, 12 Oct 2026 13:05:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68C1B10E5B5
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Oct 2026 13:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791810334; x=1823346334;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3F+g4J/tHzaQQa6L0P+dcv6RaqbkJL8aRfjlWsaA/ic=;
 b=lr1SXbjOa6R/WEte8gBLpX4ugj6FII6B6ics//Vs6VMXN6TPu+hvLhiP
 Pz5m9ip9uvsmun1hvlQiquhL2IPOnx14pDRIHQeVWSyAVxLR/XmIrmkrb
 7ghbexIAyXkVbJtLc7w9RVcW3rFymGLcegBQaznZXPG+s+GUZD+R+6rBk
 rboTrwX873wp3zDEMig9v7lMooF4mlRd4WtHK9btwQbCzXKa+6R4e2scS
 di2G45pAFb7rYxdGW+LoCnajnAYclY5LnXxC+ECNEETvRQlatHbW7gWRP
 dA8H+CJh5zSe0k8ijywS8nG4LfLjMhG7NPLr3lGJoNIHzD74E/3kwjPkb w==;
X-CSE-ConnectionGUID: BIcXW6GlTTGhTR8vRqvoag==
X-CSE-MsgGUID: wFgKmeuNRcuL/iYxDQsG2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="527332"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="527332"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 06:05:33 -0700
X-CSE-ConnectionGUID: 6UUKCb/WRjGoKvsQV5TGlA==
X-CSE-MsgGUID: VWy5W/EJQR+bsAftsKWL4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="2682050"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 06:05:30 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v10 15/16] drm/xe: Validate thermal sensor count before reads
Date: Mon, 12 Oct 2026 18:34:01 +0530
Message-Id: <20261012130401.443473-16-karthik.poosa@intel.com>
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

Check that READ_THERMAL_CONFIG reports enough thermal entries for the
platform-specific MCTRL range and PCIe sensor index before reading
READ_THERMAL_DATA.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
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

