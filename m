Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9057AC27C53
	for <intel-xe@archiver.kernel.org>; Wed, 19 Jun 2024 06:56:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57AA610E055;
	Wed, 19 Jun 2024 06:56:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="luTHBPa+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D05CB10E055
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Jun 2024 06:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718780203; x=1750316203;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=l4yeGV51JqSENBAoRveE8XYlr9VMQBnzLUTqhKkfrK0=;
 b=luTHBPa+ArOYy21WZZlmXPoSDRIlgz2R2Nhcio/uETSmrt2jUKLi599f
 yPl7xPCVBzyc9lb384QZ/x7znkYXGz9sXG6Gt28VR29Z+HpPayaelZ/YS
 J9hSTuRpsf6FN5VVwpCov/Hel9zyFLltMF2m6lmfaAiSxcT4b9p7QjaoF
 DIycNwTPxfwnea7S9aN348TVFhe8S8VTIOKYNfSpshlPot1MRLURhM0Bi
 MBcBv084S25qkSs6u2IOmiqz9rmCsQoyccwlDK8l/yzIGkbmlBw2tTVOQ
 CeY1RLwgpLOD1gFqJg2Ay3x+5DkDQAgV9Vkty6aIB2Nrs8SNBXfNbBcqY A==;
X-CSE-ConnectionGUID: K9bwgMQaQ+abTv9O6CYqXQ==
X-CSE-MsgGUID: w5TQkkd0Q6mvXOwofx9s9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="33243366"
X-IronPort-AV: E=Sophos;i="6.08,249,1712646000"; d="scan'208";a="33243366"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2024 23:56:42 -0700
X-CSE-ConnectionGUID: bHmVabdDTruna+16JaJF3A==
X-CSE-MsgGUID: EI76vVlDTdWVjeL6uATjjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,249,1712646000"; d="scan'208";a="41725266"
Received: from spottumu-desk.iind.intel.com ([10.145.153.73])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2024 23:56:35 -0700
From: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
Subject: [PATCH] drm/xe/xelpgp: Extend Wa_14019877138 to graphics 12.74
Date: Wed, 19 Jun 2024 12:26:14 +0530
Message-Id: <20240619065614.131151-1-sai.teja.pottumuttu@intel.com>
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

Wa_14019877138 is also needed for xe_lpgp graphics 12.74

Signed-off-by: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
---
 drivers/gpu/drm/xe/xe_wa.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index a2725a150441..cf546801289a 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -629,7 +629,7 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
 	  XE_RTP_ACTIONS(SET(CACHE_MODE_1, MSAA_OPTIMIZATION_REDUC_DISABLE))
 	},
 	{ XE_RTP_NAME("14019877138"),
-	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1270, 1271), ENGINE_CLASS(RENDER)),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1270, 1274), ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(SET(XEHP_PSS_CHICKEN, FD_END_COLLECT))
 	},
 
-- 
2.34.1

