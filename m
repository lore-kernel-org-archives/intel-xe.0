Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C840C2BD09
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jul 2024 11:12:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C4F110E50B;
	Tue,  9 Jul 2024 11:12:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F5y383mc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C061210E500
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jul 2024 11:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720523575; x=1752059575;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TIPeh0Xuh/vtNo24spYgTIko+jA0mReH3vyrbAUAwNw=;
 b=F5y383mcCCTux3LL83d/A4D4I82Mg0De1s4SMbandIp++++dSz3j/Ywt
 oR6LfOjk5+Y4mC4L/eaAF4JC4BDen6g4JyEtyB7zM8WGrnV+zlUbhTOio
 e40+JyhIf2vx/oOTLMnVVENE6Oq2mZf5PUN9r8MxwIrfIDLIkssNpHL6G
 R4+4PY9WKlHSUb4uz+HQFxh54rN1zlYkShE95rNG8g6355xeDlwS57Vef
 BUfaH9N77ioATDk5ndGFWyeQtzWwnkZzgb4IlG2EX08iI439CdXwRqu0e
 fHxpPMIw2v32lYn/1MAVaZGk4LXaUN2Mat5WzU6Np0Sw6w9yCq5hWjQaX g==;
X-CSE-ConnectionGUID: j8ZfhHrFSiqnA7gTiV0yEA==
X-CSE-MsgGUID: UCcbbRT8Q3SgO+QHI6JJXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="17589486"
X-IronPort-AV: E=Sophos;i="6.09,194,1716274800"; d="scan'208";a="17589486"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 04:12:55 -0700
X-CSE-ConnectionGUID: jIN2Zh0VSUmgcFkWTbMV9A==
X-CSE-MsgGUID: re60KgpuQnat4kx1FjIPTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,194,1716274800"; d="scan'208";a="85365630"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.59])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 04:12:54 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Matthew Auld <matthew.auld@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 2/2] drm/xe: Use 64K pages for scanout buffers for Xe2
Date: Tue,  9 Jul 2024 13:12:31 +0200
Message-Id: <20240709111231.490440-3-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240709111231.490440-1-zbigniew.kempczynski@intel.com>
References: <20240709111231.490440-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Set Xe2 platforms to use 64K pages for display.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 53b67f39c7d5..b629145d23fa 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -177,6 +177,7 @@ static const struct xe_graphics_desc graphics_xe2 = {
 	.name = "Xe2_LPG / Xe2_HPG",
 
 	XE2_GFX_FEATURES,
+	.vram_flags = XE_VRAM_FLAGS_DISPLAY_NEED64K,
 };
 
 static const struct xe_media_desc media_xem = {
-- 
2.34.1

