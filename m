Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25B8CC83F1A
	for <intel-xe@archiver.kernel.org>; Mon, 14 Jul 2025 21:55:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2F5510E02C;
	Mon, 14 Jul 2025 21:55:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e+qlGAHl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9A6F10E02C
 for <intel-xe@lists.freedesktop.org>; Mon, 14 Jul 2025 21:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752530118; x=1784066118;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=huw2oBHwre1cRKLdFdDDDgabTB8C53a464aMHbLlxOI=;
 b=e+qlGAHl4LyT863srOUGI36Z9vXl04Ae5I3ciOj9a9Ae9skHnzEASY/b
 xvsNr1Awc7zE15RUilxrg1Kdt9G0Ig0HV0IyBiFj7HKwc7vbTEsv6A0jl
 Jm3i/SYLDUzp3zWFUKmWFcCJ69Vo0tMOzIL9/rsKReE73AwKVGgXsdn5i
 sbq6IbgRQ1KdPGVjvOOhynABPiUh7fDs2BiINJWdNny2kRXB+PNgBlhaf
 YRAIWtNEVfYijEHpQNpUyeYaBayr8xJ2Jgypz0mWeSYmCp5pC1lNIxEmL
 mUQw6e14YgkTlRVMzQkSibwoi7XCH3rdokXcvztr84gGtXUchSeLyiM1s g==;
X-CSE-ConnectionGUID: kKg2JrDBQ4WBIwbs6M9Ntw==
X-CSE-MsgGUID: DEVR3zW3Q/uvkh13vhsVvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="80177331"
X-IronPort-AV: E=Sophos;i="6.16,312,1744095600"; d="scan'208";a="80177331"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 14:55:17 -0700
X-CSE-ConnectionGUID: MZo63iBEQPqcdmm2p+E09g==
X-CSE-MsgGUID: M1btLYwpS/e8rtNytX9aIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,312,1744095600"; d="scan'208";a="157596233"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa008.fm.intel.com with ESMTP; 14 Jul 2025 14:55:15 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: lucas.demarchi@intel.com,
	rodrigo.vivi@intel.com
Cc: intel-xe@lists.freedesktop.org, matthew.brost@intel.com,
 stuart.summers@intel.com, daniele.ceraolospurio@intel.com,
 vinay.belgaumkar@intel.com, Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v2] drm/xe: Don't fail probe on unsupported mailbox command
Date: Tue, 15 Jul 2025 03:25:03 +0530
Message-Id: <20250714215503.2897748-1-raag.jadav@intel.com>
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

If the device is running older pcode firmware, it is possible that newer
mailbox commands are not supported by it. The sysfs attributes aren't
useful in that case, but we shouldn't fail driver probe because of it.
As of now, it is unknown if we can distinguish unsupported commands before
attempting them. But until we figure out a way to do that, fix the
regressions.

v2: Add debug message (Lucas)

Fixes: cdc36b66cd41 ("drm/xe: Expose fan control and voltage regulator version")
Signed-off-by: Raag Jadav <raag.jadav@intel.com>
Tested-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_device_sysfs.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
index 8250aa4620ee..fd2ba0da02a2 100644
--- a/drivers/gpu/drm/xe/xe_device_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
@@ -160,8 +160,13 @@ static int late_bind_create_files(struct device *dev)
 
 	ret = xe_pcode_read(root, PCODE_MBOX(PCODE_LATE_BINDING, GET_CAPABILITY_STATUS, 0),
 			    &cap, NULL);
-	if (ret)
+	if (ret) {
+		if (ret == -ENXIO) {
+			drm_dbg(&xe->drm, "Late binding not supported by firmware\n");
+			ret = 0;
+		}
 		goto out;
+	}
 
 	if (REG_FIELD_GET(V1_FAN_SUPPORTED, cap)) {
 		ret = sysfs_create_file(&dev->kobj, &dev_attr_lb_fan_control_version.attr);
-- 
2.34.1

