Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EA08C28B24
	for <intel-xe@archiver.kernel.org>; Fri,  7 Mar 2025 19:08:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB3C010EAF1;
	Fri,  7 Mar 2025 19:08:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MMtWirHY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FA3910EAF1
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Mar 2025 19:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741374509; x=1772910509;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=aZrfio7LIOznUYWzV3sqiIKgRtGSnWZKE7pISnmBx1I=;
 b=MMtWirHYw36FEY6FQt2SMJOr62FO58qc0TXvyQo0pEKO1mzVXFvuojjq
 5wXggKAGWqXqxPSg2rDCsnXhUz8NwMpBdzCbos9s3BUEfKVRvJoP7P5u+
 gG2LmirMAvWtDmFETHROcZ29jCBQDmsaW6JtQOeg6wjp5oDDMzpCiHwWz
 szbMLcQFI/hqsIz1Xx2HIKsSrmgszTs37UmdJO1jVS0mvEcC7lCFedk5W
 JqW4sUGsxB2fLnFQ+2OxbGTvUHW93/TO7DChQe0UGA4fhD+ao5luyJ2pv
 lwQUTPpadZ1BF84z8Nqcq4EjJ42N5l1ykRRSSA1g8VBCSboWRkxl6w2kr g==;
X-CSE-ConnectionGUID: ym2ErDzRR++yMAHRZozW+A==
X-CSE-MsgGUID: w9fiYp2jREebJir5xW6s6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="59838157"
X-IronPort-AV: E=Sophos;i="6.14,230,1736841600"; d="scan'208";a="59838157"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 11:08:29 -0800
X-CSE-ConnectionGUID: x4U5enVsS0qIora4CgzXhA==
X-CSE-MsgGUID: YCJ5gjZWSl2/sW7LXbpHlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="119342107"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 11:08:28 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH] drm/xe/xe3: Recognize 3DSTATE_COARSE_PIXEL to LRC dumps
Date: Fri,  7 Mar 2025 11:07:55 -0800
Message-ID: <20250307190754.678376-2-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.48.1
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

Xe3 adds a new 3DSTATE_COARSE_PIXEL state instruction as part of the
render engine LRC.  Ensure we can recognize and report this properly in
the LRC dumps.

Bspec: 65182, 73415
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/instructions/xe_gfxpipe_commands.h | 1 +
 drivers/gpu/drm/xe/xe_lrc.c                           | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/instructions/xe_gfxpipe_commands.h b/drivers/gpu/drm/xe/instructions/xe_gfxpipe_commands.h
index 31d28a67ef6a..457881af8af9 100644
--- a/drivers/gpu/drm/xe/instructions/xe_gfxpipe_commands.h
+++ b/drivers/gpu/drm/xe/instructions/xe_gfxpipe_commands.h
@@ -137,6 +137,7 @@
 #define CMD_3DSTATE_CLIP_MESH			GFXPIPE_3D_CMD(0x0, 0x81)
 #define CMD_3DSTATE_SBE_MESH			GFXPIPE_3D_CMD(0x0, 0x82)
 #define CMD_3DSTATE_CPSIZE_CONTROL_BUFFER	GFXPIPE_3D_CMD(0x0, 0x83)
+#define CMD_3DSTATE_COARSE_PIXEL		GFXPIPE_3D_CMD(0x0, 0x89)
 
 #define CMD_3DSTATE_DRAWING_RECTANGLE		GFXPIPE_3D_CMD(0x1, 0x0)
 #define CMD_3DSTATE_CHROMA_KEY			GFXPIPE_3D_CMD(0x1, 0x4)
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index df3ceddede07..81def1792664 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -1445,6 +1445,7 @@ static int dump_gfxpipe_command(struct drm_printer *p,
 	MATCH3D(3DSTATE_CLIP_MESH);
 	MATCH3D(3DSTATE_SBE_MESH);
 	MATCH3D(3DSTATE_CPSIZE_CONTROL_BUFFER);
+	MATCH3D(3DSTATE_COARSE_PIXEL);
 
 	MATCH3D(3DSTATE_DRAWING_RECTANGLE);
 	MATCH3D(3DSTATE_CHROMA_KEY);
-- 
2.48.1

