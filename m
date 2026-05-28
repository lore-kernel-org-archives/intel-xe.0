Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9F65CD6E4E
	for <intel-xe@archiver.kernel.org>; Thu, 28 May 2026 05:02:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85E0510EC11;
	Thu, 28 May 2026 05:02:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YjlSBVFw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A42E10EC06;
 Thu, 28 May 2026 05:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779944542; x=1811480542;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=YxUib487iN2L7i3Tt9qrM+TtqHSveW2snRpSRXqNrNM=;
 b=YjlSBVFwUHkAoEHZfwBHkgqctub9bhA6P4Xr3MiveXHtbHQecN9WsG4G
 hVnuk02/OdvYzgyRvlG3EU/3RPfMdFzy6J+tADGCzBhWSgDIeaIzv0gwK
 u5r7USwJ+U35g9kavKbvSBkKv69c+leJ0da66y+PDAx5DqOxY6aRZCgMU
 T0vbXMNUqDPbT2lNNArOvMokUy+J0IWpgzPrPOe9md5iFr0H5kBEePj2j
 7n92hRi+LiizGocclq+Abfhx5rALWn62ACaaT2SDHhyQ+r/OQ8o1pd6rg
 +L4S3pve0D8axHVbvlZykiLGktEZ1jKC/keQTLqU1cmuLAq1YBJ2dtrQW Q==;
X-CSE-ConnectionGUID: zRI5VksdS6OYZNl7NHU1Kw==
X-CSE-MsgGUID: SCQBASZyQEC1we3HMdJ0BQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="80895724"
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; d="scan'208";a="80895724"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 22:02:22 -0700
X-CSE-ConnectionGUID: l2iH8mf1T/ipyqMrXHU9Cg==
X-CSE-MsgGUID: o5O48ewrQRmZU7ueCCWYbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; d="scan'208";a="238025994"
Received: from dibin-nuc7i7bnh.iind.intel.com ([10.190.239.19])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 22:02:20 -0700
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [CI v2 16/17] drm/i915/display: Add RO bit masking
 gen9_write_dc_state()
Date: Thu, 28 May 2026 10:31:30 +0530
Message-ID: <20260528050131.466351-17-dibin.moolakadan.subrahmanian@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260528050131.466351-1-dibin.moolakadan.subrahmanian@intel.com>
References: <20260528050131.466351-1-dibin.moolakadan.subrahmanian@intel.com>
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

BIT 10 and BIT 11 is defined as RO bits
set by HW , so mask these bits to avoid while writing and reading
DC_STATE_EN to avaoid unnessory re writes.

BSpec: 69115
Signed-off-by: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
---
 .../gpu/drm/i915/display/intel_display_power_well.c | 13 ++++++++++++-
 drivers/gpu/drm/i915/display/intel_display_regs.h   |  3 +++
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_power_well.c b/drivers/gpu/drm/i915/display/intel_display_power_well.c
index 0e7e6a2b1547..bba80e5e8b6f 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power_well.c
+++ b/drivers/gpu/drm/i915/display/intel_display_power_well.c
@@ -732,6 +732,17 @@ static void gen9_write_dc_state(struct intel_display *display,
 	int rewrites = 0;
 	int rereads = 0;
 	u32 v;
+	u32 ro_mask = 0;
+
+	/*
+	 * mask the RO bits from state and read back to avoid
+	 * unnecessary rewrites.
+	 * FIXME: Implement RO mask for remaining display versions.
+	 */
+	if (DISPLAY_VER(display) >= 35)
+		ro_mask = DC_STATE_EN_RO_MASK;
+
+	state = (state & ~ro_mask);
 
 	intel_de_write(display, DC_STATE_EN, state);
 
@@ -741,7 +752,7 @@ static void gen9_write_dc_state(struct intel_display *display,
 	 * we are confident that state is exactly what we want.
 	 */
 	do  {
-		v = intel_de_read(display, DC_STATE_EN);
+		v = intel_de_read(display, DC_STATE_EN) & ~ro_mask;
 
 		if (v != state) {
 			intel_de_write(display, DC_STATE_EN, state);
diff --git a/drivers/gpu/drm/i915/display/intel_display_regs.h b/drivers/gpu/drm/i915/display/intel_display_regs.h
index d9efe5b0ba46..e58e53f1e2f7 100644
--- a/drivers/gpu/drm/i915/display/intel_display_regs.h
+++ b/drivers/gpu/drm/i915/display/intel_display_regs.h
@@ -3086,6 +3086,9 @@ enum skl_power_gate {
 #define  DC_STATE_EN_UPTO_DC6		REG_FIELD_PREP(DC_STATE_EN_UPTO_DC5_DC6_MASK, 2)
 #define  DC_STATE_EN_UPTO_DC3CO	REG_FIELD_PREP(DC_STATE_EN_UPTO_DC5_DC6_MASK, 3)
 
+/* Display ver 35+ */
+#define  DC_STATE_EN_RO_MASK           REG_GENMASK(11, 10)
+
 #define  DC_STATE_DEBUG                  _MMIO(0x45520)
 #define  DC_STATE_DEBUG_MASK_CORES	(1 << 0)
 #define  DC_STATE_DEBUG_MASK_MEMORY_UP	(1 << 1)
-- 
2.43.0

