Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B9ABC3DA47
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jul 2024 09:13:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 495E110E9BB;
	Thu, 11 Jul 2024 09:13:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YYwotT+u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DB4510E9BB
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jul 2024 09:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720689225; x=1752225225;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OP8R9wUYhJTezeGYlz2ceHZeTFCuLG/pINdQALiU58M=;
 b=YYwotT+u4YdT32Es/pC97bmipK+PWzR+LtTwE7a7bguzSxTD4GGir/mM
 OrRkY3w3EA3NeoGvELuYss49WDkN8n4X+KtIi80d7HLYkutfoc2R7+Bld
 pSEylyCUarugQ5TBldhEwFhG0gUZBShhEFHAh1W7ekfWe1+YwaNuCb6Jp
 7ftkOw10LdJNugGXiB5na4crDnB0/qQ8reZA9BFMnSzweuct76b8BMH/i
 Y9SgLdLXNbpRGSy0R5JM66OPpdr5c5jqlKFG7u1WQ17ueYYRKwZyWmqXZ
 SJJTPkvf3fibWjcY2SMB+qaZu2aweuslf/SI5IDcuVgevtY7DsKuCt4n2 w==;
X-CSE-ConnectionGUID: 9PgIPRHeQ3K7SG5boSIiLg==
X-CSE-MsgGUID: GrL/dFVhQJWUjcWprcBZVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="12495471"
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; d="scan'208";a="12495471"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP; 11 Jul 2024 02:09:44 -0700
X-CSE-ConnectionGUID: zRCrVrvuQDGoDrXGhDW2Rw==
X-CSE-MsgGUID: svMFAstXTTGtxH4bxIUhzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; d="scan'208";a="48467924"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.210])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 02:09:43 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Matthew Auld <matthew.auld@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v3 3/3] drm/xe: Use 64K pages for scanout buffers for
 Battlemage
Date: Thu, 11 Jul 2024 11:09:25 +0200
Message-Id: <20240711090925.179366-4-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240711090925.179366-1-zbigniew.kempczynski@intel.com>
References: <20240711090925.179366-1-zbigniew.kempczynski@intel.com>
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

