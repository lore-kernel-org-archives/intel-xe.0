Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14DDEC2BD09
	for <intel-xe@archiver.kernel.org>; Mon,  1 Jul 2024 18:47:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1A4810E08B;
	Mon,  1 Jul 2024 18:46:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cow4/der";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B84B410E08B
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Jul 2024 18:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719859619; x=1751395619;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=U+C2pYdGhKF7HYWJr0JlgGC6P98MYm30PKGfX1UqFT4=;
 b=cow4/derZJoM6bli36HKjcjuvVAko41RRlc4zPSGKxGM78t4ehuwKAg3
 MGq0aR8zkHKm4jeatxeUarsa/tiPips1GV7lmsftld5sa8Bgzq2FdL8Kr
 NM1sn4nKDyMeXCv1A2GnWdgXheTo3HBjWddsfqRAwVso1Gaxmgej6HV9q
 F/t8bL4wUqdYjYhNSf1k5N7xqSQMeK4Z9imtFbwe7cquupXY99nNik8BP
 xPyIl/6pXjX0jAMbDP230aItJWxTagIgvCB1G2Twu4EOQfiKmrgaxRF/W
 /qKO/26LDiPh7SXG2a+53QW6sguzRiazVe9uo3WNga2ekFCzSQhnJ8NMr Q==;
X-CSE-ConnectionGUID: mqBTkdUoRgCT4VxB8cJ/1w==
X-CSE-MsgGUID: R3bnHxUMSB6iEeNes1IB4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11120"; a="20873882"
X-IronPort-AV: E=Sophos;i="6.09,177,1716274800"; d="scan'208";a="20873882"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2024 11:46:58 -0700
X-CSE-ConnectionGUID: M8mImhSwRJGUKURi6O2mbQ==
X-CSE-MsgGUID: FJMpD7N4TMiBoSDWV4SkEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,177,1716274800"; d="scan'208";a="46056034"
Received: from nkwan-gpu-0.jf.intel.com ([10.165.21.133])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2024 11:46:58 -0700
From: Ngai-Mint Kwan <ngai-mint.kwan@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Ngai-Mint Kwan <ngai-mint.kwan@linux.intel.com>
Subject: [PATCH] drm/xe/xe2lpm: Extend Wa_16021639441
Date: Mon,  1 Jul 2024 11:46:37 -0700
Message-Id: <20240701184637.531794-1-ngai-mint.kwan@linux.intel.com>
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

Wa_16021639441 applies to Xe2_LPM.

Signed-off-by: Ngai-Mint Kwan <ngai-mint.kwan@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_wa.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index c7bf0862b231..6c52d9d02b5f 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -539,6 +539,16 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 	  XE_RTP_ACTIONS(SET(HALF_SLICE_CHICKEN7, CLEAR_OPTIMIZATION_DISABLE))
 	},
 
+	/* Xe2_LPM */
+
+	{ XE_RTP_NAME("16021639441"),
+	  XE_RTP_RULES(MEDIA_VERSION(2000)),
+	  XE_RTP_ACTIONS(SET(CSFE_CHICKEN1(0),
+			     GHWSP_CSB_REPORT_DIS |
+			     PPHWSP_CSB_AND_TIMESTAMP_REPORT_DIS,
+			     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
+	},
+
 	/* Xe2_HPM */
 
 	{ XE_RTP_NAME("16021639441"),
-- 
2.34.1

