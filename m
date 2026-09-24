Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1118FC98318
	for <intel-xe@archiver.kernel.org>; Thu, 24 Sep 2026 20:55:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A21CC10E206;
	Thu, 24 Sep 2026 20:55:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S6bG593Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FDA610E1F3
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Sep 2026 20:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790283337; x=1821819337;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PAOfvzUM2rSeY4fH6Kf2MdaWs7jq3topqWjGZL+8V3w=;
 b=S6bG593YCiS7St8stOZ445jmptCQ1PEtPxJB+wXfGZ7SnTcT/1xvgWhj
 9dfqXjJJlW9xDPaXIQ1vGfHB7i7sA9tcJ6DO56RNGSCwojd2gq3DdO3ua
 2WVFOq8X0PRe1vb2lPIghSGLDe4+Fm0ivAJScz4RUDZBV+R9P4Jyh9Ryy
 pydNrjaGNiErD8DPKShPpFO+l3Sf16BmjWLXloD+5FRPQz3JIdUS1ohdh
 tB1usPooDCy2OwEPcU4PALbqT+Tx2wBiU/++mNUeFjU8d3qEmxl8Zc3Tw
 5tNYoqZXielzs6Drvw31S2JjyjGrYiolV3id2+L0XHaIc3ozjOczNOLzT w==;
X-CSE-ConnectionGUID: F1uEb4bVRwmR+fhSC9ssyA==
X-CSE-MsgGUID: yALVFJI4Su61ulX27vMWPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="94886179"
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; d="scan'208";a="94886179"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 13:55:37 -0700
X-CSE-ConnectionGUID: UabMgYzsQF+i1lwhetgU/w==
X-CSE-MsgGUID: SnX69RCoRFGVeV7QPvCEYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; d="scan'208";a="273347350"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 13:55:34 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v6 06/13] drm/xe/hwmon: Detect unavailable PCIe thermal sensors
Date: Fri, 25 Sep 2026 02:24:22 +0530
Message-Id: <20260924205429.2846256-7-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260924205429.2846256-1-karthik.poosa@intel.com>
References: <20260924205429.2846256-1-karthik.poosa@intel.com>
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
index 83466b8d8d27..4a7cf913e6c8 100644
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

