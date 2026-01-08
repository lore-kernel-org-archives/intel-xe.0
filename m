Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08FD5D0D17C
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jan 2026 00:20:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE44710E190;
	Thu,  8 Jan 2026 00:20:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jh2FJ7Pm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AADC10E0FA
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Jan 2026 00:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767831613; x=1799367613;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=izP5IF89rt/4ZMCGiQqZYx6nKPGPt5IC5Kesppfc+ig=;
 b=Jh2FJ7Pm3WzqWSj0K3/05WkfAW9kLjxHSeveNGVEnUsICd5XzlUXGTXK
 X4p9UgFjZH/wjdFvwNUkfJLkBjLL8/OgABW2mp/+wdqa4J/ka6zOIOlzb
 ovOxbzv7SNMFj9dSh4mfrLr4BlKtVRjSeO6BDf8xR6MAk5qj4N3eub+H8
 5HyF0zpKgZpJxeBbPmCaZW01wXUd7Wi72e6AAWvX4Y+VDwIm1qulllF7G
 09aYNK9m015fw7zuv0xCfJrR8h+d0VY7Z+/ZLOdLQIGzXCO/k2KTh72pN
 Y4C9+0KWQVj8afnRBT56GRoOypZIiCjZ+LFUXYzasC3hmlNmXjxeF4kYI Q==;
X-CSE-ConnectionGUID: 2TKy63kxQIGKX6tZNL++VA==
X-CSE-MsgGUID: 83zmgj6kTgy7UvVeYqW+Eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="71785539"
X-IronPort-AV: E=Sophos;i="6.21,209,1763452800"; d="scan'208";a="71785539"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 16:20:13 -0800
X-CSE-ConnectionGUID: mlFDSH1LRoiXAB9MKOS/Rg==
X-CSE-MsgGUID: pBY2G8UWQ/i/9n1KknW+Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,209,1763452800"; d="scan'208";a="203500995"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 16:20:13 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 2/4] drm/xe/oa: Stop whitelisting OAG_OASTATUS
Date: Wed,  7 Jan 2026 16:20:03 -0800
Message-ID: <20260108002000.384449-8-matthew.d.roper@intel.com>
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

OAG_OASTATUS has always been part of the hardware whitelist and thus
accessible to userspace for all platforms supported by the Xe driver.
There has never been any need to add it to the software whitelist.

Bspec: 45545, 60150
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_reg_whitelist.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
index 1bcb01f93914..7491a8393b6f 100644
--- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
+++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
@@ -95,9 +95,6 @@ static const struct xe_rtp_entry_sr register_whitelist[] = {
 	WHITELIST(status, RING_FORCE_TO_NONPRIV_ACCESS_RD), \
 	WHITELIST(head, RING_FORCE_TO_NONPRIV_ACCESS_RD | RING_FORCE_TO_NONPRIV_RANGE_4)
 
-#define WHITELIST_OAG_MMIO_TRG \
-	WHITELIST_OA_MMIO_TRG(OAG_OASTATUS, OAG_OAHEADPTR)
-
 #define WHITELIST_OAM_MMIO_TRG \
 	WHITELIST_OA_MMIO_TRG(OAM_STATUS(XE_OAM_SAG_BASE_ADJ), \
 			      OAM_HEAD_POINTER(XE_OAM_SAG_BASE_ADJ)), \
@@ -112,12 +109,16 @@ static const struct xe_rtp_entry_sr register_whitelist[] = {
 	{ XE_RTP_NAME("oag_mmio_trg_rcs"),
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, XE_RTP_END_VERSION_UNDEFINED),
 		       ENGINE_CLASS(RENDER)),
-	  XE_RTP_ACTIONS(WHITELIST_OAG_MMIO_TRG)
+	  XE_RTP_ACTIONS(WHITELIST(OAG_OAHEADPTR,
+				   RING_FORCE_TO_NONPRIV_ACCESS_RD |
+				   RING_FORCE_TO_NONPRIV_RANGE_4))
 	},
 	{ XE_RTP_NAME("oag_mmio_trg_ccs"),
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, XE_RTP_END_VERSION_UNDEFINED),
 		       ENGINE_CLASS(COMPUTE)),
-	  XE_RTP_ACTIONS(WHITELIST_OAG_MMIO_TRG)
+	  XE_RTP_ACTIONS(WHITELIST(OAG_OAHEADPTR,
+				   RING_FORCE_TO_NONPRIV_ACCESS_RD |
+				   RING_FORCE_TO_NONPRIV_RANGE_4))
 	},
 	{ XE_RTP_NAME("oam_mmio_trg_vcs"),
 	  XE_RTP_RULES(MEDIA_VERSION_RANGE(1300, XE_RTP_END_VERSION_UNDEFINED),
-- 
2.52.0

