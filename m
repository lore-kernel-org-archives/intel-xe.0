Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24509CA6019
	for <intel-xe@archiver.kernel.org>; Fri,  9 Oct 2026 12:04:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D61DC10E569;
	Fri,  9 Oct 2026 12:04:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lpsB0u2M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FA1810E569
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Oct 2026 12:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791547479; x=1823083479;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Y+fgHTcttQbPOjCRZsxi5bGr1Suf4I5B/CS6FKIq0+8=;
 b=lpsB0u2MN43a7HNVcfyupqCfS//mxEicVLXZA+gYnf/HRARI3xScxq1T
 rNJP8ShhQjDPy66glL8RIIdNMBdqHlxGnklsUCj1HrYLO5T0O/oxqvQZG
 HtSOK5NjXO5ZBStrSJ9TcrGNBkNU6hksTTvQyqk9oKirbNGu4igrcmTrU
 RZd2pf+A3bgnbCpH64MhgDEb1i0KksvpTTIqnL0pdLJFJ4oBLHuMXPQ+U
 S7Jgz2noiYXLCELR8ezkZkVZ7hBpDOvhnwZt4I5alDnTqd8HOtALmku7p
 wI7fTde00vXf5F7iwMAE8UXtQLQ2K1oxeMj6Rex+3o1QzQtemRY/UYJFx A==;
X-CSE-ConnectionGUID: i2hW3gjDSJyrAxtyzhctiA==
X-CSE-MsgGUID: 4eUYhyiDR5y6uLGVDMJ1Cw==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="372036"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="372036"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2026 05:04:38 -0700
X-CSE-ConnectionGUID: IaFJu0Z0SKisgrXdGe2LVQ==
X-CSE-MsgGUID: CZV6wTqdSS++oj0h/JSAWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="311910"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2026 05:04:36 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v9 06/14] drm/xe/hwmon: Detect unavailable PCIe thermal sensors
Date: Fri,  9 Oct 2026 17:33:27 +0530
Message-Id: <20261009120335.52973-7-karthik.poosa@intel.com>
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
index 89e47d013dc6..accccadbe3e6 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -903,7 +903,13 @@ static int get_pcie_temp(struct xe_hwmon *hwmon, long *val)
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

