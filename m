Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DCF6FF8873
	for <intel-xe@archiver.kernel.org>; Thu, 30 Apr 2026 16:15:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DB7210F3C4;
	Thu, 30 Apr 2026 16:15:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AaY07LsG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70F5F10F3C3
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Apr 2026 16:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777565704; x=1809101704;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=NTPsTQ92A+FMi5/wO+eJ0cGwL5zZmoHWl2Ocakky9sU=;
 b=AaY07LsGembuo5CNl+8csddMKjNcEIkUGw+X5K1EG+r1LIacfLSXdaTp
 EfGC2oYukf8UzVzbpZeXH7+6ppz7G8C1Xuhb1PrS6HpuvVoCe7dGxHNqw
 +QKR3+fyLoAuSGRhAO8Xhrnw7LvFD+9gLCiW4ldnfysXEeRFIhpyUFva1
 k94Q/lbxuPlAbEfUx4AX98pwidlGG+SofTi/9BESsJLgVyOko/wTYFIpG
 g/0db8kJAuHkGtne3PVcPfR93OvdZ5hFQ7sOzAKghQ3U/eUfdJrynXyoM
 C9pG48lIkda4ey0p+ldFlvJIVGnz/fgYtrQbCWw2gh7ZDNI5ZH/HQtVfL g==;
X-CSE-ConnectionGUID: M4QG6ZWQSra9NTKtdnSVYg==
X-CSE-MsgGUID: zpXXJJZyTEqLAWe5cZVVLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11772"; a="89620095"
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; d="scan'208";a="89620095"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 09:15:03 -0700
X-CSE-ConnectionGUID: M5WbOXrbT5yR4Yf4U0nx4g==
X-CSE-MsgGUID: qyHLSIfAQjyonVjMr75HWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; d="scan'208";a="238609919"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 09:15:03 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 3/4] drm/xe/oa: Add val arg to xe_oa_is_valid_config_reg
Date: Thu, 30 Apr 2026 09:14:58 -0700
Message-ID: <20260430161459.2892545-4-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260430161459.2892545-1-ashutosh.dixit@intel.com>
References: <20260430161459.2892545-1-ashutosh.dixit@intel.com>
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

Add val arg to xe_oa_is_valid_config_reg so that register values can also
be verified, in addition to register address. Value verification is needed
to implement MERTOA Wa_14026779378.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 13458050907ad..7e1e8a86d19c0 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -2249,7 +2249,7 @@ static bool xe_oa_is_valid_mux_addr(struct xe_oa *oa, u32 addr)
 		return xe_oa_reg_in_range_table(addr, gen12_oa_mux_regs);
 }
 
-static bool xe_oa_is_valid_config_reg_addr(struct xe_oa *oa, u32 addr)
+static bool xe_oa_is_valid_config_reg(struct xe_oa *oa, u32 addr, u32 val)
 {
 	return xe_oa_is_valid_flex_addr(oa, addr) ||
 		xe_oa_is_valid_b_counter_addr(oa, addr) ||
@@ -2257,7 +2257,7 @@ static bool xe_oa_is_valid_config_reg_addr(struct xe_oa *oa, u32 addr)
 }
 
 static struct xe_oa_reg *
-xe_oa_alloc_regs(struct xe_oa *oa, bool (*is_valid)(struct xe_oa *oa, u32 addr),
+xe_oa_alloc_regs(struct xe_oa *oa, bool (*is_valid)(struct xe_oa *oa, u32 addr, u32 val),
 		 u32 __user *regs, u32 n_regs)
 {
 	struct xe_oa_reg *oa_regs;
@@ -2275,16 +2275,16 @@ xe_oa_alloc_regs(struct xe_oa *oa, bool (*is_valid)(struct xe_oa *oa, u32 addr),
 		if (err)
 			goto addr_err;
 
-		if (!is_valid(oa, addr)) {
-			drm_dbg(&oa->xe->drm, "Invalid oa_reg address: %X\n", addr);
-			err = -EINVAL;
-			goto addr_err;
-		}
-
 		err = get_user(value, regs + 1);
 		if (err)
 			goto addr_err;
 
+		if (!is_valid(oa, addr, value)) {
+			drm_dbg(&oa->xe->drm, "Invalid oa_reg addr/value: %#x %#x\n", addr, value);
+			err = -EINVAL;
+			goto addr_err;
+		}
+
 		oa_regs[i].addr = XE_REG(addr);
 		oa_regs[i].value = value;
 
@@ -2383,7 +2383,7 @@ int xe_oa_add_config_ioctl(struct drm_device *dev, u64 data, struct drm_file *fi
 	memcpy(oa_config->uuid, arg->uuid, sizeof(arg->uuid));
 
 	oa_config->regs_len = arg->n_regs;
-	regs = xe_oa_alloc_regs(oa, xe_oa_is_valid_config_reg_addr,
+	regs = xe_oa_alloc_regs(oa, xe_oa_is_valid_config_reg,
 				u64_to_user_ptr(arg->regs_ptr),
 				arg->n_regs);
 	if (IS_ERR(regs)) {
-- 
2.54.0

