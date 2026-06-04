Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6505CD6E6D
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jun 2026 14:51:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BA9B112832;
	Thu,  4 Jun 2026 14:51:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QGlu7wgi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33DE4112832
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Jun 2026 14:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780584720; x=1812120720;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8RKCLJk2SzOtQi+lClpTE1OnD8OLND7jE2+JZ+6WKiU=;
 b=QGlu7wgiw2VUdiLGl/EW4Ois0voBqhwTIs7UaAMjygnk7MpX7MygINQt
 l4RW9lRUnDUaXJFRH/8xkSoOZRlGqcKaeV32qHnfnrRmKR7XfFek/i9QP
 CfG+LnJ3HV0mgFGryNM81CS0HquErxTUr60Z6js8qLxC6cnvZ7Z88NinT
 4iWr7GrDW4QsJG+BJ6GDzFjrUVlOpqx/Vb9f863g7P/yMW/O4sS9Arx45
 q2N3D9kZ7TXHZvMuGsS6S9+u7Jubns+VJFUJlu9zX+4POE+uU/ggFsteD
 VmBo6JhDwf8wG6Py/HuMkuxl8c+CfVSXLZsb4KS9QYySpcN8kcO3+88Jf Q==;
X-CSE-ConnectionGUID: Cij2hHQwQsC+p4qHvc5hmg==
X-CSE-MsgGUID: BOWarv+TQDCm8ebaz5D20Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="85301271"
X-IronPort-AV: E=Sophos;i="6.24,187,1774335600"; d="scan'208";a="85301271"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2026 07:51:59 -0700
X-CSE-ConnectionGUID: v3uc/7L2QPqyHNqLwp22vA==
X-CSE-MsgGUID: ir9qjukGTaq3WxolI787xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,187,1774335600"; d="scan'208";a="244419524"
Received: from osgc-sh-dragon.sh.intel.com ([10.239.81.44])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2026 07:51:57 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 raag.jadav@intel.com
Subject: [PATCH v2] drm/xe/i2c: Report i2c irq handler issue
Date: Thu,  4 Jun 2026 22:51:54 +0800
Message-ID: <20260604145154.3769802-1-jonathan.cavitt@intel.com>
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

xe_i2c_irq_handler() calls generic_handle_irq_safe(), which can return
an error value.  In all other cases, this is passed to a
.*_err_ratelimited() error logging helper.  Add the missing error logger.

This issue was caught by static analysis.

v2:
- Misc. commit message changes (Jadav)

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

