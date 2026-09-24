Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC5A3C9830E
	for <intel-xe@archiver.kernel.org>; Thu, 24 Sep 2026 10:51:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9620C10F469;
	Thu, 24 Sep 2026 10:51:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ioy6e6hH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD90F10E9CD
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Sep 2026 10:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790247073; x=1821783073;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qLEOnxWbmZBz2/fvrum4hlLjvVdEW/q/5Cs9ikplZIQ=;
 b=ioy6e6hHx1iCH5qlfkZX5aXBSNTe1jb1pUZwi83tlmcjCr6FsE218K8m
 Fn7H4DRj8Q1ZaSIZTNyDOyh3P8L3ln/WrXemEB5Ig+lWtMtaFTHOhawmb
 sUzcMyck8qgzELGd0VnemPCoETQbPimtPu5kl9L5B++KoZkyfz9zS7qg2
 uQbxC1WxghyElOJkgNAS42CyrVaF1oITn8aQCrv2NsFbm5WLwblNcitak
 JxKzktBeASyIKk7VOwuNeN5zuHCUgj77lWvRYo/XrGEp3+3YWal+ZzRDJ
 VOaqeNjeewNAWQ3X6XIaLpMidEzDAjzrFCMpkmmEXf4hDqOoBcV+ehUvq w==;
X-CSE-ConnectionGUID: iDkuKMqOQlSlhRD37+I5ww==
X-CSE-MsgGUID: KI8/lpvtRDalYHJpihmWew==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="91032888"
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; d="scan'208";a="91032888"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 03:51:13 -0700
X-CSE-ConnectionGUID: 2htiCYlpReuM168cohTQJw==
X-CSE-MsgGUID: lOw0BnkbQ1SrWg8al19xjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; d="scan'208";a="277750139"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 03:51:11 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH i-g-t v4 06/13] drm/xe/hwmon: Detect unavailable PCIe thermal
 sensors
Date: Thu, 24 Sep 2026 16:19:53 +0530
Message-Id: <20260924105000.2627929-7-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260924105000.2627929-1-karthik.poosa@intel.com>
References: <20260924105000.2627929-1-karthik.poosa@intel.com>
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
---
 drivers/gpu/drm/xe/xe_hwmon.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 905c3d6b3d3f..7bb7a5f402d1 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -897,7 +897,13 @@ static int get_pcie_temp(struct xe_hwmon *hwmon, long *val)
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

