Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AD0AEDF04C
	for <intel-xe@archiver.kernel.org>; Thu, 12 Feb 2026 06:59:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DEB010E00A;
	Thu, 12 Feb 2026 06:59:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TSrPk+Xr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A2D710E00A
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Feb 2026 06:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770879575; x=1802415575;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=S8ABC3iqwYslohnCF1xkOl1AmBkLpQR1dBiJkWMC2oI=;
 b=TSrPk+XravZkDCMU0YDvuoy7v5U9cDzmPY8bnKkcH9q6s6nVxaeGWZmL
 jTPjA5l1M0UbFP9UNI81/5/chl6TzQGnhnGZky5VLa1TLAOID09LXzRSA
 Xpwxo2rbck5nsmKjDb55fcWsYXuw6a3iO5CNr7DDuZeGvjQpC6om6ULLf
 AIyeVcfiblQpTvnxnwR9RxXc9eS8qv0axMNCXPkqQozFvHwI9bxJT13/h
 kc8T+vHrnwEwGNskkxGdu15dUS9MtN6Sw8cCk74qSxvL5SHYKDNqesn+j
 wMQG4DF0GcQ8QkYDRoM0F8QGgu8asyzOnHH9kjYmRbQak11f3T4O+xOgp Q==;
X-CSE-ConnectionGUID: 8ODmtj9YS1OWWBH3yracqg==
X-CSE-MsgGUID: 5wPQDXQARP+WoBBelHUbfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="71072984"
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; d="scan'208";a="71072984"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 22:59:35 -0800
X-CSE-ConnectionGUID: RmkhOjY6THWfEonibqLz/Q==
X-CSE-MsgGUID: WKlDYhHwQ3eNbOMEO3IeJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; d="scan'208";a="211418420"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 22:59:33 -0800
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com, nitin.r.gote@intel.com,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH v4] drm/xe/xe2: Apply Wa_14024997852
Date: Thu, 12 Feb 2026 12:29:20 +0530
Message-ID: <20260212065920.1815979-1-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
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

Applied Wa_14024997852 to Graphics version 20.01 to 20.04
Whitelist registers needed for userspace to control autostrip on xe2.

v2:
  - set Bit 31 of FF_MODE, for TE autostrip disable (Nitin)
v3:
  - Need to whitelist these for Xe2 IPs (MATT R)
v4:
  - Combine these into a single range for simplicity:(2001, 3005)
    (MATT R)

Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Reviewed-by: Nitin Gote <nitin.r.gote@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_reg_whitelist.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
index 1d36c09681aa..754c15f3341a 100644
--- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
+++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
@@ -75,7 +75,7 @@ static const struct xe_rtp_entry_sr register_whitelist[] = {
 	  XE_RTP_ACTIONS(WHITELIST(CSBE_DEBUG_STATUS(RENDER_RING_BASE), 0))
 	},
 	{ XE_RTP_NAME("14024997852"),
-	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3005), ENGINE_CLASS(RENDER)),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 3005), ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(WHITELIST(FF_MODE,
 				   RING_FORCE_TO_NONPRIV_ACCESS_RW),
 			 WHITELIST(VFLSKPD,
-- 
2.43.0

