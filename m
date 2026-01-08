Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 066BBCD5859
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jan 2026 00:20:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBE9610E2DD;
	Thu,  8 Jan 2026 00:20:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O5EiaJvS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C580110E190
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Jan 2026 00:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767831613; x=1799367613;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nIhtLl41DSRs2ydx3qaBlRkYW7HT81ADBwTc6o1+8vI=;
 b=O5EiaJvSSLdGUXMP51FEAg6TQVPIX2I+1O4h5i1NvBzIq3ETLoCR+dHb
 cIH+X0zBmHV6VdWyQioAKUvjOzPvYxWJv1ltv+7sFq6urakzmLo2vgdYE
 bDQSJnYBBbOKtV4vckuW4ukaTRf0MloVR0lUXSXyxkhn1osrtprKb8tXw
 pzM8BxbLjAhw4P2uzuBu+uNP5OrzfbxEn9tugIFRCTUnpT57Kd83iB4L0
 AAZv+6B/6fFj7kxUYe/SBdUFYG/RkmkMAvd19Y1UiC9N8pW4W6izqqpqe
 cz85lBQ7SWxVmlGUlxcpKBPw5Vep80RX2nM9xkgR2t0m0MoxtC4jhulyS w==;
X-CSE-ConnectionGUID: re0CDaqVRAOSz3jx8oHA4A==
X-CSE-MsgGUID: 2Mv9P34gRgGxXwRaIvvouQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="71785540"
X-IronPort-AV: E=Sophos;i="6.21,209,1763452800"; d="scan'208";a="71785540"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 16:20:13 -0800
X-CSE-ConnectionGUID: abh21wlrTSi9RdnEYI16GQ==
X-CSE-MsgGUID: MrX+x4r5R3G+lmiCrcQxjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,209,1763452800"; d="scan'208";a="203500999"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 16:20:13 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 3/4] drm/xe/oa: Stop whitelisting OAM registers on non Xe2/Xe3
Date: Wed,  7 Jan 2026 16:20:04 -0800
Message-ID: <20260108002000.384449-9-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260108002000.384449-6-matthew.d.roper@intel.com>
References: <20260108002000.384449-6-matthew.d.roper@intel.com>
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
index 7491a8393b6f..99956c3574f9 100644
--- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
+++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
@@ -121,12 +121,12 @@ static const struct xe_rtp_entry_sr register_whitelist[] = {
 				   RING_FORCE_TO_NONPRIV_RANGE_4))
 	},
 	{ XE_RTP_NAME("oam_mmio_trg_vcs"),
-	  XE_RTP_RULES(MEDIA_VERSION_RANGE(1300, XE_RTP_END_VERSION_UNDEFINED),
+	  XE_RTP_RULES(MEDIA_VERSION_RANGE(1301, 3099),
 		       ENGINE_CLASS(VIDEO_DECODE)),
 	  XE_RTP_ACTIONS(WHITELIST_OAM_MMIO_TRG)
 	},
 	{ XE_RTP_NAME("oam_mmio_trg_vecs"),
-	  XE_RTP_RULES(MEDIA_VERSION_RANGE(1300, XE_RTP_END_VERSION_UNDEFINED),
+	  XE_RTP_RULES(MEDIA_VERSION_RANGE(1301, 3099),
 		       ENGINE_CLASS(VIDEO_ENHANCE)),
 	  XE_RTP_ACTIONS(WHITELIST_OAM_MMIO_TRG)
 	},
-- 
2.52.0

