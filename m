Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28E9BCC6B1C
	for <intel-xe@archiver.kernel.org>; Tue, 13 Oct 2026 18:50:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D28C710E9C3;
	Tue, 13 Oct 2026 18:50:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E35C510E8DD
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Oct 2026 18:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791917446; x=1823453446;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=k24rBZjiLQuHzVDh4M3kjxCBRriG5n5LAm4rTY7alZM=;
 b=fule1Skw0Wlf8SX8w7DY2mGeVDOqjJkHV5CfLfOcTBOZrPELXCIXcaXr
 t5uakLwTXKD4DefXPw/A56K9tIj6wkGVnjrXnqRLwKWS5S/lE9APZb5Wn
 34xFRrX11dyccv3rcSNYvP9eNW3XTbM4BIqHn8iifXjbdgrk0nytuLqQs
 H8mfjGjv2gifjLENU3dO2AL+wP0tOt6EJXNZ6JlDUQxOKhnWAc8exB+BK
 O51SlowCnYKR/wox+1GM+FpNpCSTUJPvx/tmb759mOmHcXqwNyR6ggQll
 xKyPWyU+pTXqyWf8lhFTRaINfy0sBmKi4fOz8uHAHljXXxu6yLFnD1cnI Q==;
X-CSE-ConnectionGUID: YQG8baQpT9yd2ZlM7CDEgQ==
X-CSE-MsgGUID: IuBv7yMMSKiW98H1lM9dfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="545795"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="545795"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 11:50:42 -0700
X-CSE-ConnectionGUID: UyaDSWxCSQ+RE3tWBFcE5w==
X-CSE-MsgGUID: P1pjwqXoRleJKVmYHRTW1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1596180"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 11:50:40 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v12 06/16] drm/xe/hwmon: Detect unavailable PCIe thermal
 sensors
Date: Wed, 14 Oct 2026 00:19:29 +0530
Message-Id: <20261013184939.694945-7-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261013184939.694945-1-karthik.poosa@intel.com>
References: <20261013184939.694945-1-karthik.poosa@intel.com>
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

Return -ENXIO from get_pcie_temp() when the mailbox reports an invalid
reading, so the PCIe sensor can be treated as unavailable. Guard the val
store so the function can be used purely as an availability probe. No
sysfs visibility changes.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_hwmon.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 2f92ec950614..4463f32c8d8c 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -906,7 +906,13 @@ static int get_pcie_temp(struct xe_hwmon *hwmon, long *val)
 		data = REG_FIELD_GET(PCIE_SENSOR_MASK, data);
 
 	data = REG_FIELD_GET(TEMP_MASK, data);
-	*val = mbx_temp_decode(data) * MILLIDEGREE_PER_DEGREE;
+	if (!mbx_temp_valid(hwmon, data)) {
+		drm_dbg(&hwmon->xe->drm, "PCIe temperature not available\n");
+		return -ENXIO;
+	}
+
+	if (val)
+		*val = mbx_temp_decode(data) * MILLIDEGREE_PER_DEGREE;
 
 	return 0;
 }
-- 
2.25.1

