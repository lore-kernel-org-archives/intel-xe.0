Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4645F9D0CE
	for <intel-xe@archiver.kernel.org>; Tue, 14 Apr 2026 12:46:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9314710E5A2;
	Tue, 14 Apr 2026 12:46:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mqc9YkCE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D10F210E5A2
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Apr 2026 12:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776170816; x=1807706816;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bMR+cZakpCi5Xq+/mNh6DQopKEl+YAdJ9YUkiPg+X14=;
 b=Mqc9YkCEzA4I2xZYdz/8CsDEscjhuo3HvmzojWpSodBH+ajHaupHZFUL
 h1A/FsUeSPWIOqP+JOy9E1IvFhv78Qc3hxlrDHbY/DGNfXWiOgzXPkJip
 2QZc9/yEsA2oZsvAu1bT8m3OKMDALpHzHgEkh5w1TLgfjbm6pt8F+miZF
 T/hKliULv/4gmGpHWMcip8R5mciMJ/hZoq8hjonO2OURyiOEvPF8fjJ5y
 x3r96cKGMMhlwd394Wh3eOBsmQiIz/kFQXx97iuXrYdQOLbhVu/ZTR004
 Jq9yEgqKmZVHQYx7JTii2nwuPN+07rXoaBT5+rtttSEWvN2ZZWCONAubP Q==;
X-CSE-ConnectionGUID: RgksDwxOSJO+68jNT+MABQ==
X-CSE-MsgGUID: C/5TlXILSlmoyFOoXVV/AA==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="77308246"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="77308246"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 05:46:55 -0700
X-CSE-ConnectionGUID: EFwuz/ewTiG+Bo/vdK+Guw==
X-CSE-MsgGUID: vVU7jzGwSRuzqBVA66dTGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="235019578"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa005.fm.intel.com with ESMTP; 14 Apr 2026 05:46:53 -0700
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, sk.anirban@intel.com, raag.jadav@intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH] drm/xe/xe_survivability: Fix runtime survivability error
 handling
Date: Tue, 14 Apr 2026 18:14:27 +0530
Message-ID: <20260414124426.566929-2-mallesh.koujalagi@intel.com>
X-Mailer: git-send-email 2.43.0
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

When enabling survivability mode at runtime, the code tries to create
a sysfs entry. If that step fails, the error is only logged, but the
function still reports success. This makes it look like survivability
mode was enabled even though part of it failed.

Fixes: a2ca0633a0fe ("drm/xe/xe_survivability: Add support for Runtime survivability mode")
Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
 drivers/gpu/drm/xe/xe_survivability_mode.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
index db64cac39c94..c2dfc7ea7b83 100644
--- a/drivers/gpu/drm/xe/xe_survivability_mode.c
+++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
@@ -413,8 +413,10 @@ int xe_survivability_mode_runtime_enable(struct xe_device *xe)
 	populate_survivability_info(xe);
 
 	ret = create_survivability_sysfs(pdev);
-	if (ret)
+	if (ret) {
 		dev_err(&pdev->dev, "Failed to create survivability mode sysfs\n");
+		return ret;
+	}
 
 	survivability->type = XE_SURVIVABILITY_TYPE_RUNTIME;
 	dev_err(&pdev->dev, "Runtime Survivability mode enabled\n");
-- 
2.34.1

