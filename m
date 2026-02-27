Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93CF3FEFB6E
	for <intel-xe@archiver.kernel.org>; Fri, 27 Feb 2026 16:44:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35DD810EBC9;
	Fri, 27 Feb 2026 16:44:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OarWcphC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD5D310EBC8
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Feb 2026 16:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772210652; x=1803746652;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=iFkp1QKVkUBs7h3tg9Xx7HNiMzOyEyGW7spIFTjBYgA=;
 b=OarWcphC8St0WhotzIet9a2q6fAV77Q0gzZ/SmGHUpcK5dY+oFXP4Ztw
 cXtjwGSDnZu6JftYQy9bPGlj3GDYfZX9CuqtJDP1ZAlEhbA5ytowDU4MK
 O4HqsqBxsYB7HnuT/JGHqkbymsaZQyGtuKBKVEr8LVVhd6mHImigqfKU/
 OOgVyc42mMB9xF7Xcgjost6KDHUZq1UXJG/frYoZhBpdQsDaFL3QUGV6q
 o9IMIR3+vYiQA70Kkdgk30SXa5XKgdhKxnQZ/jPHJZKq2XLTdbU+ep4F2
 /0RsPN4hst1xAXqgKPnKv0yGbVnYoWJSiHtiRm98/9MO7Sockwr5/0IHG w==;
X-CSE-ConnectionGUID: VW5RINCGSp+0a5zvK4UNfg==
X-CSE-MsgGUID: B1cCM++0Td+EYmjldYO3mw==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="90698333"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="90698333"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 08:44:12 -0800
X-CSE-ConnectionGUID: XVJHUtRrQc+mlhHpyIOMmQ==
X-CSE-MsgGUID: Z/ooLAG1RUWnwnyl5ypSlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="221936786"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 08:44:12 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com, Aradhya Bhatia <aradhya.bhatia@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>, stable@vger.kernel.org
Subject: [PATCH] drm/xe/xe2_hpg: Correct implementation of Wa_16025250150
Date: Fri, 27 Feb 2026 08:43:41 -0800
Message-ID: <20260227164341.3600098-2-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.53.0
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

Wa_16025250150 asks us to set five register fields of the register to
0x1 each.  However we were just OR'ing this into the existing register
value (which has a default of 0x4 for each nibble-sized field) resulting
in final field values of 0x5 instead of the desired 0x1.  Correct the
RTP programming (use FIELD_SET instead of SET) to ensure each field is
assigned to exactly the value we want.

Cc: Aradhya Bhatia <aradhya.bhatia@intel.com>
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Cc: <stable@vger.kernel.org> # v6.16+
Fixes: 7654d51f1fd8 ("drm/xe/xe2hpg: Add Wa_16025250150")
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_wa.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 26950b8a7543..183c5c86c35a 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -249,12 +249,13 @@ static const struct xe_rtp_entry_sr gt_was[] = {
 
 	{ XE_RTP_NAME("16025250150"),
 	  XE_RTP_RULES(GRAPHICS_VERSION(2001)),
-	  XE_RTP_ACTIONS(SET(LSN_VC_REG2,
-			     LSN_LNI_WGT(1) |
-			     LSN_LNE_WGT(1) |
-			     LSN_DIM_X_WGT(1) |
-			     LSN_DIM_Y_WGT(1) |
-			     LSN_DIM_Z_WGT(1)))
+	  XE_RTP_ACTIONS(FIELD_SET(LSN_VC_REG2,
+				   LSN_LNI_WGT_MASK | LSN_LNE_WGT_MASK |
+				   LSN_DIM_X_WGT_MASK | LSN_DIM_Y_WGT_MASK |
+				   LSN_DIM_Z_WGT_MASK,
+				   LSN_LNI_WGT(1) | LSN_LNE_WGT(1) |
+				   LSN_DIM_X_WGT(1) | LSN_DIM_Y_WGT(1) |
+				   LSN_DIM_Z_WGT(1)))
 	},
 
 	/* Xe3_LPG */
-- 
2.53.0

