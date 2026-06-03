Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 183FCCD6E57
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jun 2026 20:10:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7F5211233B;
	Wed,  3 Jun 2026 20:10:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hBYAX73h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AA8811233B
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Jun 2026 20:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780517412; x=1812053412;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=G2dsCtu2CRb7pjJkAkJJpwOfKu+iHX6g/T5sMbuaElE=;
 b=hBYAX73hhzAFwG7dhd4h8apmq2B2hY0zUNcgzaI8ZtxKTcrPyDPs1DOR
 6GbYiX9oqlEXI9ALSOdxM9d/ePK2V4MfILS8xsYCq511zXU3O/qrQ2+m/
 K/I89mdf51F0JHINNuedKziYu2Ci99Aezd8HwkS0WrkJyhaLnYmJGsZTt
 UP14eSj28C3FeO9ARV5KKTDwLzOyvYJvJYZEOrHnJTrebQ3pHLe0slY6s
 8L26PADe1F9hTsr2MFHZtd8fzCMNLoBMT5rO/BP52tqMtiFG4bfB1A5uc
 7mmn/verpuHRPUXgCiXlmMSLyF0MkH4DibRpuHM0cK5ybNTsDLYnFbVUQ Q==;
X-CSE-ConnectionGUID: 9FBv1qsQQTKyRi5sYDN2Zg==
X-CSE-MsgGUID: d7DuXnOLQpqL7tdvzFHCBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11806"; a="81336101"
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; d="scan'208";a="81336101"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 13:10:11 -0700
X-CSE-ConnectionGUID: bGOkCIn1TK66KxasZfSOlg==
X-CSE-MsgGUID: jXvgcZkvSAW4PUyW7vYyuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; d="scan'208";a="244421991"
Received: from osgc-sh-dragon.sh.intel.com ([10.239.81.44])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 13:10:10 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 raag.jadav@intel.com
Subject: [PATCH] drm/xe/i2c: Report i2c irq handler issue
Date: Thu,  4 Jun 2026 04:10:07 +0800
Message-ID: <20260603201007.3768029-1-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.53.0
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

xe_i2c_irq_handler calls generic_handle_irq_safe, which can return an
error value.  In all other cases, this is passed to a
.*_err_ratelimited error message helper.  Add the missing error handler.

This issue was caught by static analysis.

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpu/drm/xe/xe_i2c.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_i2c.c b/drivers/gpu/drm/xe/xe_i2c.c
index 706783863d07..acfc171483b2 100644
--- a/drivers/gpu/drm/xe/xe_i2c.c
+++ b/drivers/gpu/drm/xe/xe_i2c.c
@@ -177,12 +177,15 @@ static bool xe_i2c_irq_present(struct xe_device *xe)
 void xe_i2c_irq_handler(struct xe_device *xe, u32 master_ctl)
 {
 	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
+	int ret;
 
 	if (!(master_ctl & I2C_IRQ) || !xe_i2c_irq_present(xe))
 		return;
 
 	/* Forward interrupt to I2C adapter */
-	generic_handle_irq_safe(xe->i2c->adapter_irq);
+	ret = generic_handle_irq_safe(xe->i2c->adapter_irq);
+	if (ret)
+		drm_err_ratelimited(&xe->drm, "error handling i2c irq: %d\n", ret);
 
 	/* Deassert after I2C adapter clears the interrupt */
 	xe_mmio_rmw32(mmio, I2C_CONFIG_CMD, 0, PCI_COMMAND_INTX_DISABLE);
-- 
2.53.0

