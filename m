Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A766C54FB3
	for <intel-xe@archiver.kernel.org>; Thu, 29 May 2025 16:11:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEECA10E087;
	Thu, 29 May 2025 16:11:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nupKA4Bk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E36AC10E087
 for <intel-xe@lists.freedesktop.org>; Thu, 29 May 2025 16:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748535063; x=1780071063;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HSM2pIDZZAz5ybw2Xc2zNdyNeFJNxA16VEo2WSuSiGE=;
 b=nupKA4Bk+jYtndEPSKWDF3hjgqRSoITNUBN/wweXeqmDhD/Tch3XFZxn
 zUs8TLG/+uUunfcuzXsNCpXtYh6F2NZgRawaRGqigQ/WUt7LVi1HYOUOz
 4gXgTPQkirhZogZnP06wXBLAEsznYrcA4Z+l792FPJz9PharLvNajGqbA
 M0eaLuA83bLBh/HaSivxOECamhQJaitOWPuvS4XeZQcnsGmSPJbJ1dXhS
 h8ZGOyWBRV/PLlQ9brXU/scgZCiOF2zpt7A60RBfv7fjUbpqEpzWBPah0
 l0Wvb5QxcHfc23C5AJlwUm67XPXdrxI2KlihdAvDzdqgaH6sq8cjm/DNS g==;
X-CSE-ConnectionGUID: 0SP46LK8S6WsliWuBpKp3g==
X-CSE-MsgGUID: 9AE8FUhHQ/iNsl3iSDGuWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="53230330"
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; d="scan'208";a="53230330"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 09:10:57 -0700
X-CSE-ConnectionGUID: LNJ6a78/TFa9wRTVET/vQg==
X-CSE-MsgGUID: rAVKDKhJSTWpMqB7yFZEjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; d="scan'208";a="174611492"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa002.jf.intel.com with ESMTP; 29 May 2025 09:10:56 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: lucas.demarchi@intel.com,
	rodrigo.vivi@intel.com,
	riana.tauro@intel.com
Cc: intel-xe@lists.freedesktop.org, Raag Jadav <raag.jadav@intel.com>,
 kernel test robot <lkp@intel.com>
Subject: [PATCH v1] drm/xe: drop redundant conversion to bool
Date: Thu, 29 May 2025 21:39:37 +0530
Message-Id: <20250529160937.490147-1-raag.jadav@intel.com>
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

The result of integer comparison already evaluates to bool. No need for
explicit conversion.

No functional impact.

Fixes: 0e414bf7ad01 ("drm/xe: Expose PCIe link downgrade attributes")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202505292205.MoljmkjQ-lkp@intel.com/
Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpu/drm/xe/xe_device_sysfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
index 2e657692e5b5..b9440f8c781e 100644
--- a/drivers/gpu/drm/xe/xe_device_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
@@ -115,7 +115,7 @@ auto_link_downgrade_capable_show(struct device *dev, struct device_attribute *at
 	xe_pm_runtime_put(xe);
 
 	cap = REG_FIELD_GET(LINK_DOWNGRADE, val);
-	return sysfs_emit(buf, "%u\n", cap == DOWNGRADE_CAPABLE ? true : false);
+	return sysfs_emit(buf, "%u\n", cap == DOWNGRADE_CAPABLE);
 }
 static DEVICE_ATTR_ADMIN_RO(auto_link_downgrade_capable);
 
-- 
2.34.1

