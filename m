Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4E83C3DA4A
	for <intel-xe@archiver.kernel.org>; Thu,  1 Aug 2024 11:11:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A617810E915;
	Thu,  1 Aug 2024 11:11:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mFYrEHc+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E90CB10E915
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Aug 2024 11:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722510676; x=1754046676;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=F2/S1x5HCBwtbOQISknJ2p6L7D904Ew459oKJhbIBVc=;
 b=mFYrEHc+wWZGXHciTLJT+6+2RWeOZYD6ttDiJWJ+i04cAzbUjANQs9x4
 VyY2fmqlV8/DLwHTx4YZQ1C6va3LgndmalzUJrD6F94VIGiL/lXWbCtqh
 /+xcntKq8Rg/W9CJYnAuJjRu1HSl3ZJSeqMF3Hn/Gt3ls42IqQrGBb7xV
 1T+aypP9VbIdcbtZQyBEdewTWS3/1vJrzB1yic2Ara80KAI24GCi27KIt
 T9tn8JOaRRn1YqHM0S+nmS+nTNqTUozvXfmDvS2GbJxrEyjb5WV0Pnybj
 HzfS/tF4jEYxPSEseAVE8nghklA1qs+eaAPvLM1oq7V5NSo6KyOyqbk9+ Q==;
X-CSE-ConnectionGUID: 5Oenz9tYQQeARUvnPuNI8g==
X-CSE-MsgGUID: H43UEevRSpKKaM12W+xtpw==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="31090536"
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="31090536"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 04:11:15 -0700
X-CSE-ConnectionGUID: FrHkHccZQz+xfVvf1SbwUg==
X-CSE-MsgGUID: T/xq1PQuRr25+IpUeNoGNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="92529374"
Received: from sinjan-super-server.iind.intel.com ([10.145.169.153])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 04:11:13 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, ashutosh.dixit@intel.com,
 rodrigo.vivi@intel.com, jonathan.cavitt@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v2] drm/xe/hwmon: Fix PL1 disable flow in
 xe_hwmon_power_max_write
Date: Thu,  1 Aug 2024 16:54:24 +0530
Message-Id: <20240801112424.1841766-1-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
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

In xe_hwmon_power_max_write, for PL1 disable supported case, instead of
returning after PL1 disable, PL1 enable path was also being run.
Fixed it by returning after disable.

v2: Correct typo and grammar in commit message. (Jonathan)

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
Fixes: fef6dd12b45a ("drm/xe/hwmon: Protect hwmon rw attributes with hwmon_lock")
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/xe/xe_hwmon.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 0c8ce09e5025..832ea81faeee 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -203,9 +203,10 @@ static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, int channel, long va
 		reg_val = xe_mmio_rmw32(hwmon->gt, rapl_limit, PKG_PWR_LIM_1_EN, 0);
 		reg_val = xe_mmio_read32(hwmon->gt, rapl_limit);
 		if (reg_val & PKG_PWR_LIM_1_EN) {
+			drm_warn(&gt_to_xe(hwmon->gt)->drm, "PL1 disable is not supported!\n");
 			ret = -EOPNOTSUPP;
-			goto unlock;
 		}
+		goto unlock;
 	}
 
 	/* Computation in 64-bits to avoid overflow. Round to nearest. */
-- 
2.25.1

