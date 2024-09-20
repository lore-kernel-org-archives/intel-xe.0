Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CD8ECF9C69
	for <intel-xe@archiver.kernel.org>; Fri, 20 Sep 2024 21:15:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5649710E865;
	Fri, 20 Sep 2024 21:15:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QtI1ybCs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E9EE10E865
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Sep 2024 21:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726866915; x=1758402915;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XotO02h3fr2Q8aFiotafd5EPpEYEnsJJQAmQRlLSLLI=;
 b=QtI1ybCsW1ZVkjeyRp3Vn19H8pJFYqQ2ql+JkPzU0/VJhB8yqNJFeMCH
 KuEZTF1e/qTUmniZhRAGJSq9S7frxLLHtosUgRpkUY9KEDdTWWb3Vak96
 ZeueVNZdLzt0QJIpaCk3XqTXe01xPrmrRpcFbc74pxVNaqk+wxUQVVtr/
 uR4Z6TMyCX41XOwPPom/tB1QAdInvEL7En6LAjLioXh8+YcB+n5bMR0Hj
 omazEz2rwy4sUwCIdv6tSZmE7q9bjfsv9yOq3es1zV0t0NSaWnHRMu85h
 /N1Hjq3w+GAjNfJRiX+vM0oSwQNpOnYI2gj2yaMRh2n+mOcHoBPYHfNcs A==;
X-CSE-ConnectionGUID: FV7a9u5eQdK4jTBBTMN4xg==
X-CSE-MsgGUID: 1jNsDEcPRyKKN6wQb5SoDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11201"; a="28786497"
X-IronPort-AV: E=Sophos;i="6.10,245,1719903600"; d="scan'208";a="28786497"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2024 14:15:15 -0700
X-CSE-ConnectionGUID: FKAkr3efRmmd33DyoAzSuw==
X-CSE-MsgGUID: d2w6wnR6SVKSRGl4cBOUAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,245,1719903600"; d="scan'208";a="93761644"
Received: from iweiny-mobl.amr.corp.intel.com (HELO gjsousa-mobl2.intel.com)
 ([10.125.110.71])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2024 14:15:14 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH v3 3/4] drm/xe/xe2: Assume tuning settings also apply for
 future media GT
Date: Fri, 20 Sep 2024 18:13:17 -0300
Message-ID: <20240920211459.255181-4-gustavo.sousa@intel.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20240920211459.255181-1-gustavo.sousa@intel.com>
References: <20240920211459.255181-1-gustavo.sousa@intel.com>
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

We already make the assumption that recommended tuning settings for
primary GT on Xe2 will also apply for future releases. Let's make the
same assumption for the media GT. We can come back and define closed
ranges when that becomes necessary.

Bspec: 72161
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_tuning.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
index c798ae1b3f75..230369f108ab 100644
--- a/drivers/gpu/drm/xe/xe_tuning.c
+++ b/drivers/gpu/drm/xe/xe_tuning.c
@@ -33,7 +33,7 @@ static const struct xe_rtp_entry_sr gt_tunings[] = {
 				   REG_FIELD_PREP(L3_PWM_TIMER_INIT_VAL_MASK, 0x7f)))
 	},
 	{ XE_RTP_NAME("Tuning: L3 cache - media"),
-	  XE_RTP_RULES(MEDIA_VERSION(2000)),
+	  XE_RTP_RULES(MEDIA_VERSION_RANGE(2000, XE_RTP_END_VERSION_UNDEFINED)),
 	  XE_RTP_ACTIONS(FIELD_SET(XE2LPM_L3SQCREG5, L3_PWM_TIMER_INIT_VAL_MASK,
 				   REG_FIELD_PREP(L3_PWM_TIMER_INIT_VAL_MASK, 0x7f)))
 	},
@@ -43,7 +43,7 @@ static const struct xe_rtp_entry_sr gt_tunings[] = {
 			 SET(CCCHKNREG1, L3CMPCTRL))
 	},
 	{ XE_RTP_NAME("Tuning: Compression Overfetch - media"),
-	  XE_RTP_RULES(MEDIA_VERSION(2000)),
+	  XE_RTP_RULES(MEDIA_VERSION_RANGE(2000, XE_RTP_END_VERSION_UNDEFINED)),
 	  XE_RTP_ACTIONS(CLR(XE2LPM_CCCHKNREG1, ENCOMPPERFFIX),
 			 SET(XE2LPM_CCCHKNREG1, L3CMPCTRL))
 	},
@@ -52,7 +52,7 @@ static const struct xe_rtp_entry_sr gt_tunings[] = {
 	  XE_RTP_ACTIONS(SET(L3SQCREG3, COMPPWOVERFETCHEN))
 	},
 	{ XE_RTP_NAME("Tuning: Enable compressible partial write overfetch in L3 - media"),
-	  XE_RTP_RULES(MEDIA_VERSION(2000)),
+	  XE_RTP_RULES(MEDIA_VERSION_RANGE(2000, XE_RTP_END_VERSION_UNDEFINED)),
 	  XE_RTP_ACTIONS(SET(XE2LPM_L3SQCREG3, COMPPWOVERFETCHEN))
 	},
 	{ XE_RTP_NAME("Tuning: L2 Overfetch Compressible Only"),
@@ -61,7 +61,7 @@ static const struct xe_rtp_entry_sr gt_tunings[] = {
 			     COMPMEMRD256BOVRFETCHEN))
 	},
 	{ XE_RTP_NAME("Tuning: L2 Overfetch Compressible Only - media"),
-	  XE_RTP_RULES(MEDIA_VERSION(2000)),
+	  XE_RTP_RULES(MEDIA_VERSION_RANGE(2000, XE_RTP_END_VERSION_UNDEFINED)),
 	  XE_RTP_ACTIONS(SET(XE2LPM_L3SQCREG2,
 			     COMPMEMRD256BOVRFETCHEN))
 	},
@@ -71,7 +71,7 @@ static const struct xe_rtp_entry_sr gt_tunings[] = {
 				   REG_FIELD_PREP(UNIFIED_COMPRESSION_FORMAT, 0)))
 	},
 	{ XE_RTP_NAME("Tuning: Stateless compression control - media"),
-	  XE_RTP_RULES(MEDIA_VERSION_RANGE(1301, 2000)),
+	  XE_RTP_RULES(MEDIA_VERSION_RANGE(1301, XE_RTP_END_VERSION_UNDEFINED)),
 	  XE_RTP_ACTIONS(FIELD_SET(STATELESS_COMPRESSION_CTRL, UNIFIED_COMPRESSION_FORMAT,
 				   REG_FIELD_PREP(UNIFIED_COMPRESSION_FORMAT, 0)))
 	},
-- 
2.46.1

