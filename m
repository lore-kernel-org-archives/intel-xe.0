Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1D4ECAC59A
	for <intel-xe@archiver.kernel.org>; Thu, 18 Sep 2025 10:32:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9350810E149;
	Thu, 18 Sep 2025 10:32:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oGVzURJa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B8D810E149
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Sep 2025 10:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758191541; x=1789727541;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JxfXUU6H8wOA8X4vFNRSTCoWFs1FjhT8Ny2FlEfSx7A=;
 b=oGVzURJaiGjuNI+hZBL76XyNxMBO9Lo7Sbn4+laERAYygvwYOzGFUlSZ
 sEuLusTNncnicWZsjbzMQLnhmF60EWdue6N+x6gZ3PXG+9U8FEkQYdDeg
 YgLdc9fZZ3SUXXNMQGF5qbUzMmJvpMDuyGP8u8Bp0H4s/37YdOjynHuR0
 wgznq0cP/Qw+zOSGDMOgP3WE6uVcfII4wai6+UNk9f/BOeW7sf2FiHEon
 6RpLbuOCJ68mBnUXufj/FZdgkELcBbz3y5zlidI+azwHWmWns/X8ktTHI
 7tMwOcslghppcS/0jjAG+nSn3uNY1gr77LMMoapq8O9QgdI8zh49I4dCH w==;
X-CSE-ConnectionGUID: vUYmS/9oQPeBsR86CKnIkQ==
X-CSE-MsgGUID: n0GF7M31QsiqTgVm3gETSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="71944508"
X-IronPort-AV: E=Sophos;i="6.18,274,1751266800"; d="scan'208";a="71944508"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 03:32:21 -0700
X-CSE-ConnectionGUID: Xrd7OiUBSLq5Y0K9rrChAw==
X-CSE-MsgGUID: qGvJJ7nURFCZRPJuuc0q9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,274,1751266800"; d="scan'208";a="176305428"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa010.fm.intel.com with ESMTP; 18 Sep 2025 03:32:19 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: lucas.demarchi@intel.com,
	rodrigo.vivi@intel.com
Cc: intel-xe@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com, Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v2] drm/xe/i2c: Don't rely on d3cold.allowed flag in system PM
 path
Date: Thu, 18 Sep 2025 16:02:00 +0530
Message-Id: <20250918103200.2952576-1-raag.jadav@intel.com>
X-Mailer: git-send-email 2.34.1
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

In S3 and above sleep states, the device can loose power regardless of
d3cold.allowed flag. Bring up I2C controller explicitly in system PM
path to ensure its normal operation after loosing power.

v2: Cover S3 and above states (Rodrigo)

Fixes: 0ea07b69517a ("drm/xe/pm: Wire up suspend/resume for I2C controller")
Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpu/drm/xe/xe_pm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index a303ed5780b4..00ced1f63776 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -198,7 +198,7 @@ int xe_pm_resume(struct xe_device *xe)
 	if (err)
 		goto err;
 
-	xe_i2c_pm_resume(xe, xe->d3cold.allowed);
+	xe_i2c_pm_resume(xe, true);
 
 	xe_irq_resume(xe);
 
-- 
2.34.1

