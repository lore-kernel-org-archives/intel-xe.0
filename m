Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0171ACD1284
	for <intel-xe@archiver.kernel.org>; Tue,  2 Apr 2024 06:11:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E50010FA46;
	Tue,  2 Apr 2024 06:11:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k5aFzR4U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CE3910FA48
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Apr 2024 06:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712038285; x=1743574285;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/pF5va1LfG9A362yNxOPC7GsDFiZRvdB53kppUT7ziE=;
 b=k5aFzR4UrbYY93DpqhIotKIP6Fqlkaeukku2MDkz11NYXvWic0KObWjI
 DKKLBfx9j38KeapPfgB2ukVKEegZss7MUBUxueP/PwUrky3RDxL4qe/gX
 gH6CcxGJ3cZicZoRgypDNFZ+KCtDUNpOABxAaI+QTXVISIo5lARfjlXt7
 WEDsa52E+kkjFy7HgzJAMC5bFuqMo3/0FpKiPnSKC0wu/m4rsmuaCa2oT
 qBzRETWtT4YFu8wF9ozcMSk/Oo3z8Hw+gkBXc+fnvdvbHKIDW2pJoUnoM
 W7R2TBr8ZIuxF6fTINDctZjE85Q3z0M8nNvFBn6yNjkBFyo0rAIcPdLIc w==;
X-CSE-ConnectionGUID: +PzgMd/qSE2lbzQ7/Yeqpg==
X-CSE-MsgGUID: 8hYqA3EKSdaPwHgUDtDJhA==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="10151192"
X-IronPort-AV: E=Sophos;i="6.07,174,1708416000"; d="scan'208";a="10151192"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2024 23:11:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,174,1708416000"; d="scan'208";a="18410540"
Received: from bommu-optiplex-5060.iind.intel.com ([10.145.169.63])
 by orviesa006.jf.intel.com with ESMTP; 01 Apr 2024 23:11:22 -0700
From: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH] drm/xe/xe2: Add workaround 18034896535
Date: Tue,  2 Apr 2024 11:41:29 +0530
Message-Id: <20240402061129.117196-1-krishnaiah.bommu@intel.com>
X-Mailer: git-send-email 2.25.1
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

Add 18034896535 as driver permanent workarounds.
Also reverting temporary workaround 16021540221.

Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_wa.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 74b33a3845f2..4d8e0d64cf42 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -423,8 +423,8 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 		       FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(HALF_SLICE_CHICKEN5, DISABLE_SAMPLE_G_PERFORMANCE))
 	},
-	{ XE_RTP_NAME("16021540221"),
-	  XE_RTP_RULES(GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0),
+	{ XE_RTP_NAME("18034896535"),
+	  XE_RTP_RULES(GRAPHICS_VERSION(2004),
 		       FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(ROW_CHICKEN4, DISABLE_TDL_PUSH))
 	},
-- 
2.25.1

