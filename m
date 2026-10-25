Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C3C606A31B
	for <intel-xe@archiver.kernel.org>; Sun, 25 Oct 2026 13:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kW6BBsl1
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8477610E07C;
	Sun, 25 Oct 2026 13:03:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F2CF10E07C;
 Sun, 25 Oct 2026 13:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792933400; x=1824469400;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Lvld6mxwz4VKb7/zEds2ou2goYcnLzsRSDu4UZH+etw=;
 b=kW6BBsl1tKvONoGPu2SFDg9VJTJBMx8my/TADGmFZBIv2ZYARA2oWnyP
 9elpWDGxUVNC5bGVcufqKrcrpRZVcjmRP/gsHlWIkF6tq9sSUPSYDxxDD
 C4Jdyyt3RQndhCxoXACqOxcj2XqtpR4Ss4d016rnrySgcZhh9HXD396cX
 zga34Q6s+khc62PKC8DkOzPQfrII29rSmDh7hwD5qnMQuJ0C22h0gamNu
 eIqj9sl6UoHTFZ8EmKVAC6NsXvz9nLDTAssZHaar+tutzvPrqfBYUFoMg
 L1X3VPjiIhtHwxDuqogBA+o4Fja1qolitUK7M3WX8JJC5J4hVzacrnlgV Q==;
X-CSE-ConnectionGUID: g12T8Y8BSKOuRaJxoq5LWA==
X-CSE-MsgGUID: q1pX7awlTnSPZ4BGqtpRDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11945"; a="1498802"
X-IronPort-AV: E=Sophos;i="6.27,177,1787036400"; 
   d="scan'208";a="1498802"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2026 06:03:19 -0700
X-CSE-ConnectionGUID: UcN8gD2wSiWmylYfKtWhrQ==
X-CSE-MsgGUID: VKyc4J6TRNyXORqC/c/seA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,177,1787036400"; 
   d="scan'208";a="4021141"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2026 06:03:17 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: suraj.kandpal@intel.com, Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Sui Jingfeng <suijingfeng@loongson.cn>, stable@vger.kernel.org
Subject: [PATCH v2 1/2] drm/i915/dsc: Fix QP table index calculation for bpp
 selection
Date: Sun, 25 Oct 2026 18:17:20 +0530
Message-ID: <20261025124720.953439-1-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261016101713.230013-2-ankit.k.nautiyal@intel.com>
References: <20261016101713.230013-2-ankit.k.nautiyal@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The QP table rows increment in steps of 0.5 bpp, meaning each integer
bpp step corresponds to 2 rows in the table. While refactoring the index
calculation to support fractional bpp, the multiplier of 2 was dropped for
the integer bpp portion.

Also, the check for a fractional bpp of 0.5 or more compared
fractional_bits against 5000 which was a leftover threshold from an earlier
decimal-scaled (*10000) version of the change.

Restore the missing factor of 2 in the integer part of the bpp calculation,
and compare fractional_bits against 8 (0.5 in Q4 format, i.e. 8/16) instead
of 5000, to correctly align the QP selection with the table layout.

Also fix a typo in the native_420 comment: the second bpp sub-range was
written as 4.5 to 4.8375 instead of 4.5 to 4.9375, inconsistent with the
9.875 value it maps to.

v2:
 - Fix fractional_bits threshold. (Sashiko)
 - Fix typo in native_420 comment (4.8375 -> 4.9375).

Fixes: 2df50cb46a4c ("drm/i915/dsc/mtl: Add support for fractional bpp")
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: Suraj Kandpal <suraj.kandpal@intel.com>
Cc: Sui Jingfeng <suijingfeng@loongson.cn>
Cc: <stable@vger.kernel.org> # v6.8+
Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_vdsc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_vdsc.c b/drivers/gpu/drm/i915/display/intel_vdsc.c
index 8f06c3a4d56d..a6556a6e45b7 100644
--- a/drivers/gpu/drm/i915/display/intel_vdsc.c
+++ b/drivers/gpu/drm/i915/display/intel_vdsc.c
@@ -211,7 +211,7 @@ calculate_rc_params(struct drm_dsc_config *vdsc_cfg)
 		 * For 420 format since bits_per_pixel (bpp) is set to target bpp * 2,
 		 * QP table values for target bpp 4.0 to 4.4375 (rounded to 4.0) are
 		 * actually for bpp 8 to 8.875 (rounded to 4.0 * 2 i.e 8).
-		 * Similarly values for target bpp 4.5 to 4.8375 (rounded to 4.5)
+		 * Similarly values for target bpp 4.5 to 4.9375 (rounded to 4.5)
 		 * are for bpp 9 to 9.875 (rounded to 4.5 * 2 i.e 9), and so on.
 		 */
 		bpp_i  = bpp - 8;
@@ -239,7 +239,7 @@ calculate_rc_params(struct drm_dsc_config *vdsc_cfg)
 				range_bpg_offset & DSC_RANGE_BPG_OFFSET_MASK;
 		}
 	} else {
-		/* fractional bpp part * 10000 (for precision up to 4 decimal places) */
+		/* fractional bpp part, in Q4 format */
 		int fractional_bits = fxp_q4_to_frac(vdsc_cfg->bits_per_pixel);
 
 		static const s8 ofs_und6[] = {
@@ -259,9 +259,9 @@ calculate_rc_params(struct drm_dsc_config *vdsc_cfg)
 		 * QP table rows have values in increment of 0.5.
 		 * So 6.0 bpp to 6.4375 will have index 0, 6.5 to 6.9375 will have index 1,
 		 * and so on.
-		 * 0.5 fractional part with 4 decimal precision becomes 5000
+		 * 0.5 in Q4 fractional format is 8 (i.e. 8/16)
 		 */
-		bpp_i  = ((bpp - 6) + (fractional_bits < 5000 ? 0 : 1));
+		bpp_i  = (2 * (bpp - 6) + (fractional_bits < 8 ? 0 : 1));
 
 		for (buf_i = 0; buf_i < DSC_NUM_BUF_RANGES; buf_i++) {
 			u8 range_bpg_offset;
-- 
2.50.1

