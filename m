Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFA93C2BD09
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jul 2024 12:25:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A86C10E539;
	Tue,  9 Jul 2024 12:25:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hiAZzafV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF71B10E537
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jul 2024 12:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720527934; x=1752063934;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HlhWTGyWKtUMFnyqvEE5RW+YS7YG976Rq/Jzjd6tEsE=;
 b=hiAZzafVnfz5jgM6UXVrVTQMdagI+1fS0SdCTtiyzKudtiWf/KNqDCD2
 qXbL4VHngZs9FY/SyF8hdXIDtjTJujadi9lIWCC4m05hcDt9GTG8A594r
 J2r6bMokWIieXBA1EsGjNeoc5BoI/i7Onej+dOArkbNfcE6CGPzgXfc0O
 kYTIq+QFOcGD3cWY1pGcjKTt55Q/Dr/KK53Dh6UNMo+exHeR1xIcB0xZk
 UtBrTnD8ceWjv4G4R15/ud+7OpzKiIyzWIl7652Bw5qJC2Nh7AWgCnqF6
 b7FLJsZPT941OTwSl8U+JY2+3+0ityZGLRq1m2VxQ4YATd+Wfr8aDOPel w==;
X-CSE-ConnectionGUID: FfmwKn+0TqWZlXRpULQLSw==
X-CSE-MsgGUID: V1ckT9q7RRi/zbH4tc+KjQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="17647167"
X-IronPort-AV: E=Sophos;i="6.09,195,1716274800"; d="scan'208";a="17647167"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 05:25:33 -0700
X-CSE-ConnectionGUID: HTWqAH8AQ7uiZdN43Us9GA==
X-CSE-MsgGUID: ZvBTRGD8RH2w3EZIEeT7Qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,195,1716274800"; d="scan'208";a="47774148"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.59])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 05:25:32 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Matthew Auld <matthew.auld@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v2 2/2] drm/xe: Use 64K pages for scanout buffers for
 Battlemage
Date: Tue,  9 Jul 2024 14:25:14 +0200
Message-Id: <20240709122514.538137-3-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240709122514.538137-1-zbigniew.kempczynski@intel.com>
References: <20240709122514.538137-1-zbigniew.kempczynski@intel.com>
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

Set BMG platform to use 64K pages for display.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
v2: Use 64K for BMG only (Matt)
---
 drivers/gpu/drm/xe/xe_pci.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 53b67f39c7d5..c297f3547734 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -179,6 +179,13 @@ static const struct xe_graphics_desc graphics_xe2 = {
 	XE2_GFX_FEATURES,
 };
 
+static const struct xe_graphics_desc graphics_bmg = {
+	.name = "Xe2_BMG",
+
+	XE2_GFX_FEATURES,
+	.vram_flags = XE_VRAM_FLAGS_DISPLAY_NEED64K,
+};
+
 static const struct xe_media_desc media_xem = {
 	.name = "Xe_M",
 	.ver = 12,
@@ -355,7 +362,7 @@ static const struct gmdid_map graphics_ip_map[] = {
 	{ 1270, &graphics_xelpg },
 	{ 1271, &graphics_xelpg },
 	{ 1274, &graphics_xelpg },	/* Xe_LPG+ */
-	{ 2001, &graphics_xe2 },
+	{ 2001, &graphics_bmg },
 	{ 2004, &graphics_xe2 },
 };
 
-- 
2.34.1

