Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EBCFCD342C
	for <intel-xe@archiver.kernel.org>; Mon,  4 May 2026 10:06:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BA8510E192;
	Mon,  4 May 2026 10:06:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RKsSBp1e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 141E510E192
 for <intel-xe@lists.freedesktop.org>; Mon,  4 May 2026 10:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777889187; x=1809425187;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8p4syC621wJ2PcbhN0gpT7UdZvzngP+37wP1RYvlL2I=;
 b=RKsSBp1eUUORr4xOILqVTOuCjs1VYeTh2EyHrQnB6PH/6Ly7L03aWlNv
 zKxvKZzvAMPHPyYm44SWpDwuGg67QuColzeZLvuZ8UGhQ/5vbohCMeboE
 GofCNrzKXRX1IPRwG93OqCxzJ/nOQJruCj1qztZPR6LVHTxLs2HWYlWvh
 eEat+uIOa0KKExwlIFytBt2gvg8Uvj+Ay4K6nYHcZv1rYDCbFJOf4m/nh
 QY6vR9gkIvsw7BLgVCs7eTwXQbzHE1urqZ+DVgA092lDrVWjnlAMow2rC
 2wjd2V4v31DS/6MqyoKpLxk/bLGVzx4vR+hEzEf09U4nY88r/fDJD/BQB Q==;
X-CSE-ConnectionGUID: gkw8IjPtSgW2uaMBtHJRVg==
X-CSE-MsgGUID: /DDI8B+8SYShk5QTZXzhqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="89847221"
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; d="scan'208";a="89847221"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 03:06:26 -0700
X-CSE-ConnectionGUID: RAQ3G5kFQbGPDFGCECh94A==
X-CSE-MsgGUID: 9e3Nrva9TkiRJihz6YC61g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; d="scan'208";a="232825246"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO tpalli-mobl3.intel.com)
 ([10.245.245.163])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 03:06:24 -0700
From: =?UTF-8?q?Tapani=20P=C3=A4lli?= <tapani.palli@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.s.atwood@intel.com,
 =?UTF-8?q?Tapani=20P=C3=A4lli?= <tapani.palli@intel.com>
Subject: [PATCH] drm/xe: enable sampler LD on LSC control via render surface
 state
Date: Mon,  4 May 2026 13:05:11 +0300
Message-ID: <20260504100511.146844-1-tapani.palli@intel.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

This makes it possible for user space driver to control LSC usage
for sampler loads.

Bspec: 56846
Signed-off-by: Tapani Pälli <tapani.palli@intel.com>
---
 drivers/gpu/drm/xe/xe_tuning.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
index ce39b77a084a..f3ed27115893 100644
--- a/drivers/gpu/drm/xe/xe_tuning.c
+++ b/drivers/gpu/drm/xe/xe_tuning.c
@@ -92,6 +92,13 @@ static const struct xe_rtp_entry_sr gt_tunings[] = {
 	  XE_RTP_ACTIONS(SET(XE2LPM_SCRATCH3_LBCF, RWFLUSHALLEN))
 	},
 
+	/* Xe3 */
+
+	{ XE_RTP_NAME("Tuning: Enable Sampler LD on LSC Controlled by Render Surface State"),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, XE_RTP_END_VERSION_UNDEFINED)),
+	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0_UDW, ENABLE_SMP_LD_RENDER_SURFACE_CONTROL))
+	},
+
 	/* Xe3p */
 
 	{ XE_RTP_NAME("Tuning: Set STLB Bank Hash Mode to 4KB"),
-- 
2.53.0

