Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19306E6FE4C
	for <intel-xe@archiver.kernel.org>; Fri,  6 Sep 2024 21:52:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAF1910EB06;
	Fri,  6 Sep 2024 21:52:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GlZNNSnd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 230C810EB02
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Sep 2024 21:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725659527; x=1757195527;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TEwvvKAtY+ts/uh5vlZ8YSfSomW5uGv8q1gTmY/4CUY=;
 b=GlZNNSnd5sppRdEVwQqe0j0zHMfwYtA6NfsTJE8TprEAnimJRKJkRKrX
 YWo7SmwIdnGA+Fuqv8CeQn6FZ/Xac5kE7JbDCUqV4NGVUquSZaOAP7UH9
 WX0Ql4gc3PWMNuSTO8DcwYEd8mmUg7ZW/2CS5ZYqMVD9y9FGFwITzN6xb
 GqjOO+5CyEIBNpextEuWNPYR/S/gvRN34bENXpp1724odKfvu0rghTXAu
 F6rxv50shiq72Wp8ljVjvUOxAggtZPrL6a+u1OcdL+x8QDqdBGUNIX8w1
 +qA/phAqoXyEPdbMiQ4BNaMXfCJ4zhypDMlTUErdcqJejrwDUz0aRrtLM g==;
X-CSE-ConnectionGUID: FQ0sTR+iQvqnwXw24nLF4A==
X-CSE-MsgGUID: 71pBzvfUR+CgplaUj7Ae8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="24580594"
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; d="scan'208";a="24580594"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 14:52:07 -0700
X-CSE-ConnectionGUID: vb3PxH3ISAyW4ohgUWsoow==
X-CSE-MsgGUID: ahmBtpchRuK1ClfMPHTc/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; d="scan'208";a="70656347"
Received: from msatwood-mobl.amr.corp.intel.com (HELO
 msatwood-mobl.hsd1.or.comcast.net) ([10.125.110.176])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 14:52:06 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Matt Atwood <matthew.s.atwood@intel.com>
Subject: [PATCH 8/9] drm/xe/ptl: Add performance tuning settings for PTL
Date: Fri,  6 Sep 2024 14:51:52 -0700
Message-ID: <20240906215153.31210-9-matthew.s.atwood@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240906215153.31210-1-matthew.s.atwood@intel.com>
References: <20240906215153.31210-1-matthew.s.atwood@intel.com>
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

From: Matt Roper <matthew.d.roper@intel.com>

The L3SQCREG5 tuning suggestion remains the same on Xe3 as on Xe2.

Bspec: 72161
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
---
 drivers/gpu/drm/xe/xe_tuning.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
index faa1bf42e50e..9bb6afaa560a 100644
--- a/drivers/gpu/drm/xe/xe_tuning.c
+++ b/drivers/gpu/drm/xe/xe_tuning.c
@@ -25,15 +25,15 @@ static const struct xe_rtp_entry_sr gt_tunings[] = {
 	  XE_RTP_ACTIONS(SET(XEHP_SQCM, EN_32B_ACCESS))
 	},
 
-	/* Xe2 */
+	/* Xe2 / Xe3 */
 
 	{ XE_RTP_NAME("Tuning: L3 cache"),
-	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, XE_RTP_END_VERSION_UNDEFINED)),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 3000)),
 	  XE_RTP_ACTIONS(FIELD_SET(XEHP_L3SQCREG5, L3_PWM_TIMER_INIT_VAL_MASK,
 				   REG_FIELD_PREP(L3_PWM_TIMER_INIT_VAL_MASK, 0x7f)))
 	},
 	{ XE_RTP_NAME("Tuning: L3 cache - media"),
-	  XE_RTP_RULES(MEDIA_VERSION(2000)),
+	  XE_RTP_RULES(MEDIA_VERSION_RANGE(2000, 3000)),
 	  XE_RTP_ACTIONS(FIELD_SET(XE2LPM_L3SQCREG5, L3_PWM_TIMER_INIT_VAL_MASK,
 				   REG_FIELD_PREP(L3_PWM_TIMER_INIT_VAL_MASK, 0x7f)))
 	},
-- 
2.44.0

