Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B22D7CD6E7D
	for <intel-xe@archiver.kernel.org>; Fri,  5 Jun 2026 16:05:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7016C10E661;
	Fri,  5 Jun 2026 16:05:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W0Xw6U1o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47AC810E63D;
 Fri,  5 Jun 2026 16:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780675499; x=1812211499;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3ETy1AvkxsEDDo4edovY6YhBuSc2U+w/Pnf/uFbeisQ=;
 b=W0Xw6U1oqPqcut4eZxhmrczrkOThy5OGAxdtvcXKG31z2QuO40sfbB5d
 zYOvG5SRUm9jOslZmw+EwoEm/wX6QcOcmcuf7PTVqcf8z8hTw6wNwTo1I
 zcrX2zRdFCJvEDcI2g/ZNUeM5iUC5/hCEAUVYGHSKuH67hxBsVfk8mebN
 E5CR+yFOX6slWnpA6GyEerbtvc/bxr1HwLMLQhfMTu8yNnFsmj/XnxIB/
 Rw+D5jDYcadMFMO/5wsLrrFOAbjHWuBFQYrEYw0TFoSja/SssR4Wr3wfg
 ZlygOg21WYJu2Fl/NBuQRhT2Aoo40Et+eAMlHqBQ8bDnwcqNm0ORSYZ2a w==;
X-CSE-ConnectionGUID: AXG9/5s6Tg65oL717sv3IA==
X-CSE-MsgGUID: DteAkVtJR8u6Jz27pZOV0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11808"; a="98928789"
X-IronPort-AV: E=Sophos;i="6.24,189,1774335600"; d="scan'208";a="98928789"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 09:04:59 -0700
X-CSE-ConnectionGUID: KVx+NQCDTm6iuk3PU61keg==
X-CSE-MsgGUID: d0Zd4XK3StCZ0rDTxmpOvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,189,1774335600"; d="scan'208";a="268566325"
Received: from osgc-sh-dragon.sh.intel.com ([10.239.81.44])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 09:04:56 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 raag.jadav@intel.com
Subject: [PATCH 5/5] drm/xe/i2c: Report i2c irq handler issue
Date: Sat,  6 Jun 2026 00:04:44 +0800
Message-ID: <20260605160444.3833295-6-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260605160444.3833295-1-jonathan.cavitt@intel.com>
References: <20260605160444.3833295-1-jonathan.cavitt@intel.com>
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

Error logging is expected but not included in xe_i2c_irq_handler() for
generic_handle_irq_safe(), so add error logging there.

This issue was caught by static analysis.

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpu/drm/xe/xe_i2c.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_i2c.c b/drivers/gpu/drm/xe/xe_i2c.c
index 148e82e01ae8..42851e95f75f 100644
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
+		xe_err_ratelimited(xe, "failed to handle i2c irq: %d\n", ret);
 
 	/* Deassert after I2C adapter clears the interrupt */
 	xe_mmio_rmw32(mmio, I2C_CONFIG_CMD, 0, PCI_COMMAND_INTX_DISABLE);
-- 
2.53.0

