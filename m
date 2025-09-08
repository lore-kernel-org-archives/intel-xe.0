Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AAB2CA1016
	for <intel-xe@archiver.kernel.org>; Mon,  8 Sep 2025 05:53:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D396110E461;
	Mon,  8 Sep 2025 05:53:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GuRTOSB0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C89E10E461
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Sep 2025 05:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757310821; x=1788846821;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MPN1QzPN7Q7lXrBARGXetmRY83/+FScQMAjOsB1HHvM=;
 b=GuRTOSB0DjDc2yiPGzeBexHOj10Ld0OA8zTYmRH5Wi2rwA9iIB21886v
 TVH3f4JYVMlUGmhPn+1yTWGS267JfBVGfZy6Yxj1w+vFclqA83rZVdGwd
 zf0DDJcpD0yYslaIxn9DvoFsP6LAfpyolkx8jKXSdPbgRUSwSyOXSdc34
 OnHuehXCXkAp/Qyo2jFj9mBBB90Or/xgn5qkqkY2uMrorbbhvOoCuMmNN
 0pDKPTdF1mh9Qlk5RjoqGSBuPuI9kaNvxMhqaYvZf1zM1eaY2S31FAYBW
 JmAvLT1qVir3dpzaBhcmXjWKrQl7Z+VOaRF6ip39dhUk0Zm7ylitJO+qD Q==;
X-CSE-ConnectionGUID: VzR5PvTwRKGLQOaFFCVWpQ==
X-CSE-MsgGUID: 3LgPaBokTNq+Z1+PLwtmeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11546"; a="70657886"
X-IronPort-AV: E=Sophos;i="6.18,247,1751266800"; d="scan'208";a="70657886"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2025 22:53:41 -0700
X-CSE-ConnectionGUID: 8SsHOYqBR4yNyRNVstkbTA==
X-CSE-MsgGUID: 6MYyq+WQTr2JUyJtAF9lPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,247,1751266800"; d="scan'208";a="172570929"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa007.jf.intel.com with ESMTP; 07 Sep 2025 22:53:39 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: lucas.demarchi@intel.com,
	rodrigo.vivi@intel.com
Cc: intel-xe@lists.freedesktop.org, riana.tauro@intel.com,
 heikki.krogerus@linux.intel.com, Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v1] drm/xe/i2c: Enable bus mastering
Date: Mon,  8 Sep 2025 11:23:20 +0530
Message-Id: <20250908055320.2549722-1-raag.jadav@intel.com>
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

Enable bus mastering for I2C controller to support device initiated
in-band transactions.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpu/drm/xe/xe_i2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_i2c.c b/drivers/gpu/drm/xe/xe_i2c.c
index 044dda517b7c..48dfcb41fa08 100644
--- a/drivers/gpu/drm/xe/xe_i2c.c
+++ b/drivers/gpu/drm/xe/xe_i2c.c
@@ -259,7 +259,7 @@ void xe_i2c_pm_resume(struct xe_device *xe, bool d3cold)
 		return;
 
 	if (d3cold)
-		xe_mmio_rmw32(mmio, I2C_CONFIG_CMD, 0, PCI_COMMAND_MEMORY);
+		xe_mmio_rmw32(mmio, I2C_CONFIG_CMD, 0, PCI_COMMAND_MEMORY | PCI_COMMAND_MASTER);
 
 	xe_mmio_rmw32(mmio, I2C_CONFIG_PMCSR, PCI_PM_CTRL_STATE_MASK, (__force u32)PCI_D0);
 	drm_dbg(&xe->drm, "pmcsr: 0x%08x\n", xe_mmio_read32(mmio, I2C_CONFIG_PMCSR));
-- 
2.34.1

