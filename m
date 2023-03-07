Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F429C678DB
	for <intel-xe@archiver.kernel.org>; Tue,  7 Mar 2023 09:25:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E3B410E3C6;
	Tue,  7 Mar 2023 09:25:38 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB86610E3BD
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Mar 2023 09:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678181130; x=1709717130;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pho9SBuYalkJjXKCBL/1SnB09JBlHCo+cAc8bUAWZ/U=;
 b=m162UpcC1MhBe2XBdD7RFkpYYR7w6Zwy5HsqX4kmZ5Lb2YFWG9giQ3a2
 Y9EV4kK/8AwSOq5MuKnwLchEPAPPQZOpOrvo3JxtBJKiIyUcqdNwn6RYL
 YFyzoY7xTfh68Mp2/+Mc8shYqnt+JMIRpzG1DmRZOzA726CBboCqBmiLi
 NeyTcxIjKcLBdW5QwfzqqPZCdEuPBh6AA6jkhYPgEpbHImQO1k/U3E0D7
 ecTnkZIDxr1jLTGR2Ny0mhbLTtInbhQNafVS0VhvUBU5GJwq1vqFeRMmH
 Txd8CcnhFLfIS4xFQrA6fBhPsyWz1L8oSY376hDAH+rO14VvWE3Tjh3ef A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="422079122"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400"; d="scan'208";a="422079122"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 01:25:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="1005798823"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400"; d="scan'208";a="1005798823"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 01:25:14 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  7 Mar 2023 01:24:38 -0800
Message-Id: <20230307092446.1263266-12-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230307092446.1263266-1-lucas.demarchi@intel.com>
References: <20230307092446.1263266-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 11/19] drm/xe/reg_sr: Tweak verbosity for
 register printing
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

If there is no register to save-restore or whitelist, just return. This
drops some noise from the log, particurlarly for platforms with several
engines like PVC:

	[drm:xe_reg_sr_apply_mmio [xe]] Applying bcs0 save-restore MMIOs
	[drm:xe_reg_sr_apply_whitelist [xe]] Whitelisting bcs0 registers
	[drm:xe_reg_sr_apply_mmio [xe]] Applying bcs1 save-restore MMIOs
	[drm:xe_reg_sr_apply_whitelist [xe]] Whitelisting bcs1 registers
	[drm:xe_reg_sr_apply_mmio [xe]] Applying bcs2 save-restore MMIOs
	[drm:xe_reg_sr_apply_whitelist [xe]] Whitelisting bcs2 registers
	[drm:xe_reg_sr_apply_mmio [xe]] Applying bcs5 save-restore MMIOs
	[drm:xe_reg_sr_apply_whitelist [xe]] Whitelisting bcs5 registers
	[drm:xe_reg_sr_apply_mmio [xe]] Applying bcs6 save-restore MMIOs
	[drm:xe_reg_sr_apply_whitelist [xe]] Whitelisting bcs6 registers
	[drm:xe_reg_sr_apply_mmio [xe]] Applying bcs7 save-restore MMIOs
	[drm:xe_reg_sr_apply_whitelist [xe]] Whitelisting bcs7 registers
	[drm:xe_reg_sr_apply_mmio [xe]] Applying bcs8 save-restore MMIOs
	[drm:xe_reg_sr_apply_whitelist [xe]] Whitelisting bcs8 registers
	[drm:xe_reg_sr_apply_mmio [xe]] Applying ccs0 save-restore MMIOs
	[drm:xe_reg_sr_apply_mmio [xe]] REG[0x20e4] = 0x00008000
	[drm:xe_reg_sr_apply_mmio [xe]] REG[0xb01c] = 0x00000001
	[drm:xe_reg_sr_apply_mmio [xe]] REG[0xe48c] = 0x00000800
	[drm:xe_reg_sr_apply_mmio [xe]] REG[0xe7c8] = 0x40000000
	...

On the other hand, contrary to the save-restore, it was not printing the
registers being whitelisted, so add them now. On a PVC system it should
show something like:

	[drm:xe_reg_sr_apply_whitelist [xe]] Whitelisting bcs7 registers
	[drm:xe_reg_sr_apply_whitelist [xe]] (slot=0) REG[0x4400] = 0x40000003
	[drm:xe_reg_sr_apply_whitelist [xe]] (slot=1) REG[0x4500] = 0x40000003
	[drm:xe_reg_sr_apply_whitelist [xe]] (slot=2) REG[0x3ec3a8] = 0x10000000
	[drm:xe_reg_sr_apply_whitelist [xe]] Whitelisting bcs8 registers
	[drm:xe_reg_sr_apply_whitelist [xe]] (slot=0) REG[0x4400] = 0x40000003
	[drm:xe_reg_sr_apply_whitelist [xe]] (slot=1) REG[0x4500] = 0x40000003
	[drm:xe_reg_sr_apply_whitelist [xe]] (slot=2) REG[0x3ee3a8] = 0x10000000
	[drm:xe_reg_sr_apply_mmio [xe]] Applying ccs0 save-restore MMIOs
	[drm:xe_reg_sr_apply_mmio [xe]] REG[0x20e4] = 0x00008000
	[drm:xe_reg_sr_apply_mmio [xe]] REG[0xb01c] = 0x00000001
	[drm:xe_reg_sr_apply_mmio [xe]] REG[0xe48c] = 0x00000800
	[drm:xe_reg_sr_apply_mmio [xe]] REG[0xe7c8] = 0x40000000

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_reg_sr.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
index 855d86a6c43a..8ae803393ff0 100644
--- a/drivers/gpu/drm/xe/xe_reg_sr.c
+++ b/drivers/gpu/drm/xe/xe_reg_sr.c
@@ -169,6 +169,9 @@ void xe_reg_sr_apply_mmio(struct xe_reg_sr *sr, struct xe_gt *gt)
 	unsigned long reg;
 	int err;
 
+	if (xa_empty(&sr->xa))
+		return;
+
 	drm_dbg(&xe->drm, "Applying %s save-restore MMIOs\n", sr->name);
 
 	err = xe_force_wake_get(&gt->mmio.fw, XE_FORCEWAKE_ALL);
@@ -196,6 +199,9 @@ void xe_reg_sr_apply_whitelist(struct xe_reg_sr *sr, u32 mmio_base,
 	unsigned int slot = 0;
 	int err;
 
+	if (xa_empty(&sr->xa))
+		return;
+
 	drm_dbg(&xe->drm, "Whitelisting %s registers\n", sr->name);
 
 	err = xe_force_wake_get(&gt->mmio.fw, XE_FORCEWAKE_ALL);
@@ -203,6 +209,8 @@ void xe_reg_sr_apply_whitelist(struct xe_reg_sr *sr, u32 mmio_base,
 		goto err_force_wake;
 
 	xa_for_each(&sr->xa, reg, entry) {
+		drm_dbg(&xe->drm, "(slot=%d) REG[0x%lx] = 0x%08x", slot, reg,
+			entry->set_bits);
 		xe_mmio_write32(gt, RING_FORCE_TO_NONPRIV(mmio_base, slot).reg,
 				reg | entry->set_bits);
 		slot++;
-- 
2.39.0

