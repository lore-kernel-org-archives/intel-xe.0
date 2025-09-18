Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 455BCCAC59A
	for <intel-xe@archiver.kernel.org>; Thu, 18 Sep 2025 11:48:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06E4510E751;
	Thu, 18 Sep 2025 11:48:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QMWdm80/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1455210E751
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Sep 2025 11:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758196130; x=1789732130;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1ch9Z7GpMnmCFP9OGvZmH6K60cxf9wvTEKdqxWGoZV4=;
 b=QMWdm80/rRe2C2gNa2VR749zsCyGMnCmdbeojHYUZWVSG+xVrvXLl/YX
 6FtmkN/ktUDSFMllEImE+iTwGgdw43Jt1V3zq/NkJsUuU1HNJyaA9NAm5
 MDmFSz5pIEjBg/fkLegD0ZpkPo92r8GU1xw5Mbhqcg6jVcf5TnRh5PQQj
 BV4CzbR6HE61g114ujB8nJ1D3RLBcpUddHh7Gu1Q8+DuZEmXq8bSy7cgv
 3Kzbvg2RrKdU4smIWx9vSQARd1g2QM/wytOgRd6KU2KXX5fV0ziQWj7mf
 NFc1qEd9cqeS+3vBBJC2pdDw6lJQo591NYxxu62no6td5E4z63/LkIZVp Q==;
X-CSE-ConnectionGUID: +nOW7ChETv25WV1y6FUq+w==
X-CSE-MsgGUID: KohYF5iBR8CK6dridKOyGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="59563314"
X-IronPort-AV: E=Sophos;i="6.18,274,1751266800"; d="scan'208";a="59563314"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 04:48:50 -0700
X-CSE-ConnectionGUID: AZAcjd0EQ/iSUTj34syE7w==
X-CSE-MsgGUID: MVhIU2WSRHCRUSdx07AoTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,274,1751266800"; d="scan'208";a="175092858"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa009.jf.intel.com with ESMTP; 18 Sep 2025 04:48:48 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: lucas.demarchi@intel.com,
	rodrigo.vivi@intel.com
Cc: intel-xe@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com, michal.wajdeczko@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v1 2/2] drm/xe/sysfs: Drop redundant runtime PM usage
Date: Thu, 18 Sep 2025 17:18:04 +0530
Message-Id: <20250918114804.2957177-3-raag.jadav@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250918114804.2957177-1-raag.jadav@intel.com>
References: <20250918114804.2957177-1-raag.jadav@intel.com>
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

The device is expected to be in D0 state during driver probe. No need to
resume it in ->is_visible() callbacks or non I/O operations.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpu/drm/xe/xe_device_sysfs.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
index c5151c86a98a..ec9c06b06fb5 100644
--- a/drivers/gpu/drm/xe/xe_device_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
@@ -38,13 +38,8 @@ vram_d3cold_threshold_show(struct device *dev,
 {
 	struct pci_dev *pdev = to_pci_dev(dev);
 	struct xe_device *xe = pdev_to_xe_device(pdev);
-	int ret;
 
-	xe_pm_runtime_get(xe);
-	ret = sysfs_emit(buf, "%d\n", xe->d3cold.vram_threshold);
-	xe_pm_runtime_put(xe);
-
-	return ret;
+	return sysfs_emit(buf, "%d\n", xe->d3cold.vram_threshold);
 }
 
 static ssize_t
@@ -173,11 +168,8 @@ static umode_t late_bind_attr_is_visible(struct kobject *kobj,
 	u32 cap = 0;
 	int ret;
 
-	xe_pm_runtime_get(xe);
-
 	ret = xe_pcode_read(root, PCODE_MBOX(PCODE_LATE_BINDING, GET_CAPABILITY_STATUS, 0),
 			    &cap, NULL);
-	xe_pm_runtime_put(xe);
 	if (ret)
 		return 0;
 
-- 
2.34.1

