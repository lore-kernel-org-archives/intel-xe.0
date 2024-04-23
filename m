Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CAAAC4345F
	for <intel-xe@archiver.kernel.org>; Tue, 23 Apr 2024 07:12:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4B4E10ECA8;
	Tue, 23 Apr 2024 07:12:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f5FLS3Ec";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97BF010ECA8
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Apr 2024 07:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713856362; x=1745392362;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UJr52k7jZw5gyrmUH5A7NHpowLT/iY/6uwa+ZsYdCso=;
 b=f5FLS3EcsQr/vlb91aJAMm5Jp8eKDybu7uuakt+m8NYKlfQo5RFOLVDE
 gpjOrx6bW+avQwzqiAMx81oHmUeJfl90JvUDaRhYu2KN7tX5mP7e4Ag5j
 PX0nmby8MaKJ4Rx+r3P0wxj+NxWxN1gd43VeHP/IbAZobigzpekervOXg
 XeD3uBO97l4MD8YIKsK6pyphmSxGwc0HsDVozMa3SpNrVXyHwIcLvoWGW
 YOm9pU3aclQfOf+7Rm1HY4Cw+scrbimeK4cn8BNY2IPYP++qwtwDMKKUm
 Lw8bZdw2h+oSZZsj1SZXfAmkY61ZWg0upMhNc8Xq/WIM75wQxD1RQbiRj A==;
X-CSE-ConnectionGUID: ZTh1q7t5RW6LG6yueaGEDQ==
X-CSE-MsgGUID: NnUNwZTiSnWnnQskTRf5zQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="9645178"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="9645178"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 00:12:42 -0700
X-CSE-ConnectionGUID: u18FQk4qSWW05zv8x/BRoQ==
X-CSE-MsgGUID: UDi65u3oTySy/To9gv3bVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="24335956"
Received: from shekharc-ms-7d25.iind.intel.com ([10.190.239.16])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 00:12:40 -0700
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: gustavo.sousa@intel.com,
	Shekhar Chauhan <shekhar.chauhan@intel.com>
Subject: [PATCH] drm/xe/xe2hpg: Add Wa_14021490052
Date: Tue, 23 Apr 2024 12:40:39 +0530
Message-Id: <20240423071039.1350633-1-shekhar.chauhan@intel.com>
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

Add Wa_14021490052 for Xe2HPG 20.01.

Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
---
 drivers/gpu/drm/xe/xe_wa.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index dcf7ed51757c..078d23dad817 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -687,7 +687,15 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
 	  XE_RTP_RULES(GRAPHICS_VERSION(2001), ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(SET(WM_CHICKEN3, HIZ_PLANE_COMPRESSION_DIS))
 	},
-
+	{ XE_RTP_NAME("14021490052"),
+	  XE_RTP_RULES(GRAPHICS_VERSION(2001), ENGINE_CLASS(RENDER)),
+	  XE_RTP_ACTIONS(SET(FF_MODE,
+			     DIS_MESH_PARTIAL_AUTOSTRIP |
+			     DIS_MESH_AUTOSTRIP),
+			 SET(VFLSKPD,
+			     DIS_PARTIAL_AUTOSTRIP |
+			     DIS_AUTOSTRIP))
+	},
 	{}
 };
 
-- 
2.34.1

