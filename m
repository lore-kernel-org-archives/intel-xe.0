Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCD68CC6B34
	for <intel-xe@archiver.kernel.org>; Thu, 15 Oct 2026 07:16:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88FEF1120DE;
	Thu, 15 Oct 2026 07:16:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E37941120E8
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Oct 2026 07:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792048551; x=1823584551;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1Yx84G/3M58RZ5FdKC7TeDFSJDMbZijYHwLvj+XduDM=;
 b=D6oESuMdZgNnVxmFa2aNYoJXYNXNJpVdeaiqPM108bl1Cu2+xHCkx8Sg
 gb9PjZEXNlWOwH3llqvqnImAVVd4+Y+RNsDgrXmp6OLZmlJxloz+PFPdG
 SZEf5omKRrrd4G5KH+17JOG4SXCiRUeO/AJcUSGXZ1rib0uJsAyDAi+vn
 YlHiU1UXJwJxCoukpoiJiuj0H6ib+KDMuuioZmlmIPfZstWBsASenY5bF
 2QoOcG3A8oM9sw4wCh8IFazPQhBEBVRNp8jqX5xIj9dQ3SU2qFPi9I6Yn
 JzyF/rUP3JUkCH6awgbdfoYMhBD/w0L2PmDgmK32VQAmKGmrmc7Ng+EQt g==;
X-CSE-ConnectionGUID: J25o8fgiRT6JvSuLgbr4PQ==
X-CSE-MsgGUID: wJgFWZytRLWYxFvByQLFXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="707162"
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="707162"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 00:15:51 -0700
X-CSE-ConnectionGUID: ukZ7BWVXSNiDptoVbEimdA==
X-CSE-MsgGUID: fFaRAD/kTpCeE2Kv4vMkgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="1508974"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 00:15:49 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v14 06/16] drm/xe/hwmon: Detect unavailable PCIe thermal
 sensors
Date: Thu, 15 Oct 2026 12:44:24 +0530
Message-Id: <20261015071434.1063785-7-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261015071434.1063785-1-karthik.poosa@intel.com>
References: <20261015071434.1063785-1-karthik.poosa@intel.com>
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
index 13343f5ed3c0..3d761858fc67 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -945,7 +945,13 @@ static int get_pcie_temp(struct xe_hwmon *hwmon, long *val)
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

