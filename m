Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEBAECD6E7C
	for <intel-xe@archiver.kernel.org>; Fri,  5 Jun 2026 20:41:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACF1210E6DE;
	Fri,  5 Jun 2026 20:41:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VH9u8KDs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A764010E54A;
 Fri,  5 Jun 2026 20:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780692064; x=1812228064;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XpIvs/s0R4uGCxmmrAdRjqLwdAHk4Hsns1QvYez5Wu8=;
 b=VH9u8KDsLcGdXsN+71PWeg27g54AiwQP5T6Rwc9R+bteJ+CnD2jGNpyC
 7Us2VuHpdiLola8RSoKYAqEQURRMJVgM3hCgCdJNB1fAiPmKR5PtWQ+q4
 XjvZw1fHTztLaqWwA2QK31voeu3dA3NYsyVn9oOIFzKm3AZi5T8c4cEj+
 XuPJYHT2dM3nn/ZkbA/BPljyXN0mEmaR8nB+uj+LQd0WIU7FgfD1QCGxk
 TWOFDam78Pdd8Ur5RQVL/1XEB0F+qUiFYsJThu8SpBK9C051JjbsQ4jzm
 QNedQsukWZ3oa+J/kovLPsvvuJr8YF29w/WZCABV7OZdHkwCZAV/18rE9 g==;
X-CSE-ConnectionGUID: Peh7QCD7Tlm6whv6y451vA==
X-CSE-MsgGUID: FOvEfVuERriLhGIDLU5ddg==
X-IronPort-AV: E=McAfee;i="6800,10657,11808"; a="84108068"
X-IronPort-AV: E=Sophos;i="6.24,189,1774335600"; d="scan'208";a="84108068"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 13:41:04 -0700
X-CSE-ConnectionGUID: jdp3qs2JQ0OQ/EnkNRvWjQ==
X-CSE-MsgGUID: pRcJgGMhRUefxGbxg6MT5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,189,1774335600"; d="scan'208";a="243839429"
Received: from osgc-sh-dragon.sh.intel.com ([10.239.81.44])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 13:41:02 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 raag.jadav@intel.com, Michal.Wajdeczko@intel.com
Subject: [PATCH v2 5/5] drm/xe/i2c: Report i2c irq handler issue
Date: Sat,  6 Jun 2026 04:40:47 +0800
Message-ID: <20260605204047.3840459-6-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260605204047.3840459-1-jonathan.cavitt@intel.com>
References: <20260605204047.3840459-1-jonathan.cavitt@intel.com>
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

v2:
- Reword error message (Wajdeczko)

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Raag Jadav <raag.jadav@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_i2c.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_i2c.c b/drivers/gpu/drm/xe/xe_i2c.c
index 148e82e01ae8..84171021e6ea 100644
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
+		xe_err_ratelimited(xe, "I2C: irq handling failure (%pe)\n", ERR_PTR(ret));
 
 	/* Deassert after I2C adapter clears the interrupt */
 	xe_mmio_rmw32(mmio, I2C_CONFIG_CMD, 0, PCI_COMMAND_INTX_DISABLE);
-- 
2.53.0

