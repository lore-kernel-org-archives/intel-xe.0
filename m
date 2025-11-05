Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D65BCCFA19
	for <intel-xe@archiver.kernel.org>; Wed,  5 Nov 2025 14:08:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C87F10E75C;
	Wed,  5 Nov 2025 14:08:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hBj2kMwO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DB5710E75E;
 Wed,  5 Nov 2025 14:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762351711; x=1793887711;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UJtvpTN5WMac+stuXi0Mhm7Bje4cC0pGnPli7M0KSVw=;
 b=hBj2kMwOrwPQDAAm+mmpFuMRbXp3BbBwGrm3OS963jrS8y7qWkiIGP+M
 XMuYjLtBhQzqoUzaaROScfxIjTGK3F8mP9/g2Ega1R40RXh0ZeRtUvQh6
 awsyZTHotybX/nqv9l1rtrI0ZiF+wO/ZmGXx7ZiD2bzH5k3CwgO+XUX1w
 tZXC6OP8u+Xk28QxzJYVKazvgmEcxeKnO01+MZQb2/dich5qIQ/IwDr6Q
 LmqxNzWZnK+oOENr1+po6XNQD+Ul3omegq1kSL9EddMCHs56eHIHCc3X+
 hLyq0lgogCN/Oqlt9vXDhBIUlfSlWz4uNQhe2b95e1WovMTHLmyo8K2Am g==;
X-CSE-ConnectionGUID: JRIE98ZhSWSyuzF15inyVw==
X-CSE-MsgGUID: tnh7nQrDTNO47gLNb9h1Eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="64348260"
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; d="scan'208";a="64348260"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 06:08:16 -0800
X-CSE-ConnectionGUID: SnJIzDs6QyWxjoegTll6GA==
X-CSE-MsgGUID: ayYOqHTRQhmwe1BWU0DSMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; d="scan'208";a="191562942"
Received: from rfrazer-mobl3.amr.corp.intel.com (HELO gjsousa-mobl2.intel.com)
 ([10.124.221.150])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 06:08:14 -0800
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: gustavo.sousa@intel.com
Subject: [CI 04/17] drm/i915/xe3p_lpd: Update bandwidth parameters
Date: Wed,  5 Nov 2025 11:06:53 -0300
Message-ID: <20251105140651.71713-23-gustavo.sousa@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251105140651.71713-19-gustavo.sousa@intel.com>
References: <20251105140651.71713-19-gustavo.sousa@intel.com>
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

From: Matt Atwood <matthew.s.atwood@intel.com>

Bandwidth parameters for Xe3p_LPD are the same as for Xe3_LPD. Re-use
them.

Since handling for Xe3_LPD version 30.02 is more like a special case,
let's use a "== 3002" check for it inside the ">= 30" branch instead of
adding a new branch for version 35.  That allows us to re-use the ">=
30" branch for Xe3p_LPD.

v2:
  - Do not have a special case for ecc_impacting_de_bw, since there are
    no specific instructions in Bspec for this scenario. (Matt Roper)
v3:
  - Re-use the ">= 30" branch in the if-ladder. (Matt Roper)

Bspec: 68859
Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Link: https://patch.msgid.link/20251103-xe3p_lpd-basic-enabling-v3-4-00e87b510ae7@intel.com
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/i915/display/intel_bw.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_bw.c b/drivers/gpu/drm/i915/display/intel_bw.c
index bf37d7a9732e..919b25a5fbac 100644
--- a/drivers/gpu/drm/i915/display/intel_bw.c
+++ b/drivers/gpu/drm/i915/display/intel_bw.c
@@ -805,10 +805,11 @@ void intel_bw_init_hw(struct intel_display *display)
 	if (!HAS_DISPLAY(display))
 		return;
 
-	if (DISPLAY_VERx100(display) >= 3002) {
-		tgl_get_bw_info(display, dram_info, &xe3lpd_3002_sa_info);
-	} else if (DISPLAY_VER(display) >= 30) {
-		tgl_get_bw_info(display, dram_info, &xe3lpd_sa_info);
+	if (DISPLAY_VER(display) >= 30) {
+		if (DISPLAY_VERx100(display) == 3002)
+			tgl_get_bw_info(display, dram_info, &xe3lpd_3002_sa_info);
+		else
+			tgl_get_bw_info(display, dram_info, &xe3lpd_sa_info);
 	} else if (DISPLAY_VERx100(display) >= 1401 && display->platform.dgfx) {
 		if (dram_info->type == INTEL_DRAM_GDDR_ECC)
 			xe2_hpd_get_bw_info(display, dram_info, &xe2_hpd_ecc_sa_info);
-- 
2.51.0

