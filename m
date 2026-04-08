Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA28710FC467
	for <intel-xe@archiver.kernel.org>; Wed,  8 Apr 2026 23:44:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6678510E708;
	Wed,  8 Apr 2026 23:44:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OdC9mlwC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB85410E6FD
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Apr 2026 23:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775691868; x=1807227868;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=6ioFm0HZPnou6CY+k3Jlr0KdmxUQUa7JRYgBt8GXbs4=;
 b=OdC9mlwCzbV7M+6DnoOhJtHzP3A/XLzcARQlz4KY10AQaMh8AJZfNNhE
 m/l1zD1DZ/lfplnG2WgHPx+CtGEhXlcB1YGacIu6uBiropBq1egOdF6Li
 gipc0G2b2mnojNVA6z18EusNPOvqe5J8z9efFqPQLO+MFudkADhdFd00d
 ItNiQhJtY84L5IlAYlEs/LToDGLsD9BdNks4s8ixIJK7jvaeBS62V+c/P
 OYXyNICUGokyqjEvmrfbhc/OJQKN26TdPIlAUB4j4FXJEYvWf7DoVjBTc
 oDm85q7TnIu6mezChipUm2cCD9AMf+ms+kILTFw5apP9L+zj042Os4AZP Q==;
X-CSE-ConnectionGUID: LU/qkCyvTzibzrLI06oCYQ==
X-CSE-MsgGUID: 2kFBjBVOQhmMvTC4J30Xhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="94272797"
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; d="scan'208";a="94272797"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 16:44:28 -0700
X-CSE-ConnectionGUID: GjcpxfLuQ5e/vhhPj4PdoQ==
X-CSE-MsgGUID: bnMgG7qoQbGzUTo/H+7NVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; d="scan'208";a="227616910"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.39.133])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 16:44:28 -0700
From: Matt Roper <matthew.d.roper@intel.com>
Date: Wed, 08 Apr 2026 16:43:02 -0700
Subject: [PATCH v2 03/10] drm/xe/oa: Stop whitelisting OAM registers on non
 Xe2/Xe3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260408-oa-whitelist-cleanup-v2-3-db4a06aae8b0@intel.com>
References: <20260408-oa-whitelist-cleanup-v2-0-db4a06aae8b0@intel.com>
In-Reply-To: <20260408-oa-whitelist-cleanup-v2-0-db4a06aae8b0@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>, 
 Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2163;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=6ioFm0HZPnou6CY+k3Jlr0KdmxUQUa7JRYgBt8GXbs4=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBp1uhasfm3BBJqD+H7VyGFUIKKsGY/oluwAn+Tl
 wYETM9qtueJAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCadboWgAKCRBNeSQFyHKQ
 BKIoEACHv32+O0+Oi9Aa63o/lzmqrZYUT1PkX1iucDSryDD0mfN72gRIo5GHbn2Sq+c2LmC0x+h
 Mnicjq2Q25Tb2wlGuZvOvK3wfOUr7rLVGlDjjolAZLn9JjMrj6ayxkUW4NysPxqAz4UnHNLO6PF
 8d+/GNaeR3jw21BYewDzCjIocAep4muzjMQh1Pka/IrdshjgBmnM2T4YXswvztyoM7oAvUbIeQ6
 SrzC+cQOuLdZQuvvdcYVqTTh/WREpS0r3vZSnFqMQNOeyqnaldIIwKSKTA9fMJgRI+98wxykrVn
 sjZdXz/z676mQ8w9Io9BREvv2XWqepSE3tyorPFVEHq2K/i1TKvGx8WCHVHs03DUoYZV2CW53cc
 x0sQArbOmWFwaW7pCr1rCd2ntk15JYKNp14Jz3If2mGz3jZfNadshpET7aQWMwusH6h5toBONhf
 XkS4cjyGDY2JwBRLSV0jdjOlCA3K+Jn7Ah6TgVkKC7Hm4IweHTCkwjvawTMtzwO5msb5dHQFncV
 89kvpbr5oO1A5TRA6hLiGFpp/31XApWGzq2SirZKFU4UgVZbKilXLZwhtlrLofNxctzUP+V2KOG
 9YvTtVh+HXxqdZT2iwPEfvsk9QwkGf5v/SurthkZ9xUx0Wm/5/wVs9Yh/JGZtzKJhmC1CIlw1TL
 oUbPiPQYs63XYvA==
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

With the introduction of standalone media in Xe_LPM (version 13.00), the
OAM register space was part of the hardware's built-in register
whitelist, granting userspace read-only access automatically.  There is
no need to explicitly whitelist the registers on media version 13.00.

From Xe2_HPM (13.01) onward, userspace access to these registers was
deliberately removed by the hardware teams; by design, those registers
are not supposed to be needed by userspace for proper OA operation and
they're not supposed to be added to the software whitelist either.
Unfortunately they're already on the software table, so it's possible
that some of our KMD<->UMD OA interaction got misdesigned and trying to
remove them now might break userspace.  While we investigate further to
see whether or not it's possible to safely remove them, place an upper
bound on the whitelist entries to prevent this mistake from spreading
past Xe3 platforms.

Bspec: 45545, 60150
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_reg_whitelist.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
index b0ad89a5ad4f..457702de53e4 100644
--- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
+++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
@@ -128,14 +128,14 @@ static const struct xe_rtp_entry_sr register_whitelist[] = {
 				   RING_FORCE_TO_NONPRIV_RANGE_4))
 	},
 	{ XE_RTP_NAME("oam_mmio_trg_vcs"),
-	  XE_RTP_RULES(MEDIA_VERSION_RANGE(1300, XE_RTP_END_VERSION_UNDEFINED),
+	  XE_RTP_RULES(MEDIA_VERSION_RANGE(1301, 3099),
 		       ENGINE_CLASS(VIDEO_DECODE)),
 	  XE_RTP_ACTIONS(WHITELIST(OAM_MMIO_TRG(XE_OAM_SAG_BASE_ADJ),
 				   RING_FORCE_TO_NONPRIV_ACCESS_RW),
 			 WHITELIST_OAM_MMIO_TRG)
 	},
 	{ XE_RTP_NAME("oam_mmio_trg_vecs"),
-	  XE_RTP_RULES(MEDIA_VERSION_RANGE(1300, XE_RTP_END_VERSION_UNDEFINED),
+	  XE_RTP_RULES(MEDIA_VERSION_RANGE(1301, 3099),
 		       ENGINE_CLASS(VIDEO_ENHANCE)),
 	  XE_RTP_ACTIONS(WHITELIST(OAM_MMIO_TRG(XE_OAM_SAG_BASE_ADJ),
 				   RING_FORCE_TO_NONPRIV_ACCESS_RW),

-- 
2.53.0

