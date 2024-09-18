Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4593DCDD55E
	for <intel-xe@archiver.kernel.org>; Wed, 18 Sep 2024 20:48:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08D4110E63B;
	Wed, 18 Sep 2024 20:48:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I5LdDtRi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CC1B10E63A
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Sep 2024 20:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726692525; x=1758228525;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WkMCwP0rQ6Oja2rVi5WJp/RJF7IFYi6Fw5CCUirGCkU=;
 b=I5LdDtRidcS5SCiD5GDaTENXK/56ARd8xL77/pHvyoeKy5gVUJahFkvM
 g5LVIysWdkKCo0lnhNgzt4f0LqUXxKIJ8SRv3Br8NZ4FKptXhYb3RiN+i
 YXl2qNronUr20jC9XtaMRCu3Ye/uscWIJM3Li50j2rD43PAEnCDxBT0iQ
 0eCzMcSuFtmhs1TdjXgDNZa0uyWezAsK2is4lwSslB8VdLYxUutIi2lOz
 oYqew9a/YN8SSrP5gxDrK2i5fTaUbrRD8MkYp31+hb+7cCZ4FZkXXnUMH
 EXN4IWvgz4f0+I796TioeQuvtk3IFBEQOF9Q3MP+Gya5kAY6mLi1U4NAs w==;
X-CSE-ConnectionGUID: DCDvxcJuR7q70KiyubSVTw==
X-CSE-MsgGUID: QvSLSw9tSgWO9OSd/5luoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="25509484"
X-IronPort-AV: E=Sophos;i="6.10,239,1719903600"; d="scan'208";a="25509484"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 13:48:45 -0700
X-CSE-ConnectionGUID: MaLRCiQZSp+k10zIhFLs/g==
X-CSE-MsgGUID: 7Wj2KlJAR9SmxACWMctHAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,239,1719903600"; d="scan'208";a="74246623"
Received: from rfrazer-mobl3.amr.corp.intel.com (HELO gjsousa-mobl2.intel.com)
 ([10.125.109.171])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 13:48:44 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH 2/3] drm/xe/xe2: Assume tuning settings also apply for future
 media GT
Date: Wed, 18 Sep 2024 17:47:30 -0300
Message-ID: <20240918204830.49880-3-gustavo.sousa@intel.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20240918204830.49880-1-gustavo.sousa@intel.com>
References: <20240918204830.49880-1-gustavo.sousa@intel.com>
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
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_tuning.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
index 7a5b852af8d7..f62622f0be85 100644
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
-	  XE_RTP_RULES(MEDIA_VERSION(2000)),
+	  XE_RTP_RULES(MEDIA_VERSION_RANGE(2000, XE_RTP_END_VERSION_UNDEFINED)),
 	  XE_RTP_ACTIONS(FIELD_SET(STATELESS_COMPRESSION_CTRL, UNIFIED_COMPRESSION_FORMAT,
 				   REG_FIELD_PREP(UNIFIED_COMPRESSION_FORMAT, 0)))
 	},
-- 
2.46.1

