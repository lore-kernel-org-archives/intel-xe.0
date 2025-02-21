Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1833CC021AA
	for <intel-xe@archiver.kernel.org>; Fri, 21 Feb 2025 11:47:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D66CB10E1DE;
	Fri, 21 Feb 2025 11:47:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lXS1KRXl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 190F810E1DE
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Feb 2025 11:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740138422; x=1771674422;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YSGL2yHaoZG236kvHDqWLVNHTjSCXyDSWMZoKy99Irs=;
 b=lXS1KRXl1zw8ieE9pt6HYJO2b5rLKWalZFtjV5LkAi88gqqjOeG08lwv
 PPfBgppeRLEUBAAkspWAf3Ja7yeT0ozDE//nqc0eaf4eaasEnkG+JEsy3
 J0CH7r7uELM4ae86fGeoHFlL91wKwi1LnmG9cDjgkRbc/wYy2S+NvC827
 ggAtRJbae3Ec4IpSZ/4Rk4Eae5HLCfVh7nkMlfdBxFVxCic5zIbRwDl7/
 bg2mz+plYG2Yg/zR0Z9PosWI9212stY/AuwVzgnBFpGD90W3hasLbzMfw
 dHORpa5dI9f7jZawsYZwY6wRRXnmXnMRBsBIcKCoZdZKw0AKAyNozVXvZ g==;
X-CSE-ConnectionGUID: 0RFKpjSaR0+PrjpHkxFX0g==
X-CSE-MsgGUID: UGwfYSoaRQeGtp6zI4EYSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="40667246"
X-IronPort-AV: E=Sophos;i="6.13,304,1732608000"; d="scan'208";a="40667246"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 03:47:01 -0800
X-CSE-ConnectionGUID: nlBaTN52TwK99Xs9MwqCrQ==
X-CSE-MsgGUID: V5ZSPcNfS6++Kqu6sp8G5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,304,1732608000"; d="scan'208";a="115993711"
Received: from unknown (HELO tejas-super-server..) ([10.190.239.37])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 03:47:00 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: badal.nilawar@intel.com,
	Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH] drm/xe/wa: Limit char per line to 100
Date: Fri, 21 Feb 2025 17:23:44 +0530
Message-Id: <20250221115344.389975-1-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.34.1
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

Above 100 char per line checkpatch would complain. Fixing it.

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_wa.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 744dba4fdb58..d4982799383c 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -599,7 +599,8 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 	/* Xe3_LPG */
 
 	{ XE_RTP_NAME("14021402888"),
-	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3001), FUNC(xe_rtp_match_first_render_or_compute)),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3001),
+		       FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(HALF_SLICE_CHICKEN7, CLEAR_OPTIMIZATION_DISABLE))
 	},
 	{ XE_RTP_NAME("18034896535"),
-- 
2.34.1

