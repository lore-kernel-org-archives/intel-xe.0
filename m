Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1629ACA0EED
	for <intel-xe@archiver.kernel.org>; Tue, 19 Aug 2025 15:40:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C833F10E62A;
	Tue, 19 Aug 2025 15:40:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oACkj9Gz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54C6310E62D;
 Tue, 19 Aug 2025 15:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755618034; x=1787154034;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zawUTKSxa9MVJU6e7udTsVAIxjOYFGGRbiOTYMENmW8=;
 b=oACkj9GzQFToWhObTohcqjssNnsGGmE6cvX4Du8QhaelOCpjnrrubWzh
 v8Fgx8Oz1+hujF0F+luQtVbIjxeCWtaRRklqORVFb2L1d4Q4rSVw93W8K
 yENQzj4adsGbfjipjJfLComkoF+LFSz/IIdN3DlL1u2ckK6z12XDI90Vh
 soQubM2z67laBbHWsVe3OOJoxe20PTsANb1dsaVHle2ovj2l9helbsU7i
 prtAIAlqybj/bAiJmcoHIi40kcIsUnF5hQd3BWwi6AOcYipo119CkiVTi
 LirC3D666DjC5k/Jzlr2XLu4mWN5PlRSzmg2oGgoIio08imSM4dGigHEX g==;
X-CSE-ConnectionGUID: 7Aho/yxdSK+YY6DdLIfxiA==
X-CSE-MsgGUID: 3zv0jwyURLORQQAT3w8FVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="57935347"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="57935347"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2025 08:40:34 -0700
X-CSE-ConnectionGUID: U0JfNkiDTDeSmbV2SllkLw==
X-CSE-MsgGUID: xWnXBpCMSfC4+28OAZwR8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="205029938"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa001.jf.intel.com with ESMTP; 19 Aug 2025 08:40:32 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: jouni.hogander@intel.com,
	Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH] drm/i915/backlight: Fix divide by 0 error in
 i9xx_set_backlight
Date: Tue, 19 Aug 2025 21:10:27 +0530
Message-Id: <20250819154027.143066-1-suraj.kandpal@intel.com>
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

pwm_level_max maybe 0 we do throw a warning but move ahead with
execution which may later cause a /0 error.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_backlight.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_backlight.c b/drivers/gpu/drm/i915/display/intel_backlight.c
index e007380e9a63..d0e9de8ab834 100644
--- a/drivers/gpu/drm/i915/display/intel_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_backlight.c
@@ -234,6 +234,7 @@ static void i9xx_set_backlight(const struct drm_connector_state *conn_state, u32
 	struct intel_connector *connector = to_intel_connector(conn_state->connector);
 	struct intel_display *display = to_intel_display(connector);
 	struct intel_panel *panel = &connector->panel;
+	u32 max_level = panel->backlight.pwm_level_max ?: 1;
 	u32 tmp, mask;
 
 	drm_WARN_ON(display->drm, panel->backlight.pwm_level_max == 0);
@@ -242,7 +243,7 @@ static void i9xx_set_backlight(const struct drm_connector_state *conn_state, u32
 		struct pci_dev *pdev = to_pci_dev(display->drm->dev);
 		u8 lbpc;
 
-		lbpc = level * 0xfe / panel->backlight.pwm_level_max + 1;
+		lbpc = level * 0xfe / max_level + 1;
 		level /= lbpc;
 		pci_write_config_byte(pdev, LBPC, lbpc);
 	}
-- 
2.34.1

