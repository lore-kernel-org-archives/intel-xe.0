Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5675AE91297
	for <intel-xe@archiver.kernel.org>; Thu,  5 Feb 2026 23:40:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E231210E201;
	Thu,  5 Feb 2026 23:40:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LmVk1SnT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28C1310E1A0;
 Thu,  5 Feb 2026 23:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770334835; x=1801870835;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=MVttFq6otnXhNAouGJFbBZANSNtGZGO2XVmkdk9dQnI=;
 b=LmVk1SnTDVv9yFhZWMLsn+XDBZ7yEJSG5GOTSF6gaGIw7toaSEkNV2rb
 wUZLsGdW2qAAaLFBh+G47bb7n3iJhw2keqlxVOquOYLZpzLm61xCuGshl
 d6wu3976aNsBK+xTJ4CTS2xXmrbXSkj3/pvPh0U09YrOVgtK3umD2/E5q
 HHY8cg0V4ulWGtegs73F9l2t4ZfN1JMy7vMR/6WO0Upl9WyVicR+AaItL
 BM2pKMlGPu8xWDDw5Xp/Bm+Z9B/jET2SusxwJsEWHWfb2PUEsSQ8KhyAX
 WP+fDnF6XovOY3e0pHv5zt0nfCxqpNVyFInoLAdD6GyHaYcqM1Nfd/kb/ Q==;
X-CSE-ConnectionGUID: sFMtiyG1RWGYKkTMP9J95g==
X-CSE-MsgGUID: mzzoylyaQ0+JU9SnVh2/yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="82658689"
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; d="scan'208";a="82658689"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 15:40:35 -0800
X-CSE-ConnectionGUID: nZGWhGRNQrOcbhKn/ANiXw==
X-CSE-MsgGUID: kfdElFN8SAqFbDZgfUPrXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; d="scan'208";a="210500146"
Received: from rfrazer-mobl3.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.222.82])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 15:40:33 -0800
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Thu, 05 Feb 2026 20:39:39 -0300
Subject: [PATCH v2 11/15] drm/xe/xe3p_lpg: Set STLB bank hash mode to 4KB
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260205-nvl-p-upstreaming-v2-11-9ec14f00cc6c@intel.com>
References: <20260205-nvl-p-upstreaming-v2-0-9ec14f00cc6c@intel.com>
In-Reply-To: <20260205-nvl-p-upstreaming-v2-0-9ec14f00cc6c@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>, 
 Aradhya Bhatia <aradhya.bhatia@intel.com>, 
 Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.15-dev
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

From: Aradhya Bhatia <aradhya.bhatia@intel.com>

Since the dominant size of the pages referred in an i-gpu, such as
Xe3p_LPG, will be 4KB, the HW default of mix of 64K and 2M for STLB bank
hash mode does not make sense.

Allow the SW to change it to 4KB Mode, for Xe3p_LPG.

v2:
  - Add Bspec reference. (Matt)

Bspec: 78248
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Aradhya Bhatia <aradhya.bhatia@intel.com>
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 2 ++
 drivers/gpu/drm/xe/xe_tuning.c       | 9 +++++++++
 2 files changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index f626cc584bd9..1d652266f4f3 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -470,6 +470,8 @@
 #define   FORCE_MISS_FTLB			REG_BIT(3)
 
 #define XEHP_GAMSTLB_CTRL			XE_REG_MCR(0xcf4c)
+#define   BANK_HASH_MODE			REG_GENMASK(27, 26)
+#define   BANK_HASH_4KB_MODE			REG_FIELD_PREP(BANK_HASH_MODE, 0x3)
 #define   CONTROL_BLOCK_CLKGATE_DIS		REG_BIT(12)
 #define   EGRESS_BLOCK_CLKGATE_DIS		REG_BIT(11)
 #define   TAG_BLOCK_CLKGATE_DIS			REG_BIT(7)
diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
index 694385ae75f1..316f5e2b2e48 100644
--- a/drivers/gpu/drm/xe/xe_tuning.c
+++ b/drivers/gpu/drm/xe/xe_tuning.c
@@ -90,6 +90,15 @@ static const struct xe_rtp_entry_sr gt_tunings[] = {
 	  XE_RTP_RULES(MEDIA_VERSION(2000)),
 	  XE_RTP_ACTIONS(SET(XE2LPM_SCRATCH3_LBCF, RWFLUSHALLEN))
 	},
+
+	/* Xe3p */
+
+	{ XE_RTP_NAME("Tuning: Set STLB Bank Hash Mode to 4KB"),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3510, XE_RTP_END_VERSION_UNDEFINED),
+		       IS_INTEGRATED),
+	  XE_RTP_ACTIONS(FIELD_SET(XEHP_GAMSTLB_CTRL, BANK_HASH_MODE,
+				   BANK_HASH_4KB_MODE))
+	},
 };
 
 static const struct xe_rtp_entry_sr engine_tunings[] = {

-- 
2.52.0

