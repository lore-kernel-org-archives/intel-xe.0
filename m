Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17DD9C5AD4D
	for <intel-xe@archiver.kernel.org>; Fri, 20 Feb 2026 17:28:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A367710E82D;
	Fri, 20 Feb 2026 17:28:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QLbMbDmM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8331810E82C
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Feb 2026 17:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771608498; x=1803144498;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=aZPIX9iHEfGes4aGLFpfQ4Bx/Rt+YkfaZVYoFwzpgig=;
 b=QLbMbDmMDsnV+cqqTZSaTIleKTsJscA6qGyQViHakfwOsJikWU+qetEQ
 dQ0qwMotC837g2SKJ7SAINmuCrz4NWnofiVAHkMThlkD+zzO5rhhsedOd
 s6p4c1ct9FoIs06Vr2EuGYAN1tpC/pjapVpg8MEZWRcUOl3R/Zh+7gUeX
 a7evf+VnLaU9TxOhuS8AokITN+s9oHGnflb1GRBhhXO9bL+kW1DwhZxld
 LlHE8O3M5b3OrRsdXqNOn4K5ZqkjvUq7qid6zB1eJM0/g4LhsTEAv8pQh
 RaEgqG+ClXMa+PU0VWbkJfPeP9f1+ZxV/S7dc+Nh/k0sySbo2QpVTgK30 g==;
X-CSE-ConnectionGUID: OXDz3LdOT1SuSbkyeCkYvA==
X-CSE-MsgGUID: G2W4idAzSUGdEdhO86FySg==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="72606751"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="72606751"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 09:28:18 -0800
X-CSE-ConnectionGUID: XBJ5a1BzRS6juM7U/WUDTQ==
X-CSE-MsgGUID: mDEXyq8STUGarSmaFLhvsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="214138735"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.39.133])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 09:28:18 -0800
From: Matt Roper <matthew.d.roper@intel.com>
Date: Fri, 20 Feb 2026 09:27:43 -0800
Subject: [PATCH v2 21/23] drm/xe/xe2_hpg: Drop invalid workaround
 Wa_15010599737
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260220-forupstream-wa_cleanup-v2-21-b12005a05af6@intel.com>
References: <20260220-forupstream-wa_cleanup-v2-0-b12005a05af6@intel.com>
In-Reply-To: <20260220-forupstream-wa_cleanup-v2-0-b12005a05af6@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1577;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=aZPIX9iHEfGes4aGLFpfQ4Bx/Rt+YkfaZVYoFwzpgig=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBpmJmv6ZtzvT1HLnyWYEO6MLIa5gPep+Wr6Ptje
 cLqqi/ATXqJAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCaZiZrwAKCRBNeSQFyHKQ
 BK+4EACcQKjprg+EFn4AdIc0r4vrpCmWGhcbC2zaUy3oOiexT1aUOhFYoiX4c+/JICxCs6BzwNy
 75SrOGZB1adhxosMVl0PgWW/GUBD9w04B+8xbeKlXG/eJgwx9umUHJOxOORSl3znWf3Oq+bb9Ak
 Lqzej/OdlUZR0v3M/U9UIRFkYkKYdtU+7zYSgY49+34phQw/noJrX1bVWGrSRYPEeuflABGf5LI
 OniStUREu4lnd/HI9lK6iY0TAHwYbncY6yrRj0as7R2WbyHmIinj/dQt1CRsESD40h7pwqg+Acs
 7WoLja7pIVTG0tn4z5fyztaGv74DHTbxSdREBc0hMk9vT0XIgMNJGCXUoC61Xzeo4uaampaxfR9
 0dihiZONpLJHix7qtoPJFpMK1OfOhlzXahtXfC1O/p1DHvO0Or+QRAzxK60IgnaCvAMamnyamjV
 klr3PEAzXBn3trHZDHxFS++vUlH9+YCF8/r/cL0W0Lks6p5P+mrpya491FIdkkSxZGVRVwsB5J3
 qQImp77avjcvi9N+vJjuMRl+qzZYMqMh0cOSLUTbkpozfyJ1d6vbunVKiNXJHbCwpsjwk/e/0YY
 7gRGtP+t691OVL+VQwTX8ZmhKCCZt4whEJny43v7N0nWMiIq9qofjxr/hBpmpolhpl9uwF+O5X6
 pXa74xX4GFSVPOQ==
X-Developer-Key: i=matthew.d.roper@intel.com; a=openpgp;
 fpr=C267C309447FEB4F3F216DAC4D792405C8729004
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

Wa_15010599737 was a workaround originally proposed (and ultimately
rejected) for DG2-G10.  There's no record of it ever being relevant or
even considered for any other platforms.

The specific bit this workaround was setting is documented as "This bit
should be set to 1 for the DX9 API and 0 for all other APIs" which means
that it should almost always be left at the default value of 0 on Linux.
The register itself is directly accessible from userspace, so in the
special cases where it might be relevant (e.g., Wine/Proton running
Windows DX9 apps), the userspace drivers already have the ability to
change the setting without involvement of the kernel.

Fixes: 7f3ee7d88058 ("drm/xe/xe2hpg: Add initial GT workarounds")
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_wa.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index fa5dce4ead48bae424a49c62142683dbf1971376..105ccd8115f09993b7ef82e70cb87d74008f267f 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -734,10 +734,7 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
 	},
 
 	/* Xe2_HPG */
-	{ XE_RTP_NAME("15010599737"),
-	  XE_RTP_RULES(GRAPHICS_VERSION(2001), ENGINE_CLASS(RENDER)),
-	  XE_RTP_ACTIONS(SET(CHICKEN_RASTER_1, DIS_SF_ROUND_NEAREST_EVEN))
-	},
+
 	{ XE_RTP_NAME("14020756599"),
 	  XE_RTP_RULES(GRAPHICS_VERSION(2001), ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(SET(WM_CHICKEN3, HIZ_PLANE_COMPRESSION_DIS))

-- 
2.53.0

