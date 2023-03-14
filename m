Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94AEEC6FD1D
	for <intel-xe@archiver.kernel.org>; Tue, 14 Mar 2023 00:30:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A71D910E6B3;
	Tue, 14 Mar 2023 00:30:47 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE91210E6A7
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Mar 2023 00:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678753845; x=1710289845;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cRbt6nXtPDKYLXi8YRC53SAwKhroWiLuq6kHB+0oGQ4=;
 b=novs6o+Sa5YE0bu8/hLDfjT1bX35kqpOC+a00SSpT4TYRubjaE9sq6jT
 j/cO4FI7h2E/WE1OAVBAB2O2sGUm+6aMZdV6Pazw0hF0DzfgBmG2xzkwP
 74+s6gim8bUWZTOl8FTUY3zU/4pCqohAcgJx0q4Dwn4hNQ1ITA9JDU5ik
 xNsyXsBi244YnS6Y4CZ9HIZnB3U01PjkkoY7AvnaqYS0eD0QGXsbIIFKQ
 /nZ8EBnuiUVTGIljpSf/Y8b9DbCuOaQgghPvFEl7FrgUuD+dWxZU3aHOq
 DyG77QRjWK8ljbxbmBRvn0bYv6wnO3u8pTIln1QsA+diQZVHjCcfaOzZu A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="402168021"
X-IronPort-AV: E=Sophos;i="5.98,258,1673942400"; d="scan'208";a="402168021"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 17:30:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="789116678"
X-IronPort-AV: E=Sophos;i="5.98,258,1673942400"; d="scan'208";a="789116678"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 17:30:44 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 13 Mar 2023 17:30:00 -0700
Message-Id: <20230314003012.2600353-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230314003012.2600353-1-lucas.demarchi@intel.com>
References: <20230314003012.2600353-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 02/14] drm/xe/reg_sr: Tweak verbosity for
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
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

On a PVC system it should show something like below. Whitelist calls
are still there since they aren't actually empty - driver just doesn't
print each individual entry. This will be fixed in future.

	[drm:xe_reg_sr_apply_whitelist [xe]] Whitelisting bcs0 registers
	[drm:xe_reg_sr_apply_whitelist [xe]] Whitelisting bcs1 registers
	[drm:xe_reg_sr_apply_whitelist [xe]] Whitelisting bcs2 registers
	[drm:xe_reg_sr_apply_whitelist [xe]] Whitelisting bcs5 registers
	[drm:xe_reg_sr_apply_whitelist [xe]] Whitelisting bcs6 registers
	[drm:xe_reg_sr_apply_whitelist [xe]] Whitelisting bcs7 registers
	[drm:xe_reg_sr_apply_whitelist [xe]] Whitelisting bcs8 registers
	[drm:xe_reg_sr_apply_mmio [xe]] Applying ccs0 save-restore MMIOs
	[drm:xe_reg_sr_apply_mmio [xe]] REG[0x20e4] = 0x00008000
	[drm:xe_reg_sr_apply_mmio [xe]] REG[0xb01c] = 0x00000001
	[drm:xe_reg_sr_apply_mmio [xe]] REG[0xe48c] = 0x00000800
	[drm:xe_reg_sr_apply_mmio [xe]] REG[0xe7c8] = 0x40000000

v2: Only tweak log verbosity, leave the whitelist printout for later
    since decoding the whitelist is more complex.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_reg_sr.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
index 194a5060f1b3..c6f92fe9aad1 100644
--- a/drivers/gpu/drm/xe/xe_reg_sr.c
+++ b/drivers/gpu/drm/xe/xe_reg_sr.c
@@ -168,6 +168,9 @@ void xe_reg_sr_apply_mmio(struct xe_reg_sr *sr, struct xe_gt *gt)
 	unsigned long reg;
 	int err;
 
+	if (xa_empty(&sr->xa))
+		return;
+
 	drm_dbg(&xe->drm, "Applying %s save-restore MMIOs\n", sr->name);
 
 	err = xe_force_wake_get(&gt->mmio.fw, XE_FORCEWAKE_ALL);
@@ -195,6 +198,9 @@ void xe_reg_sr_apply_whitelist(struct xe_reg_sr *sr, u32 mmio_base,
 	unsigned int slot = 0;
 	int err;
 
+	if (xa_empty(&sr->xa))
+		return;
+
 	drm_dbg(&xe->drm, "Whitelisting %s registers\n", sr->name);
 
 	err = xe_force_wake_get(&gt->mmio.fw, XE_FORCEWAKE_ALL);
-- 
2.39.0

