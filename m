Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0D69EB2700
	for <intel-xe@archiver.kernel.org>; Tue, 10 Feb 2026 21:58:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CC6A10E0E1;
	Tue, 10 Feb 2026 21:58:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HHSUJMyl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60DD310E0DD
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Feb 2026 21:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770760714; x=1802296714;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=j8IqkcGfBGv22+itGW5lk1q7CP/OsvYd8fCcIJN2StM=;
 b=HHSUJMylwO/Lsbsj9m/V0I+KmWGnp6h881rL6ADNLybSZkxRreYY0sL0
 ueNbvEI59EmTO16B9Tox6+2lCs/j68xl0S3ArIUpW9JBIGV7ogAgOucvV
 Yq6vquRn39hrpiJ1t2Ex2YRsNjtfO8o0rbnH/6lrLwYetuleizjaxi5DL
 7t5pj2jE2KGfCJ16CphAGwJqaY6CgY/FUUzeFf7nzttotDblkKPGGC2fb
 49Taw1EQqaiqWehhPdwGOXTL6+sCt9z9l9rQKMYM2PM4QufKT9gG36N9T
 Nd7aTPAYTv+7rr5nPnIHhs84iY4utS/c5jRCrOJas5jnjyaeURvQ/vi7g g==;
X-CSE-ConnectionGUID: FuQfS8epR1KnuVP4Mjuolw==
X-CSE-MsgGUID: xUcyiuiHR/KcIyb25H2BbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="82538606"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="82538606"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 13:58:34 -0800
X-CSE-ConnectionGUID: 0apLcUgtSI6VIQ3NlfR20Q==
X-CSE-MsgGUID: oNLiLvnARniMFPi8Fyonlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="211052250"
Received: from hchegond-desk.jf.intel.com ([10.88.27.198])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 13:58:34 -0800
From: Harish Chegondi <harish.chegondi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Harish Chegondi <harish.chegondi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [PATCH 3/3] drm/xe/xe2lpg: Extend Wa_18041344222 to graphics IP 20.04
Date: Tue, 10 Feb 2026 13:58:27 -0800
Message-ID: <6e66746246439249a278f3d157f06071d83504b6.1770760591.git.harish.chegondi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <4043a30d6a971cda3c13145e081e4eed7cc4e440.1770760591.git.harish.chegondi@intel.com>
References: <4043a30d6a971cda3c13145e081e4eed7cc4e440.1770760591.git.harish.chegondi@intel.com>
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

Apply WA 18041344222 to Xe2 LPG graphics IP version 20.04 too.

Bspec: 56024
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
---
 drivers/gpu/drm/xe/xe_wa.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index d512a9ca82fc..4360015c1abd 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -554,6 +554,12 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 		       FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(TDL_TSL_CHICKEN, RES_CHK_SPR_DIS))
 	},
+	{ XE_RTP_NAME("18041344222"),
+	  XE_RTP_RULES(GRAPHICS_VERSION(2004),
+		       FUNC(xe_rtp_match_first_render_or_compute),
+		       FUNC(xe_rtp_match_gt_has_discontiguous_dss_groups)),
+	  XE_RTP_ACTIONS(SET(TDL_CHICKEN, EUSTALL_PERF_SAMPLING_DISABLE))
+	},
 
 	/* Xe2_HPG */
 
-- 
2.43.0

