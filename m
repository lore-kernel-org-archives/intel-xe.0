Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25CD3CFD2F6
	for <intel-xe@archiver.kernel.org>; Thu, 27 Nov 2025 16:36:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE98810E834;
	Thu, 27 Nov 2025 16:36:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HZ5kbooU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A30B10E83D
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Nov 2025 16:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764261377; x=1795797377;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IR1oRMr3iPiVsclIzX0YGB3THyDD4wWdrNAmG/dYjtE=;
 b=HZ5kbooUGg+KYYDfSX57M9OFZk4ZACmVCgLXnsF2eXmZL1Q8i901Ly2t
 awzfkT4y1RUhV6COcFs1Bsg9Uq0ifJuGiBMGhkEFDCv8tsIAKdnkKeyfi
 Vgq8xjkCMoZPfFEOxM92YnT24Na9r0vCDNrjQr3Xbl+4XKyRwiisKblaS
 mwzBqPmEe0Dg0Wz+82TbdjmZCdv4hCALTc5FxgAeAsnmNC7E0/sQOnV9E
 qMtR91fXmeQ7oo3mx6HwOQI/zUFu1qqvWDIOAGzYJkPqjGkqCWPgRXM1S
 oCQPNu/V9rdJXxl33ffNxI+NwHIAIpgz0vwtFiCsPBmoVmifEWjW2iBxv A==;
X-CSE-ConnectionGUID: y+Onv6lTSwGE/cZGwB71cQ==
X-CSE-MsgGUID: O0AXAeoeSyOELSHEPLASIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="66204821"
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; d="scan'208";a="66204821"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2025 08:36:16 -0800
X-CSE-ConnectionGUID: ODMxtysMSCmhSACvlbzVoQ==
X-CSE-MsgGUID: YECM18MwSTS/TsQivPYGHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; d="scan'208";a="193494001"
Received: from nitin-super-server.iind.intel.com ([10.190.238.72])
 by fmviesa008.fm.intel.com with ESMTP; 27 Nov 2025 08:36:16 -0800
From: Nitin Gote <nitin.r.gote@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: piotr.piorkowski@intel.com,
	Nitin Gote <nitin.r.gote@intel.com>
Subject: [PATCH] drm/xe: Use IS_ENABLED() for config checks instead of
 defined()
Date: Thu, 27 Nov 2025 22:36:52 +0530
Message-ID: <20251127170651.3798-2-nitin.r.gote@intel.com>
X-Mailer: git-send-email 2.50.1
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

Prefer IS_ENABLED() instead of defined() for checking whether
a kconfig option is enabled.

Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
---
 drivers/gpu/drm/xe/xe_vram.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
index 0a645e76e5fa..8fac1cc08dc9 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -325,7 +325,7 @@ struct xe_vram_region *xe_vram_region_alloc(struct xe_device *xe, u8 id, u32 pla
 	vram->xe = xe;
 	vram->id = id;
 	vram->placement = placement;
-#if defined(CONFIG_DRM_XE_PAGEMAP)
+#if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
 	vram->migrate = xe->tiles[id].migrate;
 #endif
 	return vram;
-- 
2.50.1

