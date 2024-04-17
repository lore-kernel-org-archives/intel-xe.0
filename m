Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2CFDC4345F
	for <intel-xe@archiver.kernel.org>; Wed, 17 Apr 2024 21:25:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94E2A10F8B8;
	Wed, 17 Apr 2024 21:25:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fEwla0sw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14AFE10F8B8
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Apr 2024 21:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713389122; x=1744925122;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=AR547hCQWRF+Q+xVd+2RJ4/oFwJAZN/4aHsf32ZSMPk=;
 b=fEwla0swDI0xubr53JhLZu0NI45aLp1VZN1zoFRazTRfIhFUHvodDYQO
 V0Rl6qtO+CGhfxVZ+ZB+JHZ/8LUO9oCWH4rbFJYSkJ3IkMr1KMEIovIi3
 RnBpY+TSsGuj7jQOQZ8R8n7cKuQM40md0kUOdVi3XMSx5+aYIVcpcmA9E
 YssZ8L8thz/ACZR2M0wYVX7xA0DSYNIvXNHSeFy1xT21YNfDiKs5L8bVc
 xiGBRUzg+b0tK58zNkmr0ME9QYby5MXP79GxW96SejcttKWuQ7SKW+Nxq
 2dXuzwMoGDuUHu8uKXDnUUyZkYLD6wQuTYUqPXu+XGKCtRHq/gMhgcyrH A==;
X-CSE-ConnectionGUID: 2n62eCoRTSCcppVresL99Q==
X-CSE-MsgGUID: 5ckkOvrAS4S/1PuhdQ3Qfg==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="9127951"
X-IronPort-AV: E=Sophos;i="6.07,210,1708416000"; 
   d="scan'208";a="9127951"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 14:25:20 -0700
X-CSE-ConnectionGUID: Ez/Q2KtpQR+M1nHY56GErw==
X-CSE-MsgGUID: 4NGBtaPZRpWEHDCj5pKZGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,210,1708416000"; d="scan'208";a="27183501"
Received: from unknown (HELO gjsousa-mobl2.intel.com) ([10.124.223.230])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 14:25:19 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe/xe2lpg: Extend Wa_14020338487
Date: Wed, 17 Apr 2024 18:25:01 -0300
Message-ID: <20240417212501.312346-1-gustavo.sousa@intel.com>
X-Mailer: git-send-email 2.44.0
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

Wa_14020338487 also applies to Xe2_LPG. Replicate the existing entry to
one specific for Xe2_LPG.

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_wa.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 632bd9066f8d..dcf7ed51757c 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -445,6 +445,10 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 		       FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(HALF_SLICE_CHICKEN5, DISABLE_SAMPLE_G_PERFORMANCE))
 	},
+	{ XE_RTP_NAME("14020338487"),
+	  XE_RTP_RULES(GRAPHICS_VERSION(2004), FUNC(xe_rtp_match_first_render_or_compute)),
+	  XE_RTP_ACTIONS(SET(ROW_CHICKEN3, XE2_EUPEND_CHK_FLUSH_DIS))
+	},
 	{ XE_RTP_NAME("16021540221"),
 	  XE_RTP_RULES(GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0),
 		       FUNC(xe_rtp_match_first_render_or_compute)),
-- 
2.44.0

